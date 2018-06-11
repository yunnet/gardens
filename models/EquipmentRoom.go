package models

import (
	"time"
	"github.com/astaxie/beego/orm"
)

type EquipmentRoom struct {
	Id         int       `form:"id"`
	RoomNO     string    `orm:"column(room_no)"`
	RoomName   string    `orm:"column(room_name)"`
	CustomerNO string    `orm:"column(customer_no)"`
	Used       int       `orm:"column(tag)"`
	CreateUser string    `orm:"column(createuser)"`
	CreateDate time.Time `orm:"column(createdate)"`
	ChangeUser string    `orm:"column(changeuser)"`
	ChangeDate time.Time `orm:"column(changedate)"`
}

type EquipmentRoomQueryParam struct {
	BaseQueryParam
	RoomNO   string
	RoomName string
	Used     string
}

func init() {
	orm.RegisterModel(new(EquipmentRoom))
}

func EquipmentRoomTBName() string {
	return "equipment_room"
}

func (this *EquipmentRoom) TableName() string {
	return EquipmentRoomTBName()
}

func EquipmentRoomPageList(params *EquipmentRoomQueryParam) ([]*EquipmentRoom, int64) {
	query := orm.NewOrm().QueryTable(EquipmentRoomTBName())
	data := make([]*EquipmentRoom, 0)

	sortorder := "Id"
	switch params.Sort {
	case "Id":
		sortorder = "Id"
	case "RoomNO":
		sortorder = "room_no"
	case "RoomName":
		sortorder = "room_name"
	case "CustomerNO":
		sortorder = "CustomerNO"
	case "Used":
		sortorder = "tag"
	}

	if params.Order == "desc" {
		sortorder = "-" + sortorder
	}

	query = query.Filter("RoomNO__istartswith", params.RoomNO)
	query = query.Filter("RoomName__contains", params.RoomName)
	query = query.Filter("tag__istartswith", params.Used)

	total, _ := query.Count()
	query.OrderBy(sortorder).Limit(params.Limit, params.Offset).All(&data)

	return data, total
}

func EquipmentRoomDataList(params *EquipmentRoomQueryParam) [] *EquipmentRoom {
	params.Limit = -1
	params.Sort = "Id"
	params.Order = "asc"
	data, _ := EquipmentRoomPageList(params)
	return data
}

func EquipmentRoomBatchDelete(ids []int) (int64, error) {
	query := orm.NewOrm().QueryTable(EquipmentRoomTBName())
	num, err := query.Filter("id__in", ids).Delete()
	return num, err
}

func EquipmentRoomOne(id int) (*EquipmentRoom, error) {
	o := orm.NewOrm()
	m := EquipmentRoom{Id: id}
	err := o.Read(&m)
	if err != nil {
		return nil, err
	}
	return &m, nil
}
