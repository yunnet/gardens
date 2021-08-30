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

package utils

//
//import (
//	"time"
//	"github.com/astaxie/beego/orm"
//)
//
//type EquipmentMeterType struct {
//	Id          int    `form:"id"`
//	MeterTypeNO string `orm:"column(meter_type_no)"`
//	MeterType   string `orm:"column(meter_type)"`
//	VendorNO    string `orm:"column(vendor_no)"`
//	PtAddress   string `orm:"column(pt_address)"`
//	CtAddress   string `orm:"column(ct_address)"`
//
//	Used       int       `orm:"column(tag)"`
//	CreateUser string    `orm:"column(createuser)"`
//	CreateDate time.Time `orm:"column(createdate)"`
//	ChangeUser string    `orm:"column(changeuser)"`
//	ChangeDate time.Time `orm:"column(changedate)"`
//}
//
//type EquipmentMeterTypeQueryParam struct {
//	//BaseQueryParam
//	MeterTypeNO string
//	MeterType   string
//	Used        string //为空不查询，有值精确查询
//}
//
//func EquipmentMeterTypeTBName() string  {
//	return "equipment_meter_type"
//}
//
//func (this *EquipmentMeterType) TableName() string {
//	return EquipmentMeterTypeTBName()
//}
//
//func EquipmentMeterTypePageList(params *EquipmentMeterTypeQueryParam) ([]*EquipmentMeterType, int64) {
//	query := orm.NewOrm().QueryTable(EquipmentMeterTypeTBName())
//	data := make([]*EquipmentMeterType, 0)
//
//	sortorder := "Id"
//	switch params.Sort {
//	case "Id":
//		sortorder = "Id"
//	}
//
//	if params.Order == "desc" {
//		sortorder = "-" + sortorder
//	}
//
//	query = query.Filter("MeterTypeNO__istartswith", params.MeterTypeNO)
//	query = query.Filter("MeterType__istartswith", params.MeterType)
//
//	total, _ := query.Count()
//	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)
//
//	return data, total
//}
//
//func EquipmentMeterTypeDataList(params *EquipmentMeterTypeQueryParam) [] *EquipmentMeterType {
//	params.Limit = -1
//	params.Sort = "Id"
//	params.Order = "asc"
//	data, _ := EquipmentMeterTypePageList(params)
//	return data
//}
//
//func EquipmentMeterTypeBatchDelete(ids []int) (int64, error) {
//	query := orm.NewOrm().QueryTable(EquipmentMeterTypeTBName())
//	num, err := query.Filter("id__in", ids).Delete()
//	return num, err
//}
//
//func EquipmentMeterTypeOne(id int) (*EquipmentMeterType, error) {
//	o := orm.NewOrm()
//	m := EquipmentMeterType{Id: id}
//	err := o.Read(&m)
//	if err != nil {
//		return nil, err
//	}
//	return &m, nil
//}
//49283.44
