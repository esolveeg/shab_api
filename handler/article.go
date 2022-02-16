package handler

import (
	"fmt"
	"net/http"
	"shab/model"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ArticleListByCategoryUserSearch(c echo.Context) error {
	req := new(model.ProjectListReq)
	if err := c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	articles, err := h.articleRepo.ListByCategoryUserSearch(req.Category, req.User, req.Search)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, articles)
}

func (h *Handler) ArticleRead(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		fmt.Println(err)
	}
	article, err := h.articleRepo.ArticleRead(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, article)
}

func (h *Handler) ArticleCreate(c echo.Context) error {
	// upload image
	img, err := c.FormFile("Img")
	if err != nil {
		return c.JSON(http.StatusInternalServerError, "img_required"+err.Error())
	}
	imgName, err := utils.Upload(img)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, "err_uploading_img"+err.Error())
	}

	req := ScanArticleCreateReq(c, imgName)
	article, err := h.articleRepo.ArticleCreate(req)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, article)
}

func ScanArticleCreateReq(c echo.Context, img string) model.ArticleCreateReq {
	id := userIDFromToken(c)
	req := new(model.ArticleCreateReq)
	req.UserId = id
	req.CategoryId, _ = strconv.ParseUint(c.FormValue("CategoryId"), 0, 8)
	req.Img = img
	req.Title = c.FormValue("Title")
	req.Content = c.FormValue("Content")
	return *req

}
