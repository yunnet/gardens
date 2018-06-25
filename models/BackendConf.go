package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type BackendConf struct {
	Id         int       `form:"Id"`
	AppName    string    `orm:"column(appname)" form:"AppName"`
	AppVersion string    `orm:"column(appversion)" form:"AppVersion"`
	Deploy     string    `orm:"column(deploy)"  form:"Deploy"`
	ConfigText string    `orm:"column(configtext)" form:"ConfigText"`
	Used       int       `orm:"column(tag)" form:"Used"`
	CreateUser string    `orm:"column(createuser)" form:"CreateUser"`
	CreateDate time.Time `orm:"column(createdate)" form:"CreateDate"`
	ChangeUser string    `orm:"column(changeuser)" form:"ChangeUser"`
	ChangeDate time.Time `orm:"column(changedate)" form:"ChangeDate"`
}

type BackendConfQueryParam struct {
	BaseQueryParam
	AppName string
	Used    string //为空不查询，有值精确查询
}

func init() {
	orm.RegisterModel(new(BackendConf))
}

func BackendConfTBName() string {
	return "sys_backend_conf"
}

func (this *BackendConf) TableName() string {
	return BackendConfTBName()
}

func BackendConfPageList(params *BackendConfQueryParam) ([]*BackendConf, int64) {
	query := orm.NewOrm().QueryTable(BackendConfTBName())
	data := make([]*BackendConf, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("AppName__istartswith", params.AppName)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func BackendConfDataList(params *BackendConfQueryParam) [] *BackendConf {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := BackendConfPageList(params)
	return data
}

//delete
func BackendConfBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(BackendConfTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}
