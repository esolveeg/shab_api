package repo

import (
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type RichTextRepo struct {
	db *gorm.DB
}

func NewRichTextRepo(db *gorm.DB) RichTextRepo {
	return RichTextRepo{
		db: db,
	}
}

func (ur *RichTextRepo) ListByGroup(group uint) (*[]model.RichText, error) {
	var resp []model.RichText
	rows, err := ur.db.Raw("CALL RichTextListByGroupOrKey(? , ?);", group, nil).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.RichText
		rows.Scan(
			&rec.Value,
			&rec.Title,
			&rec.Image,
			&rec.Icon,
		)
		rec.Image = config.Config("BASE_URL") + rec.Image

		resp = append(resp, rec)
	}
	return &resp, nil
}

func (ur *RichTextRepo) GetByKey(key string) (*model.RichText, error) {
	var rec model.RichText
	err := ur.db.Raw("CALL RichTextListByGroupOrKey(? , ?);", 0, key).Row().Scan(
		&rec.Value,
		&rec.Title,
		&rec.Image,
		&rec.Icon,
	)
	rec.Image = config.Config("BASE_URL") + rec.Image

	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &rec, nil
}
