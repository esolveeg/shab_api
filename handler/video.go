package handler

import (
	"net/http"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) VideosListByCategory(c echo.Context) error {
	r, err := h.videoRepo.ListByCategory(c.QueryParam("category"))
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}
