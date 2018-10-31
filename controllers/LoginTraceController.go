package controllers

import (
	"encoding/json"
	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
)

type LoginTraceController struct {
	BaseController
}

func (this *LoginTraceController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *LoginTraceController) Index() {
	this.Data["pageTitle"] = "用户登陆日志"
	this.Data["showMoreQuery"] = false

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "logintrace/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "logintrace/index_footerjs.html"
}

func (this *LoginTraceController) DataGrid() {
	var params models.LoginTraceQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.LoginTracePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *LoginTraceController) DataList() {
	var params = models.LoginTraceQueryParam{}
	data := models.LoginTraceDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}
