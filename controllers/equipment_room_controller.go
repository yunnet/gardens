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

type EquipmentRoomController struct {
	BaseController
}

func (c *EquipmentRoomController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (c *EquipmentRoomController) Index() {
	c.Data["pageTitle"] = "电房信息"
	c.Data["showMoreQuery"] = true

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentroom/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentroom/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentRoomController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentRoomController", "Delete")
}

func (c *EquipmentRoomController) DataGrid() {
	var params models.EquipmentRoomQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentRoomPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

//下拉选择列表
func (c *EquipmentRoomController) SelectPicker() {
	var params = models.EquipmentRoomQueryParam{}
	params.Used = c.GetString("Used")
	data := models.EquipmentRoomDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentRoomController) DataList() {
	var params = models.EquipmentRoomQueryParam{}
	data := models.EquipmentRoomDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

func (c *EquipmentRoomController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentRoom{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Disabled
	}

	c.Data["m"] = m
	c.setTpl("equipmentroom/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentroom/edit_footerjs.html"
}

//add | update
func (c *EquipmentRoomController) Save() {
	var err error
	m := models.EquipmentRoom{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := c.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.RoomName = c.GetString("RoomName")
	//m.CustomerNO = c.GetString("CustomerNO")

	m.ChangeUser = c.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		to, err := o.Begin()
		if err != nil {
			c.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}
		//取电房编号
		m.RoomNO = GetCustomerNO(m.CustomerNO)
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
		m.RoomNO = c.GetString("RoomNO")

		if _, err = o.Update(&m, "RoomNO", "RoomName", "CustomerNO", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
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

func (c *EquipmentRoomController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentRoomBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
