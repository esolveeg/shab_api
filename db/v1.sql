USE alshab;

ALTER TABLE projects
ADD COLUMN `website` VARCHAR(250),
ADD COLUMN  `instagram` VARCHAR(250),
ADD COLUMN  `twitter` VARCHAR(250);




DROP PROCEDURE IF EXISTS ProjectsCreate;

DELIMITER //
CREATE  PROCEDURE `ProjectsCreate`(
    IN Iuser_id INT,
    IN Icategory_id INT,
    IN Icity_id INT,
    IN Ititle VARCHAR(250),
    IN Istatus VARCHAR(100),
    IN Iimg VARCHAR(250),
    IN Iimgs VARCHAR(250),
    IN Ilogo VARCHAR(250),
    IN Ifund FLOAT,
    IN Ibreif TEXT,
    IN Ilocation TEXT,
    IN Iphone VARCHAR(250),
    IN Ifile VARCHAR(250),
    IN Iemail VARCHAR(250),
    IN Iwebsite VARCHAR(250),
    IN Iinstagram VARCHAR(250),
    IN Itwitter VARCHAR(250)
)
BEGIN
INSERT INTO
    projects (
        user_id,
        category_id,
        city_id,
        title,
        status,
        img,
        imgs,
        logo,
        fund,
        breif,
        location,
        phone,
        file,
        email,
        website,
        instagram,
        twitter
    )
VALUES
    (
        Iuser_id,
        Icategory_id,
        Icity_id,
        Ititle,
        Istatus,
        Iimg,
        Iimgs,
        Ilogo,
        Ifund,
        Ibreif,
        Ilocation,
        Iphone,
        Ifile,
        Iemail,
        Iwebsite,
        Iinstagram,
        Itwitter
    );


    SELECT LAST_INSERT_ID() id; 

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ProjectUpdate;


DELIMITER //
CREATE PROCEDURE ProjectUpdate(
    IN Iid INT,
    IN Icategory_id INT,
    IN Icity_id INT,
    IN Ititle VARCHAR(250),
    IN Istatus VARCHAR(100),
    IN Iimg VARCHAR(250),
    IN Iimgs VARCHAR(250),
    IN Ilogo VARCHAR(250),
    IN Ifund FLOAT,
    IN Ibreif TEXT,
    IN Ilocation TEXT,
    IN Iphone VARCHAR(250),
    IN Ifile VARCHAR(250),
    IN Iemail VARCHAR(250),
    IN Iwebsite VARCHAR(250),
    IN Iinstagram VARCHAR(250),
    IN Itwitter VARCHAR(250)
) BEGIN
UPDATE
    projects
SET
    category_id = Icategory_id,
    city_id = Icity_id,
    title = Ititle,
    status = Istatus,
    img = CASE WHEN Iimg = "" THEN img ELSE Iimg END ,
    imgs = CASE WHEN Iimgs = "" THEN imgs ELSE Iimgs END ,
    logo = CASE WHEN Ilogo = "" THEN logo ELSE Ilogo END ,
    fund = Ifund,
    breif = Ibreif,
    location = Ilocation,
    phone = Iphone,
    file =  CASE WHEN Ifile = "" THEN file ELSE Ifile END ,
    email = Iemail,
    website = Iwebsite,
    instagram = Iinstagram,
    twitter = Itwitter
    WHERE id = Iid;

    SELECT LAST_INSERT_ID();

END //
DELIMITER ;


DROP PROCEDURE IF EXISTS ProjectRead;
DELIMITER //
CREATE  PROCEDURE `ProjectRead`(IN Iid INT)
BEGIN
    SELECT 
        u.name userName,
        ca.name categoryName,
        ca.id categoryId,
        ci.name city,
        ci.id cityId,
        p.title,
        p.img,
        p.logo,
        p.fund,
        p.status,
        p.breif,
        IFNULL(p.imgs , '') imgs,
        p.location,
        p.phone,
        IFNULL(p.file , '') file,
        p.email,
        p.featured,
        IFNULL(p.website , '') website,
        IFNULL(p.instagram , '') instagram,
        IFNULL(p.twitter , '') twitter
     FROM projects p 
        JOIN users u ON u.id = p.user_id
        JOIN cities ci ON ci.id = p.city_id
        JOIN categories ca ON ca.id = p.category_id
     
     WHERE p.id = Iid;
END//
DELIMITER ;