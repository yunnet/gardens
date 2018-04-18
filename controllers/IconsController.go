package controllers

type IconsController struct {
	BaseController
}

func (this *IconsController) Prepare() {
	this.BaseController.Prepare()
	this.checkLogin()
}

func (this *IconsController) Index() {
	this.Data["pageTitle"] = "图标信息"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "icons/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "icons/index_footerjs.html"
}