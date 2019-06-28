module gardens

replace (
	golang.org/x/arch => github.com/golang/arch v0.0.0-20190312162104-788fe5ffcd8c
	golang.org/x/crypto => github.com/golang/crypto v0.0.0-20190313024323-a1f597ede03a
	golang.org/x/net => github.com/golang/net v0.0.0-20190318221613-d196dffd7c2b
	golang.org/x/sync => github.com/golang/sync v0.0.0-20190423024810-112230192c58
	golang.org/x/sys => github.com/golang/sys v0.0.0-20190318195719-6c81ef8f67ca
	golang.org/x/text => github.com/golang/text v0.3.0
	golang.org/x/tools => github.com/golang/tools v0.0.0-20190529010454-aa71c3f32488
)

go 1.12

require (
	github.com/astaxie/beego v1.11.1
	github.com/beego/bee v1.10.0 // indirect
	github.com/go-delve/delve v1.2.0 // indirect
	github.com/go-sql-driver/mysql v1.4.1
	github.com/gorilla/websocket v1.4.0
	github.com/mattn/go-sqlite3 v1.10.0
	github.com/stretchr/testify v1.3.0 // indirect
	github.com/tidwall/gjson v1.2.1
	github.com/tidwall/match v1.0.1 // indirect
	github.com/tidwall/pretty v0.0.0-20190325153808-1166b9ac2b65 // indirect
	github.com/yinheli/mahonia v0.0.0-20131226213531-0eef680515cc
)
