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

type TerminalTrace struct {
	CollectTime   time.Time `orm:"column(collect_time)"`
	DTU_no        string    `orm:"column(dtu_no)"`
	MeterAddress  int       `orm:"column(meter_address)"`
	RemoteAddress string    `orm:"column(remote_address)"`
	Linked        int       `orm:"column(linked)"`
}

type TerminalTraceQueryParam struct {
	BaseQueryParam
	CollectTime  string
	DTU_no       string
	MeterAddress string
}

const C_SQL_TERMINAL_TRACE_ROWS = "SELECT count(1) as `rows` FROM collect_login_trace  where collect_time >= '%s' and collect_time <= '%s' and dtu_no like '%s%%' and meter_address like '%s%%' "
const C_SQL_TERMINAL_TRACE = `SELECT collect_time, dtu_no, meter_address, remote_address, linked FROM collect_login_trace where collect_time >= '%s' and collect_time <= '%s' and dtu_no like '%s%%' and meter_address like '%s%%' `

func TerminalTracePageList(params *TerminalTraceQueryParam) ([]*TerminalTrace, int64) {
	if len(strings.TrimSpace(params.CollectTime)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectTime, " - ")
	beginTime := ary[0] + " 00:00:00"
	endTime := ary[1] + " 23:59:59"

	data := make([]*TerminalTrace, 0)
	o := orm.NewOrm()
	o.Using("kxtimingdata")

	var total int64
	sql := fmt.Sprintf(C_SQL_TERMINAL_TRACE_ROWS, beginTime, endTime, params.DTU_no, params.MeterAddress)
	err := o.Raw(sql).QueryRow(&total)
	if err != nil {
		return nil, 0
	}

	sql2 := fmt.Sprintf(C_SQL_TERMINAL_TRACE, beginTime, endTime, params.DTU_no, params.MeterAddress)
	sql2 = sql2 + fmt.Sprintf(" LIMIT %d, %d", params.Offset, params.Limit)

	_, err = o.Raw(sql2).QueryRows(&data)
	if err != nil {
		return nil, 0
	}
	return data, total
}
