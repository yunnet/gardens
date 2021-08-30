// Copyright 2018 gardens Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package models

import (
	"github.com/beego/beego/v2/client/orm"
	"time"
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

func (c *RoleResourceRel) TableName() string {
	return RoleResourceRelTBName()
}
