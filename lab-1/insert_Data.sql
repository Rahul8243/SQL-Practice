INSERT INTO list_buses VALUES
('UP301','Zing bus','Pari Chauk','Prayagraj',1010,'2022-08-21','21:30:00'),
('HR302','Cargo','Sector 62','Chandigarh',1020,'2022-08-23','22:44:00'),
('UP101','Blue world','Pari Chauk','Lucknow',1240,'2022-09-24','08:05:00'),
('HR303','Maheshwaram','ISBT','Ambala',1010,'2022-09-25','07:22:00'),
('UP505','Goluxury','ISBT','Kanpur',2250,'2022-09-27','19:38:00'),
('DL701','Vaishnavi','ISBT','Chandigarh',1550,'2022-09-28','23:55:00'),
('DL306','Shatabdi','ISBT','Dehradun',1007,'2022-09-29','20:45:00'),
('UP501','Safar','Pari Chauk','Varanasi',1080,'2022-09-30','08:35:00');

INSERT INTO bus_status VALUES
('UP301',35,25),
('HR302',41,24),
('UP101',10,51),
('HR303',14,48),
('UP505',1,59),
('DL701',8,46),
('DL306',17,45),
('UP501',50,0);

INSERT INTO passengers VALUES
('SCS012','Arjun','UP301','M',17,'Confirm'),
('SCS013','Anamika','HR302','F',15,'Confirm'),
('SCS012','Divya','UP101','F',65,'Waiting'),
('SCS014','Diya','HR303','F',19,'Confirm'),
('SCS015','Abhishek','UP505','M',57,'Confirm'),
('SCS090','Shiva','DL701','M',16,'Waiting'),
('SCS071','Rahul','DL306','M',21,'Confirm'),
('SCS043','Rupam','UP501','F',22,'Confirm'),
('SCS017','Hina','UP301','F',23,'Waiting'),
('SCS022','Alam','HR302','M',21,'Waiting'),
('SCS056','Satya','UP101','M',23,'Confirm');
