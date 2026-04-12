-- 1.Find the average marks of each course but show only courses whose average is ≥ 75.

SELECT C.course_id, C.course_name, AVG(E.marks) AS avg_marks
FROM Course C
JOIN Enrollment E 
ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name
HAVING AVG(E.marks) >= 75;

-- 2.Count how many students enrolled in each instructor’s courses.

SELECT C.instructor, COUNT(E.student_id) AS total_students
FROM Course C
JOIN Enrollment E
ON C.course_id = E.course_id
GROUP BY C.instructor;

-- 3.Display department-wise maximum marks obtained by any student.

select S.department,max(E.marks) as maximum_marks 
from Student S
join Enrollment E on
S.student_id = E.student_id
group by S.department;

-- 4.Find the course with the highest average marks.

select C.course_id,C.course_name, avg(E.marks) as highest_Avg_marks
from Course C
join Enrollment E on
C.course_id = E.course_id
group by C.course_id,C.course_name
ORDER BY highest_Avg_marks DESC
limit 1;

-- 5.List departments where more than 2 students have appeared in DBMS.

select S.department, count(S.student_id) as total_student
from Student S
join Enrollment E on
S.student_id = E.student_id
join Course C on
E.course_id = C.course_id
where course_name = 'DBMS'
group by S.department
having count(S.student_id) > 2;

-- 6.Find instructors whose average student marks exceed the overall average marks of all students.

select C.instructor, avg(E.marks) as avg_marks
from Course C
join Enrollment E on
C.course_id = E.course_id
group by C.instructor
having avg(E.marks) > (select avg(marks) from enrollment);

-- 5.Show courses where minimum marks ≥ 60.

select C.course_id,min(E.marks) as minimum_marks
from Course C 
join Enrollment E using (course_id)
group by course_id
having min(E.marks) >= 60;

-- 8.Find students who scored more than the average marks of their respective course.

SELECT S.student_id, S.name, E.course_id, E.marks
FROM Student S
JOIN Enrollment E USING(student_id)
WHERE E.marks > (
        SELECT AVG(marks)
        FROM Enrollment
        WHERE course_id = E.course_id
);

-- 8.List students who scored less than the average marks of DBMS.

-- for Practice purpose find avg marks of DBMS.
SELECT C.course_name, AVG(E.marks) AS avg_marks
FROM Course C
JOIN Enrollment E USING(course_id)
WHERE C.course_name = 'DBMS'
GROUP BY C.course_name;

SELECT S.student_id, S.name, E.marks
FROM Student S
JOIN Enrollment E USING(student_id)
WHERE E.marks < (
        SELECT AVG(E2.marks)
        FROM Enrollment E2
        JOIN Course C ON E2.course_id = C.course_id
        WHERE C.course_name = 'DBMS'
);


-- 10.Find courses whose average marks are higher than AI’s average marks.

-- first we have to find average mark's of AI.

select C.course_name,avg(E.marks) as avg_marks
from Course C 
join Enrollment E using(course_id)
where course_name ='AI';

SELECT C.course_name, AVG(E.marks) AS avg_marks
FROM Course C
JOIN Enrollment E USING(course_id)
GROUP BY C.course_name
HAVING AVG(E.marks) > (
    SELECT AVG(E2.marks)
    FROM Enrollment E2
    JOIN Course C2 ON E2.course_id = C2.course_id
    WHERE C2.course_name = 'AI'
);

-- 11.Display students who are enrolled in more courses than the average enrollment per student.

-- No.of student enroll courses
SELECT student_id, COUNT(course_id) AS total_courses
FROM Enrollment
GROUP BY student_id;

-- Average enrollment per student
SELECT AVG(course_count)
FROM (
      SELECT COUNT(course_id) AS course_count
      FROM Enrollment
      GROUP BY student_id
) AS t;


SELECT student_id, COUNT(course_id) AS total_courses
FROM Enrollment
GROUP BY student_id
HAVING COUNT(course_id) > (SELECT 
AVG(course_count) FROM
(SELECT COUNT(course_id) AS course_count
FROM Enrollment
GROUP BY student_id) AS avg_table);

-- 12.Find names of students who have never scored below 70 in any course.

SELECT S.name FROM Student S
JOIN Enrollment E 
ON S.student_id = E.student_id
GROUP BY S.student_id, S.name
HAVING MIN(E.marks) >= 70;

-- 13.List students who are enrolled in all courses taught by Dr. Sharma.

-- students who enrolled courses by  Dr. Sharma.

SELECT S.student_id, S.name, E.course_id
FROM Student S
JOIN Enrollment E ON S.student_id = E.student_id
JOIN Course C ON E.course_id = C.course_id
WHERE C.instructor = 'Dr. Sharma';

-- courses taught by Dr.sahrma
SELECT COUNT(*)
FROM Course
WHERE instructor = 'Dr. Sharma';

-- Final Answer
select S.student_id,S.name from Student S
join Enrollment E on 
S.student_id = E.student_id
join Course C on 
E.course_id = C.course_id
where C.instructor = 'Dr. Sharma'
group by S.student_id,S.name
having count(distinct C.course_id) = (select count(*) from Course where instructor = 'Dr. Sharma');

-- 14.	Find instructors who teach more than one course.

SELECT instructor, COUNT(course_id) AS total_courses
FROM Course
GROUP BY instructor
HAVING COUNT(course_id) > 1;


-- 15.Display top 3 students based on average marks.

-- one approach without showing name
select student_id, avg(marks) as avg_marks
from Enrollment
group by student_id
order by avg_marks desc
limit 3;

-- second approach
SELECT S.student_id, S.name, AVG(E.marks) AS avg_marks
FROM Student S
JOIN Enrollment E ON S.student_id = E.student_id
GROUP BY S.student_id, S.name
ORDER BY avg_marks DESC
LIMIT 3;

-- 16.Find the second highest mark obtained in DBMS.

-- first approach
select E.course_id,C.course_name, E.marks
from Enrollment E 
join Course C on 
E.course_id = C.course_id
where C.course_name ='DBMS'
order by E.marks desc
limit 1 offset 1;

-- second Approach
SELECT MAX(E.marks) AS second_highest
FROM Enrollment E
JOIN Course C ON E.course_id = C.course_id
WHERE C.course_name = 'DBMS'
AND E.marks < (
        SELECT MAX(E2.marks)
        FROM Enrollment E2
        JOIN Course C2 ON E2.course_id = C2.course_id
        WHERE C2.course_name = 'DBMS'
);

-- 17.Show top 2 courses with the highest number of enrollments.

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS total_enrollments
FROM Course C
JOIN Enrollment E 
ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name
ORDER BY total_enrollments DESC
LIMIT 2;

 
-- 18.Display output as
-- Student: Amit (CSE) - Avg Marks: 80.00


SELECT CONCAT(
        'Student: ', S.name, 
        ' (', S.department, ') - Avg Marks: ',
        FORMAT(AVG(E.marks),2)
       ) AS result
FROM Student S
JOIN Enrollment E 
ON S.student_id = E.student_id
GROUP BY S.student_id, S.name, S.department;



-- 19.Show
-- Course: DBMS | Instructor: Dr. Rao | Avg Marks: XX

SELECT CONCAT(
       'Course: ', C.course_name,
       ' | Instructor: ', C.instructor,
       ' | Avg Marks: ', FORMAT(AVG(E.marks),2)
       ) AS result
FROM Course C
JOIN Enrollment E
ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name, C.instructor;
	
-- 20.	Find students who scored above department average but below overall university average.

select * from Enrollment;
select * from Course;
select * from Student;

SELECT S.student_id, S.name, S.department, E.marks
FROM Student S
JOIN Enrollment E 
ON S.student_id = E.student_id
WHERE E.marks > (
        SELECT AVG(E2.marks)
        FROM Enrollment E2
        JOIN Student S2 
        ON E2.student_id = S2.student_id
        WHERE S2.department = S.department
)
AND E.marks < (
        SELECT AVG(marks)
        FROM Enrollment
);
