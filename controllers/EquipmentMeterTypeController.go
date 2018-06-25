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

type EquipmentMeterTypeController struct {
	BaseController
}

func (this *EquipmentMeterTypeController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *EquipmentMeterTypeController) Index() {
	this.Data["pageTitle"] = "电表类型"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentmetertype/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentmetertype/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentMeterTypeController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentMeterTypeController", "Delete")
}

func (this *EquipmentMeterTypeController) DataGridSelect() {
	var params models.EquipmentMeterTypeQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, err := models.EquipmentMeterTypeSelect(&params)
	if err != nil{
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", "")
	}
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentMeterTypeController) DataGrid() {
	var params models.EquipmentMeterTypeQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterTypePageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *EquipmentMeterTypeController) DataList() {
	var params = models.EquipmentMeterTypeQueryParam{}
	data := models.EquipmentMeterTypeDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentMeterTypeController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentMeterType{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.ThreePhase = 1
		m.Used = enums.Enabled
	}

	this.Data["m"] = m
	this.setTpl("equipmentmetertype/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentmetertype/edit_footerjs.html"
}

//add | update
func (this *EquipmentMeterTypeController) Save() {
	var err error
	m := models.EquipmentMeterType{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//
	//m.MeterType = this.GetString("MeterType")
	//m.VendorNO = this.GetString("VendorNO")
	//m.PtAddress = this.GetString("PtAddress")
	//m.CtAddress = this.GetString("CtAddress")

	tmp_str := this.GetString("ThreePhase")
	if tmp_str == "on" {
		m.ThreePhase = 1
	} else {
		m.ThreePhase = 0
	}

	//m.Used, _ = this.GetInt("Used")

	m.ChangeUser = this.curUser.RealName
	//m.ChangeDate = time.Now()

	o := orm.NewOrm()
	if m.Id == 0 {
		if err = o.Begin(); err != nil{
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}

		if m.MeterTypeNO, err = GetSysValNO("metertypeno"); err != nil{
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			o.Rollback()
			return
		}

		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			if err = o.Commit(); err != nil{
				this.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
			}else{
				this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
			}
		} else {
			if err = o.Rollback(); err != nil{
				this.jsonResult(enums.JRCodeFailed, "添加回滚失败", m.Id)
			}else{
				this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			}
		}
	} else {
		m.MeterTypeNO = this.GetString("MeterTypeNO")

		if err = m.Update("MeterTypeNO", "MeterType", "VendorNO", "PtAddress", "CtAddress", "ThreePhase", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentMeterTypeController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterTypeBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
