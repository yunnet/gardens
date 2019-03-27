// Copyright 2018 gardens Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type EquipmentMeterRomConfig struct {
	Id             int       `orm:"column(id)" form:"Id"`
	MeterTypeNO    string    `orm:"column(meter_type_no)" form:"MeterTypeNO"`
	AddressSort    int       `orm:"column(address_sort)" form:"AddressSort"`
	RomAddress     string    `orm:"column(rom_address)" form:"RomAddress"`
	RomName        string    `orm:"column(rom_name)" form:"RomName"`
	Units          string    `orm:"column(units)" form:"Units"`
	DataType       string    `orm:"column(data_type)" form:"DataType"`
	SegmentNO      int       `orm:"column(segment_no)" form:"SegmentNO"`
	Offset         int       `orm:"column(offset)" form:"Offset"`
	Needpt         int       `orm:"column(need_pt)" form:"Needpt"`
	Needct         int       `orm:"column(need_ct)" form:"Needct"`
	Calcfactor     float64   `orm:"digits(12);decimals(4);column(calcfactor)" form:"Calcfactor"`
	Msbbit         int       `orm:"column(msb_bit)" form:"Msbbit"`
	BigEndian      int       `orm:"column(bigendian)" form:"BigEndian"`
	Bytelength     int       `orm:"column(byte_length)" form:"Bytelength"`
	FunctionTable1 string    `orm:"column(function_table1)" form:"FunctionTable1"`
	FunctionTable2 string    `orm:"column(function_table2)" form:"FunctionTable2"`
	FunctionTable3 string    `orm:"column(function_table3)" form:"FunctionTable3"`
	FunctionField  string    `orm:"column(function_field)" form:"FunctionField"`
	Used           int       `orm:"column(tag)" form:"Used"`
	CreateUser     string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate     time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser     string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate     time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
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

func EquipmentMeterRomConfigDataList(params *EquipmentMeterRomConfigQueryParam) []*EquipmentMeterRomConfig {
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
