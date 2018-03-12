package test

import (
	"testing"
	"strings"
	"fmt"
)

func TestIcon(t *testing.T) {
	line := ".fa-film:before {"
	if strings.Contains(line, ":before") {
		tempStr := line[4:]
		idx := strings.Index(tempStr, ":")
		icon := tempStr[:idx]
		fmt.Println("icon = " + icon)
	}
}
