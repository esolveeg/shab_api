package repo

import (
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type ServiceRepo struct {
	db *gorm.DB
}

func NewServiceRepo(db *gorm.DB) ServiceRepo {

	return ServiceRepo{
		db: db,
	}
}

func (ur *ServiceRepo) ListAllServicces() (*[]model.Service, error) {
	var resp []model.Service
	rows, err := ur.db.Raw("CALL ServicesListAll()").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.Service
		rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Icon,
		)
		resp = append(resp, rec)
	}
	return &resp, nil
}
