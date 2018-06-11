package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentTableConfig struct {
	Id             int       `form:"id"`
	FieldName      string    `orm:"column(field_name)"`
	FieldDesc      string    `orm:"column(field_desc)"`
	FunctionTable1 string    `orm:"column(function_table1)"`
	FunctionTable2 string    `orm:"column(function_table2)"`
	FunctionTable3 string    `orm:"column(function_table3)"`
	Used           int       `orm:"column(tag)"`
	CreateUser     string    `orm:"column(createuser)"`
	CreateDate     time.Time `orm:"column(createdate)"`
	ChangeUser     string    `orm:"column(changeuser)"`
	ChangeDate     time.Time `orm:"column(changedate)"`
}

type EquipmentTableConfigQueryParam struct {
	BaseQueryParam
	FieldName string
	FieldDesc string
	Used      string
}

func init() {
	orm.RegisterModel(new(EquipmentTableConfig))
}

func EquipmentTableConfigTBName() string {
	return "equipment_table_config"
}

func (this *EquipmentTableConfig) TableName() string {
	return EquipmentTableConfigTBName()
}

func EquipmentTableConfigPageList(params *EquipmentTableConfigQueryParam) ([]*EquipmentTableConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentTableConfigTBName())
	data := make([]*EquipmentTableConfig, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "FieldName":
		sortorder = "field_name"
	case "FieldDesc":
		sortorder = "field_desc"
	case "FunctionTable1":
		sortorder = "function_table1"
	case "FunctionTable2":
		sortorder = "function_table2"
	case "FunctionTable3":
		sortorder = "function_table3"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("FieldName__istartswith", params.FieldName)
	query = query.Filter("FieldDesc__istartswith", params.FieldDesc)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentTableConfigDataList(params *EquipmentTableConfigQueryParam) [] *EquipmentTableConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentTableConfigPageList(params)
	return data
}

func EquipmentTableConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentTableConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentTableConfigOne(id int) (*EquipmentTableConfig, error) {
	o := orm.NewOrm()
	m := EquipmentTableConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
