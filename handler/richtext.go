package handler

import (
	"net/http"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) RichListByGroup(c echo.Context) error {

	r, err := h.richTextRepo.ListByGroup(1)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) RichGetByKey(c echo.Context) error {

	r, err := h.richTextRepo.GetByKey("banner")
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}
