CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    year INT
);

CREATE TABLE Course (
	course_id int primary key ,
    course_name varchar(50),
    credits int,
    instructor varchar(50)
);
CREATE TABLE Enrollment(
	enroll_id int primary key,
    student_id int,
    course_id int,
    marks int,
    semester varchar(10)
);