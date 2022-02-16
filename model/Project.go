package model

type ProjectList struct {
	Id     uint
	Title  string
	Status string
	Logo   string
	Img    string
}

type Project struct {
	UserName     string
	CategoryName string
	CategoryId int
	City         string
	CityId         int
	Title        string
	Logo         string
	Img          string
	Fund         float64
	Status       string
	Breif        string
	Imgs         string
	Location     string
	Phone        string
	File         string
	Email        string
	Featured     bool
}

type ProjectListReq struct {
	Category uint
	User     uint
	Search   string
}

type ProjectCreateReq struct {
	Userid     uint64
	CategoryId uint64
	CityId     uint64
	Img        string
	Imgs       string
	Logo       string
	Title      string
	Status     string
	Fund       float64
	Breif      string
	Location   string
	Phone      string
	File       string
	Email      string
}
