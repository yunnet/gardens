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
	"github.com/beego/beego/v2/client/orm"
	"time"
)

type EquipmentDtuConfig struct {
	Id           int       `orm:"column(id)" form:"Id"`
	DTU_no       string    `orm:"column(dtu_no)" form:"DTU_no"`
	Room_no      string    `orm:"column(room_no)" form:"Room_no"`
	Sim_no       string    `orm:"column(sim_no)" form:"Sim_no"`
	TimeInterval int       `orm:"column(time_interval)" form:"TimeInterval"`
	Used         int       `orm:"column(tag)" form:"Used"`
	CreateUser   string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate   time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser   string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate   time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentDtuConfigQueryParam struct {
	BaseQueryParam
	DTU_no  string
	Room_no string
	Sim_no  string
	Used    string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(EquipmentDtuConfig))
}

//DTU配置
func EquipmentDtuConfigTBName() string {
	return "equipment_dtu_config"
}

func (c *EquipmentDtuConfig) TableName() string {
	return EquipmentDtuConfigTBName()
}

func EquipmentDtuConfigCount() int64 {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	query = query.Filter("tag", 0)
	total, _ := query.Count()
	return total
}

func EquipmentDtuConfigPageList(params *EquipmentDtuConfigQueryParam) ([]*EquipmentDtuConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	data := make([]*EquipmentDtuConfig, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "DTU_no":
		sortorder = "dtu_no"
	case "Room_no":
		sortorder = "room_no"
	case "Sim_no":
		sortorder = "sim_no"
	case "TimeInterval":
		sortorder = "time_interval"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("DTU_no__contains", params.DTU_no)
	query = query.Filter("Room_no__contains", params.Room_no)
	query = query.Filter("Sim_no__contains", params.Sim_no)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentDtuConfigDataList(params *EquipmentDtuConfigQueryParam) []*EquipmentDtuConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentDtuConfigPageList(params)
	return data
}

//delete
func EquipmentDtuConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentDtuConfigOne(id int) (*EquipmentDtuConfig, error) {
	o := orm.NewOrm()
	m := EquipmentDtuConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
