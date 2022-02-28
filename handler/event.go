package handler

import (
	"net/http"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) EventsListAll(c echo.Context) error {
	events, err := h.eventRepo.ListAll()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, events)
}

func (h *Handler) EventRead(c echo.Context) error {
	id, _ := strconv.ParseInt(c.Param("id"), 10, 64)
	events, err := h.eventRepo.Read(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, events)
}
