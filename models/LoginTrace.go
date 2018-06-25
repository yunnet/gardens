package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type LoginTrace struct {
	Id         int64     `orm:"column(id)" form:"Id"`
	UserName   string    `orm:"column(user)" form:"UserName"`
	RemoteAddr string    `orm:"column(remoteAddr)" form:"RemoteAddr"`
	LoginTime  time.Time `orm:"column(loginTime)" form:"LoginTime"`
}

type LoginTraceQueryParam struct {
	BaseQueryParam
	UserName string
}

func init() {
	orm.RegisterModel(new(LoginTrace))
}

func LoginTraceTBName() string {
	return "sys_logintrace"
}

func (this *LoginTrace) TableName() string {
	return LoginTraceTBName()
}

func LoginTracePageList(params *LoginTraceQueryParam) ([] *LoginTrace, int64) {
	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query := orm.NewOrm().QueryTable(LoginTraceTBName())
	data := make([]*LoginTrace, 0)
	query = query.Filter("UserName__istartswith", params.UserName)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func LoginTraceDataList(params *LoginTraceQueryParam) [] *LoginTrace {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := LoginTracePageList(params)
	return data
}

func LoginTraceAdd(_user string, _remote_add string, _login_time time.Time) error {
	m := LoginTrace{UserName: _user, RemoteAddr: _remote_add, LoginTime: _login_time}

	o := orm.NewOrm()
	if _, err := o.Insert(&m); err == nil {
		return nil
	} else {
		return err
	}
}
