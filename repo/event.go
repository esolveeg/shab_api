package repo

import (
	"database/sql"
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type EventRepo struct {
	db *gorm.DB
}

func NewEventRepo(db *gorm.DB) EventRepo {
	return EventRepo{
		db: db,
	}
}

func (ur *EventRepo) ListAll() (*[]model.Event, error) {
	rows, err := ur.db.Raw("CALL EventsList(0)").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return result, nil
}
func (ur *EventRepo) Read(id int64) (*model.Event, error) {
	var event model.Event
	err := ur.db.Raw("CALL EventRead(?)", id).Row().Scan(
		&event.Id,
		&event.Title,
		&event.Img,
		&event.Breif,
		&event.Day,
		&event.Month,
		&event.Year,
		&event.Price,
		&event.Featured,
		&event.Created_at,
		&event.CatName,
		&event.Video,
	)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	event.Img = config.Config("BASE_URL") + event.Img

	return &event, nil
}

func (er *EventRepo) ListFeatured() (*[]model.Event, error) {
	rows, err := er.db.Raw("CALL EventsList(1)").Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()

	result, err := scanResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return result, nil
}

func (er *EventRepo) ListByCategorySearch(category uint, search string) (*[]model.Event, error) {
	rows, err := er.db.Raw("CALL EventsListByCategorySearch(? , ?);", category, search).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	result, err := scanResult(rows)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return result, nil
}

func scanResult(rows *sql.Rows) (*[]model.Event, error) {
	var resp []model.Event
	for rows.Next() {
		var rec model.Event
		rows.Scan(
			&rec.Id,
			&rec.Title,
			&rec.Img,
			&rec.Breif,
			&rec.Day,
			&rec.Month,
			&rec.Year,
			&rec.Price,
			&rec.Featured,
			&rec.Created_at,
			&rec.CatName,
			&rec.CatId,
		)
		rec.Img = config.Config("BASE_URL") + rec.Img

		resp = append(resp, rec)
	}

	return &resp, nil
}
