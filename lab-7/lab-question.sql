-- 1.Create a view named patient_basic_info showing patient name, gender, and city.
CREATE VIEW patient_basic_info AS
SELECT patient_name, gender, city
FROM Patients;

select * from patient_basic_info;

-- 2.Create a view named doctor_fee_view showing doctor name and consultation fee.
CREATE VIEW doctor_fee_view AS
SELECT doctor_name, consultation_fee
FROM Doctors;

select * from doctor_fee_view;

-- 3.	Create a view showing all completed appointments.
CREATE VIEW completed_appointments AS
SELECT *
FROM Appointments
WHERE status = 'Completed';

select * from completed_appointments;

-- 4.	Create a view named appointment_details showing.
CREATE VIEW appointment_details AS
SELECT p.patient_name, d.doctor_name, a.appointment_date, a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 5.	Create a view showing only appointments with Cardiologist.
CREATE VIEW cardiologist_appointments AS
SELECT a.*
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiologist';

-- 6.	Create a view showing patients from Delhi.
CREATE VIEW delhi_patients AS
SELECT *
FROM Patients
WHERE city = 'Delhi';

-- 7.	Create a view showing doctors whose consultation fee is greater than 700.
CREATE VIEW high_fee_doctors AS
SELECT *
FROM Doctors
WHERE consultation_fee > 700;

-- 8.	Create a view showing patient name, doctor name, and consultation fee.
CREATE VIEW patient_doctor_fee AS
SELECT p.patient_name, d.doctor_name, d.consultation_fee
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 9.	Create a view showing total number of appointments per doctor.
CREATE VIEW appointments_per_doctor AS
SELECT d.doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

select * from appointments_per_doctor;

-- 10.	Create a view showing pending appointments only.
CREATE VIEW pending_appointments AS
SELECT *
FROM Appointments
WHERE status = 'Pending';

-- 11.	Create a stored procedure to display all patients.
DELIMITER //
CREATE PROCEDURE get_all_patients()
BEGIN
    SELECT * FROM Patients;
END //
DELIMITER ;

call get_all_patients();

-- 12.	Create a stored procedure to display all doctors.
DELIMITER //
CREATE PROCEDURE get_all_doctors()
BEGIN
    SELECT * FROM Doctors;
END //
DELIMITER ;

call get_all_doctors();

-- 13.	Create a stored procedure to show all appointments.
DELIMITER //
CREATE PROCEDURE get_all_appointments()
BEGIN
    SELECT * FROM Appointments;
END //
DELIMITER ;

call get_all_appointments;
-- 14.	Create a stored procedure that shows all appointments of a given patient_id.
DELIMITER //
CREATE PROCEDURE get_appointments_by_patient(IN p_patient_id INT)
BEGIN
    SELECT * FROM Appointments
    WHERE patient_id = p_patient_id;
END //
DELIMITER ;

CALL get_appointments_by_patient(3);
select * from Appointments;


-- 15.	Create a stored procedure that shows doctors of a given specialization.
DELIMITER //
CREATE PROCEDURE get_doctors_by_specialization(IN spec VARCHAR(50))
BEGIN
    SELECT * FROM Doctors
    WHERE specialization = spec;
END //
DELIMITER ;

-- 16.	Create a stored procedure to show appointments by status (input parameter).
DELIMITER //
CREATE PROCEDURE get_appointments_by_status(IN stat VARCHAR(20))
BEGIN
    SELECT * FROM Appointments
    WHERE status = stat;
END //
DELIMITER ;

-- 17.	Create a stored procedure to count total number of patients.
DELIMITER //
CREATE PROCEDURE count_patients()
BEGIN
    SELECT COUNT(*) AS total_patients FROM Patients;
END //
DELIMITER ;

-- 18.	Create a stored procedure to calculate total revenue generated.
DELIMITER //
CREATE PROCEDURE total_revenue()
BEGIN
    SELECT SUM(d.consultation_fee) AS total_revenue
    FROM Appointments a
    JOIN Doctors d ON a.doctor_id = d.doctor_id
    WHERE a.status = 'Completed';
END //


DELIMITER ;

CALL total_revenue();

-- 19.	Create a stored procedure to display doctor name and total number of appointments handled.
DELIMITER //
CREATE PROCEDURE doctor_appointment_count()
BEGIN
    SELECT d.doctor_name, COUNT(a.appointment_id) AS total
    FROM Doctors d
    LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_name;
END //
DELIMITER ;

-- 20.	Create a stored procedure to display patient name and doctor name for a given appointment_id.
DELIMITER //
CREATE PROCEDURE get_details_by_appointment(IN aid INT)
BEGIN
    SELECT p.patient_name, d.doctor_name
    FROM Appointments a
    JOIN Patients p ON a.patient_id = p.patient_id
    JOIN Doctors d ON a.doctor_id = d.doctor_id
    WHERE a.appointment_id = aid;
END //
DELIMITER ;

call get_details_by_appointment(1001);

-- 21.	Create a procedure to insert a new patient.

DELIMITER //
CREATE PROCEDURE insert_patient(
    IN pid INT,
    IN pname VARCHAR(50),
    IN age INT,
    IN gender VARCHAR(10),
    IN city VARCHAR(50)
)
BEGIN
    INSERT INTO Patients VALUES (pid, pname, age, gender, city);
    
END //
DELIMITER ;

CALL insert_patient(10, 'mohan', 22, 'Male', 'Delhi');

-- 22.	Create a procedure to update consultation fee of a doctor.
DELIMITER //
CREATE PROCEDURE update_doctor_fee(
    IN did INT,
    IN new_fee INT
)
BEGIN
    UPDATE Doctors
    SET consultation_fee = new_fee
    WHERE doctor_id = did;
END //
DELIMITER ;

-- 23.	Create a procedure to delete an appointment.
DELIMITER //
CREATE PROCEDURE delete_appointment(IN aid INT)
BEGIN
    DELETE FROM Appointments
    WHERE appointment_id = aid;
END //
DELIMITER ;