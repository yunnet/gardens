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
	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
)

type CollectBaseInfoController struct {
	BaseController
}

func (this *CollectBaseInfoController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *CollectBaseInfoController) Index() {
	this.Data["pageTitle"] = "电表数据查询"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "collectbaseinfo/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "collectbaseinfo/index_footerjs.html"
}

func (this *CollectBaseInfoController) DataGrid() {
	var params models.CollectBaseInfoQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.CollectBaseInfoPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *CollectBaseInfoController) DataList() {
	var params = models.CollectBaseInfoQueryParam{}
	params.CollectTime = this.Input().Get("CollectTime")
	params.DTU_no = this.Input().Get("DTU_no")
	params.MeterAddress = this.Input().Get("MeterAddress")

	data := models.CollectBaseInfoDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}
