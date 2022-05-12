USE alshab_staging;

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
    IN Ibreif TEXT(250)
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
        breif
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
        Ibreif
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
        r.name role,
        r.color
        FROM users u
            JOIN roles r ON u.role_id = r.id
            WHERE  u.id = Iid;
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





DROP PROCEDURE IF EXISTS UserServiceCreate;

DELIMITER //
CREATE  PROCEDURE `UserServiceCreate`(userId INT , serviceId int , Ibreif TEXT)
BEGIN
   INSERT INTO user_services (user_id , service_id , breif) VALUES (userId , serviceId , Ibreif);
   SELECT LAST_INSERT_ID() id ;
    
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

    SELECT id;

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
	SELECT e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , c.id cat_id  FROM events e JOIN categories c on e.category_id = c.id WHERE e.featured = 1 AND  e.deleted_at IS NULL ORDER BY e.date DESC;
    ELSE 
	SELECT e.id ,e.title,e.img ,IFNULL(e.breif,"") ,day(e.date) d,month(e.date) m,year(e.date) y, e.price ,e.featured ,e.created_at ,  c.name cat_name , c.id cat_id  FROM events e JOIN categories c on e.category_id = c.id WHERE  e.deleted_at IS NULL ORDER BY e.date DESC;

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

#videos
DROP PROCEDURE IF EXISTS VideosListByCategory;

DELIMITER //
CREATE  PROCEDURE `VideosListByCategory`(IN ICategory INT)
BEGIN
    SELECT id , name ,url ,image ,breif , category_id FROM videos WHERE deleted_at IS NULL AND (CASE WHEN ICategory = 0 THEN '1' ELSE category_id = ICategory END);
END//
DELIMITER ;




DROP PROCEDURE IF EXISTS VideosRead;

DELIMITER //
CREATE  PROCEDURE `VideosRead`(IN Iid INT)
BEGIN
    SELECT v.id , v.name ,v.url ,v.image ,v.breif , v.category_id ,c.name category_name  FROM videos v JOIN categories c ON v.category_id = c.id WHERE v.deleted_at IS NULL AND v.id= Iid;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS VideosCreate;

DELIMITER //
CREATE  PROCEDURE `VideosCreate`(IN Iname VARCHAR(250),IN Iurl VARCHAR(250),IN Iimage VARCHAR(250),IN Ibreif TEXT,IN Icategory_id INT)
BEGIN
    INSERT INTO videos (
        name ,
        url ,
        image ,
        breif , 
        category_id 
    ) VALUES (
        Iname,
        Iurl,
        Iimage,
        Ibreif,
        Icategory_id
    );

    SELECT LAST_INSERT_ID() id;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS VideosUpdate;

DELIMITER //
CREATE  PROCEDURE `VideosUpdate`(IN Iid INT,IN Iname VARCHAR(250),IN Iurl VARCHAR(250),IN Iimage VARCHAR(250),IN Ibreif TEXT,IN Icategory_id INT)
BEGIN
    UPDATE  videos SET
        name = Iname ,
        url = Iurl ,
        image = Iimage ,
        breif = Ibreif ,
        category_id = Icategory_id
    WHERE id = Iid;

    SELECT Iid id;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS VideosDelete;

DELIMITER //
CREATE  PROCEDURE `VideosDelete`(IN Iid INT)
BEGIN
    UPDATE  videos SET deleted_at = now()  WHERE id = Iid;
    SELECT Iid id;
END//
DELIMITER ;
DROP PROCEDURE IF EXISTS ProjectsListByCategoryUserSearch;
DELIMITER //
CREATE PROCEDURE ProjectsListByCategoryUserSearch(IN ICategory INT , IN Iuser INT , IN search VARCHAR(200)) 
BEGIN

    SELECT 
         id,
         title,
         status,
         logo,
         img
        FROM projects p
            WHERE active = 1
            AND p.user_id = CASE WHEN Iuser = 0 THEN p.user_id ELSE Iuser END
            AND p.category_id = CASE WHEN ICategory = 0 THEN p.category_id ELSE ICategory END
            AND CASE WHEN search = '' THEN 1 = 1 ELSE  title LIKE CONCAT('"%' , search , '%"') END;
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


DROP PROCEDURE IF EXISTS ProjectDelete;

DELIMITER //
CREATE  PROCEDURE `ProjectDelete`(IN Iid INT)
BEGIN
    UPDATE  projects SET deleted_at = now()  WHERE id = Iid;
    SELECT Iid id;
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
       IFNULL(a.published_at , '')
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


    INSERT INTO user_subs (
        user_id,
        role_id,
        price,
        method,
        points,
        start_at,
        end_at
    ) VALUES (
        LAST_INSERT_ID(),
        IRole,
        (SELECT price FROM roles WHERE id = IRole),
        'cash',
        (SELECT price FROM roles WHERE id = IRole),
        now(),
        DATE_ADD( now(), INTERVAL 1 YEAR)
    );


   SELECT LAST_INSERT_ID() id;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS UserReset;
DELIMITER // 
CREATE PROCEDURE UserReset(
    IN Iemail varchar(250),
    IN Ipassword varchar(250)
) BEGIN
UPDATE
    users
SET
    password = IPassword 
WHERE
    email = Iemail;
    SELECT 1 reseted;
END //
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
    IN Icity_id INT,
    IN Iimg TEXT,
    IN Iphone VARCHAR(250),
    IN Ibreif TEXT(250)
) BEGIN

UPDATE
    users u
SET
    u.name = Iname,
    u.name_ar = Iname_ar,
    u.email =  CASE WHEN Iemail = "" THEN u.email ELSE Iemail END ,
    u.password = CASE WHEN IPassword = "" THEN u.password ELSE IPassword END,
    u.serial = Iserial,
    u.role_id = CASE WHEN Irole_id = 0 THEN u.role_id ELSE Irole_id END,
    u.city_id = CASE WHEN Icity_id = 0 THEN u.city_id ELSE Icity_id END,
    u.img = CASE WHEN Iimg = "" THEN u.img ELSE Iimg END,
    u.phone = Iphone,
    u.breif = CASE WHEN Ibreif = "" THEN u.breif ELSE Ibreif END 
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
CREATE  PROCEDURE `ConsultuntsListAll`(IN Iis_team BOOLEAN)
BEGIN
    SELECT 
       *
     FROM consultunts WHERE is_team = Iis_team;
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
    IN Iis_team BOOLEAN,
    IN Ibreif TEXT
)
BEGIN
    INSERT INTO consultunts (
        name,
        title,
        skills,
        img,
        is_team,
        breif
    )
    VALUES (
        Iname,
        Ititle,
        Iskills,
        Iimg,
        Iis_team,
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
    IN Iis_team BOOLEAN,
    IN Ibreif TEXT
)
BEGIN
    UPDATE consultunts SET 
        name = Iname ,
        title = Ititle ,
        skills = Iskills ,
        img = Iimg ,
        is_team = Iis_team ,
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



DROP PROCEDURE IF EXISTS ServiceCreate;

DELIMITER //
CREATE  PROCEDURE `ServiceCreate`(IName VARCHAR(100) , IIcon VARCHAR(100))
BEGIN
    INSERT INTO services ( name,icon) VALUES(IName , IIcon);
    SELECT LAST_INSERT_ID(); 
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS ServiceUpdate;

DELIMITER //
CREATE  PROCEDURE `ServiceUpdate`(IId INT , IName VARCHAR(100) , IIcon VARCHAR(100))
BEGIN
    UPDATE  services SET name = IName ,icon = IIcon WHERE id = IId;
    SELECT 1 updated;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ServiceDelete;

DELIMITER //
CREATE  PROCEDURE `ServiceDelete`(IId INT )
BEGIN
    DELETE FROM services WHERE id = IId;
    SELECT 1 deleted;
END//
DELIMITER ;






DROP PROCEDURE IF EXISTS Merge;

DELIMITER //

CREATE PROCEDURE Merge()
BEGIN
DECLARE x INT;
DECLARE max INT;
DECLARE Iserial INT;
DECLARE Iname VARCHAR(250);
DECLARE Iname_ar VARCHAR(250);
DECLARE Iemail VARCHAR(250);
DECLARE Iimg VARCHAR(250);
DECLARE Irole_id INT;
DECLARE Icity_id INT;
DECLARE Iphone VARCHAR(250);
DECLARE Ipassword VARCHAR(250);

SET x = 1;
SET max = (SELECT COUNT(*) FROM alshab.users);

loop_label:  LOOP
		IF  x > max THEN 
			LEAVE  loop_label;
		END  IF;
            
        SET Iserial = (SELECT alshab.users.serial FROM  alshab.users WHERE id = x);
        SET Iname = (SELECT alshab.users.name FROM  alshab.users WHERE id = x);
        SET Iname_ar = (SELECT alshab.users.name_ar FROM  alshab.users WHERE id = x);
        SET Iemail = (SELECT alshab.users.email FROM  alshab.users WHERE id = x);
        SET Iimg = (SELECT alshab.users.img FROM  alshab.users WHERE id = x);
        SET Irole_id = (SELECT alshab.users.role_id FROM  alshab.users WHERE id = x);
        SET Icity_id = (SELECT alshab.users.city_id FROM  alshab.users WHERE id = x);
        SET Iphone = (SELECT alshab.users.phone FROM  alshab.users WHERE id = x);
        SET Ipassword = (SELECT alshab.users.password FROM  alshab.users WHERE id = x);
        IF NOT EXISTS(SELECT * FROM users WHERE phone = Iphone) AND NOT EXISTS(SELECT * FROM users WHERE email = Iemail)
            THEN
            
            INSERT INTO alshab_staging.users (
                serial,
                name,
                name_ar,
                email,
                role_id,
                city_id,
                img,
                phone,
                active,
                password
            ) VALUES (
                Iserial,
                Iname,
                Iname_ar,
                Iemail,
                Irole_id,
                Icity_id,
                Iimg,
                Iphone,
                1,
                Ipassword
            );
            
            END IF;
		SET  x = x + 1;
       
	END LOOP;

END//
DELIMITER ;


      




DROP PROCEDURE IF EXISTS NotificationCreate;

DELIMITER //

CREATE PROCEDURE NotificationCreate(IN Ititle VARCHAR(250) , IN Ibreif TEXT , IN Iurl VARCHAR(250) )
BEGIN
DECLARE x INT;
DECLARE max INT;
DECLARE u_id INT;
DECLARE n_id INT;

INSERT INTO notifications (
    title,
    breif,
    link
) VALUES (
    Ititle,
    Ibreif,
    Iurl
);

SET n_id = (SELECT LAST_INSERT_ID());


SET x = 0;
SET max = (SELECT (COUNT(*)) FROM users WHERE users.admin = 1);

loop_label:  LOOP
		IF  x > max THEN 
			LEAVE  loop_label;
		END  IF;
        SET u_id = (SELECT id FROM users WHERE admin = 1 LIMIT 1);

        INSERT INTO user_notifications (
            user_id,
            notification_id
        ) VALUES (
            u_id,
            n_id
        );
         
		SET  x = x + 1;
       
	END LOOP;


    SELECT n_id ;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS NotificationsByUserId;

DELIMITER //
CREATE  PROCEDURE `NotificationsByUserId`(IId INT )
BEGIN
    SELECT Title , Breif , Link FROM notifications n
    JOIN user_notifications un 
    ON n.id = un.notification_id 
    WHERE un.user_id = IId;
    
END//
DELIMITER ;



# requests
DROP PROCEDURE IF EXISTS UsersPending;
DELIMITER //
CREATE  PROCEDURE `UsersPending`()
BEGIN
       SELECT u.id , u.name_ar , u.email ,IF(us.end_at < CURRENT_DATE() , 'تجديد عضوية' , 'عضوية جديدة') AS type , u.phone , u.created_at FROM users u JOIN user_subs us ON u.id = us.user_id  WHERE active = 0 OR us.end_at < CURRENT_DATE();
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS SerivcesPendingFind;
DELIMITER //
CREATE  PROCEDURE `SerivcesPendingFind`(IN id INT)
BEGIN
       SELECT u.id , u.name_ar , u.email , u.phone , us.breif ,u.created_at FROM users u JOIN user_services us ON u.id = us.user_id  WHERE us.id = id;
END//
DELIMITER ;





DROP PROCEDURE IF EXISTS ProjectPending;
DELIMITER //
CREATE  PROCEDURE `ProjectPending`()
BEGIN
    SELECT p.id, u.name_ar , u.email , p.title , p.phone , p.created_at FROM projects p JOIN users u ON p.user_id = u.id WHERE p.active = 0 AND p.deleted_at IS NULL;
END//
DELIMITER ;





DROP PROCEDURE IF EXISTS ArticlePending;
DELIMITER //
CREATE  PROCEDURE `ArticlePending`( )
BEGIN
    SELECT a.id, u.name_ar , u.email , a.title , a.created_at FROM articles a JOIN users u ON a.user_id = u.id WHERE published_at IS NULL AND a.deleted_at IS NULL ;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ServiceRequestsPending;
DELIMITER //
CREATE  PROCEDURE `ServiceRequestsPending`()
BEGIN
    SELECT s.id, u.name_ar , u.email , s.breif , s.created_at FROM user_services s JOIN users u ON s.user_id = u.id WHERE s.seen_at IS NULL ;
END//
DELIMITER ;





DROP PROCEDURE IF EXISTS ProjectPendingApprove;
DELIMITER //
CREATE  PROCEDURE `ProjectPendingApprove`(Iid int)
BEGIN
    UPDATE projects SET active = TRUE WHERE id = Iid;
    SELECT Iid;
END//
DELIMITER ;





DROP PROCEDURE IF EXISTS ArticlePendingApprove;
DELIMITER //
CREATE  PROCEDURE `ArticlePendingApprove`(Iid int)
BEGIN
    UPDATE articles SET status = 'active' , published_at = now() WHERE id = Iid;
    SELECT Iid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS UserPendingApprove;
DELIMITER //
CREATE  PROCEDURE `UserPendingApprove`(Iid int)
BEGIN
    UPDATE users SET active = 1  WHERE id = Iid;
    SELECT Iid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS ServiceRequestPendingApprove;
DELIMITER //
CREATE  PROCEDURE `ServiceRequestPendingApprove`(Iid int)
BEGIN
    UPDATE user_services SET seen_at = now() WHERE id = Iid;
    SELECT LAST_INSERT_ID() id;

END//
DELIMITER ;

DROP PROCEDURE IF EXISTS MsgsCreate;
DELIMITER //
CREATE  PROCEDURE `MsgsCreate`(Ifrom_id INT , Ito_id INT , Ibreif TEXT)
BEGIN
   INSERT INTO msgs (from_id , to_id , breif) VALUES (Ifrom_id , Ito_id , Ibreif);
   SELECT LAST_INSERT_ID() id;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS MsgsList;
DELIMITER //
CREATE  PROCEDURE `MsgsList`(Iuser_id INT)
BEGIN
  SELECT u.id , u.name , COUNT(m.id) `count` FROM msgs m JOIN users u ON m.from_id = u.id  WHERE to_id = 9  GROUP BY u.name , u.id;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS MsgsListByUser;
DELIMITER //
CREATE  PROCEDURE `MsgsListByUser`(Ifrom_id INT ,Ito_id INT  )
BEGIN
SELECT m.id ,IF(m.from_id = Ifrom_id , TRUE , FALSE) mine, m.breif , m.created_at , IFNULL(m.seen , '') seen FROM msgs m WHERE (m.from_id = Ifrom_id AND m.to_id = Ito_id) OR (m.from_id = Ito_id AND m.to_id = Ifrom_id) ORDER BY m.created_at DESC, id DESC;
END//
DELIMITER ;