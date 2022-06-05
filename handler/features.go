package handler

import (
	"net/http"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ListFeaturesByRole(c echo.Context) error {
	var role *int
	if c.QueryParam("Role_id") != "" {
		r, _ := strconv.Atoi(c.QueryParam("Role_id"))
		role = &r
	}
	features, err := h.roleRepo.ListFeaturesByRole(role)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, features)
}
