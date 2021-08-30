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

type TotalDtuRowsController struct {
	BaseController
}

func (c *TotalDtuRowsController) Prepare() {
	c.BaseController.Prepare()
	c.checkAuthor("DataGrid", "DataList")
}

func (c *TotalDtuRowsController) Index() {
	c.Data["pageTitle"] = "采集条数查询"

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "totaldturows/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "totaldturows/index_footerjs.html"
}

func (c *TotalDtuRowsController) DataGrid() {
	var params models.TotalDtuRowsQueryParam
	json.Unmarshal(c.Ctx.Input.RequestBody, &params)
	data, total := models.TotalDtuRowsPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	c.Data["json"] = result
	c.ServeJSON()
}

func (c *TotalDtuRowsController) DataList() {
	var params = models.TotalDtuRowsQueryParam{}
	params.CollectDate = c.Input().Get("CollectDate")
	params.DTU_no = c.Input().Get("DTU_no")
	params.MeterAddress = c.Input().Get("MeterAddress")

	data := models.TotalDtuRowsDataList(&params)
	c.jsonResult(enums.JRCodeSucc, "", data)
}
