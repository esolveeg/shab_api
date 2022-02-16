USE alshab;

# procedures\\
#/// users////


DROP PROCEDURE IF EXISTS UserCreate;

DELIMITER //

CREATE PROCEDURE UserCreate(
    IN Iname varchar(250),
    IN Iname_ar varchar(250),
    IN Iemail varchar(250),
    IN Ipassword varchar(250),
    IN Iserial varchar(250),
    IN Irole_id INT,
    IN Iphone VARCHAR(250),
    IN Ibreif TEXT(250),
    IN Iwebsite VARCHAR(250),
    IN Iinstagram VARCHAR(250),
    IN Itwitter VARCHAR(250)
) BEGIN
INSERT INTO
    users (
        name,
        name_ar,
        email,
        password,
        serial,
        role_id,
        phone,
        breif,
        website,
        instagram,
        twitter
    )
VALUES
    (
        IpropName,
        Iname,
        Iname_ar,
        Iemail,
        Ipassword,
        Iserial,
        Irole_id,
        Iphone,
        Ibreif,
        Iwebsite,
        Iinstagram,
        Itwitter
    );

END // 
DELIMITER ;


DROP PROCEDURE IF EXISTS UserById;
DELIMITER // 


CREATE PROCEDURE UserById(IN Iid int) 
BEGIN

        SELECT 
        u.id,
        u.name,
        u.name_ar,
        IFNULL(u.email , "") email,
        u.img,
        u.serial,
        u.points,
        u.role_id,
        u.phone,
        IFNULL(u.breif,""),
        IFNULL(u.website , ""),
        IFNULL(u.instagram , ""),
        IFNULL(u.twitter , ""),
        r.name role,
        r.color
        FROM users u
            JOIN roles r ON u.role_id = r.id
            WHERE  u.id = Iid AND active = 1;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS UserDelete;

DELIMITER //


CREATE PROCEDURE UserDelete(IN id INT) BEGIN
UPDATE
    users u
SET
    deleted_at = now()
WHERE
    u.id = id;

END //



DELIMITER ;

DROP PROCEDURE IF EXISTS UserListByRoleOrFeatured;

DELIMITER //


CREATE PROCEDURE UserListByRoleOrFeatured(IN role INT , IN featured BOOLEAN) 
BEGIN
DECLARE roleCond VARCHAR(50) DEFAULT '';
DECLARE featuredCond VARCHAR(50) DEFAULT '';
IF role != 0 THEN
    SET roleCond = CONCAT('AND role_id = ' , role);
END IF;
IF featured THEN
    SET featuredCond =' AND FEATURED = 1';
END IF;

    SET @query = CONCAT(
        'SELECT 
        u.id,
        u.name,
        u.name_ar,
        IFNULL(u.email , "") email,
        u.img,
        u.serial,
        u.points,
        u.role_id,
        u.phone,
        IFNULL(u.breif,""),
        IFNULL(u.website , ""),
        IFNULL(u.instagram , ""),
        IFNULL(u.twitter , ""),
        r.name role,
        r.color
        FROM users u
            JOIN roles r ON u.role_id = r.id
            WHERE active = 1 ',
        roleCond,
        featuredCond, " ORDER BY RAND()");
         
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    END//
DELIMITER ;

# articles
DROP PROCEDURE IF EXISTS ArticleDelete;
DELIMITER // 


CREATE PROCEDURE ArticleDelete(IN id INT) BEGIN
UPDATE
    articles a
SET
    deleted_at = now()
WHERE
    a.id = id;

END //
DELIMITER ;


DROP PROCEDURE IF EXISTS ArticleCreate;
DELIMITER //
CREATE PROCEDURE ArticleCreate(
    IN Iuser_id INT,
    IN Icategory_id INT,
    IN Ititle VARCHAR(250),
    IN Iimg VARCHAR(250),
    IN Icontent TEXT
) BEGIN
INSERT INTO
    articles (
        user_id,
        category_id,
        title,
        img,
        content
    )
VALUES
    (
        Iuser_id,
        Icategory_id,
        Ititle,
        Iimg,
        Icontent
    );


    SELECT LAST_INSERT_ID() id; 

END //
DELIMITER ;
DROP PROCEDURE IF EXISTS ArticleUpdate;

DELIMITER //
CREATE PROCEDURE ArticleUpdate(
    IN Iid INT,
    IN Iuser_id INT,
    IN Icategory_id INT,
    IN Ititle VARCHAR(250),
    IN Iimg VARCHAR(250),
    IN Icontent TEXT
) BEGIN
UPDATE
    articles
SET
    user_id = Iuser_id,
    category_id = Icategory_id,
    title = Ititle,
    img = Iimg,
    content = Icontent;

END //
DELIMITER ;

DELIMITER ;
DROP PROCEDURE IF EXISTS ArticleList;
DELIMITER //
 
CREATE PROCEDURE `ArticleList`(
    IN `page` smallint(3),
    IN `u` int,
    IN `cat` int
) BEGIN DECLARE userCond VARCHAR(100) DEFAULT '';

DECLARE catCond VARCHAR(100) DEFAULT '';

IF u != 0 THEN
SET
    userCond = CONCAT(' AND user_id = ', u);

END IF;

IF u != 0 THEN
SET
    catCond = CONCAT(' AND category_id = ', cat);

END IF;

SET
    @query = CONCAT(
        'SELECT 
            a.* , u.name u_name , c.name cat_name FROM articles = a 
            JOIN categories c ON c.id = a.category_id JOIN users u ON u.id = a.user_id WHERE 1 = 1',
        userCond,
        catCond,
        " LIMIT 16 OFFSET ",
        16 * (page - 1)
    );

PREPARE stmt
FROM
    @query;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;

SELECT
    @query;

END // 
DELIMITER ;


DROP PROCEDURE IF EXISTS RichTextListByGroupOrKey;
DELIMITER //

CREATE PROCEDURE RichTextListByGroupOrKey(
    IN IGroup Int,
    IN IKey VARCHAR(250)
)
BEGIN

DECLARE cond VARCHAR(50) DEFAULT '';
IF IGroup != 0 THEN
    SET cond = CONCAT('AND r.group =' , IGroup);
ELSE 
    SET cond = CONCAT('AND r.key = "' , IKey , '"');
END IF;

  SET @query = CONCAT(
        'SELECT 
        r.value,
        r.title,
        IFNULL(r.image , "") image,
        IFNULL(r.icon , "") icon
        FROM rich_text r
            WHERE 1 = 1 ',
        cond);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;


# roles

DELIMITER ;

DROP PROCEDURE IF EXISTS RolesList;
DELIMITER //

CREATE PROCEDURE RolesList()
BEGIN
	SELECT * FROM roles;
END //

DELIMITER ;


# EventsList

DELIMITER ;
DROP PROCEDURE IF EXISTS EventsList;
DELIMITER //

CREATE PROCEDURE EventsList(IN featured BOOLEAN)
BEGIN

    IF featured THEN
	SELECT e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , c.id cat_id  FROM events e JOIN categories c on e.category_id = c.id WHERE e.featured = 1 AND  e.deleted_at IS NULL;
    ELSE 
	SELECT e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , c.id cat_id  FROM events e JOIN categories c on e.category_id = c.id WHERE  e.deleted_at IS NULL;

    END IF;
END //

DELIMITER ;

# EventRead

DELIMITER ;
DROP PROCEDURE IF EXISTS EventRead;
DELIMITER //

CREATE PROCEDURE EventRead(IN Iid INT)
BEGIN
	SELECT e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , e.video FROM events e JOIN categories c on e.category_id = c.id WHERE  e.id = Iid;

END //

DELIMITER ;

# EventsList



# projects


DELIMITER ;


DROP PROCEDURE IF EXISTS ProjectsListByUserOrFeatured;  
DROP PROCEDURE IF EXISTS ProjectsListFeatured;
DELIMITER //
CREATE PROCEDURE ProjectsListFeatured() 
BEGIN
    SELECT 
        p.id,
        p.title,
        p.logo,
        p.img
        FROM projects p 
           
            WHERE  featured = 1 ORDER BY RAND() LIMIT 4;
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
    IN Iemail VARCHAR(250)
) BEGIN
UPDATE
    projects
SET
    category_id = Icategory_id,
    city_id = Icity_id,
    title = Ititle,
    status = Istatus,
    img = Iimg,
    imgs = Iimgs,
    logo = Ilogo,
    fund = Ifund,
    breif = Ibreif,
    location = Ilocation,
    phone = Iphone,
    file = Ifile,
    email = Iemail


    WHERE id = Iid;

    SELECT LAST_INSERT_ID();

END //
DELIMITER ;

DROP PROCEDURE IF EXISTS UserRead;

DELIMITER //
CREATE  PROCEDURE `UserRead`(IN emailOrPhone VARCHAR(250))
BEGIN
DECLARE cond VARCHAR(50) DEFAULT '';
IF emailOrPhone REGEXP '^[0-9]+$' THEN
    SET cond = CONCAT('AND phone = "' , emailOrPhone, '"');
ELSE 
    SET cond = CONCAT('AND email = "' , emailOrPhone , '"');
END IF;
    SET @query = CONCAT(
        'SELECT 
        u.id,
        u.admin,
        u.name,
        u.name_ar,
        IFNULL(u.email , ""),
        u.img,
        u.serial,
        u.points,
        u.role_id,
        u.phone,
        IFNULL(u.breif , "") breif,
        IFNULL(u.website,"") website,
        IFNULL(u.instagram,"") instagram,
        IFNULL(u.twitter,"") twitter,
        r.name role,
        r.color,
        u.password
        FROM users u
            JOIN roles r ON u.role_id = r.id
            WHERE active = 1 ',
        cond);


    
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS VideosList;

DELIMITER //
CREATE  PROCEDURE `VideosList`()
BEGIN
    SELECT * FROM videos;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ProjectsListByCategoryUserSearch;
DELIMITER //
CREATE PROCEDURE ProjectsListByCategoryUserSearch(IN ICategory INT , IN Iuser INT , IN search VARCHAR(200)) 
BEGIN
DECLARE categoryCond VARCHAR(50) DEFAULT '';
DECLARE userCond VARCHAR(50) DEFAULT '';
DECLARE searchCond VARCHAR(50) DEFAULT '';
IF ICategory != 0 THEN
    SET categoryCond = CONCAT('AND category_id = ' , ICategory);
END IF;
IF Iuser != 0 THEN
    SET userCond = CONCAT('AND user_id = ' , IUser);
END IF;
IF search != '' THEN
    SET searchCond = CONCAT('AND title LIKE "%' , search , '%"');
END IF;

    SET @query = CONCAT(
        'SELECT 
         id,
         title,
         status,
         logo,
         img
        FROM projects
           
            WHERE 1 = 1 ',
        userCond,
        categoryCond,
        searchCond);


         
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    END//

DELIMITER ;



DROP PROCEDURE IF EXISTS EventsListByCategorySearch;
DELIMITER //
CREATE PROCEDURE EventsListByCategorySearch(IN ICategory INT  , IN search VARCHAR(200)) 
BEGIN
DECLARE categoryCond VARCHAR(50) DEFAULT '';
DECLARE searchCond VARCHAR(50) DEFAULT '';
IF ICategory != 0 THEN
    SET categoryCond = CONCAT('AND category_id = ' , ICategory);
END IF;
IF search != '' THEN
    SET searchCond = CONCAT('AND title LIKE "%' , search , '%"');
END IF;

    SET @query = CONCAT(
        'SELECT 
         e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , c.id cat_id  FROM events e JOIN categories c on e.category_id = c.id WHERE 1 = 1 ',
        categoryCond,
        searchCond);
         
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    END//

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
        p.featured
     FROM projects p 
        JOIN users u ON u.id = p.user_id
        JOIN cities ci ON ci.id = p.city_id
        JOIN categories ca ON ca.id = p.category_id
     
     WHERE p.id = Iid;
END//
DELIMITER ;





DROP PROCEDURE IF EXISTS ArticleListByCategoryUserSearch;
DELIMITER //
CREATE PROCEDURE ArticleListByCategoryUserSearch(IN ICategory INT , IN Iuser INT , IN search VARCHAR(200)) 
BEGIN
DECLARE categoryCond VARCHAR(50) DEFAULT '';
DECLARE userCond VARCHAR(50) DEFAULT '';
DECLARE searchCond VARCHAR(50) DEFAULT '';
IF ICategory != 0 THEN
    SET categoryCond = CONCAT('AND category_id = ' , ICategory);
END IF;
IF Iuser != 0 THEN
    SET userCond = CONCAT('AND user_id = ' , IUser);
END IF;
IF search != '' THEN
    SET searchCond = CONCAT('AND title LIKE "%' , search , '%"');
END IF;

    SET @query = CONCAT(
        'SELECT 
         a.id,
         c.name categoryName,
         u.name_ar userName,
         u.img userImg,
         a.title,
         a.img,
         a.views,
         a.Published_at
        FROM articles a
           JOIN users u ON u.id = a.user_id
             JOIN categories c ON c.id = a.category_id
            WHERE status = "active" ',
        userCond,
        categoryCond,
        searchCond);
         
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    END//

DELIMITER ;


DROP PROCEDURE IF EXISTS ArticleRead;


DELIMITER //
CREATE  PROCEDURE `ArticleRead`(IN Iid INT)
BEGIN


    UPDATE articles set views = views + 3 WHERE id = Iid;
    SELECT 
       a.id,
       a.user_id,
       a.category_id,
       u.name userName,
       u.img userImg,
       c.name categoryName,
       a.title,
       a.img,
       a.views,
       a.status,
       a.content,
       a.created_at,
       a.published_at
     FROM articles a
        JOIN users u ON u.id = a.user_id
        JOIN categories c ON c.id = a.category_id
     
     WHERE a.id = Iid;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS Register;

DELIMITER //
CREATE  PROCEDURE `Register`(
    IN IName VARCHAR(250),
    IN IName_ar VARCHAR(250),
    IN IEmail VARCHAR(250),
    IN IPassword VARCHAR(250),
    IN IPhone VARCHAR(250),
    IN IRole INT
)
BEGIN

    SELECT MAX(`serial`) FROM users INTO @maxSerial;
    

   INSERT INTO users (
        name,
        name_ar,
        email,
        `password`,
        phone,
        role_id,
        `serial`
   )
   VALUES (
        IName,
        IName_ar,
        IEmail,
        IPassword,
        IPhone,
        IRole,
        @maxSerial + 1
   );
END//
DELIMITER ;








DROP PROCEDURE IF EXISTS UserUpdate;



DELIMITER // 



CREATE PROCEDURE UserUpdate(
    IN id int,
    IN Iname varchar(250),
    IN Iname_ar varchar(250),
    IN Iemail varchar(250),
    IN Ipassword varchar(250),
    IN Iserial varchar(250),
    IN Irole_id INT,
    IN Iimg TEXT,
    IN Iphone VARCHAR(250),
    IN Ibreif TEXT(250),
    IN Iwebsite VARCHAR(250),
    IN Iinstagram VARCHAR(250),
    IN Itwitter VARCHAR(250)
) BEGIN

UPDATE
    users u
SET
    u.name = Iname,
    u.name_ar = Iname_ar,
    u.email =  CASE WHEN Iemail = "" THEN u.email ELSE Iemail END ,
    u.password = CASE WHEN IPassword = "" THEN u.password ELSE IPassword END,
    u.serial = Iserial,
    u.role_id = CASE WHEN Irole_id = "" THEN u.role_id ELSE Irole_id END,
    u.img = CASE WHEN Iimg = "" THEN u.img ELSE Iimg END,
    u.phone = Iphone,
    u.breif = CASE WHEN Ibreif = "" THEN u.breif ELSE Ibreif END ,
    u.website = CASE WHEN Iwebsite = "" THEN u.website ELSE Iwebsite END,
    u.instagram = CASE WHEN Iinstagram = "" THEN u.instagram ELSE Iinstagram END,
    u.twitter = CASE WHEN Itwitter = "" THEN u.twitter ELSE Itwitter END
WHERE
    u.id = id;

END //

DELIMITER ;


DROP PROCEDURE IF EXISTS CategoryListByType;


DELIMITER //
CREATE  PROCEDURE `CategoryListByType`(IN Itype VARCHAR(50))
BEGIN
    SELECT 
       id,name,icon
     FROM categories
     
     WHERE type = Itype;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ConsultuntsListAll;


DELIMITER //
CREATE  PROCEDURE `ConsultuntsListAll`()
BEGIN
    SELECT 
       *
     FROM consultunts;
END//



DELIMITER ;



DROP PROCEDURE IF EXISTS ConsultuntById ;
DELIMITER //

CREATE  PROCEDURE `ConsultuntById`(IN Iid INT)
BEGIN
    SELECT 
       *
     FROM consultunts WHERE id = Iid;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS ConsultuntsCreate;


DELIMITER //
CREATE  PROCEDURE `ConsultuntsCreate`(
    IN Iname VARCHAR(250),
    IN Ititle VARCHAR(250),
    IN Iskills VARCHAR(250),
    IN Iimg TEXT,
    IN Ibreif TEXT
)
BEGIN
    INSERT INTO consultunts (
        name,
        title,
        skills,
        img,
        breif
    )
    VALUES (
        Iname,
        Ititle,
        Iskills,
        Iimg,
        Ibreif
    );
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ConsultuntsUpdate;


DELIMITER //
CREATE  PROCEDURE `ConsultuntsUpdate`(
    IN Iid INT,
    IN Iname VARCHAR(250),
    IN Ititle VARCHAR(250),
    IN Iskills VARCHAR(250),
    IN Iimg TEXT,
    IN Ibreif TEXT
)
BEGIN
    UPDATE consultunts SET 
        name = Iname ,
        title = Ititle ,
        skills = Iskills ,
        img = Iimg ,
        breif = Ibreif 
    WHERE id = Iid;
END//
DELIMITER ;









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
    IN Iemail VARCHAR(250)
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
        email
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
        Iemail
    );


    SELECT LAST_INSERT_ID() id; 

END//
DELIMITER ;



DROP PROCEDURE IF EXISTS CityListAll;

DELIMITER //
CREATE  PROCEDURE `CityListAll`()
BEGIN
    SELECT id,name from cities;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS FeaturesListAll;

DELIMITER //
CREATE  PROCEDURE `FeaturesListAll`()
BEGIN
    SELECT * from features;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS ServicesListAll;

DELIMITER //
CREATE  PROCEDURE `ServicesListAll`()
BEGIN
    SELECT id,name,icon from services;
END//
DELIMITER ;


