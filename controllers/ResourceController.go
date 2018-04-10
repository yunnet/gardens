package controllers

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"

	"github.com/astaxie/beego/orm"
	"io/ioutil"
)

type ResourceController struct {
	BaseController
}

func (this *ResourceController) Prepare() {
	//先执行
	this.BaseController.Prepare()
	//如果一个Controller的少数Action需要权限控制，则将验证放到需要控制的Action里
	//this.checkAuthor("TreeGrid", "UserMenuTree", "ParentTreeGrid", "Select")
	//如果一个Controller的所有Action都需要登录验证，则将验证放到Prepare
	//这里注释了权限控制，因此这里需要登录验证
	this.checkLogin()
}

func (this *ResourceController) Index() {
	this.Data["pageTitle"] = "资源管理"
	//需要权限控制
	this.checkAuthor()
	//将页面左边菜单的某项激活
	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)

	this.setTpl()
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "resource/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "resource/index_footerjs.html"

	//页面里按钮权限控制
	this.Data["canEdit"] = this.checkActionAuthor("ResourceController", "Edit")
	this.Data["canDelete"] = this.checkActionAuthor("ResourceController", "Delete")
}

//TreeGrid 获取所有资源的列表
func (this *ResourceController) TreeGrid() {
	tree := models.ResourceTreeGrid()
	//转换UrlFor 2 LinkUrl
	this.UrlFor2Link(tree)
	this.jsonResult(enums.JRCodeSucc, "", tree)
}

//UserMenuTree 获取用户有权管理的菜单、区域列表
func (this *ResourceController) UserMenuTree() {
	userid := this.curUser.Id
	//获取用户有权管理的菜单列表（包括区域）
	tree := models.ResourceTreeGridByUserId(userid, 1)
	//转换UrlFor 2 LinkUrl
	this.UrlFor2Link(tree)
	this.jsonResult(enums.JRCodeSucc, "", tree)
}

//ParentTreeGrid 获取可以成为某节点的父节点列表
func (this *ResourceController) ParentTreeGrid() {
	Id, _ := this.GetInt("id", 0)
	tree := models.ResourceTreeGrid4Parent(Id)
	//转换UrlFor 2 LinkUrl
	this.UrlFor2Link(tree)
	this.jsonResult(enums.JRCodeSucc, "", tree)
}

// UrlFor2LinkOne 使用URLFor方法，将资源表里的UrlFor值转成LinkUrl
func (this *ResourceController) UrlFor2LinkOne(urlfor string) string {
	if len(urlfor) == 0 {
		return ""
	}
	// ResourceController.Edit,:id,1
	strs := strings.Split(urlfor, ",")
	if len(strs) == 1 {
		return this.URLFor(strs[0])
	} else if len(strs) > 1 {
		var values []interface{}
		for _, val := range strs[1:] {
			values = append(values, val)
		}
		return this.URLFor(strs[0], values...)
	}
	return ""
}

//UrlFor2Link 使用URLFor方法，批量将资源表里的UrlFor值转成LinkUrl
func (this *ResourceController) UrlFor2Link(src []*models.Resource) {
	for _, item := range src {
		item.LinkUrl = this.UrlFor2LinkOne(item.UrlFor)
	}
}

//Edit 资源编辑页面
func (this *ResourceController) Edit() {
	//需要权限控制
	this.checkAuthor()
	//如果是POST请求，则由Save处理
	if this.Ctx.Request.Method == "POST" {
		this.Save()
	}

	Id, _ := this.GetInt(":id", 0)
	m := &models.Resource{}
	var err error
	if Id == 0 {
		m.Seq = 100
	} else {
		m, err = models.ResourceOne(Id)
		if err != nil {
			this.pageError("数据无效，请刷新后重试")
		}
	}

	if m.Parent != nil {
		this.Data["parent"] = m.Parent.Id
	} else {
		this.Data["parent"] = 0
	}

	//获取可以成为当前节点的父节点的列表
	this.Data["parents"] = models.ResourceTreeGrid4Parent(Id)
	//转换地址
	m.LinkUrl = this.UrlFor2LinkOne(m.UrlFor)
	this.Data["m"] = m
	if m.Parent != nil {
		this.Data["parent"] = m.Parent.Id
	} else {
		this.Data["parent"] = 0
	}

	this.setTpl("resource/edit.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["footerjs"] = "resource/edit_footerjs.html"
}

//Save 资源添加编辑 保存
func (this *ResourceController) Save() {
	var err error
	o := orm.NewOrm()
	parent := &models.Resource{}
	m := models.Resource{}
	parentId, _ := this.GetInt("Parent", 0)
	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}
	//获取父节点
	if parentId > 0 {
		parent, err = models.ResourceOne(parentId)
		if err == nil && parent != nil {
			m.Parent = parent
		} else {
			this.jsonResult(enums.JRCodeFailed, "父节点无效", "")
		}
	}
	if m.Id == 0 {
		if _, err = o.Insert(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "添加成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "添加失败", m.Id)
		}

	} else {
		if _, err = o.Update(&m); err == nil {
			this.jsonResult(enums.JRCodeSucc, "编辑成功", m.Id)
		} else {
			this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
		}
	}
}

// Delete 删除
func (this *ResourceController) Delete() {
	//需要权限控制
	this.checkAuthor()
	Id, _ := this.GetInt("Id", 0)
	if Id == 0 {
		this.jsonResult(enums.JRCodeFailed, "选择的数据无效", 0)
	}
	query := orm.NewOrm().QueryTable(models.ResourceTBName())
	if _, err := query.Filter("id", Id).Delete(); err == nil {
		this.jsonResult(enums.JRCodeSucc, fmt.Sprintf("删除成功"), 0)
	} else {
		this.jsonResult(enums.JRCodeFailed, "删除失败", 0)
	}
}

// Select 通用选择面板
func (this *ResourceController) Select() {
	//获取调用者的类别 1表示 角色
	desttype, _ := this.GetInt("desttype", 0)

	//获取调用者的值
	destval, _ := this.GetInt("destval", 0)

	//返回的资源列表
	var selectedIds []string
	o := orm.NewOrm()
	if desttype > 0 && destval > 0 {
		//如果都大于0,则获取已选择的值，例如：角色，就是获取某个角色已关联的资源列表
		switch desttype {
		case 1:
			{
				role := models.Role{Id: destval}
				o.LoadRelated(&role, "RoleResourceRel")
				for _, item := range role.RoleResourceRel {
					selectedIds = append(selectedIds, strconv.Itoa(item.Resource.Id))
				}
			}
		}
	}

	this.Data["selectedIds"] = strings.Join(selectedIds, ",")
	this.setTpl("resource/select.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "resource/select_headcssjs.html"
	this.LayoutSections["footerjs"] = "resource/select_footerjs.html"
}

func (this *ResourceController) ChooseIcon() {
	filename := "static/plugins/font-awesome/less/variables.less"
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		fmt.Printf("%s\n", err)
		panic(err)
	}

	var iconlist []string
	for _, line := range strings.Split(string(data), "\n") {
		if strings.Contains(line, "@fa-var-") {
			tempStr := line[8:]
			idx := strings.Index(tempStr, ":")
			icon := tempStr[:idx]
			iconlist = append(iconlist, icon)
		}
	}
	this.Data["Iconlist"] = iconlist
	this.setTpl("resource/chooseicon.html", "shared/layout_pullbox.html")
	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "resource/chooseicon_headcssjs.html"
	this.LayoutSections["footerjs"] = "resource/chooseicon_footerjs.html"
}

//CheckUrlFor 填写UrlFor时进行验证
func (this *ResourceController) CheckUrlFor() {
	urlfor := this.GetString("urlfor")
	link := this.UrlFor2LinkOne(urlfor)
	if len(link) > 0 {
		this.jsonResult(enums.JRCodeSucc, "解析成功", link)
	} else {
		this.jsonResult(enums.JRCodeFailed, "解析失败", link)
	}
}

func (this *ResourceController) UpdateSeq() {
	Id, _ := this.GetInt("pk", 0)
	oM, err := models.ResourceOne(Id)
	if err != nil || oM == nil {
		this.jsonResult(enums.JRCodeFailed, "选择的数据无效", 0)
	}
	value, _ := this.GetInt("value", 0)
	oM.Seq = value
	if _, err := orm.NewOrm().Update(oM); err == nil {
		this.jsonResult(enums.JRCodeSucc, "修改成功", oM.Id)
	} else {
		this.jsonResult(enums.JRCodeFailed, "修改失败", oM.Id)
	}
}
