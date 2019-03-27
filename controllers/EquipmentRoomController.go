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

type EquipmentRoomController struct {
	BaseController
}

func (this *EquipmentRoomController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (this *EquipmentRoomController) Index() {
	this.Data["pageTitle"] = "电房信息"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentroom/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentroom/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentRoomController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentRoomController", "Delete")
}

func (this *EquipmentRoomController) DataGrid() {
	var params models.EquipmentRoomQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentRoomPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//下拉选择列表
func (this *EquipmentRoomController) SelectPicker() {
	var params = models.EquipmentRoomQueryParam{}
	params.Used = this.Input().Get("Used")
	data := models.EquipmentRoomDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentRoomController) DataList() {
	var params = models.EquipmentRoomQueryParam{}
	data := models.EquipmentRoomDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentRoomController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentRoom{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Disabled
	}

	this.Data["m"] = m
	this.setTpl("equipmentroom/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentroom/edit_footerjs.html"
}

//add | update
func (this *EquipmentRoomController) Save() {
	var err error
	m := models.EquipmentRoom{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.RoomName = this.GetString("RoomName")
	//m.CustomerNO = this.GetString("CustomerNO")

	m.ChangeUser = this.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		if err = o.Begin(); err != nil {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}
		//取电房编号
		m.RoomNO = GetCustomerNO(m.CustomerNO)
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			if err = o.Commit(); err != nil {
				this.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
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
		m.RoomNO = this.GetString("RoomNO")

		if _, err = o.Update(&m, "RoomNO", "RoomName", "CustomerNO", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

//取电房编号
func GetCustomerNO(_customer_no string) string {
	var no string
	o := orm.NewOrm()
	sql := fmt.Sprintf("call p_equipment_room_no('%s');", _customer_no)
	err := o.Raw(sql).QueryRow(&no)
	if err != nil {
		return ""
	}
	return no
}

func (this *EquipmentRoomController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentRoomBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
