package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentMeterRomConfig struct {
	Id             int       `form:"id"`
	MeterTypeNO    string    `orm:"column(meter_type_no)"`
	AddressSort    int       `orm:"column(address_sort)"`
	RomAddress     string    `orm:"column(rom_address)"`
	RomName        string    `orm:"column(rom_name)"`
	Units          string    `orm:"column(units)"`
	DataType       string    `orm:"column(data_type)"`
	SegmentNO      int       `orm:"column(segment_no)"`
	Offset         int       `orm:"column(offset)"`
	Needpt         int       `orm:"column(need_pt)"`
	Needct         int       `orm:"column(need_ct)"`
	Calcfactor     float64   `orm:"digits(12);decimals(4);column(calcfactor)"`
	Msbbit         int       `orm:"column(msb_bit)"`
	BigEndian      int       `orm:"column(bigendian)"`
	Bytelength     int       `orm:"column(byte_length)"`
	FunctionTable1 string    `orm:"column(function_table1)"`
	FunctionTable2 string    `orm:"column(function_table2)"`
	FunctionTable3 string    `orm:"column(function_table3)"`
	FunctionField  string    `orm:"column(function_field)"`
	Used           int       `orm:"column(tag)"`
	CreateUser     string    `orm:"column(createuser)"`
	CreateDate     time.Time `orm:"column(createdate)"`
	ChangeUser     string    `orm:"column(changeuser)"`
	ChangeDate     time.Time `orm:"column(changedate)"`
}

type EquipmentMeterRomConfigQueryParam struct {
	BaseQueryParam
	MeterTypeNO string
	Used        string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentMeterRomConfig))
}

func EquipmentMeterRomConfigTBName() string {
	return "equipment_meter_rom_config"
}

func (this *EquipmentMeterRomConfig) TableName() string {
	return EquipmentMeterRomConfigTBName()
}

func EquipmentMeterRomConfigPageList(params *EquipmentMeterRomConfigQueryParam) ([]*EquipmentMeterRomConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentMeterRomConfigTBName())

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "MeterTypeNO":
		sortorder = "meter_type_no"
	case "AddressSort":
		sortorder = "address_sort"
	case "RomAddress":
		sortorder = "rom_address"
	case "RomName":
		sortorder = "rom_name"
	case "Units":
		sortorder = "units"
	case "DataType":
		sortorder = "data_type"
	case "SegmentNO":
		sortorder = "segment_no"
	case "Offset":
		sortorder = "offset"
	case "Needpt":
		sortorder = "need_pt"
	case "Needct":
		sortorder = "need_ct"
	case "Calcfactor":
		sortorder = "calcfactor"
	case "Msbbit":
		sortorder = "msb_bit"
	case "BigEndian":
		sortorder = "bigendian"
	case "Bytelength":
		sortorder = "byte_length"
	case "FunctionTable1":
		sortorder = "function_table1"
	case "FunctionTable2":
		sortorder = "function_table2"
	case "FunctionTable3":
		sortorder = "function_table3"
	case "FunctionField":
		sortorder = "function_field"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("MeterTypeNO__istartswith", params.MeterTypeNO)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()

	data := make([]*EquipmentMeterRomConfig, 0)
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentMeterRomConfigDataList(params *EquipmentMeterRomConfigQueryParam) [] *EquipmentMeterRomConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentMeterRomConfigPageList(params)
	return data
}

//delete
func EquipmentMeterRomConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentMeterRomConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentMeterRomConfigOne(id int) (*EquipmentMeterRomConfig, error) {
	o := orm.NewOrm()
	m := EquipmentMeterRomConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
