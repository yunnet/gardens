package controllers

type MainController struct {
	BaseController
}

func (this *MainController)Prepare()  {
	this.BaseController.Prepare()
	this.checkLogin()
}

func (this *MainController)Index() {
	//判断是否登录
	//this.checkLogin()
	this.setTpl()

	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "home/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "home/index_footerjs.html"
}