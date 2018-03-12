package models

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

//初始化
func init() {
	orm.RegisterModel(new(BackendUser),
		              new(Resource),
		              new(Role),
		              new(RoleResourceRel),
		              new(RoleBackendUserRel),

		              new(BackendConf),

		              new(EquipmentDtuConfig),
		              new(EquipmentGateway),
		              new(EquipmentMeterAddrConfig),
		              new(EquipmentMeterConfig),
		              new(EquipmentMeterConfigField),
		              new(EquipmentMeterRomConfig),

		              new(EquipmentSimCards),
		              new(EquipmentTableConfig),
		              new(EquipmentVendor),

		              )
}

//下面是统一的表名管理
func TableName(name string) string {
	prefix := beego.AppConfig.String("db_dt_prefix")
	return prefix + name
}