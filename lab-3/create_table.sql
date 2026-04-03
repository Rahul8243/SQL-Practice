CREATE TABLE Instructor_details (
    Instructor_id INT,
    Instructor_name VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE List_courses (
	course_code VARCHAR(10),
    course_title VARCHAR(50),
    credits INT,
    semester INT,
    instructor_id INT
);

CREATE TABLE List_student (
    Registration_id VARCHAR(10),
    S_Name VARCHAR(50),
    Semester INT,
    Course_code VARCHAR(10),
    Age INT,
    Instructor_id INT
);
