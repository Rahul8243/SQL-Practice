-- 1.Create a VIEW that displays all buses starting from a
--  source name starting with “ISBT".
      
CREATE VIEW ISBT_Buses AS
SELECT *
FROM List_bus
WHERE Source = 'ISBT';

select * from ISBT_Buses;
-- 2.Display source locations that have more than 2 buses originating from them

SELECT Source, COUNT(*) AS Total_Buses
FROM List_bus
GROUP BY Source
HAVING COUNT(*) > 2;

-- 3.Show bus records that are scheduled to depart 
-- after September 25, 2022, ordered by departure date and time.      

SELECT * FROM List_bus
WHERE Date > '2022-09-25'
ORDER BY Date, Time;

-- 4.Create a view named "Confirmed_Passengers"
--  that displays details of passengers with a confirmed booking status.      

CREATE VIEW Confirmed_Passenger AS
SELECT *
FROM Passenger_details
WHERE Status = 'Confirm';

select * from Confirmed_passenger;

-- 5.Retrieve 	the 	details 	of 	confirmed 	passengers 	from 
-- the “Confirmed_Passengers" view, ordered by age in 
-- descending order, and then by passenger names.      

 SELECT * FROM Confirmed_Passengers
ORDER BY Age DESC, P_name;


-- 6.Retrieve the total count of passengers in each status
--  category, ordered by count in descending order.  

SELECT Status, COUNT(*) AS Total
FROM Passenger_details
GROUP BY Status
ORDER BY Total DESC;   

-- 7.Create a view that lists buses that are fully booked. 
     
CREATE VIEW Fully_Booked AS
SELECT *
FROM Bus_Status
WHERE Available_seats = 0;

select * from Fully_Booked;

-- 8.Create a view that displays buses with low 
-- available seats (where available seats are less than 10).

create view Display_buses as 
select * from Bus_Status
where Available_seats < 10;

select * from Display_buses;

-- 9.Retrieve a list of buses ordered by 
-- the number of booked seats in descending order.    4

select * from Bus_Status;

select * from Bus_Status
order by Booked_seats desc;

-- 10.Retrieve a list of buses ordered by the total number
--  of seats (available seats + booked seats) in ascending order.

select (available_seats + booked_seats) as Total_seats
from Bus_Status
order by Total_seats asc;
