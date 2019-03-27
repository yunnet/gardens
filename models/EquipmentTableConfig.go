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

type EquipmentTableConfig struct {
	Id             int       `orm:"column(id)" form:"Id"`
	FieldName      string    `orm:"column(field_name)" form:"FieldName"`
	FieldDesc      string    `orm:"column(field_desc)" form:"FieldDesc"`
	FunctionTable1 string    `orm:"column(function_table1)" form:"FunctionTable1"`
	FunctionTable2 string    `orm:"column(function_table2)" form:"FunctionTable2"`
	FunctionTable3 string    `orm:"column(function_table3)" form:"FunctionTable3"`
	Used           int       `orm:"column(tag)" form:"Used"`
	CreateUser     string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate     time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser     string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate     time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
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

func EquipmentTableConfigDataList(params *EquipmentTableConfigQueryParam) []*EquipmentTableConfig {
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
