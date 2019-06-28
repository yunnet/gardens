// Copyright 2018 gardens Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package sysinit

import (
	_ "gardens/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/mattn/go-sqlite3"
)

//初始化数据连接
func InitDatabase() {
	//读取配置文件，设置数据库参数
	//数据库类别
	dbType := beego.AppConfig.String("db_type")

	//连接名称
	dbAlias := beego.AppConfig.String(dbType + "::db_alias")

	//数据库名称
	dbName := beego.AppConfig.String(dbType + "::db_name")

	//数据库连接用户名
	dbUser := beego.AppConfig.String(dbType + "::db_user")

	//数据库连接用户名
	dbPwd := beego.AppConfig.String(dbType + "::db_pwd")

	//数据库IP（域名）
	dbHost := beego.AppConfig.String(dbType + "::db_host")

	//数据库端口
	dbPort := beego.AppConfig.String(dbType + "::db_port")

	dbName2 := "kxtimingdata"

	switch dbType {
	case "sqlite3":
		orm.RegisterDataBase(dbAlias, dbType, dbName)
	case "mysql":
		dbCharset := beego.AppConfig.String(dbType + "::db_charset")
		orm.RegisterDataBase(dbAlias, dbType, dbUser+":"+dbPwd+"@tcp("+dbHost+":"+dbPort+")/"+dbName+"?charset="+dbCharset+"&loc=Asia%2FShanghai", 30)

		orm.RegisterDataBase(dbName2, dbType, dbUser+":"+dbPwd+"@tcp("+dbHost+":"+dbPort+")/"+dbName2+"?charset="+dbCharset+"&loc=Asia%2FShanghai", 30)
	}

	//如果是开发模式，则显示命令信息
	isDev := (beego.AppConfig.String("runmode") == "dev")

	// true: drop table 后再建表
	force := false

	//自动建表
	orm.RunSyncdb("default", force, isDev)
	if isDev {
		orm.Debug = isDev
	}
}
