package handler

import (
	"net/http"
	"shab/model"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) HomeGetAllData(c echo.Context) error {
	banner, err := h.richTextRepo.GetByKey("banner")
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	goals, err := h.richTextRepo.ListByGroup(1)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}

	roles, err := h.roleRepo.ListAll()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	features, err := h.roleRepo.ListAllFeatures()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}

	events, err := h.eventRepo.ListFeatured()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	users, err := h.userRepo.ListFeatured()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	projects, err := h.projectRepo.ListFeatured()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, newHomeResponse(banner, goals, roles, users, projects, events, features))
}

func newHomeResponse(banner *model.RichText, goals *[]model.RichText, roles *[]model.Role, users *[]model.User, projects *[]model.ProjectList, events *[]model.Event, features *[]model.Feature) *model.HomeResponse {
	r := new(model.HomeResponse)
	r.Banner = *banner
	r.Goals = *goals
	r.Events = *events
	r.Roles = *roles
	r.Users = *users
	r.Projects = *projects
	r.Features = *features
	return r
}
