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
	"fmt"
	"github.com/beego/beego/v2/client/orm"
	"time"
)

type (
	EquipmentMeterType struct {
		Id          int       `orm:"column(id)" form:"Id"`
		MeterTypeNO string    `orm:"column(meter_type_no)" form:"MeterTypeNO"`
		MeterType   string    `orm:"column(meter_type)" form:"MeterType"`
		VendorNO    string    `orm:"column(vendor_no)" form:"VendorNO"`
		PtAddress   string    `orm:"column(pt_address)" form:"PtAddress"`
		CtAddress   string    `orm:"column(ct_address)" form:"CtAddress"`
		ThreePhase  int       `orm:"column(three_phase)" form:"ThreePhase"`
		Used        int       `orm:"column(tag)" form:"Used"`
		CreateUser  string    `orm:"column(createuser)" form:"CreateUser"`
		CreateDate  time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
		ChangeUser  string    `orm:"column(changeuser)" form:"ChangeUser"`
		ChangeDate  time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
	}

	EquipmentMeterTypeGrid struct {
		Id          int
		MeterTypeNO string
		MeterType   string
		VendorNO    string
		VendorDesc  string
		PtAddress   string
		CtAddress   string
		ThreePhase  int

		Used       int
		CreateUser string
		CreateDate time.Time
		ChangeUser string
		ChangeDate time.Time
	}

	EquipmentMeterTypeQueryParam struct {
		BaseQueryParam
		MeterTypeNO string
		MeterType   string
		Used        string //为空不查询，有值精确查询
	}
)

func init() {
	orm.RegisterModel(new(EquipmentMeterType))
}

func EquipmentMeterTypeTBName() string {
	return "equipment_meter_type"
}

func (c *EquipmentMeterType) TableName() string {
	return EquipmentMeterTypeTBName()
}

func EquipmentMeterTypeSelect(params *EquipmentMeterTypeQueryParam) ([]*EquipmentMeterType, error) {
	query := orm.NewOrm().QueryTable(EquipmentMeterTypeTBName())

	params.Limit = -1

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("tag__istartswith", params.Used)

	data := make([]*EquipmentMeterType, 0)
	_, err := query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)
	if err != nil {
		return nil, err
	}
	return data, nil
}

func EquipmentMeterTypePageList(params *EquipmentMeterTypeQueryParam) ([]*EquipmentMeterTypeGrid, int64) {
	//默认排序
	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder += " DESC"
	}

	query := orm.NewOrm()
	lists := make([]*EquipmentMeterTypeGrid, 0)

	sql := fmt.Sprintf(`SELECT mt.id, 
									    mt.meter_type_no as meter_type_n_o, 
									    mt.meter_type, 
									    mt.vendor_no as vendor_n_o, 
									    ev.vendor_desc, 
									    mt.pt_address, 
									    mt.ct_address, 
									    mt.three_phase, 
									    mt.tag used, 
									    mt.createuser as create_user, 
									    mt.createdate as create_date, 
									    mt.changeuser as change_user, 
									    mt.changedate as change_date
								   FROM equipment_meter_type AS mt 
								   LEFT JOIN equipment_vendor AS ev ON mt.vendor_no = ev.vendor_no 
                                  WHERE mt.meter_type_no LIKE '%s%%'
                                    AND mt.meter_type LIKE '%%%s%%'
								  ORDER BY %s								 
							     `,
		params.MeterTypeNO,
		params.MeterType,
		sortorder,
	)

	total, err := query.Raw(sql).QueryRows(&lists)
	if err != nil {
		return nil, 0
	}

	sql = sql + fmt.Sprintf(" LIMIT %d, %d", params.Offset, params.Limit)

	_, err = query.Raw(sql).QueryRows(&lists)
	if err != nil {
		return nil, 0
	}
	return lists, total
}

func EquipmentMeterTypeDataList(params *EquipmentMeterTypeQueryParam) []*EquipmentMeterTypeGrid {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentMeterTypePageList(params)
	return data
}

func EquipmentMeterTypeBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm()
	sql := "DELETE from equipment_meter_type WHERE id in(?)"
	res, err := query.Raw(sql, ids).Exec()
	if err != nil {
		return 0, err
	}

	num, _ := res.RowsAffected()
	return num, nil
}

func EquipmentMeterTypeOne(id int) (*EquipmentMeterType, error) {
	o := orm.NewOrm()
	m := EquipmentMeterType{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}

func EquipmentMeterTypeAdd(meterType *EquipmentMeterType) (int64, error) {
	id, err := orm.NewOrm().Insert(meterType)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func (this *EquipmentMeterType) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(this, fields...); err != nil {
		return err
	}
	return nil
}
