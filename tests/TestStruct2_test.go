package test

import (
	"testing"
	"fmt"
	"strconv"
	"encoding/json"
	"github.com/astaxie/beego/orm"

	_ "github.com/go-sql-driver/mysql"
)

type (
	CustomerForMeter struct {
		CustomerID        string `orm:"column(customer_id)"`
		CustomerName      string `orm:"column(customer_name)"`
		DTU_no            string `orm:"column(dtu_no)"`
		MeterAddress      int    `orm:"column(meter_address)"`
		MeterTypeNO       string `orm:"column(meter_type_no)"`
		CollectConfigName string `orm:"column(collect_config_name)"`
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

func TestStruct2JSON(t *testing.T) {
	orm.RegisterDataBase("default", "mysql", "root:root@tcp(127.0.0.1:3306)/gdkxdl?charset=utf8&loc=Asia%2FShanghai", 30)
	sql := "SELECT customer_id, customer_name, dtu_no, meter_address, meter_type_no, collect_config_name FROM v_customer_for_meter"
	lists := make([]*CustomerForMeter, 0)
	_, err := orm.NewOrm().Raw(sql).QueryRows(&lists)
	if err != nil {
		panic(err.Error())
	}

	var master *RootItem
	var company *CompanyItem
	var dtu *DtuItem

	master = &RootItem{Name: "电可托"}

	for _, row := range lists {
		meter := MeterItem{strconv.Itoa(row.MeterAddress), row.CollectConfigName}

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

	bytes, _ := json.Marshal(master)
	fmt.Printf("%s\n", bytes)
}
