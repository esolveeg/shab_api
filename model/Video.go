package model

type Video struct {
	Id          uint
	Name        string
	Url         string
	Image       string
	Category_id uint
}

type VideoCreateReq struct {
	Name        string
	Url         string
	Image       string
	Category_id uint
}
