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

type EquipmentMeterConfigController struct {
	BaseController
}

func (c *EquipmentMeterConfigController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *EquipmentMeterConfigController) Index() {
	c.Data["pageTitle"] = "电表管理"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentmeterconfig/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentmeterconfig/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentMeterConfigController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentMeterConfigController", "Delete")
}

func (c *EquipmentMeterConfigController) DataGrid() {
	var params models.EquipmentMeterConfigQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterConfigPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *EquipmentMeterConfigController) DataList() {
	var params = models.EquipmentMeterConfigQueryParam{}
	data := models.EquipmentMeterConfigDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentMeterConfigController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentMeterConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = 0
		m.Ct = 1
		m.Pt = 1
		m.MeterAddress = 1
	}

	c.Data["m"] = m
	c.setTpl("equipmentmeterconfig/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentmeterconfig/edit_footerjs.html"
}

//add | update
func (c *EquipmentMeterConfigController) Save() {
	var err error
	m := models.EquipmentMeterConfig{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := c.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//m.DTU_no = c.GetString("DTU_no")
	//
	//tmpInt := c.Input().Get("MeterAddress")
	//m.MeterAddress, _ = strconv.Atoi(tmpInt)
	//
	//m.MeterTypeNO = c.GetString("MeterTypeNO")
	//m.GatewayNO = c.GetString("GatewayNO")
	//
	//tmpInt = c.Input().Get("GatewayQzone")
	//m.GatewayQzone, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("GatewayAddress")
	//m.GatewayAddress, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("GatewaySite")
	//m.GatewaySite, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("Pt")
	//m.Pt, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("Ct")
	//m.Ct, _ = strconv.Atoi(tmpInt)
	//
	//m.LoopName = c.GetString("LoopName")

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
		if _, err = o.Update(&m, "DTU_no", "MeterAddress", "MeterTypeNO", "GatewayNO", "GatewayQzone", "GatewayAddress", "GatewaySite", "Pt", "Ct", "LoopName", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentMeterConfigController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterConfigBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
