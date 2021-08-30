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
	"gardens/enums"
	"gardens/models"
	"github.com/beego/beego/v2/client/orm"
	"strconv"
	"strings"
	"time"
)

type EquipmentGatewayController struct {
	BaseController
}

func (c *EquipmentGatewayController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (c *EquipmentGatewayController) Index() {
	c.Data["pageTitle"] = "通讯方式"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentgateway/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentgateway/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentGatewayController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentGatewayController", "Delete")
}

func (c *EquipmentGatewayController) DataGrid() {
	var params models.EquipmentGatewayQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentGatewayPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

//下拉选择列表
func (c *EquipmentGatewayController) SelectPicker() {
	var params = models.EquipmentGatewayQueryParam{}
	params.Used = c.GetString("Used")
	data := models.EquipmentGatewayDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentGatewayController) DataList() {
	var params = models.EquipmentGatewayQueryParam{}
	data := models.EquipmentGatewayDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentGatewayController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentGateway{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
	}

	c.Data["m"] = m
	c.setTpl("equipmentgateway/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentgateway/edit_footerjs.html"
}

func (c *EquipmentGatewayController) Save() {
	var err error
	m := models.EquipmentGateway{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}
	m.ChangeUser = c.curUser.RealName

	o := orm.NewOrm()
	if m.Id == 0 {
		to, err := o.Begin()
		if err != nil {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}

		if m.GatewayNO, err = GetSysValNO("gatewayno"); err != nil {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			to.Rollback()
			return
		}

		m.CreateUser = c.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			if err = to.Commit(); err != nil {
				c.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
			} else {
				c.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
			}
		} else {
			if err = to.Rollback(); err != nil {
				c.jsonResult(enums.JRCodeFailed, "添加回滚失败", m.Id)
			} else {
				c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			}
		}
	} else {
		if _, err = o.Update(&m, "GatewayDesc", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentGatewayController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentGatewayBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
