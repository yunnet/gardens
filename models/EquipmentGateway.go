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

type EquipmentGateway struct {
	Id          int       `orm:"column(id)" form:"Id"`
	GatewayNO   string    `orm:"column(gateway_no)" form:"GatewayNO"`
	GatewayDesc string    `orm:"column(gateway_desc)" form:"GatewayDesc"`
	Used        int       `orm:"column(tag)" form:"Used"`
	CreateUser  string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate  time.Time `orm:"auto_now_add;type(datetime);column(createdate)" form:"CreateDate"`
	ChangeUser  string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate  time.Time `orm:"auto_now;type(datetime);column(changedate)" form:"ChangeDate"`
}

type EquipmentGatewayQueryParam struct {
	BaseQueryParam
	GatewayNO   string
	GatewayDesc string
	Used        string
}

func init() {
	orm.RegisterModel(new(EquipmentGateway))
}

//设备网关通道
func EquipmentGatewayTBName() string {
	return "equipment_gateway"
}

func (this *EquipmentGateway) TableName() string {
	return EquipmentGatewayTBName()
}

func EquipmentGatewayPageList(params *EquipmentGatewayQueryParam) ([]*EquipmentGateway, int64) {
	query := orm.NewOrm().QueryTable(EquipmentGatewayTBName())
	data := make([]*EquipmentGateway, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "GatewayNO":
		sortorder = "gateway_no"
	case "GatewayDesc":
		sortorder = "GatewayDesc"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("GatewayNO__istartswith", params.GatewayNO)
	query = query.Filter("GatewayDesc__istartswith", params.GatewayDesc)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentGatewayDataList(params *EquipmentGatewayQueryParam) []*EquipmentGateway {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentGatewayPageList(params)
	return data
}

func EquipmentGatewayBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentGatewayTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentGatewayOne(id int) (*EquipmentGateway, error) {
	o := orm.NewOrm()
	m := EquipmentGateway{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
