SELECT * FROM Student.employee;
use Student;

select avg(salary) from employee;

-- find all the employees whose salary is more than the average salary of employees;
select * from employee where salary > (select avg(salary) from employee);
with temporarytable(averagevalue) as (select avg(salary) from employee) select* from employee e , temporarytable t where e.salary > t.averagevalue;

select department, sum(salary) from employee group by department having sum(salary) > 50000;

select * from employee order by salary desc;
select emp_fname, salary from employee;

create index emp_index on employee(salary);

show index from employee;

drop index emp_index on employee;
call get_employee;