package handler

import (
	"fmt"
	"net/http"
	"shab/model"
	"shab/utils"
	"strconv"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ConsultuntsListAll(c echo.Context) error {
	var isTeam bool
	if c.QueryParam("type") == "team" {
		isTeam = true
	}
	consultunts, err := h.consltuntsRepo.ConsultuntsListAll(isTeam)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, consultunts)
}

func (h *Handler) ConsultuntsCreate(c echo.Context) error {
	req := new(model.Consultunt)
	if err := c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	u, err := h.consltuntsRepo.ConsultuntsCreate(req)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, u)
}

func (h *Handler) ConsultuntsUpdate(c echo.Context) error {
	fmt.Println("hellow wo")
	req := new(model.Consultunt)
	var err error
	req.Id, err = strconv.Atoi(c.Param("id"))
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	if err = c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	u, err := h.consltuntsRepo.ConsultuntsUpdate(req)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, u)
}
func (h *Handler) ConsultuntById(c echo.Context) error {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}

	consultunt, err := h.consltuntsRepo.ConsultuntById(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, consultunt)
}
