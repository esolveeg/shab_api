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

func (ur *VideoRepo) ListByCategory(cat string) (*[]model.Video, error) {
	var videos []model.Video
	rows, err := ur.db.Raw("CALL VideosListByCategory(?);", cat).Rows()
	defer rows.Close()
	for rows.Next() {
		var video model.Video
		rows.Scan(
			&video.Id,
			&video.Name,
			&video.Url,
			&video.Image,
			&video.Category_id,
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

func (ur *VideoRepo) Create(req model.VideoCreateReq) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL VideosCreate(? , ? , ? , ?);",
		req.Name,
		req.Url,
		req.Image,
		req.Category_id,
	).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *VideoRepo) Update(req model.Video) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL VideosUpdate(? , ? , ? , ? , ? );",
		req.Id,
		req.Name,
		req.Url,
		req.Image,
		req.Category_id,
	).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *VideoRepo) Delete(id uint64) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL VideosDelete(?);", id).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}
