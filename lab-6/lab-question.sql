-- 1.Show student name with department name.
select S.student_name,D.dept_name from Student S
join Department D on
S.dept_id = D.dept_id;

-- 2. List all students with courses.

select S.student_name, C.course_name
from Student S
join Enrollment E on S.student_id = E.student_id
join Course C on E.course_id = C.course_id;

-- 3. Display student, course and marks.

select S.student_id, S.student_name, C.course_name, E.marks 
from Student S
join Enrollment E on S.student_id = E.student_id
join Course C on E.course_id = C.course_id;

-- 4. Show courses by department.

select C.course_id,C.course_name,D.dept_name
from Course C 
join Department D on
C.dept_id = D.dept_id;

-- 5. Show all students even without department.

-- for practice purpose check what is difference of using inner join and left join.
select S.student_name, D.dept_name
from Student S
join Department D
on S.dept_id = D.dept_id;

-- now we have to use left join .
select S.student_name, D.dept_name
from Student S
left join Department D
on S.dept_id = D.dept_id;

-- 6. Show all students even without enrollment.

select S.student_name,E.enroll_id,E.course_id
from Student S
left join Enrollment E on
S.student_id = E.student_id;

-- 7. Show all departments even if no students.

select D.dept_name, S.student_name
from Department D
left join Student S
on D.dept_id = S.dept_id;

-- 8. Show all courses even if no enrollment.

select C.course_name, S.student_name,E.enroll_id
from Course C
left join Enrollment E on C.course_id = E.course_id
left join Student S on E.student_id = S.student_id;

-- 9. Full join students and departments.

select S.student_name, D.dept_name
from Student S
left join Department D
on S.dept_id = D.dept_id
union
select S.student_name, D.dept_name
from Student S
right join Department D
on S.dept_id = D.dept_id;

-- 10. Show student, department, course, marks

select S.student_name, D.dept_name, C.course_name, E.marks
from Student S
left join Department D on S.dept_id = D.dept_id
left join Enrollment E on S.student_id = E.student_id
left join Course C on E.course_id = C.course_id;

-- 11. CSE students scoring above 80.

select S.student_name, D.dept_name, C.course_name, E.marks
from Student S
join Department D on S.dept_id = D.dept_id
join Enrollment E on S.student_id = E.student_id
join Course C on E.course_id = C.course_id
where D.dept_name = 'IT'
and E.marks > 80;

-- 12. Count students per department.
select D.dept_name, count(S.student_id) as total_students
from Department D
left join Student S
on D.dept_id = S.dept_id
group by D.dept_name;

-- 13. Average marks per course.

select C.course_name, avg(E.marks) as avg_marks
from Course C
join Enrollment E
on C.course_id = E.course_id
group by C.course_name;

-- 14. Count students per course.
select C.course_name, count(E.student_id) as total_students
from Course C
join Enrollment E
on C.course_id = E.course_id
group by C.course_name;

-- 15. Courses with more than 1 student.

select C.course_name, count(E.student_id) as total_students
from Course C
join Enrollment E
on C.course_id = E.course_id
group by C.course_name
having count(E.student_id) > 1;

-- 16. Departments with more than 2 students.

select D.dept_name, count(S.student_id) as total_students
from Department D
join Student S
on D.dept_id = S.dept_id
group by D.dept_name
having count(S.student_id) > 2;

-- 17. Students from same city.
-- first approach
select city
from Student
group by city
having count(*) > 1;

-- second approach
select student_name, city
from Student
where city in (
    select city
    from Student
    group by city
    having count(*) > 1
);

-- 18. All student-course pairs.
-- one approach
select S.student_name, C.course_name
from Student S, Course C;

-- second approach
select S.student_name, C.course_name
from Student S
cross join Course C;

-- 19. Top scorer in each course.

select S.student_name, C.course_name, E.marks
from Enrollment E
join Student S on E.student_id = S.student_id
join Course C on E.course_id = C.course_id
where E.marks = (
    select max(E2.marks)
    from Enrollment E2
    where E2.course_id = E.course_id
);


-- 20. Department with highest average marks.
select D.dept_name, avg(E.marks) as avg_marks
from Department D
join Student S on D.dept_id = S.dept_id
join Enrollment E on S.student_id = E.student_id
group by D.dept_name
order by avg_marks desc
limit 1;