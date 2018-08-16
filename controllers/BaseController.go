package controllers

import (
	"fmt"
	"strings"

	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"

	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
	controllerName string             //当前控制名称
	actionName     string             //当前action名称
	curUser        models.BackendUser //当前用户信息
}

func (this *BaseController) Prepare() {
	//附值
	this.controllerName, this.actionName = this.GetControllerAndAction()

	this.Data["siteApp"] = beego.AppConfig.String("site.app")
	this.Data["siteName"] = beego.AppConfig.String("site.name")
	this.Data["siteVersion"] = beego.AppConfig.String("site.version")

	//从Session里获取数据 设置用户信息
	this.adapterUserInfo()
}

//从session里取用户信息
func (this *BaseController) adapterUserInfo() {
	a := this.GetSession("backenduser")
	if a != nil {
		this.curUser = a.(models.BackendUser)
		this.Data["backenduser"] = a
	}
}

// checkLogin判断用户是否登录，未登录则跳转至登录页面
// 一定要在BaseController.Prepare()后执行
func (this *BaseController) checkLogin() {
	if this.curUser.Id == 0 {
		//登录页面地址
		urlstr := this.URLFor("HomeController.Login") + "?url="

		//登录成功后返回的址为当前
		returnURL := this.Ctx.Request.URL.Path

		//如果ajax请求则返回相应的错码和跳转的地址
		if this.Ctx.Input.IsAjax() {
			//由于是ajax请求，因此地址是header里的Referer
			returnURL := this.Ctx.Input.Refer()
			this.jsonResult(enums.JRCode302, "请登录", urlstr+returnURL)
		}
		this.Redirect(urlstr+returnURL, 302)
		this.StopRun()
	}
}

// 判断某 Controller.Action 当前用户是否有权访问
func (this *BaseController) checkActionAuthor(ctrlName, ActName string) bool {
	if this.curUser.Id == 0 {
		return false
	}

	//从session获取用户信息
	user := this.GetSession("backenduser")

	//类型断言
	v, ok := user.(models.BackendUser)
	if ok {
		//如果是超级管理员，则直接通过
		if v.IsSuper == true {
			return true
		}

		//遍历用户所负责的资源列表
		for i, _ := range v.ResourceUrlForList {
			urlfor := strings.TrimSpace(v.ResourceUrlForList[i])
			if len(urlfor) == 0 {
				continue
			}
			// TestController.Get,:last,xie,:first,asta
			strs := strings.Split(urlfor, ",")
			if len(strs) > 0 && strs[0] == (ctrlName+"."+ActName) {
				return true
			}
		}
	}
	return false
}

// checkLogin判断用户是否有权访问某地址，无权则会跳转到错误页面
//一定要在BaseController.Prepare()后执行
// 会调用checkLogin
// 传入的参数为忽略权限控制的Action
func (this *BaseController) checkAuthor(ignores ...string) {
	//先判断是否登录
	this.checkLogin()

	//如果Action在忽略列表里，则直接通用
	for _, ignore := range ignores {
		if ignore == this.actionName {
			return
		}
	}

	hasAuthor := this.checkActionAuthor(this.controllerName, this.actionName)
	if !hasAuthor {
		utils.LogDebug(fmt.Sprintf("author control: path=%s.%s userid=%v  无权访问", this.controllerName, this.actionName, this.curUser.Id))

		//如果没有权限
		if !hasAuthor {
			if this.Ctx.Input.IsAjax() {
				this.jsonResult(enums.JRCode401, "无权访问", "")
			} else {
				this.pageError("无权访问")
			}
		}
	}
}

//SetBackendUser2Session 获取用户信息（包括资源UrlFor）保存至Session
//被 HomeController.DoLogin 调用
func (this *BaseController) setBackendUser2Session(userId int) error {
	m, err := models.BackendUserOne(userId)
	if err != nil {
		return err
	}

	//获取这个用户能获取到的所有资源列表
	resourceList := models.ResourceTreeGridByUserId(userId, 1000)
	for _, item := range resourceList {
		m.ResourceUrlForList = append(m.ResourceUrlForList, strings.TrimSpace(item.UrlFor))
	}
	this.SetSession("backenduser", *m)
	return nil
}

// 设置模板
// 第一个参数模板，第二个参数为layout
func (this *BaseController) setTpl(template ...string) {
	layout := "shared/layout_page.html"

	var tplName string
	switch {
	case len(template) == 1:
		tplName = template[0]
	case len(template) == 2:
		tplName = template[0]
		layout = template[1]
	default:
		//不要Controller这个10个字母
		ctrlName := strings.ToLower(this.controllerName[0 : len(this.controllerName)-10])
		actionName := strings.ToLower(this.actionName)
		tplName = ctrlName + "/" + actionName + ".html"
	}

	this.Layout = layout
	this.TplName = tplName
}

func (this *BaseController) jsonResult(code enums.JsonResultCode, msg string, obj interface{}) {
	res := &models.JsonResult{Code: code, Msg: msg, Obj: obj}
	this.Data["json"] = res
	this.ServeJSON()
	this.StopRun()
}

// 重定向
func (this *BaseController) redirect(url string) {
	this.Redirect(url, 302)
	this.StopRun()
}

// 重定向 去错误页
func (this *BaseController) pageError(msg string) {
	errorurl := this.URLFor("HomeController.Error") + "/" + msg
	this.Redirect(errorurl, 302)
	this.StopRun()
}

// 重定向 去登录页
func (this *BaseController) pageLogin() {
	url := this.URLFor("HomeController.Login")
	this.Redirect(url, 302)
	this.StopRun()
}
