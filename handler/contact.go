package handler

import (
	"net/http"
	"shab/model"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ContactSend(c echo.Context) error {
	req := new(model.ContactSendReq)
	if err := c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	// u, err := h.consltuntsRepo.ConsultuntsCreate(req)
	// if err != nil {
	// 	return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	// }
	return c.JSON(http.StatusOK, "u")
}
