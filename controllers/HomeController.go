package controllers

import (
	"strings"

	"encoding/json"
	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"
	"strconv"
	"fmt"
)

type HomeController struct {
	BaseController
}

func (this *HomeController) Index() {
	//判断是否登录
	this.checkLogin()

	//url := this.URLFor("MainController.Index")
	//this.Redirect(url, 302)
	//this.StopRun()
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

func (this *HomeController) DoLogin() {
	username := strings.TrimSpace(this.GetString("UserName"))
	userpwd := strings.TrimSpace(this.GetString("UserPwd"))
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

//查询客户和电表
func (this *HomeController) GetCustomerForMeter() {
	data, err := models.CustomerForMeterDataList()
	if err != nil {
		return
	}

	var master *models.RootItem
	var company *models.CompanyItem
	var dtu *models.DtuItem

	master = &models.RootItem{Name: "电可托"}

	for _, row := range data {
		meter := models.MeterItem{strconv.Itoa(row.MeterAddress), row.CollectConfigName}

		var dtu_cur *models.DtuItem
		var company_cur *models.CompanyItem

		if company == nil {
			company_cur = &models.CompanyItem{Name: row.CustomerName}
			master.CompanyItemList = append(master.CompanyItemList, company_cur)
		} else {
			company_cur = company
			if company_cur.Name != row.CustomerName {
				company_cur = &models.CompanyItem{Name: row.CustomerName}
				master.CompanyItemList = append(master.CompanyItemList, company_cur)
			}
		}

		if dtu == nil {
			dtu_cur = &models.DtuItem{Name: row.DTU_no}
			company_cur.DtuItemList = append(company_cur.DtuItemList, dtu_cur)
		} else {
			dtu_cur = dtu
			if dtu_cur.Name != row.DTU_no {
				dtu_cur = &models.DtuItem{Name: row.DTU_no}
				company_cur.DtuItemList = append(company_cur.DtuItemList, dtu_cur)
			}
		}
		dtu_cur.MeterItemList = append(dtu_cur.MeterItemList, &meter)

		dtu = dtu_cur
		company = company_cur
	}

	jsondata, _ := json.Marshal(master)
	fmt.Println(jsondata)
	this.jsonResult(enums.JRCodeSucc, "", jsondata)
}

//取DTU总条数
func (this *HomeController) GetDtuCount() {
	count := models.EquipmentDtuConfigCount()
	this.jsonResult(enums.JRCodeSucc, "", count)
}

//取电表总条数
func (this *HomeController) GetMeterCount() {
	count := models.EquipmentMeterConfigCount()
	this.jsonResult(enums.JRCodeSucc, "", count)
}

func (this *HomeController) Logout() {
	user := models.BackendUser{}
	this.SetSession("backenduser", user)
	this.pageLogin()
}
