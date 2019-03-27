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
	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
	"strconv"
	"strings"
	"time"
)

type EquipmentMeterConfigFieldController struct {
	BaseController
}

func (this *EquipmentMeterConfigFieldController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *EquipmentMeterConfigFieldController) Index() {
	this.Data["pageTitle"] = "字段映射顺序配置"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentmeterconfigfield/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentmeterconfigfield/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentMeterConfigFieldController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentMeterConfigFieldController", "Delete")
}

func (this *EquipmentMeterConfigFieldController) DataGrid() {
	var params models.EquipmentMeterConfigFieldQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterConfigFieldPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *EquipmentMeterConfigFieldController) DataList() {
	var params = models.EquipmentMeterConfigFieldQueryParam{}
	data := models.EquipmentMeterConfigFieldDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentMeterConfigFieldController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentMeterConfigField{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = 0
		m.MeterAddress = 1
	}

	this.Data["m"] = m
	this.setTpl("equipmentmeterconfigfield/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentmeterconfigfield/edit_footerjs.html"
}

//add | update
func (this *EquipmentMeterConfigFieldController) Save() {
	var err error
	m := models.EquipmentMeterConfigField{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.DTU_no = this.GetString("DTU_no")
	//
	//tmpInt := this.Input().Get("MeterAddress")
	//m.MeterAddress, _ = strconv.Atoi(tmpInt)
	//
	//m.MeterTypeNO = this.GetString("MeterTypeNO")
	//m.GatewayNO = this.GetString("GatewayNO")
	//
	//tmpInt = this.Input().Get("DsAddr")
	//m.DsAddr, _ = strconv.Atoi(tmpInt)
	//
	//m.FieldName = this.GetString("FieldName")

	m.ChangeUser = this.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err = o.Update(&m, "DTU_no", "MeterAddress", "MeterTypeNO", "GatewayNO", "DsAddr", "FieldName", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentMeterConfigFieldController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterConfigFieldBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
