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

type TotalDtuRows struct {
	CollectDate  time.Time `orm:"column(collect_date)"`
	DTU_no       string    `orm:"column(dtu_no)"`
	MeterAddress int       `orm:"column(meter_address)"`
	NeedRows     float64   `orm:"digits(12);decimals(0);column(need_rows)"`
	Rows         int       `orm:"column(rows)"`
	Rate         float64   `orm:"digits(12);decimals(2);column(rate)"`
}

type TotalDtuRowsQueryParam struct {
	BaseQueryParam
	CollectDate  string
	DTU_no       string
	MeterAddress string
}

const C_SQL_TOTALDTUROWS = "SELECT ct.collect_date, ct.dtu_no, ct.meter_address, dt.need_rows, ct.`rows`, (ct.`rows`/ dt.need_rows * 100) as rate FROM collect_total_dtu_rows as ct " +
	"LEFT JOIN gdkxdl.v_equipment_dtu_config as dt ON ct.dtu_no = dt.dtu_no " +
	"WHERE ct.collect_date BETWEEN '%s' and '%s' and ct.dtu_no like '%s%%' and ct.meter_address = %s"

func TotalDtuRowsPageList(params *TotalDtuRowsQueryParam) ([]*TotalDtuRows, int64) {
	if len(strings.TrimSpace(params.CollectDate)) <= 0 {
		return nil, 0
	}
	if len(strings.TrimSpace(params.DTU_no)) <= 0 {
		return nil, 0
	}
	if len(strings.TrimSpace(params.MeterAddress)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectDate, " - ")
	beginTime := ary[0]
	endTime := ary[1]

	data := make([]*TotalDtuRows, 0)
	o := orm.NewOrmUsingDB("kxtimingdata")

	sql := fmt.Sprintf(C_SQL_TOTALDTUROWS,
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

	if _, err = o.Raw(sql).QueryRows(&data); err != nil {
		return nil, 0
	}
	return data, total
}

func TotalDtuRowsDataList(params *TotalDtuRowsQueryParam) []*TotalDtuRows {
	params.Limit = 65535
	params.Sort = "collect_date"
	params.Order = "asc"
	data, _ := TotalDtuRowsPageList(params)
	return data
}
