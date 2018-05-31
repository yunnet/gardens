package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type SystemVal struct {
	Id         int       `form:"id"`
	Code       string    `orm:"column(code)"`
	Desc       string    `orm:"column(desc)"`
	Value      string    `orm:"column(value)"`
	UpLimit    string    `orm:"column(uplimit)"`
	Step       string    `orm:"column(step)"`
	Used       int       `orm:"column(tag)"`
	CreateUser string    `orm:"column(createuser)"`
	CreateDate time.Time `orm:"column(createdate)"`
	ChangeUser string    `orm:"column(changeuser)"`
	ChangeDate time.Time `orm:"column(changedate)"`
}

type SystemValQueryParam struct {
	BaseQueryParam
	Code string
	Desc string
	Used string //为空不查询，有值精确查询
}

func SystemValTBName() string {
	return "sys_val"
}

func (this *SystemVal) TableName() string {
	return SystemValTBName()
}

func SystemValPageList(params *SystemValQueryParam) ([]*SystemVal, int64) {
	query := orm.NewOrm().QueryTable(SystemValTBName())
	data := make([]*SystemVal, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("code__contains", params.Code)
	query = query.Filter("desc__contains", params.Desc)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()

	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func SystemValDataList(params *SystemValQueryParam) []*SystemVal {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := SystemValPageList(params)
	return data
}

func SystemValBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(SystemValTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func SystemValOne(id int) (*SystemVal, error) {
	o := orm.NewOrm()
	m := SystemVal{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
