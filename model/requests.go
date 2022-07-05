package model

type UserPending struct {
	Id        int
	NameAr    string
	Email     string
	Type      string
	RoleName  string
	Phone     string
	Status    string
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
	Status    string
}
type ProjectPending struct {
	Id        int
	UserId    int
	NameAr    string
	Email     string
	Title     string
	Status    string
	Phone     string
	CreatedAt string
}
type ServicePending struct {
	Id        int
	UserId    int
	NameAr    string
	Email     string
	Status    string
	Breif     string
	CreatedAt string
}
