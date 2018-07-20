package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentMeterConfig struct {
	Id             int       `orm:"column(id)" form:"Id"`
	DTU_no         string    `orm:"column(dtu_no)" form:"DTU_no"`
	MeterAddress   int       `orm:"column(meter_address)" form:"MeterAddress"`
	MeterTypeNO    string    `orm:"column(meter_type_no)" form:"MeterTypeNO"`
	GatewayNO      string    `orm:"column(gateway_no)" form:"GatewayNO"`
	GatewayQzone   int       `orm:"column(gateway_qzone); null" form:"GatewayQzone"`
	GatewayAddress int       `orm:"column(gateway_address); null" form:"GatewayAddress"`
	GatewaySite    int       `orm:"column(gateway_site); null" form:"GatewaySite"`
	LoopName       string    `orm:"column(loop_name)" form:"LoopName"`
	Pt             int       `orm:"column(pt)" form:"Pt"`
	Ct             int       `orm:"column(ct)" form:"Ct"`
	Used           int       `orm:"column(tag)" form:"Used"`
	CreateUser     string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate     time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser     string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate     time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentMeterConfigQueryParam struct {
	BaseQueryParam
	DTU_no       string
	MeterAddress string
	MeterTypeNO  string
	Used         string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentMeterConfig))
}

//获取电表数
func EquipmentMeterConfigCount() int64 {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigTBName())
	query = query.Filter("tag", 0)
	total, _ := query.Count()
	return total
}

func EquipmentMeterConfigTBName() string {
	return "equipment_meter_config"
}

func (this *EquipmentMeterConfig) TableName() string {
	return EquipmentMeterConfigTBName()
}

func EquipmentMeterConfigPageList(params *EquipmentMeterConfigQueryParam) ([]*EquipmentMeterConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigTBName())
	data := make([]*EquipmentMeterConfig, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "DTU_no":
		sortorder = "dtu_no"
	case "MeterAddress":
		sortorder = "meter_address"
	case "MeterTypeNO":
		sortorder = "meter_type_no"
	case "GatewayNO":
		sortorder = "gateway_no"
	case "GatewayQzone":
		sortorder = "gateway_qzone"
	case "GatewayAddress":
		sortorder = "gateway_address"
	case "GatewaySite":
		sortorder = "gateway_site"

	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("DTU_no__contains", params.DTU_no)
	query = query.Filter("MeterAddress__istartswith", params.MeterAddress)
	query = query.Filter("MeterTypeNO__istartswith", params.MeterTypeNO)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentMeterConfigDataList(params *EquipmentMeterConfigQueryParam) [] *EquipmentMeterConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentMeterConfigPageList(params)
	return data
}

//delete
func EquipmentMeterConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentMeterConfigOne(id int) (*EquipmentMeterConfig, error) {
	o := orm.NewOrm()
	m := EquipmentMeterConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
