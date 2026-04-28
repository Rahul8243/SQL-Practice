INSERT INTO Patients VALUES
(1, 'Amit Sharma', 30, 'Male', 'Delhi'),
(2, 'Neha Singh', 25, 'Female', 'Mumbai'),
(3, 'Rahul Das', 40, 'Male', 'Kolkata'),
(4, 'Priya Verma', 35, 'Female', 'Chennai'),
(5, 'Karan Mehta', 28, 'Male', 'Delhi'),
(6, 'Rahul raj mahi',25,'Male', 'Bihar');



INSERT INTO Doctors VALUES
(101, 'Dr. Kumar', 'Cardiologist', 800),
(102, 'Dr. Meena', 'Dermatologist', 500),
(103, 'Dr. Shah', 'Neurologist', 1000),
(104, 'Dr. Roy', 'Orthopedic', 700);

INSERT INTO Appointments VALUES
(1001, 1, 101, '2026-02-01', 'Completed'),
(1002, 2, 102, '2026-02-05', 'Pending'),
(1003, 3, 101, '2026-02-10', 'Completed'),
(1004, 4, 103, '2026-02-15', 'Cancelled'),
(1005, 5, 104, '2026-02-20', 'Completed'),
(1006, 1, 103, '2026-02-25', 'Pending');