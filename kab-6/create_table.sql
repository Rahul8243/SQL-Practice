CREATE TABLE if not exists Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    building VARCHAR(30)
);

CREATE TABLE if not exists Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    city VARCHAR(30),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE if not exists Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    dept_id INT,
    credits INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
    );
    
CREATE TABLE if not exists  Enrollment (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);