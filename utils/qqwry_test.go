package utils

import (
	"testing"
	"fmt"
)

func TestQQwry(t *testing.T) {
	datafile := "z:/qqwry.dat"
	q := NewQQwry(datafile)

	ip := "218.20.137.173"
	q.Find(ip)
	fmt.Printf("ip:%v, Country:%v, City:%v", q.Ip, q.Country, q.City)
}