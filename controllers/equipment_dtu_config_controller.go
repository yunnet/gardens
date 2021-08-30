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

type EquipmentDtuConfigController struct {
	BaseController
}

func (c *EquipmentDtuConfigController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (c *EquipmentDtuConfigController) Index() {
	c.Data["pageTitle"] = "网络设备管理"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentdtuconfig/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentdtuconfig/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentDtuConfigController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentDtuConfigController", "Delete")
}

func (c *EquipmentDtuConfigController) DataGrid() {
	var params models.EquipmentDtuConfigQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentDtuConfigPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

//下拉选择列表
func (c *EquipmentDtuConfigController) SelectPicker() {
	var params = models.EquipmentDtuConfigQueryParam{}
	params.Used = c.GetString("Used")
	data := models.EquipmentDtuConfigDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentDtuConfigController) DataList() {
	var params = models.EquipmentDtuConfigQueryParam{}
	data := models.EquipmentDtuConfigDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentDtuConfigController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentDtuConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Disabled
		m.TimeInterval = 5
	}

	c.Data["m"] = m
	c.setTpl("equipmentdtuconfig/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentdtuconfig/edit_footerjs.html"
}

//add | update
func (c *EquipmentDtuConfigController) Save() {
	var err error
	m := models.EquipmentDtuConfig{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := c.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.DTU_no = c.GetString("DTU_no")
	//m.Sim_no = c.GetString("Sim_no")
	//m.Room_no = c.GetString("Room_no")
	//
	//timeInterval := c.Input().Get("TimeInterval")
	//m.TimeInterval, _ = strconv.Atoi(timeInterval)

	m.ChangeUser = c.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = c.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			c.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err = o.Update(&m, "DTU_no", "Room_no", "Sim_no", "TimeInterval", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentDtuConfigController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentVendorBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
