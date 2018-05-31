package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type EquipmentDtuConfig struct {
	Id           int       `form:"id"`
	DTU_no       string    `orm:"column(dtu_no)"`
	Room_no      string    `orm:"column(room_no)"`
	Sim_no       string    `orm:"column(sim_no)"`
	TimeInterval int       `orm:"column(time_interval)"`
	Used         int       `orm:"column(tag)"`
	CreateUser   string    `orm:"column(createuser)"`
	CreateDate   time.Time `orm:"auto_now_add;type(datetime);column(createdate)"`
	ChangeUser   string    `orm:"column(changeuser)"`
	ChangeDate   time.Time `orm:"auto_now;type(datetime);column(changedate)"`
}

type EquipmentDtuConfigQueryParam struct {
	BaseQueryParam
	DTU_no  string
	Room_no string
	Sim_no  string
	Used    string //为空不查询，有值精确查询
}

//DTU配置
func EquipmentDtuConfigTBName() string {
	return "equipment_dtu_config"
}

func (this *EquipmentDtuConfig) TableName() string {
	return EquipmentDtuConfigTBName()
}

func EquipmentDtuConfigCount() int64 {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	total, _ := query.Count()
	return total
}

func EquipmentDtuConfigPageList(params *EquipmentDtuConfigQueryParam) ([]*EquipmentDtuConfig, int64) {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	data := make([]*EquipmentDtuConfig, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("DTU_no__contains", params.DTU_no)
	query = query.Filter("Room_no__contains", params.Room_no)
	query = query.Filter("Sim_no__contains", params.Sim_no)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentDtuConfigDataList(params *EquipmentDtuConfigQueryParam) []*EquipmentDtuConfig {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentDtuConfigPageList(params)
	return data
}

//delete
func EquipmentDtuConfigBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentDtuConfigTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentDtuConfigOne(id int) (*EquipmentDtuConfig, error) {
	o := orm.NewOrm()
	m := EquipmentDtuConfig{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
