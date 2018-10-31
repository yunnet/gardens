package main

import (
	_ "github.com/yunnet/gardens/routers"
	_ "github.com/yunnet/gardens/sysinit"

	"github.com/astaxie/beego"
)

func main() {
	beego.Run()
}
