package model

type Role struct {
	Id     uint
	Name   string
	Img    string
	Breif  string
	Price  float64
	Color  string
	Active bool
}

type Feature struct {
	Id    uint
	Name  string
	Breif string
	Level uint
}
