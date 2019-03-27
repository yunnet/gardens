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

package controllers

import (
	"encoding/json"

	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"

	"fmt"
	"strconv"
	"strings"

	"github.com/astaxie/beego/orm"
)

//RoleController 角色管理
type RoleController struct {
	BaseController
}

//Prepare 参考beego官方文档说明
func (this *RoleController) Prepare() {
	//先执行
	this.BaseController.Prepare()

	//如果一个Controller的多数Action都需要权限控制，则将验证放到Prepare
	this.checkAuthor("DataGrid", "DataList", "UpdateSeq")

	//如果一个Controller的所有Action都需要登录验证，则将验证放到Prepare
	//权限控制里会进行登录验证，因此这里不用再作登录验证
	//this.checkLogin()
}

//Index 角色管理首页
func (this *RoleController) Index() {
	this.Data["pageTitle"] = "角色管理"

	//是否显示更多查询条件的按钮
	this.Data["showMoreQuery"] = false

	//将页面左边菜单的某项激活
	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)

	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "role/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "role/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("RoleController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("RoleController", "Delete")
	this.Data["canAllocate"] = this.checkActionAuthor("RoleController", "Allocate")
}

// DataGrid 角色管理首页 表格获取数据
func (this *RoleController) DataGrid() {
	//直接反序化获取json格式的requestbody里的值
	var params models.RoleQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	//获取数据列表和总数
	data, total := models.RolePageList(&params)

	//定义返回的数据结构
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//DataList 角色列表
func (this *RoleController) DataList() {
	var params = models.RoleQueryParam{}

	//获取数据列表和总数
	data := models.RoleDataList(&params)

	//定义返回的数据结构
	this.jsonResult(enums.JRCodeSucc, "", data)
}

//Edit 添加、编辑角色界面
func (this *RoleController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.Role{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	}
	this.Data["m"] = m
	this.setTpl("role/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "role/edit_footerjs.html"
}

//Save 添加、编辑页面 保存
func (this *RoleController) Save() {
	var err error
	m := models.Role{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	o := orm.NewOrm()
	if m.Id == 0 {
		if _, err = o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}

	} else {
		if _, err = o.Update(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

//Delete 批量删除
func (this *RoleController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))

	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.RoleBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}

//Allocate 给角色分配资源界面
func (this *RoleController) Allocate() {
	roleId, _ := this.GetInt("id", 0)
	strs := this.GetString("ids")

	o := orm.NewOrm()
	m := models.Role{Id: roleId}
	if err := o.Read(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "数据无效，请刷新后重试", "")
	}

	//删除已关联的历史数据
	if _, err := o.QueryTable(models.RoleResourceRelTBName()).Filter("role__id", m.Id).Delete(); err != nil {
		this.jsonResult(enums.JRCodeFailed, "删除历史关系失败", "")
	}

	var relations []models.RoleResourceRel
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			r := models.Resource{Id: id}
			relation := models.RoleResourceRel{Role: &m, Resource: &r}
			relations = append(relations, relation)
		}
	}

	if len(relations) > 0 {
		//批量添加
		if _, err := o.InsertMulti(len(relations), relations); err == nil {
			this.jsonResult(enums.JRCodeSucc, "保存成功", "")
		}
	}

	this.jsonResult(0, "保存失败", "")
}

func (this *RoleController) UpdateSeq() {
	Id, _ := this.GetInt("pk", 0)
	oM, err := models.RoleOne(Id)
	if err != nil || oM == nil {
		this.jsonResult(enums.JRCodeFailed, "选择的数据无效", 0)
	}

	value, _ := this.GetInt("value", 0)
	oM.Seq = value

	o := orm.NewOrm()
	if _, err := o.Update(oM); err == nil {
		this.jsonResult(enums.JRCodeSucc, "修改成功", oM.Id)
	} else {
		this.jsonResult(enums.JRCodeFailed, "修改失败", oM.Id)
	}
}
