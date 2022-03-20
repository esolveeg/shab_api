

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
DECLARE Irole_id INT;
DECLARE Icity_id INT;
DECLARE Iphone VARCHAR(250);
DECLARE Ipassword VARCHAR(250);

SET x = 1;
SET max = (SELECT COUNT(*) FROM alshab.categories);

loop_label:  LOOP
		IF  x > max THEN 
			LEAVE  loop_label;
		END  IF;
            
        SET Iserial = (SELECT alshab.users.serial FROM  alshab.users WHERE id = x);
        SET Iname = (SELECT alshab.users.name FROM  alshab.users WHERE id = x);
        SET Iname_ar = (SELECT alshab.users.name_ar FROM  alshab.users WHERE id = x);
        SET Iemail = (SELECT alshab.users.email FROM  alshab.users WHERE id = x);
        SET Irole_id = (SELECT alshab.users.role_id FROM  alshab.users WHERE id = x);
        SET Icity_id = (SELECT alshab.users.city_id FROM  alshab.users WHERE id = x);
        SET Iphone = (SELECT alshab.users.phone FROM  alshab.users WHERE id = x);
        SET Ipassword = (SELECT alshab.users.password FROM  alshab.users WHERE id = x);
            INSERT INTO alshab_staging.users (
                serial,
                name,
                name_ar,
                role_id,
                city_id,
                phone,
                password
            ) VALUES (
                Iserial,
                Iname,
                Iname_ar,
                Irole_id,
                Icity_id,
                Iphone,
                Ipassword
            );
		SET  x = x + 1;
       
	END LOOP;

END
