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
	"github.com/yunnet/gardens/utils"

	"github.com/astaxie/beego"
)

func init() {
	//启用Session
	beego.BConfig.WebConfig.Session.SessionOn = true

	//初始化日志
	utils.InitLogs()

	//初始化缓存
	utils.InitCache()

	//初始化数据库
	InitDatabase()
}
