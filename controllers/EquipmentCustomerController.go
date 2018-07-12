package controllers

import (
	"strings"
	"strconv"
	"encoding/json"
	"time"
	"fmt"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/enums"
	"github.com/astaxie/beego/orm"
)

type EquipmentCustomerController struct {
	BaseController
}

func (this *EquipmentCustomerController) Prepare() {
	this.BaseController.Prepare()
	this.checkAuthor("DataGrid", "DataList", "SelectPicker")
}

func (this *EquipmentCustomerController) Index() {
	this.Data["pageTitle"] = "客户管理"
	this.Data["showMoreQuery"] = true

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "equipmentcustomer/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "equipmentcustomer/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("EquipmentCustomerController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("EquipmentCustomerController", "Delete")
}

func (this *EquipmentCustomerController) DataGrid() {
	var params models.EquipmentCustomerQueryParam
	json.Unmarshal(this.Ctx.Input.RequestBody, &params)

	data, total := models.EquipmentCustomerPageList(&params)
	result := make(map[string]interface{})
	result["total"] = total
	result["rows"] = data

	this.Data["json"] = result
	this.ServeJSON()
}

//客户下拉选择列表
func(this *EquipmentCustomerController)SelectPicker(){
	var params = models.EquipmentCustomerQueryParam{}
	params.Used = this.Input().Get("Used")
	data := models.EquipmentCustomerDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentCustomerController) DataList() {
	var params = models.EquipmentCustomerQueryParam{}
	data := models.EquipmentCustomerDataList(&params)
	this.jsonResult(enums.JRCodeSucc, "", data)
}

func (this *EquipmentCustomerController) Edit() {
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := models.EquipmentCustomer{Id: Id}
	if Id > 0 {
		o := orm.NewOrm()
		err := o.Read(&m)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	} else {
		m.Used = enums.Enabled
		m.Zone = "天河区"
	}

	this.Data["m"] = m
	this.setTpl("equipmentcustomer/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "equipmentcustomer/edit_footerjs.html"
}

//add | update
func (this *EquipmentCustomerController) Save() {
	var err error
	m := models.EquipmentCustomer{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}
	m.ChangeUser = this.curUser.RealName

	o := orm.NewOrm()
	if m.Id == 0 {
		if err = o.Begin(); err != nil{
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			return
		}

		if m.CustomerNO, err = GetSysValNO("customerno"); err != nil{
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
			o.Rollback()
			return
		}

		m.CreateUser = this.curUser.RealName
		m.CreateDate = time.Now()

		if _, err = o.Insert(&m); err == nil {
			if err = o.Commit(); err != nil{
				this.jsonResult(enums.JRCodeFailed, "添加提交失败", m.Id)
				o.Rollback()
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
		if _, err = o.Update(&m, "CustomerNO", "CustomerName", "CustomerDesc", "Contacts", "Phone", "Address", "Longitude", "Latitude", "Used", "ChangeUser", "ChangeDate"); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

func (this *EquipmentCustomerController) Delete() {
	strs := this.GetString("ids")
	ids := make([]int, 0, len(strs))
	for _, str := range strings.Split(strs, ",") {
		if id, err := strconv.Atoi(str); err == nil {
			ids = append(ids, id)
		}
	}

	if num, err := models.EquipmentCustomerBatchDelete(ids); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("成功删除 %d 项", num), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}