SELECT * FROM Student.salesman;


 
 
 select s.name , c.cust_name ,c.city
 from salesman s
 inner join customer c on s.salesman_id= c.salesman_id where c.city=s.city; 
 
 
 select s.name , c.cust_name , c.city
 from salesman s
 inner join customer c on s.salesman_id=c.salesman_id where c.city=s.city;
 
  
 select s.name , c.cust_name , c.city
 from salesman s
 inner join customer c on s.salesman_id=c.salesman_id group by c.city;
 
 
 select count(cust_name) ,
 city from customer group by city;
 
 select * from customer;
 
 
 create table employee (
 empId int (3) primary key, 
 emp_fname varchar(50) not null ,
 emp_lname varchar(50) not null,
 department varchar(50) not null,
 salary int (50) not null );
 
 insert into employee
 ( empId , emp_fname, emp_lname,department, salary)
 values
 ( 1, 'karan' , 'mehta' , 'HR' , 800000),
 (2, 'rohit' , 'sharma' , 'admin' , 75000),
 ( 3, 'Ankush' , 'Rajput' , 'Account' , 50000),
 (4,'Priyanshi' , 'Sharma' , 'HR', 500000),
 (5, 'sanket' , 'gupta' , 'deveoper' , 100000),
 (6, 'Shrushti' , 'dakhra' , 'admin' , 78000),
 (7 , 'prinsi' , 'mangukiya' , 'admin' , 56000);
 
 select * from employee order by salary desc limit 3,1;
 
 select * from employee where mod(empId,2)=0;
 select * from employee where mod(empId,2)=1;
 
 select * from employee limit 0,4;
 
 select * from employee limit 1,2;
 
 select * from employee limit 5;
 select * from employee order by empId desc limit 5;
 
 select * from employee where empId > ( select max(empId) - 5 from employee);
 
 select * from employee limit 1;
 
 select * from employee order by empId desc limit 1;
 
 select * from employee;
 
 select * from employee order by salary ;
 
 commit;
 
 select * from employee limit 0,1;
 
 select * from employee where empId = (select max(empId) from employee);
 
 select * from employee where empId = ( select max(empId) from employee);
 
 select  empId from employee
 union
 select salary from employee;
 