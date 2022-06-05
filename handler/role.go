package handler

import (
	"net/http"
	"shab/model"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) RolesListAll(c echo.Context) error {
	var active *bool
	if c.QueryParam("active") != "" {
		filter, _ := strconv.ParseBool(c.QueryParam("active"))
		active = &filter
	}

	r, err := h.roleRepo.ListAll(active)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) RolesFind(c echo.Context) error {
	id, _ := strconv.Atoi(c.Param("id"))
	r, err := h.roleRepo.Find(&id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, r)
}

func (h *Handler) RolesEdit(c echo.Context) error {
	id, _ := strconv.Atoi(c.Param("id"))

	r := new(model.Role)
	if err := c.Bind(r); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	resp, err := h.roleRepo.Edit(&id, r)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, resp)
}
