package models

import (
	"time"
	"strings"
	"fmt"
	"github.com/astaxie/beego/orm"
)

type TotalDtuRows struct {
	CollectDate  time.Time `orm:"column(collect_date)"`
	DTU_no       string    `orm:"column(dtu_no)"`
	MeterAddress int       `orm:"column(meter_address)"`
	Rows         int       `orm:"column(rows)"`
}

type TotalDtuRowsQueryParam struct {
	BaseQueryParam
	CollectDate  string
	DTU_no       string
	MeterAddress string
}


func TotalDtuRowsPageList(params *TotalDtuRowsQueryParam) ([] *TotalDtuRows, int64) {
	if len(strings.TrimSpace(params.CollectDate)) <= 0 {
		return nil, 0
	}
	if len(strings.TrimSpace(params.MeterAddress)) <= 0 {
		return nil, 0
	}

	//2018-06-01 - 2018-06-22
	ary := strings.Split(params.CollectDate, " - ")
	beginTime := ary[0]
	endTime := ary[1]

	data := make([] *TotalDtuRows, 0)
	o := orm.NewOrm()
	o.Using("kxtimingdata")
	sql := fmt.Sprintf(`SELECT collect_date, dtu_no, meter_address, rows		 
		FROM collect_total_dtu_rows 
       where collect_date BETWEEN '%s' and '%s'
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

	if _, err = o.Raw(sql).QueryRows(&data); err != nil {
		return nil, 0
	}
	return data, total
}

func TotalDtuRowsDataList(params *TotalDtuRowsQueryParam) [] *TotalDtuRows {
	params.Limit = 65535
	params.Sort = "collect_date"
	params.Order = "asc"
	data, _ := TotalDtuRowsPageList(params)
	return data
}