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

type EquipmentMeterRomConfigController struct {
	BaseController
}

func (c *EquipmentMeterRomConfigController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *EquipmentMeterRomConfigController) Index() {
	c.Data["pageTitle"] = "寄存器地址管理"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentmeterromconfig/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentmeterromconfig/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentMeterRomConfigController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentMeterRomConfigController", "Delete")
}

func (c *EquipmentMeterRomConfigController) DataGrid() {
	var params models.EquipmentMeterRomConfigQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterRomConfigPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *EquipmentMeterRomConfigController) DataList() {
	var params = models.EquipmentMeterRomConfigQueryParam{}
	data := models.EquipmentMeterRomConfigDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentMeterRomConfigController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentMeterRomConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.SegmentNO = 1
	}

	c.Data["m"] = m
	c.setTpl("equipmentmeterromconfig/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentmeterromconfig/edit_footerjs.html"
}

//预处理
func (c *EquipmentMeterRomConfigController) preform() {
	tmp_str := c.GetString("Needpt")
	if tmp_str == "on" {
		c.Input()
		c.Data["Needpt"] = "1"
	} else {
		c.Data["Needpt"] = "0"
	}

	tmp_str = c.GetString("Needct")
	if tmp_str == "on" {
		c.Data["Needct"] = "1"
	} else {
		c.Data["Needct"] = "0"
	}

	tmp_str = c.GetString("Msbbit")
	if tmp_str == "on" {
		c.Data["Msbbit"] = "1"
	} else {
		c.Data["Msbbit"] = "0"
	}

	tmp_str = c.GetString("BigEndian")
	if tmp_str == "on" {
		c.Data["BigEndian"] = "1"
	} else {
		c.Data["BigEndian"] = "0"
	}
}

//add | update
func (c *EquipmentMeterRomConfigController) Save() {
	var err error
	m := models.EquipmentMeterRomConfig{}

	//有bootstapswitch控件，需要预处理一下
	c.preform()

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	m.ChangeUser = c.curUser.RealName
	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = c.curUser.RealName
		m.CreateDate = time.Now()

		if _, err := o.Insert(&m); err == nil {
			c.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err := o.Update(&m, "MeterTypeNO", "AddressSort", "RomAddress", "RomName", "Units", "DataType",
			"SegmentNO", "Offset", "Needpt", "Needct", "Calcfactor", "Msbbit", "BigEndian", "Bytelength",
			"FunctionTable1", "FunctionTable2", "FunctionTable3", "FunctionField",
			"Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentMeterRomConfigController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterRomConfigBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
