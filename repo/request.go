package repo

import (
	"fmt"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type RequestRepo struct {
	db *gorm.DB
}

func NewRequestRepo(db *gorm.DB) RequestRepo {
	return RequestRepo{
		db: db,
	}
}

func (ur *RequestRepo) RequestService(req *model.UserServiceRequest) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL UserServiceCreate(? , ? , ?);",
		req.User,
		req.Service,
		req.Breif,
	).Row().Scan(&resp)
	if err != nil {
		fmt.Println("error calling proc" + err.Error())
		utils.NewError(err)
		return nil, err
	}

	return &resp, nil
}
func (ur *RequestRepo) FindUserUpgradeRequest(id uint) (*model.UserPendingUpgrades, error) {
	var resp model.UserPendingUpgrades
	err := ur.db.Raw("CALL UserFindUpgradeRequest(?);", id).Row().Scan(
		&resp.Id,
		&resp.NameAr,
		&resp.Email,
		&resp.Phone,
		&resp.CurrentRole,
		&resp.CurrentRoleId,
		&resp.NewRole,
		&resp.NewRoleId,
		&resp.PriceToPay,
		&resp.CreatedAt,
	)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *RequestRepo) ListContactRequests(req *model.ContactListReq) (*[]model.ContactPending, error) {
	var resp []model.ContactPending
	rows, err := ur.db.Raw("CALL ContactRequestsList(? , ? , ? , ? , ? , ?);",
		req.Status,
		req.Name,
		req.Email,
		req.Phone,
		req.DateFrom,
		req.DateTo,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var c model.ContactPending
		err := rows.Scan(
			&c.Id,
			&c.UserId,
			&c.Name,
			&c.Email,
			&c.Phone,
			&c.Subject,
			&c.Msg,
			&c.Status,
			&c.CreatedAt,
		)
		if err != nil {
			utils.NewError(err)
			return nil, err
		}
		resp = append(resp, c)

	}
	return &resp, nil
}
func (ur *RequestRepo) ListPendingUsers(req *model.PendingUsersListReq) (*[]model.UserPending, error) {
	var resp []model.UserPending
	rows, err := ur.db.Raw("CALL UsersRequests(? , ? , ? , ? , ? , ? , ?);",
		req.Status,
		req.Name,
		req.Email,
		req.Role,
		req.Phone,
		req.DateFrom,
		req.DateTo,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var u model.UserPending
		rows.Scan(
			&u.Id,
			&u.NameAr,
			&u.Email,
			&u.Type,
			&u.RoleName,
			&u.Phone,
			&u.Status,
			&u.CreatedAt,
		)
		resp = append(resp, u)

	}
	return &resp, nil
}

func (ur *RequestRepo) ListPendingUpgrades(req *model.UsersUpgratedListReq) (*[]model.UserPendingUpgrades, error) {
	var resp []model.UserPendingUpgrades
	rows, err := ur.db.Raw("CALL UsersPendingUpgrades(? , ? , ? , ? , ? , ? , ? , ?);",
		req.Status,
		req.Name,
		req.Email,
		req.Phone,
		req.Role,
		req.NewRole,
		req.DateFrom,
		req.DateTo,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.UserPendingUpgrades
		rows.Scan(
			&rec.Id,
			&rec.NameAr,
			&rec.Email,
			&rec.Phone,
			&rec.CurrentRole,
			&rec.CurrentRoleId,
			&rec.NewRole,
			&rec.NewRoleId,
			&rec.PriceToPay,
			&rec.Status,
			&rec.CreatedAt,
		)
		resp = append(resp, rec)

	}
	return &resp, nil
}

func (ur *RequestRepo) ListPendingArticles(req *model.ProjectsPendingListReq) (*[]model.ArticlePending, error) {
	var resp []model.ArticlePending
	rows, err := ur.db.Raw("CALL ArticlePending(? , ? , ? , ? , ? , ? , ? );",
		req.Status,
		req.Name,
		req.Title,
		req.Phone,
		req.Email,
		req.DateFrom,
		req.DateTo,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var u model.ArticlePending
		rows.Scan(
			&u.Id,
			&u.NameAr,
			&u.Phone,
			&u.Email,
			&u.Title,
			&u.Status,
			&u.CreatedAt,
		)
		resp = append(resp, u)

	}
	return &resp, nil
}

func (ur *RequestRepo) ListPendingProjects(req *model.ProjectsPendingListReq) (*[]model.ProjectPending, error) {
	var resp []model.ProjectPending
	rows, err := ur.db.Raw("CALL ProjectPending(? , ? , ? , ? , ? , ? , ?);",
		req.Status,
		req.Name,
		req.Title,
		req.Phone,
		req.Email,
		req.DateFrom,
		req.DateTo,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var u model.ProjectPending
		rows.Scan(
			&u.Id,
			&u.UserId,
			&u.NameAr,
			&u.Email,
			&u.Title,
			&u.Phone,
			&u.Status,
			&u.CreatedAt,
		)
		resp = append(resp, u)

	}
	return &resp, nil
}

func (ur *RequestRepo) ListPendingServices(req *model.ServicePendingReq) (*[]model.ServicePending, error) {
	var resp []model.ServicePending
	rows, err := ur.db.Raw("CALL ServiceRequestsPending(? , ? , ? , ? , ?);",
		req.Name,
		req.Role_id,
		req.Service_id,
		req.Email,
		req.Breif,
	).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var u model.ServicePending
		rows.Scan(
			&u.Id,
			&u.UserId,
			&u.NameAr,
			&u.ServiceName,
			&u.RoleName,
			&u.Email,
			&u.Breif,
			&u.Status,
			&u.CreatedAt,
		)
		resp = append(resp, u)

	}
	return &resp, nil
}

func (ur *RequestRepo) ApprovePendingService(id *int, action *string) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL ServiceRequestPendingAction(? , ?);", id, action).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *RequestRepo) PendingUserAction(id *uint64, action *string) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL UserPendingAction(? , ?);", id, action).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}
func (ur *RequestRepo) ApproveUserUpgrade(id uint64) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL UserUpgradeApprove(?);", id).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *RequestRepo) PendingProjectAction(id *int, action *string) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL ProjectPendingAction(? , ?);", id, action).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *RequestRepo) ApprovePendingArticle(id *int, action *string) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL ArticlePendingAction(? , ?);", id, action).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}
