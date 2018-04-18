package controllers

import (
	"strings"

	"github.com/yunnet/gdkxdl/enums"
	"github.com/yunnet/gdkxdl/models"
	"github.com/yunnet/gdkxdl/utils"

	"github.com/astaxie/beego/orm"
)

type UserCenterController struct {
	BaseController
}

func (this *UserCenterController) Prepare() {
	//先执行
	this.BaseController.Prepare()
	//如果一个Controller的所有Action都需要登录验证，则将验证放到Prepare
	this.checkLogin()
}

func (this *UserCenterController) Profile() {
	Id := this.curUser.Id
	m, err := models.BackendUserOne(Id)
	if m == nil || err != nil {
		this.pageError("数据无效，请刷新后重试")
	}
	this.Data["hasAvatar"] = len(m.Avatar) > 0
	utils.LogDebug(m.Avatar)
	this.Data["m"] = m
	this.setTpl()

	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "usercenter/profile_headcssjs.html"
	this.LayoutSections["footerjs"] = "usercenter/profile_footerjs.html"
}

func (this *UserCenterController) BasicInfoSave() {
	Id := this.curUser.Id
	oM, err := models.BackendUserOne(Id)
	if oM == nil || err != nil {
		this.jsonResult(enums.JRCodeFailed, "数据无效，请刷新后重试", "")
	}
	m := models.BackendUser{}

	//获取form里的值
	if err = this.ParseForm(&m); err != nil {
		this.jsonResult(enums.JRCodeFailed, "获取数据失败", m.Id)
	}

	oM.RealName = m.RealName
	oM.Mobile = m.Mobile
	oM.Email = m.Email
	oM.Avatar = this.GetString("ImageUrl")
	o := orm.NewOrm()
	if _, err := o.Update(oM); err != nil {
		this.jsonResult(enums.JRCodeFailed, "编辑失败", m.Id)
	} else {
		this.setBackendUser2Session(Id)
		this.jsonResult(enums.JRCodeSucc, "保存成功", m.Id)
	}
}

func (this *UserCenterController) PasswordSave() {
	Id := this.curUser.Id
	oM, err := models.BackendUserOne(Id)
	if oM == nil || err != nil {
		this.pageError("数据无效，请刷新后重试")
	}
	oldPwd := strings.TrimSpace(this.GetString("UserPwd", ""))
	newPwd := strings.TrimSpace(this.GetString("NewUserPwd", ""))
	confirmPwd := strings.TrimSpace(this.GetString("ConfirmPwd", ""))
	md5str := utils.String2md5(oldPwd)

	if oM.UserPwd != md5str {
		this.jsonResult(enums.JRCodeFailed, "原密码错误", "")
	}

	if len(newPwd) == 0 {
		this.jsonResult(enums.JRCodeFailed, "请输入新密码", "")
	}

	if newPwd != confirmPwd {
		this.jsonResult(enums.JRCodeFailed, "两次输入的新密码不一致", "")
	}

	oM.UserPwd = utils.String2md5(newPwd)
	o := orm.NewOrm()
	if _, err := o.Update(oM); err != nil {
		this.jsonResult(enums.JRCodeFailed, "保存失败", oM.Id)
	} else {
		this.setBackendUser2Session(Id)
		this.jsonResult(enums.JRCodeSucc, "保存成功", oM.Id)
	}
}

func (this *UserCenterController) UploadImage() {
	//这里type没有用，只是为了演示传值
	stype, _ := this.GetInt32("type", 0)
	if stype > 0 {
		f, h, err := this.GetFile("fileImageUrl")
		if err != nil {
			this.jsonResult(enums.JRCodeFailed, "上传失败", "")
		}
		defer f.Close()

		filePath := "static/upload/" + h.Filename
		// 保存位置在 static/upload, 没有文件夹要先创建
		this.SaveToFile("fileImageUrl", filePath)
		this.jsonResult(enums.JRCodeSucc, "上传成功", "/"+filePath)
	} else {
		this.jsonResult(enums.JRCodeFailed, "上传失败", "")
	}
}
