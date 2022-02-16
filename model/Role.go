package model

type Role struct {
	Id    uint
	Name  string
	Image string
	Breif string
	Price float64
	Color string
}

type Feature struct {
	Id    uint
	Name  string
	Breif string
	Level uint
}
