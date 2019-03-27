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

type EquipmentRoom struct {
	Id           int       `orm:"column(id)" form:"Id"`
	RoomNO       string    `orm:"column(room_no)" form:"RoomNO"`
	RoomName     string    `orm:"column(room_name)" form:"RoomName"`
	CustomerNO   string    `orm:"column(customer_no)" form:"CustomerNO"`
	CustomerName string    `orm:"-" `
	Used         int       `orm:"column(tag)" form:"Used"`
	CreateUser   string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate   time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser   string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate   time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentRoomQueryParam struct {
	BaseQueryParam
	RoomNO   string
	RoomName string
	Used     string
}

func init() {
	orm.RegisterModel(new(EquipmentRoom))
}

func EquipmentRoomTBName() string {
	return "equipment_room"
}

func (this *EquipmentRoom) TableName() string {
	return EquipmentRoomTBName()
}

func EquipmentRoomPageList(params *EquipmentRoomQueryParam) ([]*EquipmentRoom, int64) {
	query := orm.NewOrm().QueryTable(EquipmentRoomTBName())
	data := make([]*EquipmentRoom, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "RoomNO":
		sortorder = "room_no"
	case "RoomName":
		sortorder = "room_name"
	case "CustomerNO":
		sortorder = "CustomerNO"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("RoomNO__istartswith", params.RoomNO)
	query = query.Filter("RoomName__contains", params.RoomName)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentRoomDataList(params *EquipmentRoomQueryParam) []*EquipmentRoom {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentRoomPageList(params)
	return data
}

func EquipmentRoomBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentRoomTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentRoomOne(id int) (*EquipmentRoom, error) {
	o := orm.NewOrm()
	m := EquipmentRoom{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
