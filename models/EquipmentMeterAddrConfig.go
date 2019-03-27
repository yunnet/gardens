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

type EquipmentMeterAddrConfig struct {
	Id               int       `orm:"column(id)" form:"Id"`
	MeterTypeNO      string    `orm:"column(meter_type_no)" form:"MeterTypeNO"`
	SegmentStartAddr int       `orm:"column(segment_start_addr)" form:"SegmentStartAddr"`
	SegmentLen       int       `orm:"column(segment_len)" form:"SegmentLen"`
	SegmentNO        int       `orm:"column(segment_no)" form:"SegmentNO"`
	Used             int       `orm:"column(tag)" form:"Used"`
	CreateUser       string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate       time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser       string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate       time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
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

func EquipmentMeterAddrConfigDataList(params *EquipmentMeterAddrConfigQueryParam) []*EquipmentMeterAddrConfig {
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
