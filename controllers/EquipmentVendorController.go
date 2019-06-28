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

type EquipmentVendorController struct {
	BaseController
}

func (this *EquipmentVendorController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (this *EquipmentVendorController) Index() {
	this.Data["pageTitle"] = "设备供应商"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentvendor/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentvendor/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentVendorController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentVendorController", "Delete")
}

func (this *EquipmentVendorController) DataGrid() {
	var params models.EquipmentVendorQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentVendorPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//下拉选择列表
func (this *EquipmentVendorController) SelectPicker() {
	var params = models.EquipmentVendorQueryParam{}
	params.Used = this.Input().Get("Used")
	data := models.EquipmentVendorDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentVendorController) DataList() {
	var params = models.EquipmentVendorQueryParam{}
	data := models.EquipmentVendorDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentVendorController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentVendor{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
	}

	this.Data["m"] = m
	this.setTpl("equipmentvendor/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentvendor/edit_footerjs.html"
}

//add | update
func (this *EquipmentVendorController) Save() {
	var err error
	m := models.EquipmentVendor{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//m.VendorDesc = this.GetString("VendorDesc")
	m.ChangeUser = this.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		if err = o.Begin(); err != nil {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}

		if m.VendorNO, err = GetSysValNO("vendorno"); err != nil {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			o.Rollback()
			return
		}
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			if err = o.Commit(); err != nil {
				this.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
				o.Rollback()
			} else {
				this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
			}
		} else {
			if err = o.Rollback(); err != nil {
				this.jsonResult(enums.JRCodeFailed, "添加回滚失败", m.Id)
			} else {
				this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			}
		}
	} else {
		m.VendorNO = this.GetString("VendorNO")
		if _, err = o.Update(&m, "VendorNO", "VendorDesc", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentVendorController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentVendorBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
