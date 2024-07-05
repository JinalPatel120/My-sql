create table student1 ( student_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gpa decimal not null,
enrollment_date datetime,
major varchar(50) not null );

create table Program (student_id int, program_name varchar(50) not null, program_start_date date);

create table scholarship ( student_id int, scholarship_amount int(10), scholarship_date date);

insert into student1(
student_id, first_name, last_name, gpa, enrollment_date, major)
values
(201, 'jinal' , 'lathiya' , 9.40, '2023-3-3 3:09', 'Computer science'),
(202, 'rutvik' , 'lathiya' ,8.80 , '2024-12-21 12:09:21', 'Mathematics' ),
(203, 'hina', 'mehta', 6.90, '2022-12-31 23:12:11', 'Biology'),
(204, 'komal' , 'kukadiya', 9.0, '2020-2-23 9:45:21' , 'Chemistry'),
(205, 'Bhavesh' , 'lathiya', 4.4, '2019-2-12 7:45:40', 'Physics'),
(206, 'nitin', 'gupta' ,6.7, '2018-12-31 6:45:12', 'History'),
(207, 'diya', 'rathod', 8.9, '2024-12-2 7:8:9', 'English'),
(208, 'dixit' , 'vithani', 9.9, '2023-3-3 9:23:00', 'Mathematics');

truncate table student1;

select * from student1;

insert into Program( student_id, program_name, program_start_date)
values
(201, 'Computer science' , '2023-3-3'),
(202, 'Mathematics','2024-2-2'),
(208,'Mathematics' , '2023-12-12'),
(205, 'Physics','2022-1-1'),
(204, 'Chemistry', '2020-12-1'),
(207, 'English', '2019-1-18'),
(206, 'History', '2016-2-3'),
(203,'Biology', '2015-12-1');

select * from Program;

insert into scholarship(student_id, scholarship_amount, scholarship_date)
values
(201, 5000, '2024-2-2'),
(202, 4500, '2022-12-12'),
(203,3000, '2019-1-2'),
(201, 4000, '2019-1-1');

select * from scholarship;

select upper(first_name) as student_name from student1;

select distinct(major) from student1;

-- Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .

select * from student1 order by first_name , major desc;

select substring(first_name, 1,3)from student1;

--  Write a SQL query to print details of the Students with the FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.

select * from student1 where first_name in ('jinal', 'dixit');

-- Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
select distinct major, length(major) from student1;

-- . Write a SQL query to print FIRST_NAME from the Student table after replacing ‘a’ with ‘A’.
select replace(first_name, 'a', 'A') from student1;

select concat(first_name, ' ' , last_name) as Complete_name from student1;

select * from student1 where first_name in ('jinal', 'ekta');

-- Write a SQL query to print details of the Students excluding FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
select * from student1 where first_name not in ('jinal', 'dixit');

--  Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.
select * from student1 where first_name like '%a';

-- Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains six alphabets.
select * from student1 where first_name like '_____a%';

-- 3. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
select * from student1 where gpa between 9.00 and 9.99;

--  Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
select major, count(*) from student1 where major='Computer science';

--  Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
select  concat(first_name, ' ', last_name) as full_name, gpa from student1 where gpa between 8.5 and 9.5;

-- . Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
select major, count(major) from student1 group by major order by major desc;

-- Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
select * from student1 s1 join scholarship s2 on s1.student_id=s2.student_id;

-- Write an SQL query to show only odd rows from Student table.
select * from student1 where student_id %2 !=0;
select * from student1 where student_id %2=0;

-- List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL 
-- for the scholarship details.
select * from student1 s1 left join scholarship s2 on s1.student_id=s2.student_id;

-- 21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
select * from student1 order by gpa desc limit 5;
select * from student1 limit 1,1;

-- Write an SQL query to determine the nth (say n=5) highest GPA from a table.
select * from student1 order by gpa desc limit 4,1;

select * from student1 order by gpa desc;

-- 3. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.
select * from student1 s1 where 4 = ( 
	select count(distinct(s2.gpa) ) from student1 s2 where s2.gpa >=s1.gpa);


select * from student1 s1 where 4 = (select count(distinct(s2.gpa)) from student1 s2);

-- . Write an SQL query to fetch the list of Students with the same GPA.
select s1.* from student1 s1 , student1 s2 where s1.gpa=s2.gpa and s1.student_id != s2.student_id;
select distinct s1.* from student1 s1, student1 s2 where s1.major = s2.major and s1.student_id != s2.student_id;
select distinct s1.* from student1 s1, student1 s2 where s1.last_name= s2.last_name and s1.student_id != s2.student_id;

--  Write an SQL query to show the second highest GPA from a Student table using sub-query.
select max(gpa) from student1 where gpa not in (select max(gpa) from student1);
select max(gpa) from student1 where gpa not in (select max(gpa) from student1 where gpa not in( select max(gpa) from student1));

-- . Write an SQL query to show one row twice in results from a table.
select * from student1 union all  select * from student1 order by student_id;

-- Write an SQL query to list STUDENT_ID who does not get Scholarship.
select * from student1 where student_id not in (select student_id from scholarship);

-- . Write an SQL query to fetch the first 50% records from a table
select * from student1 where student_id <= (select count(student_id) /2 from student1);
SELECT * FROM Student WHERE STUDENT_ID <= (SELECT COUNT(STUDENT_ID)/2 FROM Student);


-- Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.
select major, count(major) from student1 group by major having count(major) < 2;

-- . Write an SQL query to show all MAJOR subject along with the number of people in there.
select major, count(major) from student1 group by major;

	-- Write an SQL query to show the last record from a table.
select * from student1 where student_id = (select max(student_id) from student1);

-- Write an SQL query to fetch the first row of a table.
select * from student1 where student_id= (select min(student_id) from student1 );

-- Write an SQL query to fetch the last five records from a table.
select * from student1 order by student_id desc limit 5;
select * from ( select * from student1 order by student_id desc limit 5) as subquery order by student_id;
select * from ( select * from student1 order by student_id desc limit 5) as subquery order by student_id;

select s.*, lag(gpa) over(partition by first_name order by student_id ) as previous_student from student1 s;

-- Write an SQL query to fetch nth max GPA from a table.
select distinct gpa from student1 s1 where 6 >= (select count(distinct gpa) from student1 s2 where s1.gpa <= s2.gpa) order by s1.gpa desc;

select s.*, lag(gpa) over (partition by first_name order by student_id) as previous_student from student1 s;
