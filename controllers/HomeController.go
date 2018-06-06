package controllers

import (
	"strings"

	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"
	"time"
	"fmt"
	"github.com/astaxie/beego"
)

type HomeController struct {
	BaseController
}

func (this *HomeController) Index() {
	this.Data["pageTitle"] = "首页"

	//判断是否登录
	this.checkLogin()

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "home/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "home/index_footerjs.html"
}

func (this *HomeController) Index2() {
	this.Data["pageTitle"] = "云服务器"

	this.checkLogin()

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "home/index_headcssjs2.html"
	this.LayoutSections["footerjs"] = "home/index_footerjs2.html"
}

func (this *HomeController) Page404() {
	this.setTpl()
}

func (this *HomeController) Error() {
	this.Data["error"] = this.GetString(":error")
	this.setTpl("home/error.html", "shared/layout_pullbox.html")
}

func (this *HomeController) Login() {
	this.Data["pageTitle"] = beego.AppConfig.String("site.app") + beego.AppConfig.String("site.name") + " - 登陆"
	this.Data["siteVersion"] = beego.AppConfig.String("site.version")

	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "home/login_headcssjs.html"
	this.LayoutSections["footerjs"] = "home/login_footerjs.html"
	this.setTpl("home/login.html", "shared/layout_base.html")
}

func (this *HomeController) Logout() {
	user := models.BackendUser{}
	this.SetSession("backenduser", user)
	this.pageLogin()
}

func (this *HomeController) DoLogin() {
	remoteAddr := this.Ctx.Request.RemoteAddr
	addrs := strings.Split(remoteAddr, "::1")
	if len(addrs) > 1{
		remoteAddr = "localhost"
	}

	username := strings.TrimSpace(this.GetString("UserName"))
	userpwd := strings.TrimSpace(this.GetString("UserPwd"))

	if err := models.LoginTraceAdd(username, remoteAddr, time.Now()); err != nil{
		utils.LogError("LoginTraceAdd error.")
	}
	utils.LogInfo(fmt.Sprintf("login: %s IP: %s", username, remoteAddr))

	if len(username) == 0 || len(userpwd) == 0 {
		this.jsonResult(enums.JRCodeFailed, "用户名和密码不正确", "")
	}

	userpwd = utils.String2md5(userpwd)
	user, err := models.BackendUserOneByUserName(username, userpwd)
	if user != nil && err == nil {
		if user.Status == enums.Disabled {
			this.jsonResult(enums.JRCodeFailed, "用户被禁用，请联系管理员", "")
		}
		//保存用户信息到session
		this.setBackendUser2Session(user.Id)

		//获取用户信息
		this.jsonResult(enums.JRCodeSucc, "登录成功", "")
	} else {
		this.jsonResult(enums.JRCodeFailed, "用户名或者密码错误", "")
	}
}

//今日采集进度查询
func (this *HomeController) GetDtuRowForDay() {
	before := time.Now().Unix()
	if data, err := models.GetDtuRowsTodayList(); err != nil{
		after := time.Now().Unix()
		utils.LogInfo(fmt.Sprintf("GetDtuRowForDay spend: %d s", after - before))

		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//查询客户和电表
func (this *HomeController) GetCustomerForMeter() {
	before := time.Now().Unix()
	if data, err := models.GetCustomerForMeter(); err != nil {
		after := time.Now().Unix()
		utils.LogInfo(fmt.Sprintf("GetCustomerForMeter spend: %d s", after - before))

		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//取DTU数量
func (this *HomeController) GetDtuCount() {
	before := time.Now().Unix()
	count := models.EquipmentDtuConfigCount()
	after := time.Now().Unix()
	utils.LogInfo(fmt.Sprintf("GetDtuCount spend: %d ns", after - before))

	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取电表数量
func (this *HomeController) GetMeterCount() {
	before := time.Now().Unix()
	count := models.EquipmentMeterConfigCount()
	after := time.Now().Unix()
	utils.LogInfo(fmt.Sprintf("GetMeterCount spend: %d s", after - before))

	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取月采集数量
func (this *HomeController) GetCollectCountOfMonth() {
	before := time.Now().Unix()
	if data, err := models.GetCollectRowsOfMonth(); err != nil {
		after := time.Now().Unix()
		utils.LogInfo(fmt.Sprintf("GetCollectCountOfMonth spend: %d s", after - before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取概述信息
func (this *HomeController)GetOverviewToday()  {
	before := time.Now().Unix()
	choiceDate := this.Input().Get("choiceDate")
	if data, err := models.GetOverviewToday(choiceDate); err != nil {
		after := time.Now().Unix()
		utils.LogInfo(fmt.Sprintf("GetOverviewToday spend: %d s", after - before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取客户分布
func (this *HomeController) GetCustomerZone()  {
	before := time.Now().Unix()
	if data, err := models.GetCustomerZone(); err != nil {
		after := time.Now().Unix()
		utils.LogInfo(fmt.Sprintf("GetCustomerZone spend: %d s", after - before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}