package repo

import (
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type ProjectRepo struct {
	db *gorm.DB
}

func NewProjectRepo(db *gorm.DB) ProjectRepo {
	return ProjectRepo{
		db: db,
	}
}

func (pr *ProjectRepo) ListFeatured() (*[]model.ProjectList, error) {
	var resp []model.ProjectList
	rows, err := pr.db.Raw("CALL ProjectsListFeatured();").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.ProjectList
		rows.Scan(
			&rec.Id,
			&rec.Title,
			&rec.Logo,
			&rec.Img,
		)
		rec.Img = config.Config("BASE_URL") + rec.Img
		rec.Logo = config.Config("BASE_URL") + rec.Logo
		resp = append(resp, rec)
	}
	return &resp, nil
}

func (pr *ProjectRepo) ListByCategoryUserSearch(category uint, user uint, search string) (*[]model.ProjectList, error) {
	var resp []model.ProjectList
	rows, err := pr.db.Raw("CALL ProjectsListByCategoryUserSearch(? , ? , ?);", category, user, search).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.ProjectList
		rows.Scan(
			&rec.Id,
			&rec.Title,
			&rec.Status,
			&rec.Logo,
			&rec.Img,
		)
		rec.Img = config.Config("BASE_URL") + rec.Img
		rec.Logo = config.Config("BASE_URL") + rec.Logo

		resp = append(resp, rec)
	}
	return &resp, nil
}

func (pr *ProjectRepo) ProjectRead(id uint64) (*model.Project, error) {
	var project model.Project
	err := pr.db.Raw("CALL ProjectRead(?);", id).Row().Scan(
		&project.UserName,
		&project.CategoryName,
		&project.CategoryId,
		&project.City,
		&project.CityId,
		&project.Title,
		&project.Img,
		&project.Logo,
		&project.Fund,
		&project.Status,
		&project.Breif,
		&project.Imgs,
		&project.Location,
		&project.Phone,
		&project.File,
		&project.Email,
		&project.Featured,
	)

	if err != nil {
		utils.NewError(err)
		return nil, err
	}

	return &project, nil
}

func (pr *ProjectRepo) ProjectsCreate(req model.ProjectCreateReq) (uint, error) {
	var id uint
	err := pr.db.Raw("CALL ProjectsCreate(?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
		req.Userid,
		req.CategoryId,
		req.CityId,
		req.Title,
		req.Status,
		req.Img,
		req.Imgs,
		req.Logo,
		req.Fund,
		req.Breif,
		req.Location,
		req.Phone,
		req.File,
		req.Email,
	).Row().Scan(&id)

	if err != nil {
		return 0, err
	}

	return id, nil
}

func (pr *ProjectRepo) ProjectsUpdate(req model.ProjectCreateReq, id uint64) (uint, error) {
	var resp uint
	err := pr.db.Raw("CALL ProjectUpdate(?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
		id,
		req.CategoryId,
		req.CityId,
		req.Title,
		req.Status,
		req.Img,
		req.Imgs,
		req.Logo,
		req.Fund,
		req.Breif,
		req.Location,
		req.Phone,
		req.File,
		req.Email,
	).Row().Scan(&resp)

	if err != nil {
		return 0, err
	}

	return resp, nil
}
