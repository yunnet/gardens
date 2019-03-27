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
	"github.com/astaxie/beego/orm"
	"strings"
	"time"
)

type TotalActivePowerMinute struct {
	CollectTime      time.Time `orm:"column(collect_time)"`
	DTU_no           string    `orm:"column(dtu_no)"`
	MeterAddress     int       `orm:"column(meter_address)"`
	TotalActivePower float64   `orm:"digits(12);decimals(4);column(total_active_power)"`
}

type TotalActivePowerMinuteQueryParam struct {
	BaseQueryParam
	CollectTime  string
	DTU_no       string
	MeterAddress string
}

func TotalActivePowerMinutePageList(params *TotalActivePowerMinuteQueryParam) ([]*TotalActivePowerMinute, int64) {
	if len(strings.TrimSpace(params.CollectTime)) <= 0 {
		return nil, 0
	}

	if len(strings.TrimSpace(params.MeterAddress)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectTime, " - ")
	beginTime := ary[0] + " 00:00:00"
	endTime := ary[1] + " 23:59:59"

	data := make([]*TotalActivePowerMinute, 0)
	o := orm.NewOrm()
	o.Using("kxtimingdata")
	sql := fmt.Sprintf(`SELECT collect_time, dtu_no, meter_address, total_active_power		 
		FROM collect_total_active_power_minute 
       where collect_time >= '%s' and collect_time <= '%s'
         and dtu_no like '%s%%'
         and meter_address = %s
       `,
		beginTime,
		endTime,
		params.DTU_no,
		params.MeterAddress,
	)
	total, err := o.Raw(sql).QueryRows(&data)
	if err != nil {
		return nil, 0
	}

	sql = sql + fmt.Sprintf(" LIMIT %d, %d", params.Offset, params.Limit)

	_, err = o.Raw(sql).QueryRows(&data)
	if err != nil {
		return nil, 0
	}
	return data, total
}

func TotalActivePowerMinuteDataList(params *TotalActivePowerMinuteQueryParam) []*TotalActivePowerMinute {
	params.Limit = -1
	params.Sort = "collect_time"
	params.Order = "asc"
	data, _ := TotalActivePowerMinutePageList(params)
	return data
}
