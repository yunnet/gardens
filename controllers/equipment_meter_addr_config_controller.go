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

type EquipmentMeterAddrConfigController struct {
	BaseController
}

func (c *EquipmentMeterAddrConfigController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *EquipmentMeterAddrConfigController) Index() {
	c.Data["pageTitle"] = "寄存器分段配置"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentmeteraddrconfig/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentmeteraddrconfig/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentMeterAddrConfigController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentMeterAddrConfigController", "Delete")
}

func (c *EquipmentMeterAddrConfigController) DataGrid() {
	var params models.EquipmentMeterAddrConfigQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterAddrConfigPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *EquipmentMeterAddrConfigController) DataList() {
	var params = models.EquipmentMeterAddrConfigQueryParam{}
	data := models.EquipmentMeterAddrConfigDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentMeterAddrConfigController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentMeterAddrConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.SegmentStartAddr = 1
		m.SegmentNO = 1
	}

	c.Data["m"] = m
	c.setTpl("equipmentmeteraddrconfig/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentmeteraddrconfig/edit_footerjs.html"
}

//add | update
func (c *EquipmentMeterAddrConfigController) Save() {
	var err error
	m := models.EquipmentMeterAddrConfig{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//tmpInt := c.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(tmpInt)
	//
	//m.MeterTypeNO = c.GetString("MeterTypeNO")
	//
	//tmpInt = c.Input().Get("SegmentStartAddr")
	//m.SegmentStartAddr, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("SegmentLen")
	//m.SegmentLen, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = c.Input().Get("SegmentNO")
	//m.SegmentNO, _ = strconv.Atoi(tmpInt)

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
		if _, err = o.Update(&m, "MeterTypeNO", "SegmentStartAddr", "SegmentLen", "SegmentNO", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentMeterAddrConfigController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterAddrConfigBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
