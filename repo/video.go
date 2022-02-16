package repo

import (
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type VideoRepo struct {
	db *gorm.DB
}

func NewVideoRepo(db *gorm.DB) VideoRepo {
	return VideoRepo{
		db: db,
	}
}

func (ur *VideoRepo) ListAll() (*[]model.Video, error) {
	var videos []model.Video
	rows, err := ur.db.Raw("CALL VideosList();").Rows()
	defer rows.Close()
	for rows.Next() {
		var video model.Video
		rows.Scan(
			&video.Id,
			&video.Name,
			&video.Url,
			&video.Image,
		)
		video.Image = config.Config("BASE_URL") + video.Image

		videos = append(videos, video)

	}
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &videos, nil
}
