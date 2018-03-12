package models

import "github.com/astaxie/beego/orm"

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

func CustomerForMeterTBName() string {
	return "v_customer_for_meter"
}

func CustomerForMeterDataList() ([] *CustomerForMeter, error) {
	data := make([] *CustomerForMeter, 0)
	sql := "SELECT customer_id, customer_name,dtu_no, meter_address, meter_type_no, collect_config_name FROM v_customer_for_meter"
	_, err := orm.NewOrm().Raw(sql).QueryRows(&data)
	if err != nil {
		return nil, err
	}
	return data, nil
}
