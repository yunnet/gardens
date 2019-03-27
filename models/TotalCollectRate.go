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

type TotalCollectRate struct {
	CollectDate  time.Time `orm:"column(collect_date)"`
	CustomerNO   string    `orm:"column(customer_no)"`
	CustomerName string    `orm:"column(customer_name)"`
	Num          int       `orm:"column(num)"`
	NeedRows     float64   `orm:"digits(12);decimals(0);column(need_rows)"`
	Rows         int       `orm:"column(rows)"`
	Rate         float64   `orm:"digits(12);decimals(2);column(rate)"`
}

type TotalCollectRateQueryParam struct {
	BaseQueryParam
	CollectDate  string
	CustomerNO   string
	CustomerName string
}

const C_SQL_TOTALCOLLECTRATE_ROWS = "SELECT count(1) as `rows` FROM v_collect_total_rate where collect_date BETWEEN '%s' and '%s' and customer_no like '%s%%' and customer_name like '%s%%' "
const C_SQL_TOTALCOLLECTRATE = "SELECT collect_date, customer_no, customer_name, num, need_rows, `rows`, rate FROM v_collect_total_rate where collect_date BETWEEN '%s' and '%s' and customer_no like '%s%%' and customer_name like '%s%%' "

func TotalCollectRatePageList(params *TotalCollectRateQueryParam) ([]*TotalCollectRate, int64) {
	if len(strings.TrimSpace(params.CollectDate)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectDate, " - ")
	beginTime := ary[0] + " 00:00:00"
	endTime := ary[1] + " 23:59:59"

	data := make([]*TotalCollectRate, 0)
	o := orm.NewOrm()
	o.Using("kxtimingdata")

	var total int64
	sql := fmt.Sprintf(C_SQL_TOTALCOLLECTRATE_ROWS, beginTime, endTime, params.CustomerNO, params.CustomerName)
	err := o.Raw(sql).QueryRow(&total)
	if err != nil {
		return nil, 0
	}

	sql2 := fmt.Sprintf(C_SQL_TOTALCOLLECTRATE, beginTime, endTime, params.CustomerNO, params.CustomerName)
	sql2 = sql2 + fmt.Sprintf(" LIMIT %d, %d", params.Offset, params.Limit)

	_, err = o.Raw(sql2).QueryRows(&data)
	if err != nil {
		return nil, 0
	}
	return data, total
}
