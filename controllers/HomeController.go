package controllers

import (
	"strings"

	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"
	"time"
	"fmt"
)

type HomeController struct {
	BaseController
}

func (this *HomeController) Index() {
	this.Data["pageTitle"] = "首页"

	//判断是否登录
	this.checkLogin()

	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "home/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "home/index_footerjs.html"
}

func (this *HomeController) Page404() {
	this.setTpl()
}

func (this *HomeController) Error() {
	this.Data["error"] = this.GetString(":error")
	this.setTpl("home/error.html", "shared/layout_pullbox.html")
}

func (this *HomeController) Login() {
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
	username := strings.TrimSpace(this.GetString("UserName"))
	userpwd := strings.TrimSpace(this.GetString("UserPwd"))

	if err := models.LoginTraceAdd(username, remoteAddr, time.Now()); err != nil{
		utils.LogError("LoginTraceAdd error.")
	}
	utils.LogInfo(fmt.Sprintf("login:[%s]/[%s] IP:%s", username, userpwd, remoteAddr))

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

//采集进度查询
func (this *HomeController) GetDtuRowForDay() {
	if data, err := models.GetDtuRowForDayList(); err != nil{
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//查询客户和电表
func (this *HomeController) GetCustomerForMeter() {
	if data, err := models.GetCustomerForMeter(); err != nil {
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//取DTU数量
func (this *HomeController) GetDtuCount() {
	count := models.EquipmentDtuConfigCount()
	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取电表数量
func (this *HomeController) GetMeterCount() {
	count := models.EquipmentMeterConfigCount()
	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取今日采集数量
func (this *HomeController) GetCollectRowsToday() {
	count := models.GetCollectRowsToday()
	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取月采集数量
func (this *HomeController) GetCollectCountOfMonth() {
	if data, err := models.GetCollectRowsOfMonth(); err != nil {
		this.jsonResult(enums.JRCodeFailed, "", 0)
	}else{
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}