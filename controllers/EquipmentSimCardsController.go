package controllers

import (
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego/orm"
	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"strconv"
	"strings"
	"time"
)

type EquipmentSimCardsController struct {
	BaseController
}

func (c *EquipmentSimCardsController) Prepare() {
	//先执行
	c.BaseController.Prepare()
	//如果一个Controller的多数Action都需要权限控制，则将验证放到Prepare
	c.checkAuthor("DataGrid", "DataList")
	//如果一个Controller的所有Action都需要登录验证，则将验证放到Prepare
	//权限控制里会进行登录验证，因此这里不用再作登录验证
	//c.checkLogin()
}

func (this *EquipmentSimCardsController) Index() {
	this.Data["title"] = "SIM卡管理"
	//是否显示更多查询条件的按钮
	this.Data["showMoreQuery"] = true

	//将页面左边菜单的某项激活
	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentsimcards/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentsimcards/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentSimCardsController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentSimCardsController", "Delete")
}

// DataGrid 管理首页 表格获取数据
func (this *EquipmentSimCardsController) DataGrid() {
	var params models.EquipmentSimCardsQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentSimCardsPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//DataList 列表
func (this *EquipmentSimCardsController) DataList() {
	var params = models.EquipmentSimCardsQueryParam{}
	data := models.EquipmentSimCardsDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

//Edit 添加、编辑角色界面
func (this *EquipmentSimCardsController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentSimCards{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
	}

	this.Data["m"] = m
	this.setTpl("equipmentsimcards/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentsimcards/edit_footerjs.html"
}

//Save 添加、编辑页面 保存
func (this *EquipmentSimCardsController) Save() {
	var err error
	m := models.EquipmentSimCards{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	id := this.Input().Get("Id")
	m.Id, _ = strconv.Atoi(id)
	m.Sim_no = this.GetString("Sim_no")

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
		m.ChangeUser = this.curUser.RealName
		m.ChangeDate = time.Now()

		if _, err = o.Update(&m, "Sim_no", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

//Delete 批量删除
func (this *EquipmentSimCardsController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentSimCardsBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
