package repo

import (
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type RoleRepo struct {
	db *gorm.DB
}

func NewRoleRepo(db *gorm.DB) RoleRepo {

	return RoleRepo{
		db: db,
	}
}

func (ur *RoleRepo) ListAll() (*[]model.Role, error) {
	var resp []model.Role
	rows, err := ur.db.Raw("CALL RolesList()").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.Role
		rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Image,
			&rec.Breif,
			&rec.Price,
			&rec.Color,
		)
		rec.Image = config.Config("BASE_URL") + rec.Image
		resp = append(resp, rec)
	}
	return &resp, nil
}

func (ur *RoleRepo) ListAllFeatures() (*[]model.Feature, error) {
	var resp []model.Feature
	rows, err := ur.db.Raw("CALL FeaturesListAll()").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.Feature
		rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Breif,
			&rec.Level,
		)
		resp = append(resp, rec)
	}
	return &resp, nil
}
