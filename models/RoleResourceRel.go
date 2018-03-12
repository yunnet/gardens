package models

import "time"

//角色与资源关系表
type RoleResourceRel struct {
	Id       int
	Role     *Role     `orm:"rel(fk)"`  //外键
	Resource *Resource `orm:"rel(fk)" ` // 外键
	Created  time.Time `orm:"auto_now_add;type(datetime)"`
}

//角色与资源多对多关系表
func RoleResourceRelTBName() string {
	return "sys_role_resource_rel"
}

func (this *RoleResourceRel) TableName() string {
	return RoleResourceRelTBName()
}
