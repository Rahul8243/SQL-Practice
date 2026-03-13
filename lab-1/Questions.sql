SELECT * FROM passengers WHERE gender = 'M';

SELECT * FROM passengers WHERE p_name IS NULL;

SELECT * FROM passengers WHERE gender = 'F' AND age > 18;

SELECT * FROM list_buses WHERE Source IN ('ISBT','Pari Chauk');

ALTER TABLE passengers ADD blood_group VARCHAR(5);
ALTER TABLE passengers DROP blood_group;

CREATE TABLE new_passengers AS
SELECT * FROM passengers;

ALTER TABLE new_passengers MODIFY gender CHAR(1);
ALTER TABLE new_passengers CHANGE p_name passenger_name VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM new_passengers
WHERE age > 50;

UPDATE new_passengers
SET age = 17
WHERE passenger_name = 'Shiva';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM new_passengers;
