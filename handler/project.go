package handler

import (
	"fmt"
	"net/http"
	"shab/config"
	"shab/model"
	"shab/utils"
	"strconv"
	"strings"

	"github.com/labstack/echo/v4"
)

func (h *Handler) ProjectListByCategoryUserSearch(c echo.Context) error {
	req := new(model.ProjectListReq)
	if err := c.Bind(req); err != nil {
		return c.JSON(http.StatusUnprocessableEntity, utils.NewError(err))
	}
	projects, err := h.projectRepo.ListByCategoryUserSearch(req.Category, req.User, req.Search)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, projects)
}

func (h *Handler) ProjectRead(c echo.Context) error {
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		fmt.Println(err)
	}
	project, err := h.projectRepo.ProjectRead(id)
	project.Img = config.Config("BASE_URL") + project.Img
	project.Logo = config.Config("BASE_URL") + project.Logo

	// imgs
	imgs := strings.Split(project.Imgs, ",")
	for i := range imgs {
		imgs[i] = config.Config("BASE_URL") + imgs[i]
	}
	project.Imgs = strings.Join(imgs, ",")
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, project)
}
func UploadProjectFiles(c echo.Context) (model.ProjectCreateReq, error) {
	req := new(model.ProjectCreateReq)
	// upload image
	img, err := c.FormFile("Img")
	if err != nil {
		return *req, err
	}
	imgName, err := utils.Upload(img)
	if err != nil {
		return *req, err
	}

	// upload images
	form, err := c.MultipartForm()
	if err != nil {
		return *req, err
	}
	files := form.File["Imgs"]
	var imgsArr []string
	for _, file := range files {
		singleImgName, err := utils.Upload(file)
		if err != nil {
			return *req, err
		}
		imgsArr = append(imgsArr, singleImgName)
	}
	// convert imgs to comma separated string
	imgs := strings.Join(imgsArr, ",")

	// upload logo
	logo, err := c.FormFile("Logo")
	if err != nil {
		return *req, err
	}
	logoName, err := utils.Upload(logo)

	// upload file
	file, err := c.FormFile("File")
	if err != nil {
		return *req, err
	}
	fileName, err := utils.Upload(file)
	if err != nil {
		return *req, err
	}
	reqq := ScanProjectCreateReq(c, imgName, logoName, fileName, imgs)
	return reqq, nil
}
func (h *Handler) ProjectCreate(c echo.Context) error {
	req, err := UploadProjectFiles(c)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	project, err := h.projectRepo.ProjectsCreate(req)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, project)
}

func (h *Handler) ProjectUpdate(c echo.Context) error {
	// // get project
	id, err := strconv.ParseUint(c.Param("id"), 10, 32)
	if err != nil {
		fmt.Println(err)
	}
	project, err := h.projectRepo.ProjectRead(id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}

	// check if img is passed
	// TRUE: delete the current img file
	// TRUE: upload the new img
	// FALSE: settt img name to current project img
	var imgName string
	img, err := c.FormFile("Img")
	if err != nil {
		imgName = project.Img
	} else {
		imgName, err = utils.Upload(img)
		if err != nil {
			return c.JSON(http.StatusInternalServerError, "err_uploading_img"+err.Error())
		}
	}

	// check if logo is passed
	// TRUE: delete the current logo file
	// TRUE: upload the new logo
	// FALSE: set logo name to current project logo

	var logoName string
	logo, err := c.FormFile("Logo")
	if err != nil {
		logoName = project.Logo
	} else {
		logoName, err = utils.Upload(logo)
		if err != nil {
			return c.JSON(http.StatusInternalServerError, "err_uploading_logo"+err.Error())
		}
	}

	// chech if file is passed
	// TRUE: delete the current  file
	// TRUE: upload the new file
	// FALSE: set file name to current project file
	var fileName string
	file, err := c.FormFile("File")
	if err != nil {
		fileName = project.File
	} else {
		fileName, err = utils.Upload(file)
		if err != nil {
			return c.JSON(http.StatusInternalServerError, "err_uploading_file"+err.Error())
		}
	}

	// check if imgs is passed
	// TRUE: delete the current imgs
	// TRUE: upload the new imgs
	// FALSE: set imgs name to current project imgs
	var imgs string
	imgsFile, err := c.FormFile("Imgs")
	if err != nil {
		imgs = project.Imgs
	} else {
		imgs, err = utils.Upload(imgsFile)
		if err != nil {
			return c.JSON(http.StatusInternalServerError, "err_uploading_file"+err.Error())
		}
	}
	// generate req
	req := ScanProjectCreateReq(c, imgName, logoName, fileName, imgs)

	// update project
	newProject, err := h.projectRepo.ProjectsUpdate(req, id)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, utils.NewError(err))
	}
	return c.JSON(http.StatusOK, newProject)
}

func ScanProjectCreateReq(c echo.Context, logo string, img string, file string, imgs string) model.ProjectCreateReq {
	req := new(model.ProjectCreateReq)
	req.Userid, _ = strconv.ParseUint(c.FormValue("UserId"), 0, 8)
	req.CategoryId, _ = strconv.ParseUint(c.FormValue("CategoryId"), 0, 8)
	req.CityId, _ = strconv.ParseUint(c.FormValue("CityId"), 0, 8)
	req.Img = img
	req.Imgs = imgs
	req.Logo = logo
	req.Title = c.FormValue("Title")
	req.Fund, _ = strconv.ParseFloat(c.FormValue("Fund"), 0)
	req.Breif = c.FormValue("Breif")
	req.Status = c.FormValue("Status")
	req.Location = c.FormValue("Location")
	req.Phone = c.FormValue("Phone")
	req.File = file
	req.Email = c.FormValue("Email")
	return *req

}
