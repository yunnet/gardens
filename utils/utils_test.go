package utils

import (
	"testing"
	"io/ioutil"
	"fmt"
	"strings"
)

func TestRandomString(t *testing.T) {
	str := RandomString(10)
	InitLogs()
	LogDebug("asdfasdfasdf")
	t.Error(str)
}

func TestReadFile(t *testing.T)  {
	var iconlist []string
	filename := "E:/go-src/src/github.com/lhtzbj12/sdrms/static/plugins/font-awesome/css/font-awesome.css"

	data, err := ioutil.ReadFile(filename)
	if err != nil{
		fmt.Printf("%s\n", err)
		panic(err)
	}

	fmt.Println("load ready." + filename)

	for _, line := range strings.Split(string(data), "\n"){
		if(strings.Contains(line, ":before")){
			tempStr := strings.TrimLeft(line,".fa-")
			idx := strings.Index(tempStr, ":")
			icon := tempStr[:idx]
			iconlist = append(iconlist, icon)
		}
	}

	for index, value := range iconlist{
		fmt.Printf("icon[%d]=%s \n", index, value)
	}
}