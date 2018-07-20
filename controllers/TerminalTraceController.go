package controllers

import (
	"encoding/json"
	"github.com/yunnet/gdkxdl/models"
)

type TerminalTraceController struct {
	BaseController
}

func (this *TerminalTraceController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid")
}

func (this *TerminalTraceController) Index() {
	this.Data["pageTitle"] = "连接状态查询"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "terminaltrace/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "terminaltrace/index_footerjs.html"
}

func (this *TerminalTraceController) DataGrid() {
	var params models.TerminalTraceQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.TerminalTracePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}
