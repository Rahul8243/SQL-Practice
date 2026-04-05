-- 1. display the details of students sorted by age in ascending order. 

select * from List_student order by age desc;

-- 2. display the number of students in each semester.

SELECT Semester, COUNT(*) AS Total_Students
FROM List_student
GROUP BY Semester;

-- 3.Display the courses which are having more than 2 credits sorted in descending order. 


select * from List_courses
where credits > 2
order by credits desc;

-- 4.Display courses offered in semesters 3 and 5 ordered by course code.   
select * from List_courses
where semester = 3 or semester = 5
order by course_code;

-- 5.List courses by descending order of credits and then ascending order of semesters. 
    
select * from List_courses
order by credits desc,semester asc;
    
-- 6.Find the maximum credits among courses for each instructor.

SELECT Instructor_id, MAX(Credits) AS Max_Credits
FROM List_courses
GROUP BY Instructor_id;

-- 7.Display the number of courses offered by each instructor in semester 3. 

SELECT Instructor_id, COUNT(*) AS Course_Count
FROM List_courses
WHERE Semester = 3
GROUP BY Instructor_id;

-- 8.Create a view that lists instructors and the number of courses they teach.
DROP VIEW IF EXISTS Instructor_Course_Count;

CREATE VIEW Instructor_Course_Count AS
SELECT Instructor_id, COUNT(*) AS Total_Courses
FROM List_courses
GROUP BY Instructor_id;

SELECT * FROM Instructor_Course_Count;


-- 9.Create a view that lists students and the number of courses they are registered for.   

CREATE VIEW Student_Course_Count AS
SELECT Registration_id, COUNT(Course_code) AS Total_Courses
FROM List_student
GROUP BY Registration_id;

SELECT * FROM Student_Course_Count;
    
-- 10.Create a view that shows students registered in semester 3, ordered by age.

create view semester3_student as
select * from List_student
where semester =3
order by age asc;

select * from semester3_student;

-- 11.Create a view that shows the count of instructors in each department, ordered by department name.  
desc Instructor_details;
select * from Instructor_details;

DROP VIEW IF EXISTS Department_Instructor_Count;

CREATE VIEW Department_Instructor_Count AS
SELECT Department,
       COUNT(*) AS Total_Instructors
FROM Instructor_details
GROUP BY Department
ORDER BY Department;

select * from Department_Instructor_Count;


-- Each student must create five unique questions and write the answers to
 -- each question separately. If we want to use keys, then clearly specify 
--  the primary key for each table
--  and the foreign keys for related tables. These keys must also be 
--  reflected by making the necessary changes in the table structure.


-- 1.Find the number of students in each semester.    

SELECT Semester, COUNT(*) AS Total_Students
FROM List_student
GROUP BY Semester;

-- 2.Find the number of courses offered in each semester.
SELECT Semester, COUNT(*) AS Total_Courses
FROM List_courses
GROUP BY Semester;

-- 3.Find the number of instructors in each department.
SELECT Department, COUNT(*) AS Total_Instructors
FROM Instructor_details
GROUP BY Department;

-- 4.Find how many students are enrolled in each course.
SELECT Course_code, COUNT(*) AS Total_Students
FROM List_student
GROUP BY Course_code;

-- 5.Create a view that shows the number of students above age 20 in each semester.

CREATE VIEW Senior_Students_Count AS
SELECT Semester, COUNT(*) AS Total_Students
FROM List_student
WHERE Age > 20
GROUP BY Semester;

select * from Senior_Students_Count;