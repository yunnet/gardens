package controllers

import (
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/enums"
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