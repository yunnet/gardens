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

type EquipmentDtuConfigController struct {
	BaseController
}

func (this *EquipmentDtuConfigController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (this *EquipmentDtuConfigController) Index() {
	this.Data["pageTitle"] = "网络设备管理"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentdtuconfig/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentdtuconfig/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentDtuConfigController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentDtuConfigController", "Delete")
}

func (this *EquipmentDtuConfigController) DataGrid() {
	var params models.EquipmentDtuConfigQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentDtuConfigPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//下拉选择列表
func(this *EquipmentDtuConfigController)SelectPicker(){
	var params = models.EquipmentDtuConfigQueryParam{}
	params.Used = this.Input().Get("Used")
	data := models.EquipmentDtuConfigDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentDtuConfigController) DataList() {
	var params = models.EquipmentDtuConfigQueryParam{}
	data := models.EquipmentDtuConfigDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentDtuConfigController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentDtuConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Disabled
		m.TimeInterval = 5
	}

	this.Data["m"] = m
	this.setTpl("equipmentdtuconfig/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentdtuconfig/edit_footerjs.html"
}

//add | update
func (this *EquipmentDtuConfigController) Save() {
	var err error
	m := models.EquipmentDtuConfig{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	id := this.Input().Get("Id")
	m.Id, _ = strconv.Atoi(id)

	m.DTU_no = this.GetString("DTU_no")
	m.Sim_no = this.GetString("Sim_no")
	m.Room_no = this.GetString("Room_no")

	timeInterval := this.Input().Get("TimeInterval")
	m.TimeInterval, _ = strconv.Atoi(timeInterval)

	m.ChangeUser = this.curUser.RealName
	m.ChangeDate = time.Now()

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
		if _, err = o.Update(&m, "DTU_no", "Room_no", "Sim_no", "TimeInterval", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentDtuConfigController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentVendorBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
