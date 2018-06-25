package models

import (
	"time"
	"github.com/astaxie/beego/orm"
	"fmt"
)

type EquipmentCustomer struct {
	Id           int       `orm:"column(id)" form:"Id"`
	CustomerNO   string    `orm:"column(customer_no)" form:"CustomerNO"`
	CustomerName string    `orm:"column(customer_name)" form:"CustomerName"`
	CustomerDesc string    `orm:"column(customer_desc)" form:"CustomerDesc"`
	Contacts     string    `orm:"column(contacts)" form:"Contacts"`
	Phone        string    `orm:"column(phone)" form:"Phone"`
	Address      string    `orm:"column(address)" form:"Address"`
	Zone         string    `orm:"column(zone)" form:"Zone"`
	Longitude    float64   `orm:"digits(12);decimals(6);column(longitude)" form:"Longitude"`
	Latitude     float64   `orm:"digits(12);decimals(6);column(latitude)" form:"Latitude"`
	Used         int       `orm:"column(tag)" form:"Used"`
	CreateUser   string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate   time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser   string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate   time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentCustomerQueryParam struct {
	BaseQueryParam
	CustomerNO   string
	CustomerName string
	Used         string
}

func init() {
	orm.RegisterModel(new(EquipmentCustomer))
}

type CustomerZone struct {
	CustomerNO   string  `orm:"column(customer_no)"`
	CustomerName string  `orm:"column(customer_name)"`
	Zone         string  `orm:"column(zone)"`
	Longitude    float64 `orm:"digits(12);decimals(6);column(longitude)"`
	Latitude     float64 `orm:"digits(12);decimals(6);column(latitude)"`
	Num          int     `orm:"column(num)"`
}

func EquipmentCustomerTBName() string {
	return "equipment_customer"
}

func EquipmentCustomerPageList(params *EquipmentCustomerQueryParam) ([]*EquipmentCustomer, int64) {
	query := orm.NewOrm().QueryTable(EquipmentCustomerTBName())
	data := make([]*EquipmentCustomer, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "CustomerNO":
		sortorder = "customer_no"
	case "CustomerName":
		sortorder = "customer_name"
	case "CustomerDesc":
		sortorder = "customer_desc"
	case "Contacts":
		sortorder = "customer_desc"
	case "Phone":
		sortorder = "phone"
	case "Address":
		sortorder = "address"
	case "Zone":
		sortorder = "zone"
	case "Longitude":
		sortorder = "longitude"
	case "Latitude":
		sortorder = "latitude"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("CustomerNO__istartswith", params.CustomerNO)
	query = query.Filter("CustomerName__contains", params.CustomerName)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentCustomerDataList(params *EquipmentCustomerQueryParam) [] *EquipmentCustomer {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentCustomerPageList(params)
	return data
}

func EquipmentCustomerBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentCustomerTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentCustomerOne(id int) (*EquipmentCustomer, error) {
	o := orm.NewOrm()
	m := EquipmentCustomer{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}

func (this *EquipmentCustomer) TableName() string {
	return EquipmentCustomerTBName()
}

//获取客户分布
func GetCustomerZone() ([] *CustomerZone, error) {
	data := make([] *CustomerZone, 0)

	o := orm.NewOrm()
	sql := fmt.Sprintf(`SELECT customer_no, customer_name, zone, longitude, latitude, count(customer_no) as num FROM v_customer_room_meter WHERE meter_config_tag = 0 GROUP BY customer_no`)
	_, err := o.Raw(sql).QueryRows(&data)
	if err != nil {
		return nil, err
	}
	return data, nil
}
