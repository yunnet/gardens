package main

import (
	_ "github.com/yunnet/gdkxdl/routers"
	_ "github.com/yunnet/gdkxdl/sysinit"

	"github.com/astaxie/beego"
)

func main() {
	beego.Run()
}
