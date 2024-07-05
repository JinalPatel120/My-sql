-- adddate(date)
select adddate('2002-12-12', interval 10 day);

select adddate('2002-12-12 09:32:12',interval 15 minute);

select adddate('2002-12-12', interval -2 month);

-- add time ()

select addtime('2002-12-12 09:32:56',12);

-- curdate()

select curdate() + 1;

select current_date() ;

select current_time();

select current_time() + 1;

select current_timestamp();

select current_user();

select date_format('2002-12-12' , '%d %m %y');

select date_format('2002-12-12' , '%w %m %e %y');

create table student1 ( student_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gpa decimal(2,2) not null,
enrollment_date datetime,
major varchar(50) not null );

create table Program (student_id int, program_name varchar(50) not null, program_start_date date);

create table scholarship ( student_id int, scholarship_amount int(10), scholarship_date date);

insert into student1(
student_id, first_name, last_name, gpa, enrollment_date, major)
values
(201, 'jinal' , 'lathiya' , 9.40, '2023-3-3 3:09', 'BCA'),
(202, 'rutvik' , 'lathiya' ,8.80 , '2024-12-21 12:09:21', 'Mathematics' ),
(203, 'hina', 'mehta', 6.90, '2022-12-31 23:12:11', 'Chemistry'),
(204, 'komal' , 'kukadiya', 9.0, '2020-2-23 9:45:21' , 'CA'),
(205, 'Bhavesh' , 'lathiya', 4.4, '2019-2-12 7:45:40', 'BBA'),
(206, 'nitin', 'gupta' ,6.7, '2018-12-31 6:45:12', 'BA'),
(207, 'diya', 'rathod', 8.9, '2024-12-2 7:8:9', 'BCA'),
(208, 'dixit' , 'vithani', 9.9, '2023-3-3 9:23:00', 'BCA');

select * from student1;

insert into Program ( student_id, program_name, program_start_date
)


