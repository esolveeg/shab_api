package handler

import (
	"net/http"
	"shab/model"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) EventsListByCategorySearch(c echo.Context) error {
	req := new(model.ProjectListReq)
	if err := c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	projects, err := h.eventRepo.ListByCategorySearch(req.Category, req.Search)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, projects)
}

func (h *Handler) EventRead(c echo.Context) error {
	id, _ := strconv.ParseInt(c.Param("id"), 10, 64)
	projects, err := h.eventRepo.Read(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, projects)
}
