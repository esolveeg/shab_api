package model

type Msg struct {
	Id        uint
	Msg       string
	Mine      bool
	Name      string
	CreatedAt string
	Seen      string
}

type Inbox struct {
	Id    uint
	Name  string
	Count uint
}

type MsgReq struct {
	FromId uint
	ToId   uint
	Msg    string
}
