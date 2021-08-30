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

type EquipmentCustomerController struct {
	BaseController
}

func (c *EquipmentCustomerController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (c *EquipmentCustomerController) Index() {
	c.Data["pageTitle"] = "客户管理"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentcustomer/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentcustomer/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentCustomerController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentCustomerController", "Delete")
}

func (c *EquipmentCustomerController) DataGrid() {
	var params models.EquipmentCustomerQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentCustomerPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

//客户下拉选择列表
func (c *EquipmentCustomerController) SelectPicker() {
	var params = models.EquipmentCustomerQueryParam{}
	params.Used = c.GetString("Used")
	data := models.EquipmentCustomerDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentCustomerController) DataList() {
	var params = models.EquipmentCustomerQueryParam{}
	data := models.EquipmentCustomerDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentCustomerController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentCustomer{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.Zone = "天河区"
	}

	c.Data["m"] = m
	c.setTpl("equipmentcustomer/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentcustomer/edit_footerjs.html"
}

//add | update
func (c *EquipmentCustomerController) Save() {
	var err error
	m := models.EquipmentCustomer{}

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

		if m.CustomerNO, err = GetSysValNO("customerno"); err != nil {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			to.Rollback()
			return
		}

		m.CreateUser = c.curUser.RealName
		m.CreateDate = time.Now()

		_, err = o.Insert(&m)
		if  err == nil {
			if err = to.Commit(); err != nil {
				c.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
				to.Rollback()
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
		if _, err = o.Update(&m, "CustomerNO", "CustomerName", "CustomerDesc", "Contacts", "Phone", "Address", "Longitude", "Latitude", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentCustomerController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentCustomerBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
