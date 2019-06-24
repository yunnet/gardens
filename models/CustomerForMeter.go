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
	"encoding/json"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	"strconv"
)

type (
	CustomerForMeter struct {
		CustomerName string `orm:"column(customer_name)"`
		DTU_no       string `orm:"column(dtu_no)"`
		MeterAddress int    `orm:"column(meter_address)"`
		MeterTypeNO  string `orm:"column(meter_type_no)"`
		LoopName     string `orm:"column(loop_name)"`
	}

	RootItem struct {
		Name            string         `json:"name"`
		CompanyItemList []*CompanyItem `json:"children"`
	}

	CompanyItem struct {
		Name        string     `json:"name"`
		DtuItemList []*DtuItem `json:"children"`
	}

	DtuItem struct {
		Name          string       `json:"name"`
		MeterItemList []*MeterItem `json:"children"`
	}

	MeterItem struct {
		Name string `json:"name"`
		Desc string `json:"desc"`
	}
)

func CustomerForMeterDataList() ([]*CustomerForMeter, error) {
	data := make([]*CustomerForMeter, 0)
	sql := "SELECT customer_name, dtu_no, meter_address, meter_type, loop_name  FROM v_customer_room_meter"
	if _, err := orm.NewOrm().Raw(sql).QueryRows(&data); err != nil {
		return nil, err
	}
	return data, nil
}

func GetCustomerForMeter() (string, error) {
	data, err := CustomerForMeterDataList()
	if err != nil {
		return "", err
	}

	var master *RootItem
	var company *CompanyItem
	var dtu *DtuItem

	var appName = beego.AppConfig.String("site.name")
	master = &RootItem{Name: appName}

	for _, row := range data {
		meter := MeterItem{strconv.Itoa(row.MeterAddress), row.LoopName}

		var dtu_cur *DtuItem
		var company_cur *CompanyItem

		if company == nil {
			company_cur = &CompanyItem{Name: row.CustomerName}
			master.CompanyItemList = append(master.CompanyItemList, company_cur)
		} else {
			company_cur = company
			if company_cur.Name != row.CustomerName {
				company_cur = &CompanyItem{Name: row.CustomerName}
				master.CompanyItemList = append(master.CompanyItemList, company_cur)
			}
		}

		if dtu == nil {
			dtu_cur = &DtuItem{Name: row.DTU_no}
			company_cur.DtuItemList = append(company_cur.DtuItemList, dtu_cur)
		} else {
			dtu_cur = dtu
			if dtu_cur.Name != row.DTU_no {
				dtu_cur = &DtuItem{Name: row.DTU_no}
				company_cur.DtuItemList = append(company_cur.DtuItemList, dtu_cur)
			}
		}
		dtu_cur.MeterItemList = append(dtu_cur.MeterItemList, &meter)

		dtu = dtu_cur
		company = company_cur
	}

	jsondata, _ := json.Marshal(master)
	return string(jsondata), nil
}
