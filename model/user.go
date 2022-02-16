package model

type UserLoginRequest struct {
	Username string
	Password string
}

type UserRegisterRequest struct {
	Name      string
	Name_ar   string
	Email     string
	Img       string
	Serial    string
	Password  string
	Phone     string
	Role_id   uint
	Breif     string
	Website   string
	Twitter   string
	Instagram string
}
type UserListRequest struct {
	Role_id  uint
	Featured bool
}

type UserUpdateRequest struct {
	Id   int
	User UserRegisterRequest
}

type UserResponse struct {
	User  User
	Token string
}

type User struct {
	Id        uint
	Admin     bool
	Name      string
	Name_ar   string
	Email     string
	Img       string
	Serial    string
	Points    uint
	Role_id   uint
	Phone     string
	Breif     string
	Website   string
	Instagram string
	Twitter   string
	Role      string
	Color     string
	Password  string
}
