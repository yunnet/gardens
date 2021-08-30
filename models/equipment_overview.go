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
	"strings"
	"time"
)

type EquipmentOverview struct {
	CollectDate  time.Time `orm:"column(collect_date)"`
	CustomerNO   string    `orm:"column(customer_no)"`
	CustomerName string    `orm:"column(customer_name)" `
	DTU_no       string    `orm:"column(dtu_no)"`
	MeterAddress int       `orm:"column(meter_address)"`
	MeterTypeNO  string    `orm:"column(meter_type_no)" `
	MeterType    string    `orm:"column(meter_type)"`
	GatewayNO    string    `orm:"column(gateway_no)" `
	GatewayDesc  string    `orm:"column(gateway_desc)" `
	NeedRows     float64   `orm:"digits(12);decimals(0);column(need_rows)"`
	Rows         int       `orm:"column(rows)"`
	Rate         float64   `orm:"digits(12);decimals(2);column(rate)"`
}

type EquipmentOverviewQueryParam struct {
	BaseQueryParam
	CollectDate string
}

const C_SQL_EQUIPMENTOVERVIEW = "SELECT collect_date, customer_no, customer_name, dtu_no, meter_address, meter_type_no, meter_type, gateway_no, gateway_desc, need_rows, rows, (rows/need_rows*100) as rate FROM v_equipment_overview " +
	"WHERE collect_date BETWEEN '%s' and '%s' ORDER BY customer_no, collect_date, dtu_no, meter_address"

func EquipmentOverviewPageList(params *EquipmentOverviewQueryParam) ([]*EquipmentOverview, int64) {
	if len(strings.TrimSpace(params.CollectDate)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectDate, " - ")
	beginTime := ary[0]
	endTime := ary[1]

	data := make([]*EquipmentOverview, 0)
	o := orm.NewOrm()
	o.Using("kxtimingdata")
	sql := fmt.Sprintf(C_SQL_EQUIPMENTOVERVIEW,
		beginTime,
		endTime,
	)
	total, err := o.Raw(sql).QueryRows(&data)
	if err != nil {
		return nil, 0
	}

	sql = sql + fmt.Sprintf(" LIMIT %d, %d", params.Offset, params.Limit)

	if _, err = o.Raw(sql).QueryRows(&data); err != nil {
		return nil, 0
	}
	return data, total
}

func EquipmentOverviewDataList(params *EquipmentOverviewQueryParam) []*EquipmentOverview {
	params.Limit = 65535
	params.Sort = "collect_date"
	params.Order = "asc"
	data, _ := EquipmentOverviewPageList(params)
	return data
}
