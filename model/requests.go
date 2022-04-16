package model

type UserPending struct {
	Id        int
	NameAr    string
	Email     string
	Phone     string
	CreatedAt string
}
type ApproveServiceReq struct {
	Msg    string
	FromId int
	ToId   int
}
type ArticlePending struct {
	Id        int
	NameAr    string
	Email     string
	Title     string
	CreatedAt string
}
type ProjectPending struct {
	Id        int
	NameAr    string
	Email     string
	Title     string
	Phone     string
	CreatedAt string
}
type ServicePending struct {
	Id        int
	NameAr    string
	Email     string
	Breif     string
	CreatedAt string
}
