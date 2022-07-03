package model

type Article struct {
	Id           uint
	UserId       uint
	CatId        uint
	CategoryName string
	UserImg      string
	UserName     string
	Title        string
	Img          string
	Status       string
	Content      string
	Created_at   string
	Published_at string
	Views        int
}

type ArticleList struct {
	Id           uint
	CategoryName string
	UserName     string
	UserImg      string
	Title        string
	Img          string
	Views        int
	Published_at string
}

type ArticleCreateReq struct {
	UserId  uint
	CatId   uint64
	Img     string
	Content string
	Title   string
	Status  string
}
