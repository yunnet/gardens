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

package utils

import (
	"fmt"
	"io/ioutil"
	"strings"
	"testing"
)

func TestRandomString(t *testing.T) {
	str := RandomString(10)
	InitLogs()
	LogDebug("asdfasdfasdf")
	t.Error(str)
}

func TestReadFile(t *testing.T) {
	var iconlist []string
	filename := "E:/go-src/src/github.com/lhtzbj12/sdrms/static/plugins/font-awesome/css/font-awesome.css"

	data, err := ioutil.ReadFile(filename)
	if err != nil {
		fmt.Printf("%s\n", err)
		panic(err)
	}

	fmt.Println("load ready." + filename)

	for _, line := range strings.Split(string(data), "\n") {
		if strings.Contains(line, ":before") {
			tempStr := strings.TrimLeft(line, ".fa-")
			idx := strings.Index(tempStr, ":")
			icon := tempStr[:idx]
			iconlist = append(iconlist, icon)
		}
	}

	for index, value := range iconlist {
		fmt.Printf("icon[%d]=%s \n", index, value)
	}
}
