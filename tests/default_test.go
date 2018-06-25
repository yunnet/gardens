package test

import (
	//"net/http"
	//"net/http/httptest"
	//"path/filepath"
	//"runtime"
	"testing"

	//_ "github.com/lhtzbj12/sdrms/routers"

	//"github.com/astaxie/beego"
	//. "github.com/smartystreets/goconvey/convey"
	"time"
	"fmt"
)
//
//func init() {
//	_, file, _, _ := runtime.Caller(1)
//	apppath, _ := filepath.Abs(filepath.Dir(filepath.Join(file, ".."+string(filepath.Separator))))
//	beego.TestBeegoInit(apppath)
//}
//
//// TestBeego is a sample to run an endpoint test
//func TestBeego(t *testing.T) {
//	r, _ := http.NewRequest("GET", "/", nil)
//	w := httptest.NewRecorder()
//	beego.BeeApp.Handlers.ServeHTTP(w, r)
//
//	beego.Trace("testing", "TestBeego", "Code[%d]\n%s", w.Code, w.Body.String())
//
//	Convey("Subject: Test Station Endpoint\n", t, func() {
//		Convey("Used Code Should Be 200", func() {
//			So(w.Code, ShouldEqual, 200)
//		})
//		Convey("The Result Should Not Be Empty", func() {
//			So(w.Body.Len(), ShouldBeGreaterThan, 0)
//		})
//	})
//}

func TestNowTime(t *testing.T)  {
	str_time := time.Now().Format("2006-01-02 15:04:05")
	fmt.Println(str_time )
}
