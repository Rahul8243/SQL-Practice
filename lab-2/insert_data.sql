INSERT INTO List_bus VALUES
('UP301','Zing bus','Pari Chauk','Prayagraj',1010,'2022-08-21','21:30:00'),
('HR302','Cargo','Sector 62','Chandigarh',1020,'2022-08-23','22:44:00'),
('UP101','Blue world','Pari Chauk','Lucknow',1240,'2022-09-24','08:05:00'),
('HR303','Maheshwaram','ISBT','Ambala',1010,'2022-09-25','07:22:00'),
('UP505','Goluxury','ISBT','Kanpur',2250,'2022-09-27','19:38:00'),
('DL701','Vaishnavi','ISBT','Chandigarh',1550,'2022-09-28','23:55:00'),
('DL306','Shatabdi','ISBT','Dehradun',1007,'2022-09-29','20:45:00'),
('UP501','Safar','Pari Chauk','Varansi',1080,'2022-09-30','08:35:00');

SELECT * FROM List_bus;

INSERT INTO Passenger_details VALUES
('SCS012','Arjun','UP301',17,'M','Confirm'),
('SCS013','Anamika','HR302',15,'F','Confirm'),
('SCS016','Divya','UP101',65,'F','Waiting'),
('SCS014','Diya','HR303',19,'F','Confirm'),
('SCS015','Abhishek','UP505',57,'M','Confirm'),
('SCS090','Shiva','DL701',16,'M','Waiting'),
('SCS071','Rahul','DL306',21,'M','Confirm'),
('SCS043','Rupam','UP501',22,'F','Confirm'),
('SCS017','Hina','UP301',23,'F','Waiting'),
('SCS022','Alam','HR302',21,'M','Waiting'),
('SCS056','Satya','UP101',23,'M','Confirm');

SELECT * FROM Passenger_details;

INSERT INTO Bus_Status VALUES
('UP301',35,25),
('HR302',41,24),
('UP101',10,51),
('HR303',14,48),
('UP505',1,59),
('DL701',8,46),
('DL306',17,45),
('UP501',50,0);
