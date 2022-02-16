package repo

import (
	"database/sql"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type CatRepo struct {
	db *gorm.DB
}

func NewCatRepo(db *gorm.DB) CatRepo {
	return CatRepo{
		db: db,
	}
}

func (ur *CatRepo) CatListByType(t string) (*[]model.Cat, error) {
	rows, err := ur.db.Raw("CALL CategoryListByType(?)", t).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanCatsResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return result, nil
}

func scanCatsResult(rows *sql.Rows) (*[]model.Cat, error) {
	var resp []model.Cat
	for rows.Next() {
		var rec model.Cat
		rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Icon,
		)
		resp = append(resp, rec)
	}

	return &resp, nil
}
