package handler

import (
	"net/http"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) CatsListByType(c echo.Context) error {
	r, err := h.catRepo.CatListByType(c.Param("type"))
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}
