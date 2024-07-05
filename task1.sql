insert into stud(stud_id, name) values
(1,'jinal'),
(2,'ekta'),
(3,'hina'),
(4,'drashti');

SELECT * FROM Student.stud;

insert into course(course_id,name) values
(101,'bca'),
(102,'bba'),
(103,'mba'),
(104,'mca');

insert into data(course_id, stud_id)
values
(101,1),
(103,2),
(102,3),
(104,4);

select  stud_id,stud_name, course_id,name 
from stud,course;

select * from course;
select * from data;

select s.stud_id, s.stud_name,c.name
 from data d join stud s on d.stud_id=s.stud_id 
 join course c on d.course_id=c.course_id ; 

select stud_id,stud_name , name from stud,course where stud_id  in ( select stud_id  from data);

select c.course_id,c.name as course_name,s.stud_name
 from data d  join stud s on d.stud_id=s.stud_id 
 right join course c on d.course_id=c.course_id ; 

select * from data;

select * from course;



