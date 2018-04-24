package routers

import (
	"github.com/yunnet/gdkxdl/controllers"

	"github.com/astaxie/beego"
)

func init() {
	//websocket
	beego.Router("/websocketwidget/index", &controllers.WebsocketWidgetController{}, "*:Index")
	beego.Router("/websocketwidget/ws", &controllers.WebsocketWidgetController{}, "Get:Get")


	//logintrace
	beego.Router("/logintrace/index", &controllers.LoginTraceController{}, "*:Index")
	beego.Router("/logintrace/datagrid", &controllers.LoginTraceController{}, "Get,Post:DataGrid")
	beego.Router("/logintrace/datalist", &controllers.LoginTraceController{}, "Post:DataList")

	//icons
	beego.Router("/icons/index", &controllers.IconsController{}, "*:Index")

	//totalactivepowerminute
	beego.Router("/totalactivepowerminute/index", &controllers.TotalActivePowerMinuteController{}, "*:Index")
	beego.Router("/totalactivepowerminute/datagrid", &controllers.TotalActivePowerMinuteController{}, "Get,Post:DataGrid")
	beego.Router("/totalactivepowerminute/datalist", &controllers.TotalActivePowerMinuteController{}, "Post:DataList")

	//collectbaseinfo
	beego.Router("/collectbaseinfo/index", &controllers.CollectBaseInfoController{}, "*:Index")
	beego.Router("/collectbaseinfo/datagrid", &controllers.CollectBaseInfoController{}, "Get,Post:DataGrid")
	beego.Router("/collectbaseinfo/datalist", &controllers.CollectBaseInfoController{}, "Post:DataList")

	//EquipmentDtuConfig
	beego.Router("/equipmentdtuconfig/index", &controllers.EquipmentDtuConfigController{}, "*:Index")
	beego.Router("/equipmentdtuconfig/datagrid", &controllers.EquipmentDtuConfigController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentdtuconfig/datalist", &controllers.EquipmentDtuConfigController{}, "Post:DataList")
	beego.Router("/equipmentdtuconfig/edit/?:id", &controllers.EquipmentDtuConfigController{}, "Get,Post:Edit")
	beego.Router("/equipmentdtuconfig/delete", &controllers.EquipmentDtuConfigController{}, "Post:Delete")

	//EquipmentGateway
	beego.Router("/equipmentgateway/index", &controllers.EquipmentGatewayController{}, "*:Index")
	beego.Router("/equipmentgateway/datagrid", &controllers.EquipmentGatewayController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentgateway/datalist", &controllers.EquipmentGatewayController{}, "Post:DataList")
	beego.Router("/equipmentgateway/edit/?:id", &controllers.EquipmentGatewayController{}, "Get,Post:Edit")
	beego.Router("/equipmentgateway/delete", &controllers.EquipmentGatewayController{}, "Post:Delete")

	//EquipmentMeterAddrConfig
	beego.Router("/equipmentmeteraddrconfig/index", &controllers.EquipmentMeterAddrConfigController{}, "*:Index")
	beego.Router("/equipmentmeteraddrconfig/datagrid", &controllers.EquipmentMeterAddrConfigController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentmeteraddrconfig/datalist", &controllers.EquipmentMeterAddrConfigController{}, "Post:DataList")
	beego.Router("/equipmentmeteraddrconfig/edit/?:id", &controllers.EquipmentMeterAddrConfigController{}, "Get,Post:Edit")
	beego.Router("/equipmentmeteraddrconfig/delete", &controllers.EquipmentMeterAddrConfigController{}, "Post:Delete")

	//EquipmentMeterConfig
	beego.Router("/equipmentmeterconfig/index", &controllers.EquipmentMeterConfigController{}, "*:Index")
	beego.Router("/equipmentmeterconfig/datagrid", &controllers.EquipmentMeterConfigController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentmeterconfig/datalist", &controllers.EquipmentMeterConfigController{}, "Post:DataList")
	beego.Router("/equipmentmeterconfig/edit/?:id", &controllers.EquipmentMeterConfigController{}, "Get,Post:Edit")
	beego.Router("/equipmentmeterconfig/delete", &controllers.EquipmentMeterConfigController{}, "Post:Delete")

	//EquipmentMeterConfigField
	beego.Router("/equipmentmeterconfigfield/index", &controllers.EquipmentMeterConfigFieldController{}, "*:Index")
	beego.Router("/equipmentmeterconfigfield/datagrid", &controllers.EquipmentMeterConfigFieldController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentmeterconfigfield/datalist", &controllers.EquipmentMeterConfigFieldController{}, "Post:DataList")
	beego.Router("/equipmentmeterconfigfield/edit/?:id", &controllers.EquipmentMeterConfigFieldController{}, "Get,Post:Edit")
	beego.Router("/equipmentmeterconfigfield/delete", &controllers.EquipmentMeterConfigFieldController{}, "Post:Delete")

	//EquipmentMeterRomConfig
	beego.Router("/equipmentmeterromconfig/index", &controllers.EquipmentMeterRomConfigController{}, "*:Index")
	beego.Router("/equipmentmeterromconfig/datagrid", &controllers.EquipmentMeterRomConfigController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentmeterromconfig/datalist", &controllers.EquipmentMeterRomConfigController{}, "Post:DataList")
	beego.Router("/equipmentmeterromconfig/edit/?:id", &controllers.EquipmentMeterRomConfigController{}, "Get,Post:Edit")
	beego.Router("/equipmentmeterromconfig/delete", &controllers.EquipmentMeterRomConfigController{}, "Post:Delete")

	//EquipmentMeterType
	beego.Router("/equipmentmetertype/index", &controllers.EquipmentMeterTypeController{}, "*:Index")
	beego.Router("/equipmentmetertype/datagrid", &controllers.EquipmentMeterTypeController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentmetertype/datagridselect", &controllers.EquipmentMeterTypeController{}, "Get,Post:DataGridSelect")
	beego.Router("/equipmentmetertype/datalist", &controllers.EquipmentMeterTypeController{}, "Post:DataList")
	beego.Router("/equipmentmetertype/edit/?:id", &controllers.EquipmentMeterTypeController{}, "Get,Post:Edit")
	beego.Router("/equipmentmetertype/delete", &controllers.EquipmentMeterTypeController{}, "Post:Delete")

	//EquipmentSimCards
	beego.Router("/equipmentsimcards/index", &controllers.EquipmentSimCardsController{}, "*:Index")
	beego.Router("/equipmentsimcards/datagrid", &controllers.EquipmentSimCardsController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentsimcards/datalist", &controllers.EquipmentSimCardsController{}, "Post:DataList")
	beego.Router("/equipmentsimcards/edit/?:id", &controllers.EquipmentSimCardsController{}, "Get,Post:Edit")
	beego.Router("/equipmentsimcards/delete", &controllers.EquipmentSimCardsController{}, "Post:Delete")

	//EquipmentTableConfig
	beego.Router("/equipmenttableconfig/index", &controllers.EquipmentTableConfigController{}, "*:Index")
	beego.Router("/equipmenttableconfig/datagrid", &controllers.EquipmentTableConfigController{}, "Get,Post:DataGrid")
	beego.Router("/equipmenttableconfig/datalist", &controllers.EquipmentTableConfigController{}, "Post:DataList")
	beego.Router("/equipmenttableconfig/edit/?:id", &controllers.EquipmentTableConfigController{}, "Get,Post:Edit")
	beego.Router("/equipmenttableconfig/delete", &controllers.EquipmentTableConfigController{}, "Post:Delete")

	//EquipmentVendor
	beego.Router("/equipmentvendor/index", &controllers.EquipmentVendorController{}, "*:Index")
	beego.Router("/equipmentvendor/datagrid", &controllers.EquipmentVendorController{}, "Get,Post:DataGrid")
	beego.Router("/equipmentvendor/datalist", &controllers.EquipmentVendorController{}, "Post:DataList")
	beego.Router("/equipmentvendor/edit/?:id", &controllers.EquipmentVendorController{}, "Get,Post:Edit")
	beego.Router("/equipmentvendor/delete", &controllers.EquipmentVendorController{}, "Post:Delete")

	//BackendConf
	beego.Router("/backendconf/index", &controllers.BackendConfController{}, "*:Index")
	beego.Router("/backendconf/datagrid", &controllers.BackendConfController{}, "Get,Post:DataGrid")
	beego.Router("/backendconf/datalist", &controllers.BackendConfController{}, "Post:DataList")
	beego.Router("/backendconf/edit/?:id", &controllers.BackendConfController{}, "Get,Post:Edit")
	beego.Router("/backendconf/delete", &controllers.BackendConfController{}, "Post:Delete")

	//用户角色路由
	beego.Router("/role/index", &controllers.RoleController{}, "*:Index")
	beego.Router("/role/datagrid", &controllers.RoleController{}, "Get,Post:DataGrid")
	beego.Router("/role/edit/?:id", &controllers.RoleController{}, "Get,Post:Edit")
	beego.Router("/role/delete", &controllers.RoleController{}, "Post:Delete")
	beego.Router("/role/datalist", &controllers.RoleController{}, "Post:DataList")
	beego.Router("/role/allocate", &controllers.RoleController{}, "Post:Allocate")
	beego.Router("/role/updateseq", &controllers.RoleController{}, "Post:UpdateSeq")

	//资源路由
	beego.Router("/resource/index", &controllers.ResourceController{}, "*:Index")
	beego.Router("/resource/treegrid", &controllers.ResourceController{}, "POST:TreeGrid")
	beego.Router("/resource/edit/?:id", &controllers.ResourceController{}, "Get,Post:Edit")
	beego.Router("/resource/parent", &controllers.ResourceController{}, "Post:ParentTreeGrid")
	beego.Router("/resource/delete", &controllers.ResourceController{}, "Post:Delete")

	//快速修改顺序
	beego.Router("/resource/updateseq", &controllers.ResourceController{}, "Post:UpdateSeq")

	//通用选择面板
	beego.Router("/resource/select", &controllers.ResourceController{}, "Get:Select")
	beego.Router("/resource/chooseIcon", &controllers.ResourceController{}, "Get:ChooseIcon")

	//用户有权管理的菜单列表（包括区域）
	beego.Router("/resource/usermenutree", &controllers.ResourceController{}, "POST:UserMenuTree")
	beego.Router("/resource/checkurlfor", &controllers.ResourceController{}, "POST:CheckUrlFor")

	//后台用户路由
	beego.Router("/backenduser/index", &controllers.BackendUserController{}, "*:Index")
	beego.Router("/backenduser/datagrid", &controllers.BackendUserController{}, "POST:DataGrid")
	beego.Router("/backenduser/edit/?:id", &controllers.BackendUserController{}, "Get,Post:Edit")
	beego.Router("/backenduser/delete", &controllers.BackendUserController{}, "Post:Delete")

	//后台用户中心
	beego.Router("/usercenter/profile", &controllers.UserCenterController{}, "Get:Profile")
	beego.Router("/usercenter/basicinfosave", &controllers.UserCenterController{}, "Post:BasicInfoSave")
	beego.Router("/usercenter/uploadimage", &controllers.UserCenterController{}, "Post:UploadImage")
	beego.Router("/usercenter/passwordsave", &controllers.UserCenterController{}, "Post:PasswordSave")

	beego.Router("/home/index", &controllers.HomeController{}, "*:Index")
	beego.Router("/home/login", &controllers.HomeController{}, "*:Login")
	beego.Router("/home/dologin", &controllers.HomeController{}, "Post:DoLogin")
	beego.Router("/home/logout", &controllers.HomeController{}, "*:Logout")

	beego.Router("/home/metercount", &controllers.HomeController{}, "*:GetMeterCount")
	beego.Router("/home/dtucount", &controllers.HomeController{}, "*:GetDtuCount")
	beego.Router("/home/customerformeter", &controllers.HomeController{}, "*:GetCustomerForMeter")
	beego.Router("/home/dturowforday", &controllers.HomeController{}, "*:GetDtuRowForDay")
	beego.Router("/home/collectrowstoday", &controllers.HomeController{}, "*:GetCollectRowsToday")
	beego.Router("/home/collectcountofmonth", &controllers.HomeController{}, "*:GetCollectCountOfMonth")
	beego.Router("/home/customers", &controllers.HomeController{}, "*:GetCustomers")

	beego.Router("/home/404", &controllers.HomeController{}, "*:Page404")
	beego.Router("/home/error/?:error", &controllers.HomeController{}, "*:Error")

	beego.Router("/", &controllers.HomeController{}, "*:Index")
}
