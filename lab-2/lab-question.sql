
SELECT Source, 
COUNT(*) AS Total_Buses
FROM List_bus
GROUP BY Source;

SELECT Source, 
COUNT(*) AS Total_Buses
FROM List_bus
GROUP BY Source
ORDER BY Total_Buses ASC;

SELECT * FROM List_bus
ORDER BY Fare ASC
LIMIT 4;

SELECT * FROM Passenger_details
WHERE P_Name LIKE 'D%';

SELECT * FROM Passenger_details
WHERE P_Name LIKE '%m'
ORDER BY P_Name ASC
LIMIT 1;

SELECT AVG(Age) AS Avg_Male_Age
FROM Passenger_details
WHERE Gender = 'M';

SELECT P_Name
FROM Passenger_details
WHERE Status = 'Confirm'
ORDER BY Age DESC
LIMIT 1;

SELECT *
FROM Passenger_details
WHERE Gender = 'F'
AND Status = 'Confirm'
AND Bus_no IN (
    SELECT Bus_no
    FROM List_bus
    WHERE Source = 'Pari Chauk'
);

SELECT CONCAT(Age, ' - ', Gender) AS Age_Gender
FROM Passenger_details;

SET SQL_SAFE_UPDATES = 0;
UPDATE List_bus
SET Fare = Fare + 50
WHERE Source = 'Pari Chauk';

UPDATE List_bus
SET Fare = Fare + 75
WHERE Source = 'ISBT';
SET SQL_SAFE_UPDATES = 1;


select * from List_bus;

select count(*) as total_buses
from List_bus
where Destination = 'Chandigarh';