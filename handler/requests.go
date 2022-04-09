package handler

import (
	"net/http"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ServicesPendingListAll(c echo.Context) error {

	r, err := h.userRepo.ListPendingServices()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) UsersPendingListAll(c echo.Context) error {

	r, err := h.userRepo.ListPendingUsers()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) ProjectsPendingListAll(c echo.Context) error {

	r, err := h.userRepo.ListPendingProjects()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) ArticlesPendingListAll(c echo.Context) error {

	r, err := h.userRepo.ListPendingArticles()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}
func (h *Handler) ServicesPendingApprove(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	r, err := h.userRepo.ApprovePendingService(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) UsersPendingApprove(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	r, err := h.userRepo.ApprovePendingUser(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) ProjectsPendingApprove(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	r, err := h.userRepo.ApprovePendingProject(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) ArticlesPendingApprove(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	r, err := h.userRepo.ApprovePendingArticle(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}
