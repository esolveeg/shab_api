USE alshab_staging;

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



DECLARE currentRole INT;
DECLARE points FLOAT;

SET currentRole = (SELECT role_id  FROM users u WHERE u.id = id);

SET points =(SELECT price FROM roles r WHERE r.id = Irole_id) - (SELECT price FROM roles r WHERE r.id = currentRole);

/* 
IF currentRole != Irole_id THEN 
END IF; */
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
    u.points = (u.points + points),
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
       id,name,icon,type
     FROM categories
     
     WHERE type = CASE WHEN Itype = "" THEN type ELSE Itype END ;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS CategoryCreate;


DELIMITER //
CREATE  PROCEDURE `CategoryCreate`(IN Iname VARCHAR(300) , IN Iicon VARCHAR(300) , IN Itype VARCHAR(10))
BEGIN
    INSERT INTO categories (name , icon , type) VALUES (Iname , Iicon , Itype);
    SELECT LAST_INSERT_ID() id;
END//
DELIMITER ;


DELIMITER //
CREATE  PROCEDURE `CategoryFind`(IN Iid INT)
BEGIN
    SELECT 
       id,name,icon,type
     FROM categories
     
     WHERE id = Iid;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS CategoryUpdate;


DELIMITER //
CREATE  PROCEDURE `CategoryUpdate`(IN Iid INT , IN Iname VARCHAR(300) , IN Iicon VARCHAR(300) , IN Itype VARCHAR(10))
BEGIN
    UPDATE categories SET 
    name = Iname ,
    icon = Iicon ,
    type = Itype WHERE id = Iid ;

    SELECT Iid;
END//
DELIMITER ;

