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
	"fmt"
	"strconv"
	"strings"

	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
	"github.com/yunnet/gardens/utils"

	"github.com/astaxie/beego/orm"
)

type BackendUserController struct {
	BaseController
}

func (this *BackendUserController) Prepare() {
	//先执行
	this.BaseController.Prepare()
	//如果一个Controller的多数Action都需要权限控制，则将验证放到Prepare
	this.checkAuthor("DataGrid")
	//如果一个Controller的所有Action都需要登录验证，则将验证放到Prepare
	//权限控制里会进行登录验证，因此这里不用再作登录验证
	//this.checkLogin()

}
func (this *BackendUserController) Index() {
	this.Data["pageTitle"] = "用户管理"

	//是否显示更多查询条件的按钮
	this.Data["showMoreQuery"] = true

	//将页面左边菜单的某项激活
	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)

	//页面模板设置
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "backenduser/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "backenduser/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("BackendUserController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("BackendUserController", "Delete")
}

func (this *BackendUserController) DataGrid() {
	//直接反序化获取json格式的requestbody里的值（要求配置文件里 copyrequestbody=true）
	var params models.BackendUserQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	//获取数据列表和总数
	data, total := models.BackendUserPageList(&params)

	//定义返回的数据结构
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

// Edit 添加 编辑 页面
func (this *BackendUserController) Edit() {
	//如果是Post请求，则由Save处理
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := &models.BackendUser{}
	var err error
	if Id > 0 {
		m, err = models.BackendUserOne(Id)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
		o := orm.NewOrm()
		o.LoadRelated(m, "RoleBackendUserRel")
	} else {
		//添加用户时默认状态为启用
		m.Status = enums.Enabled
	}

	this.Data["m"] = m
	//获取关联的roleId列表
	var roleIds []string
	for _, item := range m.RoleBackendUserRel {
		roleIds = append(roleIds, strconv.Itoa(item.Role.Id))
	}
	this.Data["roles"] = strings.Join(roleIds, ",")
	this.setTpl("backenduser/edit.html", "shared/layout_pullbox.html")

	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "backenduser/edit_footerjs.html"
}

func (this *BackendUserController) Save() {
	m := models.BackendUser{}
	o := orm.NewOrm()
	var err error
	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//删除已关联的历史数据
	if _, err := o.QueryTable(models.RoleBackendUserRelTBName()).Filter("backenduser__id", m.Id).Delete(); err != nil {
		this.jsonResult(enums.JRCodeFailed, "删除历史关系失败", "")
	}

	if m.Id == 0 {
		//对密码进行加密
		m.UserPwd = utils.String2md5(m.UserPwd)
		if _, err := o.Insert(&m); err != nil {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if oM, err := models.BackendUserOne(m.Id); err != nil {
			this.jsonResult(enums.JRCodeFailed, "数据无效，请刷新后重试", m.Id)
		} else {
			m.UserPwd = strings.TrimSpace(m.UserPwd)
			if len(m.UserPwd) == 0 {
				//如果密码为空则不修改
				m.UserPwd = oM.UserPwd
			} else {
				m.UserPwd = utils.String2md5(m.UserPwd)
			}
			//本页面不修改头像和密码，直接将值附给新m
			m.Avatar = oM.Avatar
		}
		if _, err := o.Update(&m); err != nil {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}

	//添加关系
	var relations []models.RoleBackendUserRel
	for _, roleId := range m.RoleIds {
		r := models.Role{Id: roleId}
		relation := models.RoleBackendUserRel{BackendUser: &m, Role: &r}
		relations = append(relations, relation)
	}
	if len(relations) > 0 {
		//批量添加
		if _, err := o.InsertMulti(len(relations), relations); err == nil {
			this.jsonResult(enums.JRCodeSucc, "保存成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "保存失败", m.Id)
		}
	} else {
		this.jsonResult(enums.JRCodeSucc, "保存成功", m.Id)
	}
}

func (this *BackendUserController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	query := orm.NewOrm().QueryTable(models.BackendUserTBName())
	if num, err := query.Filter("id__in", ids).Delete(); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
