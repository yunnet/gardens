package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

//角色与资源关系表
type RoleResourceRel struct {
	Id       int
	Role     *Role     `orm:"rel(fk)"`  //外键
	Resource *Resource `orm:"rel(fk)" ` //外键
	Created  time.Time `orm:"auto_now_add;type(datetime)"`
}

func init() {
	orm.RegisterModel(new(RoleResourceRel))
}

//角色与资源多对多关系表
func RoleResourceRelTBName() string {
	return "sys_role_resource_rel"
}

func (this *RoleResourceRel) TableName() string {
	return RoleResourceRelTBName()
}
