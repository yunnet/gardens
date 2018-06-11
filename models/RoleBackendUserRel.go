package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

//角色与用户关系
type RoleBackendUserRel struct {
	Id          int
	Role        *Role        `orm:"rel(fk)"`  //外键
	BackendUser *BackendUser `orm:"rel(fk)" ` // 外键
	Created     time.Time    `orm:"auto_now_add;type(datetime)"`
}

func init() {
	orm.RegisterModel(new(RoleBackendUserRel))
}

//角色与用户多对多关系表
func RoleBackendUserRelTBName() string {
	return "sys_role_backenduser_rel"
}

func (this *RoleBackendUserRel) TableName() string {
	return RoleBackendUserRelTBName()
}
