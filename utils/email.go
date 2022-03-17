package utils

import (
	"crypto/tls"
	"fmt"

	gomail "gopkg.in/mail.v2"
)

func SendEmail(email string) bool {

	m := gomail.NewMessage()

	// Set E-Mail sender
	m.SetHeader("From", "a.dariwsh.dev@gmail.com")

	// Set E-Mail receivers
	m.SetHeader("To", "ahmed.ashraf.devv@gmail.com")

	// Set E-Mail subject
	m.SetHeader("Subject", "Gomail test subject")

	// Set E-Mail body. You can set plain text or html with text/html
	m.SetBody("text/html", "<a href='http://localhost:4000/?restId=1'>http://localhost:4000/?restEmail=1</a>")

	// Settings for SMTP server
	d := gomail.NewDialer("smtp.gmail.com", 587, "a.darwish.dev@gmail.com", "asd@asd@9517532468")

	// This is only needed when SSL/TLS certificate is not valid on server.
	// In production this should be set to false.
	d.TLSConfig = &tls.Config{InsecureSkipVerify: true}

	// Now send E-Mail
	if err := d.DialAndSend(m); err != nil {
		fmt.Println(err)
		panic(err)
	}

	return true
}
