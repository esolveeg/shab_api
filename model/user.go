package model

type UserLoginRequest struct {
	Username string
	Password string
}
type UserResetRequest struct {
	Password string
}
type UserSendResetEmailRequest struct {
	Email string
}

type UserRegisterRequest struct {
	Name     string
	Name_ar  string
	Email    string
	Img      string
	Serial   string
	Password string
	Phone    string
	Role_id  uint
	City_id  uint
	Breif    string
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
	Id       uint
	Admin    bool
	Name     string
	Name_ar  string
	Email    string
	Img      string
	Serial   string
	Points   uint
	Role_id  uint
	City_id  uint
	Phone    string
	Breif    string
	Role     string
	Color    string
	Password string
}

func UserToRegisterReq(user *User) *UserRegisterRequest {
	register := new(UserRegisterRequest)
	register.Name = user.Name
	register.Name_ar = user.Name_ar
	register.Email = user.Email
	register.Img = user.Img
	register.Serial = user.Serial
	register.Password = user.Password
	register.Phone = user.Phone
	register.Role_id = user.Role_id
	register.City_id = user.City_id
	register.Breif = user.Breif
	return register
}
