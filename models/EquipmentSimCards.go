package models

import (
	"github.com/astaxie/beego/orm"
	"time"
	"fmt"
)

type EquipmentSimCards struct {
	Id         int       `form:"id"`
	Sim_no     string    `orm:"column(sim_no)"`
	Used       int       `orm:"column(tag)"`
	CreateUser string    `orm:"column(createuser)"`
	CreateDate time.Time `orm:"column(createdate)"`
	ChangeUser string    `orm:"column(changeuser)"`
	ChangeDate time.Time `orm:"column(changedate)"`
}

type EquipmentSimCardsQueryParam struct {
	BaseQueryParam
	Sim_no string
	Used   string //为空不查询，有值精确查询
}

func EquipmentSimCardsTBName() string {
	return "equipment_simcards"
}

func (this *EquipmentSimCards) TableName() string {
	return EquipmentSimCardsTBName()
}

func EquipmentSimCardsPageList(params *EquipmentSimCardsQueryParam) ([]*EquipmentSimCards, int64) {
	query := orm.NewOrm().QueryTable(EquipmentSimCardsTBName())
	data := make([]*EquipmentSimCards, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("sim_no__istartswith", params.Sim_no)

	if len(params.Used) > 0 {
		query = query.Filter("Used", params.Used)
	}
	total, _ := query.Count()

	fmt.Println("params: ", params)

	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentSimCardsDataList(params *EquipmentSimCardsQueryParam) []*EquipmentSimCards {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentSimCardsPageList(params)
	return data
}

func EquipmentSimCardsBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentSimCardsTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentSimCardsOne(id int) (*EquipmentSimCards, error) {
	o := orm.NewOrm()
	m := EquipmentSimCards{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}

