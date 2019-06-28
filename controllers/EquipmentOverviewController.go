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

func (this *EquipmentOverviewController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *EquipmentOverviewController) Index() {
	this.Data["pageTitle"] = "历史采集查询"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentoverview/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentoverview/index_footerjs.html"
}

func (this *EquipmentOverviewController) DataGrid() {
	var params models.EquipmentOverviewQueryParam
	params.CollectDate = this.GetString("CollectDate")
	data, total := models.EquipmentOverviewPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *EquipmentOverviewController) DataList() {
	var params = models.EquipmentOverviewQueryParam{}
	params.CollectDate = this.Input().Get("CollectDate")

	data := models.EquipmentOverviewDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}
