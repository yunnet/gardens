package controllers

import (
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/yunnet/gardens/enums"
	"github.com/yunnet/gardens/models"
	"strconv"
	"strings"
	"time"
)

type SystemValController struct {
	BaseController
}

func (this *SystemValController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *SystemValController) Index() {
	this.Data["pageTitle"] = "系统参数管理"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "systemval/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "systemval/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("SystemValController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("SystemValController", "Delete")
}

func (this *SystemValController) DataGrid() {
	var params models.SystemValQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	data, total := models.SystemValPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *SystemValController) DataList() {
	var params = models.SystemValQueryParam{}
	data := models.SystemValDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *SystemValController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.SystemVal{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.Step = "1"
	}

	this.Data["m"] = m
	this.setTpl("systemval/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "systemval/edit_footerjs.html"
}

//add | update
func (this *SystemValController) Save() {
	var err error
	m := models.SystemVal{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.Code = this.GetString("Code")
	//m.Desc = this.GetString("Desc")
	//m.Value = this.GetString("Value")
	//m.UpLimit = this.GetString("UpLimit")
	//m.Step = this.GetString("Step")

	m.ChangeUser = this.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}
	} else {
		if _, err = o.Update(&m, "Code", "Desc", "Value", "UpLimit", "Step", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *SystemValController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.SystemValBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}

//取电房编号
func GetSysValNO(_code string) (string, error) {
	var no string
	o := orm.NewOrm()
	sql := fmt.Sprintf("call p_sysval_no('%s');", _code)
	if err := o.Raw(sql).QueryRow(&no); err != nil {
		return "", err
	}
	return no, nil
}
