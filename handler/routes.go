package handler

import (
	"shab/router/middleware"
	"shab/utils"

	"github.com/labstack/echo/v4"
)

func (h *Handler) Register(v1 *echo.Group) {
	jwtMiddleware := middleware.JWT(utils.JWTSecret)
	v1.GET("/health", h.CheckHealth)
	api := v1.Group("/api")
	api.GET("/validate", h.ValidateUser, jwtMiddleware)

	// auth routes
	auth := api.Group("/me", jwtMiddleware)
	auth.GET("", h.Me)
	auth.GET("/notifications", h.CurrentUserNotifications)
	auth.PUT("", h.CurrentUserUpdate)

	// roles routes
	roles := api.Group("/roles")
	roles.GET("", h.RolesListAll)

	// users routes
	users := api.Group("/users")
	users.GET("", h.UserListByRoleOrFeatured)
	users.GET("/:id", h.UserFindById)
	users.GET("/ryadeen", h.UserListRyadeen)
	users.PUT("/:id", h.UserUpdate)
	users.PUT("/reset/email", h.UserSendResetEmail)
	users.PUT("/reset", h.UserResetPassword)
	users.POST("/service/:id", h.UserRequestService, jwtMiddleware)

	//email routes
	//auth routes
	api.POST("/login", h.Login)
	api.POST("/register", h.RegisterUser)

	// project routes
	projects := api.Group("/projects")
	projects.POST("", h.ProjectListByCategoryUserSearch)
	projects.POST("/editadd", h.ProjectCreate, jwtMiddleware)
	projects.PUT("/editadd/:id", h.ProjectUpdate, jwtMiddleware)
	projects.GET("/:id", h.ProjectRead)

	// articles routes
	articles := api.Group("/articles")
	articles.POST("", h.ArticleListByCategoryUserSearch)
	articles.POST("/create", h.ArticleCreate, jwtMiddleware)
	articles.GET("/:id", h.ArticleRead)

	// events
	api.POST("/events", h.EventsListAll)
	api.GET("/events/:id", h.EventRead)

	// services

	api.GET("/services", h.ServicesListAll)
	api.POST("/services", h.ServiceCreate)
	api.PUT("/services", h.ServiceUpdate)
	api.DELETE("/services/:id", h.ServiceDelete)

	// rich text routes
	rich := api.Group("/rich")
	rich.GET("", h.RichListByGroup)
	rich.GET("/key", h.RichGetByKey)

	//consultunts routes
	consultunts := api.Group("/consultunts")

	consultunts.GET("", h.ConsultuntsListAll)
	consultunts.POST("", h.ConsultuntsCreate)
	consultunts.PUT("/:id", h.ConsultuntsUpdate)
	consultunts.GET("/:id", h.ConsultuntById)

	// global routes

	api.POST("/upload", h.Upload)
	api.POST("/contact", h.ContactSend)
	api.GET("/home", h.HomeGetAllData)
	api.GET("/videos", h.VideosListByCategory)
	api.GET("/cats/:type", h.CatsListByType)
	api.GET("/cities", h.CitiesListAll)

}
