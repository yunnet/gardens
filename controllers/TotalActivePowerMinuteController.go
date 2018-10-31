package controllers

import (
	"encoding/json"
	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
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
