package controllers

import (
	"strings"

	"fmt"
	"github.com/astaxie/beego"
	"github.com/tidwall/gjson"
	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"
	"io/ioutil"
	"net/http"
	"time"
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
	this.setTpl("home/page404.html", "shared/layout_base.html")
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

//退出
func (this *HomeController) Logout() {
	user := models.BackendUser{}
	this.SetSession("backenduser", user)
	this.pageLogin()
}

//登陆
func (this *HomeController) DoLogin() {
	remoteAddr := this.Ctx.Request.RemoteAddr
	addrs := strings.Split(remoteAddr, "::1")
	if len(addrs) > 1 {
		remoteAddr = "localhost"
	}

	username := strings.TrimSpace(this.GetString("UserName"))
	userpwd := strings.TrimSpace(this.GetString("UserPwd"))

	if err := models.LoginTraceAdd(username, remoteAddr, time.Now()); err != nil {
		beego.Error("LoginTraceAdd error.")
	}
	beego.Info(fmt.Sprintf("login: %s IP: %s", username, remoteAddr))

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

//************************************* A P I ******************************************************

//获取配置文件信息
func (this *HomeController) GetConfigValue() {
	key := this.GetString("key")
	result := ""
	err := true
	if key == "siteApp" {
		result = beego.AppConfig.String("site.app")
		err = false
	} else if key == "siteName" {
		result = beego.AppConfig.String("site.name")
		err = false
	} else if key == "siteVersion" {
		result = beego.AppConfig.String("site.version")
		err = false
	}

	if err {
		this.jsonResult(enums.JRCodeFailed, "获取参数失败", key)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", result)
	}
}

//今日采集进度查询
func (this *HomeController) GetDtuRowForDay() {
	before := time.Now().Unix()
	if data, err := models.GetDtuRowsTodayList(); err != nil {
		after := time.Now().Unix()
		beego.Info(fmt.Sprintf("GetDtuRowForDay spend: %d s", after-before))

		this.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//查询客户和电表
func (this *HomeController) GetCustomerForMeter() {
	before := time.Now().Unix()
	if data, err := models.GetCustomerForMeter(); err != nil {
		after := time.Now().Unix()
		beego.Info(fmt.Sprintf("GetCustomerForMeter spend: %d s", after-before))

		this.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//取DTU数量
func (this *HomeController) GetDtuCount() {
	before := time.Now().Unix()
	count := models.EquipmentDtuConfigCount()
	after := time.Now().Unix()
	beego.Info(fmt.Sprintf("GetDtuCount spend: %d ns", after-before))

	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取电表数量
func (this *HomeController) GetMeterCount() {
	before := time.Now().Unix()
	count := models.EquipmentMeterConfigCount()
	after := time.Now().Unix()
	beego.Info(fmt.Sprintf("GetMeterCount spend: %d s", after-before))

	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取月采集数量
func (this *HomeController) GetCollectCountOfMonth() {
	before := time.Now().Unix()
	if data, err := models.GetCollectRowsOfMonth(); err != nil {
		after := time.Now().Unix()
		beego.Info(fmt.Sprintf("GetCollectCountOfMonth spend: %d s", after-before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取概述信息GetDtuRowForDay
func (this *HomeController) GetOverviewToday() {
	before := time.Now().Unix()
	choiceDate := this.Input().Get("choiceDate")
	if data, err := models.GetOverviewToday(choiceDate); err != nil {
		after := time.Now().Unix()
		beego.Info(fmt.Sprintf("GetOverviewToday spend: %d s", after-before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取客户分布
func (this *HomeController) GetCustomerZone() {
	before := time.Now().Unix()
	if data, err := models.GetCustomerZone(); err != nil {
		after := time.Now().Unix()
		beego.Info(fmt.Sprintf("GetCustomerZone spend: %d s", after-before))
		this.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		this.jsonResult(enums.JRCodeSucc, "", data)
	}
}

func (this *HomeController) GetWeather() {
	url := "http://api.openweathermap.org/data/2.5/weather?q=Guangzhou&appid=dafef1a9be486b5015eb92330a0add7d"
	ch := make(chan string)

	go func(url string, ch chan string) {
		resp, err := http.Get(url)
		if err != nil {
			beego.Error("同步天气出错." + err.Error())
			return
		}
		defer resp.Body.Close()

		body, err := ioutil.ReadAll(resp.Body)
		if nil != err {
			beego.Error("同步天气出错：" + err.Error())
			return
		}
		ch <- string(body)
	}(url, ch)

	reuslt := <-ch
	gjsonData := gjson.Parse(reuslt)
	temp := gjsonData.Get("main.temp").Float() - 274.15
	this.jsonResult(enums.JRCodeSucc, "", temp)
}
