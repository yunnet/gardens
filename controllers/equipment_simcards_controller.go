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

type EquipmentSimCardsController struct {
	BaseController
}

func (c *EquipmentSimCardsController) Prepare() {
	//先执行
	c.BaseController.Prepare()
	//如果一个Controller的多数Action都需要权限控制，则将验证放到Prepare
	c.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (c *EquipmentSimCardsController) Index() {
	c.Data["pageTitle"] = "SIM卡管理"
	//是否显示更多查询条件的按钮
	c.Data["showMoreQuery"] = true

	//将页面左边菜单的某项激活
	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentsimcards/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentsimcards/index_footerjs.html"

	//页面里按钮权限控制
	c.Data["canEdit"] = c.checkActionAuthor("EquipmentSimCardsController", "Edit")
	c.Data["canDelete"] = c.checkActionAuthor("EquipmentSimCardsController", "Delete")
}

// DataGrid 管理首页 表格获取数据
func (c *EquipmentSimCardsController) DataGrid() {
	var params models.EquipmentSimCardsQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentSimCardsPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

//下拉选择列表
func (c *EquipmentSimCardsController) SelectPicker() {
	var params = models.EquipmentSimCardsQueryParam{}
	params.Used = c.GetString("Used")
	data := models.EquipmentSimCardsDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

//DataList 列表
func (c *EquipmentSimCardsController) DataList() {
	var params = models.EquipmentSimCardsQueryParam{}
	data := models.EquipmentSimCardsDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}

//Edit 添加、编辑角色界面
func (c *EquipmentSimCardsController) Edit() {
	if c.Ctx.Request.Method == "POST" {
		c.Save()
	}

	Id, _ := c.GetInt(":id", 0)
	m := models.EquipmentSimCards{Id: int64(Id)}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			c.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
	}

	c.Data["m"] = m
	c.setTpl("equipmentsimcards/edit.html", "shared/layout_pullbox.html")
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["footerjs"] = "equipmentsimcards/edit_footerjs.html"
}

//Save 添加、编辑页面 保存
func (c *EquipmentSimCardsController) Save() {
	var err error
	m := models.EquipmentSimCards{}

	//获取form里的值
	if err = c.ParseForm(&m); err != nil {
		c.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}
	m.ChangeUser = c.curUser.RealName

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
		if _, err = o.Update(&m, "Sim_no", "Iccid", "Used", "ChangeUser", "ChangeDate"); err == nil {
			c.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			c.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

//Delete 批量删除
func (c *EquipmentSimCardsController) Delete() {
	strs := c.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentSimCardsBatchDelete(ids); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}

//abcdefg hijklmn opqrst uvwxyz
func (c *EquipmentSimCardsController) TrafficSync() {
	if num, err := models.TrafficSync(); err == nil {
		c.jsonResult(enums.JRCodeSucc, fmt.Sprintf("同步成功 %d 项", num), 0)
	} else {
		c.jsonResult(enums.JRCodeFailed, "同步失败", 0)
	}
}
