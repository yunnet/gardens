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
	"gardens/enums"
	"gardens/models"
)

type EquipmentOverviewController struct {
	BaseController
}

func (c *EquipmentOverviewController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *EquipmentOverviewController) Index() {
	c.Data["pageTitle"] = "历史采集查询"

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "equipmentoverview/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "equipmentoverview/index_footerjs.html"
}

func (c *EquipmentOverviewController) DataGrid() {
	var params models.EquipmentOverviewQueryParam
	params.CollectDate = c.GetString("CollectDate")
	data, total := models.EquipmentOverviewPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *EquipmentOverviewController) DataList() {
	var params = models.EquipmentOverviewQueryParam{}
	params.CollectDate = c.Input().Get("CollectDate")

	data := models.EquipmentOverviewDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}
