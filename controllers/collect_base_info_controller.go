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

type CollectBaseInfoController struct {
	BaseController
}

func (c *CollectBaseInfoController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *CollectBaseInfoController) Index() {
	c.Data["pageTitle"] = "电表数据查询"

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "collectbaseinfo/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "collectbaseinfo/index_footerjs.html"
}

func (c *CollectBaseInfoController) DataGrid() {
	var params models.CollectBaseInfoQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.CollectBaseInfoPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *CollectBaseInfoController) DataList() {
	var params = models.CollectBaseInfoQueryParam{}
	params.CollectTime = c.GetString("CollectTime")
	params.DTU_no = c.GetString("DTU_no")
	params.MeterAddress = c.GetString("MeterAddress")

	data := models.CollectBaseInfoDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}
