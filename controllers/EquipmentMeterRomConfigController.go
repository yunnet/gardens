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
	"github.com/astaxie/beego/orm"
	"gardens/enums"
	"gardens/models"
	"strconv"
	"strings"
	"time"
)

type EquipmentMeterRomConfigController struct {
	BaseController
}

func (this *EquipmentMeterRomConfigController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *EquipmentMeterRomConfigController) Index() {
	this.Data["pageTitle"] = "寄存器地址管理"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentmeterromconfig/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentmeterromconfig/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentMeterRomConfigController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentMeterRomConfigController", "Delete")
}

func (this *EquipmentMeterRomConfigController) DataGrid() {
	var params models.EquipmentMeterRomConfigQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterRomConfigPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *EquipmentMeterRomConfigController) DataList() {
	var params = models.EquipmentMeterRomConfigQueryParam{}
	data := models.EquipmentMeterRomConfigDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentMeterRomConfigController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentMeterRomConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.SegmentNO = 1
	}

	this.Data["m"] = m
	this.setTpl("equipmentmeterromconfig/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentmeterromconfig/edit_footerjs.html"
}

//预处理
func (this *EquipmentMeterRomConfigController) preform() {
	tmp_str := this.Input().Get("Needpt")
	if tmp_str == "on" {
		this.Input().Set("Needpt", "1")
	} else {
		this.Input().Set("Needpt", "0")
	}

	tmp_str = this.Input().Get("Needct")
	if tmp_str == "on" {
		this.Input().Set("Needct", "1")
	} else {
		this.Input().Set("Needct", "0")
	}

	tmp_str = this.GetString("Msbbit")
	if tmp_str == "on" {
		this.Input().Set("Msbbit", "1")
	} else {
		this.Input().Set("Msbbit", "0")
	}

	tmp_str = this.GetString("BigEndian")
	if tmp_str == "on" {
		this.Input().Set("BigEndian", "1")
	} else {
		this.Input().Set("BigEndian", "0")
	}
}

//add | update
func (this *EquipmentMeterRomConfigController) Save() {
	var err error
	m := models.EquipmentMeterRomConfig{}

	//有bootstapswitch控件，需要预处理一下
	this.preform()

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	m.ChangeUser = this.curUser.RealName
	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err := o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err := o.Update(&m, "MeterTypeNO", "AddressSort", "RomAddress", "RomName", "Units", "DataType",
			"SegmentNO", "Offset", "Needpt", "Needct", "Calcfactor", "Msbbit", "BigEndian", "Bytelength",
			"FunctionTable1", "FunctionTable2", "FunctionTable3", "FunctionField",
			"Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentMeterRomConfigController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterRomConfigBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
