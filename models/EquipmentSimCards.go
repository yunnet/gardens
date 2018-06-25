package models

import (
	"github.com/astaxie/beego/orm"
	"time"
	"fmt"
	"crypto/md5"
	"encoding/hex"
	"github.com/astaxie/beego"
	"github.com/tidwall/gjson"
	"net/http"
	"io/ioutil"
	"sync"
)

type EquipmentSimCards struct {
	Id               int64     `orm:"column(id)" form:"Id"`
	Sim_no           string    `orm:"column(sim_no)" form:"Sim_no"`
	Iccid            string    `orm:"column(ICCID)" form:"Iccid"`
	TotalTraffic     float64   `orm:"digits(12);decimals(2);column(totaltraffic)" form:"TotalTraffic"`
	UseTraffic       float64   `orm:"digits(12);decimals(2);column(usetraffic)" form:"UseTraffic"`
	RemainTraffic    float64   `orm:"digits(12);decimals(2);column(remaintraffic)" form:"RemainTraffic"`
	TrafficSyncTime  time.Time `orm:"column(trafficsynctime)" form:"TrafficSyncTime"`
	PackageStartTime time.Time `orm:"column(packagestarttime)" form:"PackageStartTime"`
	PackageStopTime  time.Time `orm:"column(packagestoptime)" form:"PackageStopTime"`
	Used             int       `orm:"column(tag)" form:"Used"`
	CreateUser       string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate       time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser       string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate       time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentSimCardsQueryParam struct {
	BaseQueryParam
	Sim_no string
	Used   string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentSimCards))
}

func EquipmentSimCardsTBName() string {
	return "equipment_simcards"
}

func (this *EquipmentSimCards) TableName() string {
	return EquipmentSimCardsTBName()
}

func EquipmentSimCardsPageList(params *EquipmentSimCardsQueryParam) ([]*EquipmentSimCards, int64) {
	query := orm.NewOrm().QueryTable(EquipmentSimCardsTBName())
	data := make([]*EquipmentSimCards, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "Sim_no":
		sortorder = "sim_no"
	case "Iccid":
		sortorder = "ICCID"
	case "TotalTraffic":
		sortorder = "totaltraffic"
	case "UseTraffic":
		sortorder = "usetraffic"
	case "RemainTraffic":
		sortorder = "remaintraffic"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("sim_no__contains", params.Sim_no)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()

	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentSimCardsDataList(params *EquipmentSimCardsQueryParam) []*EquipmentSimCards {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentSimCardsPageList(params)
	return data
}

func EquipmentSimCardsBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentSimCardsTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentSimCardsOne(id int64) (*EquipmentSimCards, error) {
	o := orm.NewOrm()
	m := EquipmentSimCards{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}

//与移动物联网进行数据同步
func TrafficSync() (int64, error) {
	var params = EquipmentSimCardsQueryParam{}
	data := EquipmentSimCardsDataList(&params)

	api := beego.AppConfig.String("simcard::api")
	key := beego.AppConfig.String("simcard::key")
	username := beego.AppConfig.String("simcard::username")
	timestamp := time.Now().Unix()

	num := 0
	wg := sync.WaitGroup{}
	for i, simcard := range data{
		url := getSimCardUrl(simcard.Sim_no, api, key, username, timestamp)

		wg.Add(1)
		go func(url string, id int64, sim string) {
			defer wg.Done()

			resp, err := http.Get(url)
			if err != nil {
				fmt.Println("同步出错：" + sim)
				return
			}
			defer resp.Body.Close()

			body, err := ioutil.ReadAll(resp.Body)
			if nil != err{
				fmt.Println("同步出错：" + sim)
				return
			}

			updateRecord(id, string(body))
		}(url, simcard.Id, simcard.Sim_no)

		num = i
	}
	wg.Wait()

	return int64(num), nil
}

//{"Status":1,"Message":"Success","Data":{"operatortype":1,"GPS":{"total":150.0,"used":9.54,"left":140.46},"package":[{"packageCode":"9","packageName":"150M/月 续费一年","beginTime":"2017-09-25 00:00:00","endTime":"2018-08-31 17:38:30","total":150.0,"used":9.54,"left":140.46}]}}
func updateRecord(id int64, json string) error{
	gjsonData := gjson.Parse(json)

	//isOK := gjsonData.Get("Message")
	total := gjsonData.Get("Data.GPS.total").Float()
	used := gjsonData.Get("Data.GPS.used").Float()
	left := gjsonData.Get("Data.GPS.left").Float()

	beginTime := gjsonData.Get("Data.package.0.beginTime").String()
	endTime := gjsonData.Get("Data.package.0.endTime").String()
	packagestarttime, _ := time.Parse("2006-01-02 15:04:05", beginTime)
	packagestoptime, _ := time.Parse("2006-01-02 15:04:05", endTime)

	if m, err := EquipmentSimCardsOne(id); err == nil {
		m.TotalTraffic = total
		m.UseTraffic = used
		m.RemainTraffic = left
		m.PackageStartTime = packagestarttime
		m.PackageStopTime = packagestoptime
		m.ChangeDate = time.Now()
		m.TrafficSyncTime = time.Now()

		o := orm.NewOrm()
		if id, err = o.Update(m, "TotalTraffic", "UseTraffic", "RemainTraffic", "PackageStartTime", "PackageStopTime", "TrafficSyncTime", "ChangeDate"); err == nil {
			return nil
		} else {
			return err
		}
	}else {
		return err
	}
}

//生成sim连接url
func getSimCardUrl(card, api, key, username string, timestamp int64)string {
	url := fmt.Sprintf("card=%s&key=%s&timestamp=%d&username=%s", card, key, timestamp, username)
	encoder := md5.New()
	encoder.Write([]byte(url))
	md5str := encoder.Sum(nil)
	signature := hex.EncodeToString(md5str)

	return api + "?" + url + "&signature=" + signature
}