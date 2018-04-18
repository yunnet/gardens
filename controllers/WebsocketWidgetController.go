package controllers

import (
	"github.com/gorilla/websocket"
	"log"
	"github.com/yunnet/gdkxdl/models"
	"fmt"
	"github.com/yunnet/gdkxdl/utils"
	"time"
)

var (
	clients   = make(map[*websocket.Conn]bool)
	broadcast = make(chan models.SendMessage)
)

var upgrader = websocket.Upgrader{}

func init() {
	go handleMessage()
}

type WebsocketWidgetController struct {
	BaseController
}

func (this *WebsocketWidgetController) Prepare() {
	this.BaseController.Prepare()
	this.checkLogin()
}

func (this *WebsocketWidgetController) Index() {
	this.Data["pageTitle"] = "Websocket测试"

	this.Data["activeSidebarUrl"] = this.URLFor(this.controllerName + "." + this.actionName)
	this.setTpl()

	this.LayoutSections = make(map[string]string)
	this.LayoutSections["headcssjs"] = "websocketwidget/index_headcssjs.html"
	this.LayoutSections["footerjs"] = "websocketwidget/index_footerjs.html"
}

func handleMessage() {
	for {
		msg := <- broadcast
		fmt.Println("clients len : ", len(clients))

		for client := range clients {
			err := client.WriteJSON(msg)
			if err != nil {
				utils.LogError("client write JSON err: ")
				client.Close()
				delete(clients, client)
			}
		}
	}
}

func startTimer(f func()) chan struct{} {
	done := make(chan struct{}, 1)
	go func() {
		timer := time.NewTicker(5 * time.Minute)
		defer timer.Stop()
		for {
			select {
			case <-timer.C:
				f()
			case <-done:
				return
			}
		}
	}()
	return done
}

func (this *WebsocketWidgetController) Get() {
	ws, err := upgrader.Upgrade(this.Ctx.ResponseWriter, this.Ctx.Request, nil)
	if err != nil {
		log.Fatal(err)
	}
	defer ws.Close()

	for {
		mt, message, err := ws.ReadMessage()
		if err != nil {
			log.Println("read:", err)
			break
		}
		log.Printf("%d recv: %s", mt, message)

		ticker := time.NewTicker(1 * time.Second)
		for{
			time := <- ticker.C
			msg := []byte(time.Format("2006-01-02 15:04:05"))
			mt := 1
			log.Printf("%d send: %s", mt, msg)

			err = ws.WriteMessage(mt, msg)
			if err != nil {
				log.Println("write:", err)
				break
			}
		}
	}
}
