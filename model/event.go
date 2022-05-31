package model

type Event struct {
	Id         uint
	Title      string
	Img        string
	Breif      string
	Day        string
	Month      string
	Year       string
	Date       string
	Price      float64
	Featured   bool
	Created_at string
	CatName    string
	CatId      uint
	Video      string
}

type EventRequest struct {
	Title    string
	Img      string
	Breif    string
	Date     string
	Price    float64
	Featured bool
	CatId    uint
	Video    string
}
