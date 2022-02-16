package model

type HomeResponse struct {
	Banner   RichText
	Goals    []RichText
	Roles    []Role
	Events   []Event
	Users    []User
	Projects []ProjectList
	Features []Feature
}
