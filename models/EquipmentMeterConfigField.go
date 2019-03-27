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

type EquipmentMeterConfigField struct {
	Id           int       `orm:"column(id)" form:"Id"`
	DTU_no       string    `orm:"column(dtu_no)" form:"DTU_no"`
	MeterAddress int       `orm:"column(meter_address)" form:"MeterAddress"`
	MeterTypeNO  string    `orm:"column(meter_type_no)" form:"MeterTypeNO"`
	GatewayNO    string    `orm:"column(gateway_no)" form:"GatewayNO"`
	DsAddr       int       `orm:"column(ds_addr)" form:"DsAddr"`
	FieldName    string    `orm:"column(field_name)" form:"FieldName"`
	Used         int       `orm:"column(tag)" form:"Used"`
	CreateUser   string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate   time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser   string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate   time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentMeterConfigFieldQueryParam struct {
	BaseQueryParam
	DTU_no       string
	MeterAddress string
	Used         string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentMeterConfigField))
}

func EquipmentMeterConfigFieldTBName() string {
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
	case "DTU_no":
		sortorder = "dtu_no"
	case "MeterAddress":
		sortorder = "meter_address"
	case "MeterTypeNO":
		sortorder = "meter_type_no"
	case "GatewayNO":
		sortorder = "gateway_no"
	case "DsAddr":
		sortorder = "ds_addr"
	case "FieldName":
		sortorder = "field_name"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("DTU_no__contains", params.DTU_no)
	query = query.Filter("MeterAddress__istartswith", params.MeterAddress)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentMeterConfigFieldDataList(params *EquipmentMeterConfigFieldQueryParam) []*EquipmentMeterConfigField {
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
