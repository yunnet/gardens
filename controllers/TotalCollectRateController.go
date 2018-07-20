package controllers

import (
	"github.com/yunnet/gdkxdl/models"
	"encoding/json"
)

type TotalCollectRateController struct {
	BaseController
}

func (this *TotalCollectRateController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid")
}

func (this *TotalCollectRateController) Index() {
	this.Data["pageTitle"] = "采集成功率查询"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "totalcollectrate/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "totalcollectrate/index_footerjs.html"
}

func (this *TotalCollectRateController) DataGrid() {
	var params models.TotalCollectRateQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.TotalCollectRatePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}
