package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentMeterConfigField struct {
	Id           int    `form:"id"`
	DTU_no       string `orm:"column(dtu_no)"`
	MeterAddress int    `orm:"column(meter_address)"`
	MeterTypeNO  string `orm:"column(meter_type_no)"`
	GatewayNO    string `orm:"column(gateway_no)"`
	DsAddr       int    `orm:"column(ds_addr)"`
	FieldName    string `orm:"column(field_name)"`

	Used       int       `orm:"column(tag)"`
	CreateUser string    `orm:"column(createuser)"`
	CreateDate time.Time `orm:"column(createdate)"`
	ChangeUser string    `orm:"column(changeuser)"`
	ChangeDate time.Time `orm:"column(changedate)"`
}

type EquipmentMeterConfigFieldQueryParam struct {
	BaseQueryParam
	DTU_no string
	MeterAddress string
	Used   string //为空不查询，有值精确查询
}

func EquipmentMeterConfigFieldTBName() string  {
	return "equipment_meter_config_field"
}

func (this *EquipmentMeterConfigField) TableName() string {
	return EquipmentMeterConfigFieldTBName()
}


func EquipmentMeterConfigFieldPageList(params *EquipmentMeterConfigFieldQueryParam) ([]*EquipmentMeterConfigField, int64) {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigFieldTBName())
	data := make([]*EquipmentMeterConfigField, 0)

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

func EquipmentMeterConfigFieldDataList(params *EquipmentMeterConfigFieldQueryParam) [] *EquipmentMeterConfigField {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentMeterConfigFieldPageList(params)
	return data
}

//delete
func EquipmentMeterConfigFieldBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentMeterConfigFieldTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentMeterConfigFieldOne(id int) (*EquipmentMeterConfigField, error) {
	o := orm.NewOrm()
	m := EquipmentMeterConfigField{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
