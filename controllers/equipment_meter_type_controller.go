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

type EquipmentMeterTypeController struct {
	BaseController
}

func (c *EquipmentMeterTypeController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *EquipmentMeterTypeController) Index() {
	c.Data["pageTitle"] = "电表类型"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentmetertype/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentmetertype/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentMeterTypeController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentMeterTypeController", "Delete")
}

func (c *EquipmentMeterTypeController) DataGridSelect() {
	var params models.EquipmentMeterTypeQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, err := models.EquipmentMeterTypeSelect(&params)
	if err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", "")
	}
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentMeterTypeController) DataGrid() {
	var params models.EquipmentMeterTypeQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterTypePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *EquipmentMeterTypeController) DataList() {
	var params = models.EquipmentMeterTypeQueryParam{}
	data := models.EquipmentMeterTypeDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentMeterTypeController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentMeterType{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.ThreePhase = 1
		m.Used = enums.Enabled
	}

	c.Data["m"] = m
	c.setTpl("equipmentmetertype/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentmetertype/edit_footerjs.html"
}

//预处理
func (c *EquipmentMeterTypeController) preform() {
	tmp_str := c.GetString("ThreePhase")
	if tmp_str == "on" {
		c.Data["ThreePhase"] = "1"
	} else {
		c.Data["ThreePhase"] = "0"
	}
}

//add | update
func (c *EquipmentMeterTypeController) Save() {
	var err error
	m := models.EquipmentMeterType{}

	//有bootstapswitch控件，需要预处理一下
	c.preform()

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

		if m.MeterTypeNO, err = GetSysValNO("metertypeno"); err != nil {
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
		m.MeterTypeNO = c.GetString("MeterTypeNO")

		if err = m.Update("MeterTypeNO", "MeterType", "VendorNO", "PtAddress", "CtAddress", "ThreePhase", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (c *EquipmentMeterTypeController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterTypeBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
