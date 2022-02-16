package repo

import (
	"database/sql"
	"errors"
	"fmt"
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
	"golang.org/x/crypto/bcrypt"
)

type UserRepo struct {
	db *gorm.DB
}

func NewUserRepo(db *gorm.DB) UserRepo {
	return UserRepo{
		db: db,
	}
}

func (ur *UserRepo) Register(req *model.UserRegisterRequest) (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL Register(? , ? , ? ,? , ?,?);",
		req.Name,
		req.Name_ar,
		req.Email,
		req.Password,
		req.Phone,
		req.Role_id,
	).Rows()
	if err != nil {
		fmt.Println("error calling proc" + err.Error())
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}

func (ur *UserRepo) Update(Id uint, req *model.UserRegisterRequest) (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL UserUpdate(? , ? , ? , ?,? , ? , ?,?,? , ? , ? , ? , ?);",
		Id,
		req.Name,
		req.Name_ar,
		req.Email,
		req.Password,
		req.Serial,
		req.Role_id,
		req.Img,
		req.Phone,
		req.Breif,
		req.Website,
		req.Instagram,
		req.Twitter,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}

func (ur *UserRepo) GetByEmailOrPhone(emailOrPhone string) (*model.User, error) {
	var user model.User
	fmt.Println(emailOrPhone)
	err := ur.db.Raw("CALL UserRead(?);", emailOrPhone).Row().Scan(
		&user.Id,
		&user.Admin,
		&user.Name,
		&user.Name_ar,
		&user.Email,
		&user.Img,
		&user.Serial,
		&user.Points,
		&user.Role_id,
		&user.Phone,
		&user.Breif,
		&user.Website,
		&user.Instagram,
		&user.Twitter,
		&user.Role,
		&user.Color,
		&user.Password,
	)
	user.Img = config.Config("BASE_URL") + user.Img

	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &user, nil
}
func (ur *UserRepo) GetById(id uint) (*model.User, error) {
	var user model.User
	err := ur.db.Raw("CALL UserById(?);", id).Row().Scan(
		&user.Id,
		&user.Name,
		&user.Name_ar,
		&user.Email,
		&user.Img,
		&user.Serial,
		&user.Points,
		&user.Role_id,
		&user.Phone,
		&user.Breif,
		&user.Website,
		&user.Instagram,
		&user.Twitter,
		&user.Role,
		&user.Color,
	)
	user.Img = config.Config("BASE_URL") + user.Img

	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &user, nil
}

func scanUserResult(rows *sql.Rows) (*[]model.User, error) {
	var resp []model.User
	for rows.Next() {
		var rec model.User
		rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Name_ar,
			&rec.Email,
			&rec.Img,
			&rec.Serial,
			&rec.Points,
			&rec.Role_id,
			&rec.Phone,
			&rec.Breif,
			&rec.Website,
			&rec.Instagram,
			&rec.Twitter,
			&rec.Role,
			&rec.Color,
		)
		rec.Img = config.Config("BASE_URL") + rec.Img

		resp = append(resp, rec)
	}

	return &resp, nil
}

func (ur *UserRepo) ListAll() (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL UserListByRoleOrFeatured(? , ?);", 0, 0).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}
func (ur *UserRepo) ListByRoleOrFeatured(role uint64, featured bool) (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL UserListByRoleOrFeatured(? , ?);", role, featured).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}

func (ur *UserRepo) ListRyadeen() (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL UserListByRoleOrFeatured(? , ?);", 3, 0).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}

func (ur *UserRepo) ListFeatured() (*[]model.User, error) {
	rows, err := ur.db.Raw("CALL UserListByRoleOrFeatured(? , ?);", 0, 1).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanUserResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return result, nil
}

func (ur *UserRepo) HashUserPassword(plain string) (string, error) {
	if len(plain) == 0 {
		return "", errors.New("empty_password")
	}
	h, err := bcrypt.GenerateFromPassword([]byte(plain), bcrypt.DefaultCost)
	return string(h), err
}

func (ur *UserRepo) CheckPassword(plain string, password string) bool {
	// err := bcrypt.CompareHashAndPassword([]byte(password), []byte(plain))
	// return err == nil
	return plain == password
}
