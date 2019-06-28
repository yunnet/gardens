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
	"gardens/enums"
	"gardens/models"
)

type TotalActivePowerMinuteController struct {
	BaseController
}

func (this *TotalActivePowerMinuteController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *TotalActivePowerMinuteController) Index() {
	this.Data["pageTitle"] = "电表需量查询"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "totalactivepowerminute/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "totalactivepowerminute/index_footerjs.html"
}

func (this *TotalActivePowerMinuteController) DataGrid() {
	var params models.TotalActivePowerMinuteQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.TotalActivePowerMinutePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *TotalActivePowerMinuteController) DataList() {
	var params = models.TotalActivePowerMinuteQueryParam{}
	data := models.TotalActivePowerMinuteDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}
