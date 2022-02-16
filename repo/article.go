package repo

import (
	"shab/config"
	"shab/model"
	"shab/utils"

	"github.com/jinzhu/gorm"
)

type ArticleRepo struct {
	db *gorm.DB
}

func NewArticleRepo(db *gorm.DB) ArticleRepo {
	return ArticleRepo{
		db: db,
	}
}

func (ar *ArticleRepo) ArticleCreate(req model.ArticleCreateReq) (uint, error) {
	var id uint
	err := ar.db.Raw("CALL ArticleCreate(?,?,?,?,?);",
		req.UserId,
		req.CategoryId,
		req.Title,
		req.Img,
		req.Content,
	).Row().Scan(&id)
	if err != nil {
		return 0, err
	}
	return id, nil
}

func (ar *ArticleRepo) ListByCategoryUserSearch(category uint, user uint, search string) (*[]model.ArticleList, error) {
	var articles []model.ArticleList
	rows, err := ar.db.Raw("CALL ArticleListByCategoryUserSearch(? , ? , ?);", category, user, search).Rows()
	defer rows.Close()
	for rows.Next() {
		var article model.ArticleList
		rows.Scan(
			&article.Id,
			&article.CategoryName,
			&article.UserName,
			&article.UserImg,
			&article.Title,
			&article.Img,
			&article.Views,
			&article.Published_at,
		)
		article.Img = config.Config("BASE_URL") + article.Img
		article.UserImg = config.Config("BASE_URL") + article.UserImg

		articles = append(articles, article)

	}
	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &articles, nil
}

func (ar *ArticleRepo) ArticleRead(id uint64) (*model.Article, error) {
	var article model.Article
	err := ar.db.Raw("CALL ArticleRead(?);", id).Row().Scan(
		&article.Id,
		&article.UserId,
		&article.CategoryId,
		&article.UserName,
		&article.UserImg,
		&article.CategoryName,
		&article.Title,
		&article.Img,
		&article.Views,
		&article.Status,
		&article.Content,
		&article.Created_at,
		&article.Published_at,
	)
	article.Img = config.Config("BASE_URL") + article.Img
	article.UserImg = config.Config("BASE_URL") + article.UserImg

	if err != nil {
		utils.NewError(err)
		return nil, err
	}
	return &article, nil
}
