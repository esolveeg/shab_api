package model

type Consultunt struct {
	Id      int
	Name_ar string
	Title   string
	Skills  string
	Img     string
	Breif   string
}

type ConsultuntCreateReq struct {
	Name   string
	Title  string
	Skills string
	Img    string
	Breif  string
}
