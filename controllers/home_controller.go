// Copyright 2018 gardens Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package controllers

import (
	"github.com/beego/beego/v2/core/logs"
	"strings"

	"fmt"
	"gardens/enums"
	"gardens/models"
	"gardens/utils"
	beego "github.com/beego/beego/v2/server/web"
	"github.com/tidwall/gjson"
	"io/ioutil"
	"net/http"
	"time"
)

type HomeController struct {
	BaseController
}

func (c *HomeController) Index() {
	c.Data["pageTitle"] = "首页"

	//判断是否登录
	c.checkLogin()

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "home/index_headcssjs.html"
	c.LayoutSections["footerjs"] = "home/index_footerjs.html"
}

func (c *HomeController) Index2() {
	c.Data["pageTitle"] = "云服务器"

	c.checkLogin()

	c.Data["activeSidebarUrl"] = c.URLFor(c.controllerName + "." + c.actionName)
	c.setTpl()
	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "home/index_headcssjs2.html"
	c.LayoutSections["footerjs"] = "home/index_footerjs2.html"
}

func (c *HomeController) Page404() {
	c.setTpl("home/page404.html", "shared/layout_base.html")
}

func (c *HomeController) Error() {
	c.Data["error"] = c.GetString(":error")
	c.setTpl("home/error.html", "shared/layout_pullbox.html")
}

func (c *HomeController) Login() {
	siteApp, _ := beego.AppConfig.String("site.app")
	sitename, _ := beego.AppConfig.String("site.name")
	c.Data["pageTitle"] = siteApp + sitename + " - 登陆"
	c.Data["siteVersion"], _ = beego.AppConfig.String("site.version")

	c.LayoutSections = make(map[string]string)
	c.LayoutSections["headcssjs"] = "home/login_headcssjs.html"
	c.LayoutSections["footerjs"] = "home/login_footerjs.html"
	c.setTpl("home/login.html", "shared/layout_base.html")
}

//退出
func (c *HomeController) Logout() {
	user := models.BackendUser{}
	c.SetSession("backenduser", user)
	c.pageLogin()
}

//登陆
func (c *HomeController) DoLogin() {
	remoteAddr := c.Ctx.Request.RemoteAddr
	addrs := strings.Split(remoteAddr, "::1")
	if len(addrs) > 1 {
		remoteAddr = "localhost"
	}

	username := strings.TrimSpace(c.GetString("UserName"))
	userpwd := strings.TrimSpace(c.GetString("UserPwd"))

	if err := models.LoginTraceAdd(username, remoteAddr, time.Now()); err != nil {
		logs.Error("LoginTraceAdd error.")
	}
	logs.Info(fmt.Sprintf("login: %s IP: %s", username, remoteAddr))

	if len(username) == 0 || len(userpwd) == 0 {
		c.jsonResult(enums.JRCodeFailed, "用户名和密码不正确", "")
	}

	userpwd = utils.String2md5(userpwd)
	user, err := models.BackendUserOneByUserName(username, userpwd)
	if user != nil && err == nil {
		if user.Status == enums.Disabled {
			c.jsonResult(enums.JRCodeFailed, "用户被禁用，请联系管理员", "")
		}
		//保存用户信息到session
		c.setBackendUser2Session(user.Id)

		//获取用户信息
		c.jsonResult(enums.JRCodeSucc, "登录成功", "")
	} else {
		c.jsonResult(enums.JRCodeFailed, "用户名或者密码错误", "")
	}
}

//************************************* A P I ******************************************************

//获取配置文件信息
func (c *HomeController) GetConfigValue() {
	key := c.GetString("key")
	result := ""
	err := true
	if key == "siteApp" {
		result, _ = beego.AppConfig.String("site.app")
		err = false
	} else if key == "siteName" {
		result, _ = beego.AppConfig.String("site.name")
		err = false
	} else if key == "siteVersion" {
		result, _ = beego.AppConfig.String("site.version")
		err = false
	}

	if err {
		c.jsonResult(enums.JRCodeFailed, "获取参数失败", key)
	} else {
		c.jsonResult(enums.JRCodeSucc, "", result)
	}
}

//今日采集进度查询
func (c *HomeController) GetDtuRowForDay() {
	if data, err := models.GetDtuRowsTodayList(); err != nil {
		c.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		c.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//查询客户和电表
func (c *HomeController) GetCustomerForMeter() {
	before := time.Now().Unix()
	key := "GetCustomerForMeter"
	var data string

	if err := utils.GetCache(key, &data); err == nil {
		after := time.Now().Unix()
		logs.Info(fmt.Sprintf("use redis cache: GetCustomerForMeter spend: %d ns", after-before))
		c.jsonResult(enums.JRCodeSucc, "", data)
	}

	if data, err := models.GetCustomerForMeter(); err != nil {
		c.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		utils.SetCache(key, data, 3600)

		after := time.Now().Unix()
		logs.Info(fmt.Sprintf("::: DB GetCustomerForMeter spend: %d ns", after-before))
		c.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//取DTU数量
func (c *HomeController) GetDtuCount() {
	key := "GetDtuCount"
	var count int64

	if err := utils.GetCache(key, &count); err == nil {
		logs.Info("use redis cache: GetDtuCount")
		c.jsonResult(enums.JRCodeSucc, "", count)
	}

	count = models.EquipmentDtuConfigCount()
	utils.SetCache(key, count, 3600)
	c.jsonResult(enums.JRCodeSucc, "", count)
}

//取电表数量
func (c *HomeController) GetMeterCount() {
	key := "GetMeterCount"
	var count int64

	if err := utils.GetCache(key, &count); err == nil {
		logs.Info("use redis cache: GetMeterCount")
		c.jsonResult(enums.JRCodeSucc, "", count)
	}

	count = models.EquipmentMeterConfigCount()
	utils.SetCache(key, count, 3600)
	c.jsonResult(enums.JRCodeSucc, "", count)
}

//取月采集数量
func (c *HomeController) GetCollectCountOfMonth() {
	key := "GetCollectCountOfMonth"
	var data []*models.CollectCountOfMonth

	if err := utils.GetCache(key, &data); err == nil {
		logs.Info("use redis cache: GetCollectCountOfMonth")
		c.jsonResult(enums.JRCodeSucc, "", data)
	}

	if data, err := models.GetCollectRowsOfMonth(); err != nil {
		c.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		utils.SetCache(key, data, 7200)
		c.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取客户分布
func (c *HomeController) GetCustomerZone() {
	key := "GetCustomerZone"
	var data []*models.EquipmentCustomer

	if err := utils.GetCache(key, &data); err == nil {
		logs.Info("use redis cache: GetCustomerZone")
		c.jsonResult(enums.JRCodeSucc, "", data)
	}

	if data, err := models.GetCustomerZone(); err != nil {
		c.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		utils.SetCache(key, data, 7200)
		c.jsonResult(enums.JRCodeSucc, "", data)
	}
}

//获取概述信息GetDtuRowForDay
func (c *HomeController) GetOverviewToday() {
	before := time.Now().Unix()
	choiceDate := c.GetString("choiceDate")
	if data, err := models.GetOverviewToday(choiceDate); err != nil {
		after := time.Now().Unix()
		logs.Info(fmt.Sprintf("GetOverviewToday spend: %d s", after-before))
		c.jsonResult(enums.JRCodeFailed, "", 0)
	} else {
		c.jsonResult(enums.JRCodeSucc, "", data)
	}
}

func (c *HomeController) GetWeather() {
	url := "http://api.openweathermap.org/data/2.5/weather?q=Guangzhou&appid=dafef1a9be486b5015eb92330a0add7d"
	ch := make(chan string)

	go func(url string, ch chan string) {
		resp, err := http.Get(url)
		if err != nil {
			logs.Error("同步天气出错." + err.Error())
			return
		}
		defer resp.Body.Close()

		body, err := ioutil.ReadAll(resp.Body)
		if nil != err {
			logs.Error("同步天气出错：" + err.Error())
			return
		}
		ch <- string(body)
	}(url, ch)

	reuslt := <-ch
	gjsonData := gjson.Parse(reuslt)
	temp := gjsonData.Get("main.temp").Float() - 274.15
	c.jsonResult(enums.JRCodeSucc, "", temp)
}
