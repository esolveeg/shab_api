package repo

import (
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type MsgRepo struct {
	db *gorm.DB
}

func NewMsgRepo(db *gorm.DB) MsgRepo {
	return MsgRepo{
		db: db,
	}
}

func (ur *MsgRepo) ListAll(id uint) (*[]model.Inbox, error) {
	var resp []model.Inbox
	rows, err := ur.db.Raw("CALL MsgsList(?)", id).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.Inbox
		err := rows.Scan(
			&rec.Id,
			&rec.Name,
			&rec.Count,
		)
		if err != nil {
			utils.NewError(err)
			return nil, err
		}

		resp = append(resp, rec)
	}
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}

func (ur *MsgRepo) ListByUser(from_id uint, to_id uint64) (*[]model.Msg, error) {
	var resp []model.Msg
	rows, err := ur.db.Raw("CALL MsgsListByUser(? , ?)", from_id, to_id).Rows()
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	defer rows.Close()
	for rows.Next() {
		var rec model.Msg
		err := rows.Scan(
			&rec.Id,
			&rec.Mine,
			&rec.Msg,
			&rec.CreatedAt,
			&rec.Seen,
		)
		if err != nil {
			utils.NewError(err)
			return nil, err
		}

		resp = append(resp, rec)
	}
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}
func (ur *MsgRepo) Create(req model.MsgReq) (*int, error) {
	var resp int
	err := ur.db.Raw("CALL MsgsCreate(? , ? , ?)", req.FromId, req.ToId, req.Msg).Row().Scan(&resp)
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &resp, nil
}
