package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentMeterConfig struct {
	Id             int       `form:"id"`
	DTU_no         string    `orm:"column(dtu_no)"`
	MeterAddress   int       `orm:"column(meter_address)"`
	MeterTypeNO    string    `orm:"column(meter_type_no)"`
	GatewayNO      string    `orm:"column(gateway_no)"`
	GatewayQzone   int       `orm:"column(gateway_qzone)"`
	GatewayAddress int       `orm:"column(gateway_address)"`
	GatewaySite    int       `orm:"column(gateway_site)"`
	Pt             int       `orm:"column(pt)"`
	Ct             int       `orm:"column(ct)"`
	Used           int       `orm:"column(tag)"`
	CreateUser     string    `orm:"column(createuser)"`
	CreateDate     time.Time `orm:"column(createdate)"`
	ChangeUser     string    `orm:"column(changeuser)"`
	ChangeDate     time.Time `orm:"column(changedate)"`
}

type EquipmentMeterConfigQueryParam struct {
	BaseQueryParam
	DTU_no       string
	MeterAddress string
	Used         string //为空不查询，有值精确查询
}

func EquipmentMeterConfigCount() int64 {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigTBName())
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
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("DTU_no__istartswith", params.DTU_no)
	query = query.Filter("MeterAddress__istartswith", params.MeterAddress)

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
