package controllers

import (
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"strconv"
	"strings"
	"time"
	"github.com/astaxie/beego"
	"crypto/md5"
	"encoding/hex"
	"sync"
	"net/http"
	"io/ioutil"
	"github.com/tidwall/gjson"
)

type EquipmentSimCardsController struct {
	BaseController
}

func (this *EquipmentSimCardsController) Prepare() {
	//先执行
	this.BaseController.Prepare()
	//如果一个Controller的多数Action都需要权限控制，则将验证放到Prepare
	this.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (this *EquipmentSimCardsController) Index() {
	this.Data["pageTitle"] = "SIM卡管理"
	//是否显示更多查询条件的按钮
	this.Data["showMoreQuery"] = true

	//将页面左边菜单的某项激活
	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentsimcards/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentsimcards/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentSimCardsController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentSimCardsController", "Delete")
}

// DataGrid 管理首页 表格获取数据
func (this *EquipmentSimCardsController) DataGrid() {
	var params models.EquipmentSimCardsQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentSimCardsPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//下拉选择列表
func(this *EquipmentSimCardsController)SelectPicker(){
	var params = models.EquipmentSimCardsQueryParam{}
	params.Used = this.Input().Get("Used")
	data := models.EquipmentSimCardsDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

//DataList 列表
func (this *EquipmentSimCardsController) DataList() {
	var params = models.EquipmentSimCardsQueryParam{}
	data := models.EquipmentSimCardsDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

//Edit 添加、编辑角色界面
func (this *EquipmentSimCardsController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentSimCards{Id: int64(Id)}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
	}

	this.Data["m"] = m
	this.setTpl("equipmentsimcards/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentsimcards/edit_footerjs.html"
}

//Save 添加、编辑页面 保存
func (this *EquipmentSimCardsController) Save() {
	var err error
	m := models.EquipmentSimCards{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	id := this.Input().Get("Id")
	m.Id, _ = strconv.ParseInt(id, 10, 64)
	m.Sim_no = this.GetString("Sim_no")
	m.Iccid = this.GetString("Iccid")
	m.ChangeUser = this.curUser.RealName
	m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err = o.Update(&m, "Sim_no", "Iccid", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

//Delete 批量删除
func (this *EquipmentSimCardsController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentSimCardsBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}

//abcdefg hijklmn opqrst uvwxyz
func (this *EquipmentSimCardsController)TrafficSync() {
	var params = models.EquipmentSimCardsQueryParam{}
	data := models.EquipmentSimCardsDataList(&params)

	num := 0
	wg := sync.WaitGroup{}
	for i, simcard := range data{
		url := getSimCardUrl(simcard.Sim_no)

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

	this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("同步成功 %d 项", num), 0)
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

	if m, err := models.EquipmentSimCardsOne(id); err == nil {
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
func getSimCardUrl(card string)string {
	api := beego.AppConfig.String("simcard::api")
	key := beego.AppConfig.String("simcard::key")
	username := beego.AppConfig.String("simcard::username")
	timestamp := time.Now().Unix()

	url := fmt.Sprintf("card=%s&key=%s&timestamp=%d&username=%s", card, key, timestamp, username)
	encoder := md5.New()
	encoder.Write([]byte(url))
	md5str := encoder.Sum(nil)
	signature := hex.EncodeToString(md5str)

	return api + "?" + url + "&signature=" + signature
}
