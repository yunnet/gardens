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

type EquipmentMeterConfigController struct {
	BaseController
}

func (this *EquipmentMeterConfigController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList")
}

func (this *EquipmentMeterConfigController) Index() {
	this.Data["pageTitle"] = "电表管理"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentmeterconfig/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentmeterconfig/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentMeterConfigController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentMeterConfigController", "Delete")
}

func (this *EquipmentMeterConfigController) DataGrid() {
	var params models.EquipmentMeterConfigQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)
	data, total := models.EquipmentMeterConfigPageList(&params)

	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

func (this *EquipmentMeterConfigController) DataList() {
	var params = models.EquipmentMeterConfigQueryParam{}
	data := models.EquipmentMeterConfigDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentMeterConfigController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentMeterConfig{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = 0
		m.Ct = 1
		m.Pt = 1
		m.MeterAddress = 1
	}

	this.Data["m"] = m
	this.setTpl("equipmentmeterconfig/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentmeterconfig/edit_footerjs.html"
}

//add | update
func (this *EquipmentMeterConfigController) Save() {
	var err error
	m := models.EquipmentMeterConfig{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	//id := this.Input().Get("Id")
	//m.Id, _ = strconv.Atoi(id)
	//m.DTU_no = this.GetString("DTU_no")
	//
	//tmpInt := this.Input().Get("MeterAddress")
	//m.MeterAddress, _ = strconv.Atoi(tmpInt)
	//
	//m.MeterTypeNO = this.GetString("MeterTypeNO")
	//m.GatewayNO = this.GetString("GatewayNO")
	//
	//tmpInt = this.Input().Get("GatewayQzone")
	//m.GatewayQzone, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = this.Input().Get("GatewayAddress")
	//m.GatewayAddress, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = this.Input().Get("GatewaySite")
	//m.GatewaySite, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = this.Input().Get("Pt")
	//m.Pt, _ = strconv.Atoi(tmpInt)
	//
	//tmpInt = this.Input().Get("Ct")
	//m.Ct, _ = strconv.Atoi(tmpInt)
	//
	//m.LoopName = this.GetString("LoopName")

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
		if _, err = o.Update(&m, "DTU_no", "MeterAddress", "MeterTypeNO", "GatewayNO", "GatewayQzone", "GatewayAddress", "GatewaySite", "Pt", "Ct", "LoopName", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentMeterConfigController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentMeterConfigBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}
