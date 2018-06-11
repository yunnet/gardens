package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentMeterAddrConfig struct {
	Id               int       `form:"id"`
	MeterTypeNO      string    `orm:"column(meter_type_no)"`
	SegmentStartAddr int       `orm:"column(segment_start_addr)"`
	SegmentLen       int       `orm:"column(segment_len)"`
	SegmentNO        int       `orm:"column(segment_no)"`
	Used             int       `orm:"column(tag)"`
	CreateUser       string    `orm:"column(createuser)"`
	CreateDate       time.Time `orm:"column(createdate)"`
	ChangeUser       string    `orm:"column(changeuser)"`
	ChangeDate       time.Time `orm:"column(changedate)"`
}

type EquipmentMeterAddrConfigQueryParam struct {
	BaseQueryParam
	MeterTypeNO string
	Used        string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentMeterAddrConfig))
}

func EquipmentMeterAddrConfigTBName() string {
	return "equipment_meter_addr_config"
}

func (this *EquipmentMeterAddrConfig) TableName() string {
	return EquipmentMeterAddrConfigTBName()
}

func EquipmentMeterAddrConfigPageList(params *EquipmentMeterAddrConfigQueryParam) ([]*EquipmentMeterAddrConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentMeterAddrConfigTBName())
	data := make([]*EquipmentMeterAddrConfig, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "MeterTypeNO":
		sortorder = "meter_type_no"
	case "SegmentStartAddr":
		sortorder = "segment_start_addr"
	case "SegmentLen":
		sortorder = "segment_len"
	case "SegmentNO":
		sortorder = "segment_no"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("MeterTypeNO__istartswith", params.MeterTypeNO)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentMeterAddrConfigDataList(params *EquipmentMeterAddrConfigQueryParam) [] *EquipmentMeterAddrConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentMeterAddrConfigPageList(params)
	return data
}

//delete
func EquipmentMeterAddrConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentMeterAddrConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentMeterAddrConfigOne(id int) (*EquipmentMeterAddrConfig, error) {
	o := orm.NewOrm()
	m := EquipmentMeterAddrConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
