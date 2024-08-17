-- creating a database
create database if not exists employes_db;
use employes_db; 

create table if not exists employees (
emp_no int primary key ,
birth_date date not null,
first_name varchar(14) not null,
last_name varchar(16) not null,
hire_date date not null,
gender char(1) check (gender in ('m', 'f'))
);

create table if not exists titles (
emp_no int not null, -- foriegn key to employees
title varchar(50) primary key,
from_date Date not null,
to_date Date not null
);

create table if not exists salaries (
emp_no int not null, -- foriegn key to employees
salary int not null,
from_date Date not null,
to_date Date not null
);

create table if not exists departments (
dep_no char(4) not null,
dept_name varchar(40) primary key
);
drop table departments;

create table if not exists departments (
dep_no int not null,
dept_name varchar(40) primary key
);
drop table departments;
create table if not exists departments (
dep_no int primary key,
dept_name varchar(40) not null
);


create table if not exists dept_manager (
dep_no int not null, -- foriegn key to departments
emp_no int not null, -- foriegn key to employees
from_date Date not null,
to_date Date not null
);

create table if not exists dept_emp (
emp_no int not null, -- foriegn key to employees,
dep_no char(4) not null, -- foriegn key to departments
from_date Date not null,
to_date Date not null
);
drop table dept_emp;

create table if not exists dept_emp (
emp_no int not null, -- foriegn key to employees,
dep_no int not null, -- foriegn key to departments
from_date Date not null,
to_date Date not null
);

create table if not exists dept_emp (
emp_no int not null, -- foriegn key to employees,
dep_no int not null, -- foriegn key to departments
from_date Date not null,
to_date Date not null
);

alter table titles
add constraint foreign key (emp_no) references employees(emp_no);

alter table salaries
add constraint foreign key (emp_no) references employees(emp_no);

alter table dept_emp
add constraint foreign key (emp_no) references employees(emp_no),
add constraint foreign key (dep_no) references departments(dep_no);

alter table dept_manager
add constraint foreign key (emp_no) references employees(emp_no),
add constraint foreign key (dep_no) references departments(dep_no);

insert into employees 
values (10001,"1980/1/15","Charles","Knights","2001/7/15","m"),
       (10002,"1982/3/25","Ella","Chapman","2005/2/28","f"),
       (10003,"1975/12/10","Jade","Adams","2003/11/10","m"),
       (10004,"1988/5/20","Kyle","Boris","2007/9/15","f"),
       (10005,"1984/8/30","Alex","Vincent","2002/4/20","m"),
       (10006,"1981/6/12","Emma","Douglas","2004/3/18","f"),
       (10007,"1979/10/5","Muhammad","Patterson","2006/8/22","m"),
       (10008,"1983/9/17","Chloe","Bryant","2008/11/30","f"),
       (10009,"1986/2/28","Mattew","David","2010/5/14","m"),
       (10010,"1989/7/19","Rose","Kent","2009/3/26","f");
       
insert into departments 
values (001,"HR"),
		(002,"Finance"),
		(003,"Marketing"),
		(004,"Engineering"),
		(005,"Sales"),
		(006,"IT"),
		(007,"Operations"),
		(008,"Research"),
		(009,"Quality Assurance"),
		(010,"Customer Service");
        
insert into salaries
values (10001,"60000","2001-7-15","2003-1-1"),
		(10002,"55000","2005-2-28","2007-1-1"),
		(10003,"65000","2006-1-1","2010-12-31"),
		(10004,"71000","2007-9-15","9999-1-1"),
		(10005,"62200","2004-1-1","9999-1-1"),
		(10006,"63000","2004-3-18","9999-1-1"),
		(10007,"61000","2006-8-22","9999-1-1"),
		(10008,"64000","2008-11-30","9999-1-1"),
		(10009,"67000","2010-5-14","9999-1-1"),
		(10010,"59000","2009-3-26","9999-1-1");
        
insert into titles
values (10001,"receptionist","2001-7-15","2005-2-28"),
		(10002,"senior analyst","2005-2-28","2007-1-1"),
		(10003,"Treasurer","2003-11-10","2006-1-1"),
		(10004,"production manager","2007-9-15","9999-1-1"),
		(10005,"Sales rep","2002-4-20","9999-1-1"),
		(10006,"Analyst","2004-3-18","9999-1-1"),
		(10007,"technician","2006-8-22","9999-1-1"),
		(10008,"Coordinator","2008-11-30","9999-1-1"),
		(10009,"Engineer","2010-5-14","9999-1-1"),
		(10010,"Sales Associate","2009-3-26","9999-1-1");
        
insert into dept_emp 
values (10001,001,"2001-7-15","9999-1-1"),
		(10002,002,"2005-2-28","9999-1-1"),
		(10003,003,"2003-10-11","2010-12-31"),
		(10004,004,"2007-9-15","9999-1-1"),
		(10005,005,"2002-4-20","9999-1-1"),
		(10006,001,"2004-3-18","9999-1-1"),
		(10007,002,"2006-8-22","9999-1-1"),
		(10008,003,"2008-11-30","9999-1-1"),
		(10009,004,"2010-5-14","9999-1-1"),
		(10010,005,"2009-3-26","9999-1-1");
        
insert into dept_manager 
values (001,"10001","2001-7-15","2005-2-28"),
		(002,"10002","2005-2-28","2007-9-15"),
		(003,"10003","2003-11-10","9999-1-1"),
		(004,"10004","2007-9-15","2010-12-31"),
		(005,"10005","2002-4-20","9999-1-1"),
		(001,"10006","2004-3-18","9999-1-1"),
		(002,"10007","2006-8-22","9999-1-1"),
		(003,"10008","2008-11-30","9999-1-1"),
		(004,"10009","2010-5-14","9999-1-1"),
		(005,"10010","2009-3-26","9999-1-1");
        
select first_name, last_name -- analysis question 1
from employees;

select * -- analysis question 2
from departments;

select count(*) as total_employees -- question 3
from employees;

select avg(salary) as average_salary -- question 4
from salaries;

select birth_date, hire_date -- question 5
from employees
where emp_no like 10003;

select emp_no,title -- question 6
from titles;

select count(*) as total_departments -- question 7
from departments;

select d.dep_no, d.dept_name -- question 8
from dept_emp de
join departments d on de.dep_no = d.dep_no
where de.emp_no = 10004;

select gender -- question 9
from employees 
where emp_no like 10007;

select max(salary) as highest_salary -- question 10
from salaries;

select e.emp_no, e.first_name, e.last_name, s.salary -- question 13
from employees e
join salaries s on e.emp_no = s.emp_no
where salary > 60000;
   
   
select  d.dept_name , avg(s.salary) as average_salary -- question 14
from employees e
join salaries s on e.emp_no = s.emp_no
join departments d on dep_no = d.dep_no
group by d.dept_name;

select e.emp_no, e.first_name, e.last_name, t.title -- question 15
from employees e
join dept_manager dm on e.emp_no = dm.emp_no
join titles t on e.emp_no = t.emp_no;

select d.dept_name,count(emp_no) as total_employee -- question 16
from employees e 
join departments d on dep_no = d.dep_no
group by d.dept_name;

select d.dep_no, d.dept_name  -- question 17
from departments d
join employees e on d.dep_no = dep_no
where e.hire_date = (select MAX(hire_date) 
from employees);

select d.dep_no, d.dept_name, avg(e.salary) as average_salary  -- undone
from departments d
join employees e on d.dep_no = e.dep_no
group by d.dep_no, d.dept_name
having count(e.emp_no) > 3;

select e.emp_no, e.first_name, e.last_name, t.title -- question 18
from employees e
join titles t on e.emp_no = t.emp_no
where year(e.hire_date) like 2005;

select d.dep_no, d.dept_name,avg(salary) as average_salary
from departments d
join titles t on d.dep_no = t.dep_no
join employees e on de.emp_no = e.emp_no
group by d.dep_no, d.dept_name
order by average_salary 
desc limit 1;

select e.emp_no, e.first_name,e.last_name,s.salary -- qustion 21
from employees e
join salaries s on e.emp_no = s.emp_no
where hire_date < '2005-01-01';

select d.dep_no, d.dept_name,count(de.emp_no) as 'total employees'
from departments
join dept_emp de on d.dep_no  = de.dep_no
join employees e on de.emp_no = e.emp_no
join dept_manager dm on d.dep_no = dm.dep_no
join employees m on dm.emp_no = m.emp_no
where m.gender ='f'
group by d.dep_no, d.dept_name;

select e.emp_no,e.first_name,e.last_name,d.dept_name -- question 23
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dep_no = d.dep_no
where d.dept_name = 'finance'
and de.to_date = '9999-01-01';

SELECT d.dep_no,d.dept_name,e.emp_no,e.first_name,e.last_name,s.salary -- question 24
FROM departments d
JOIN dept_emp de ON d.dep_no = de.dep_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary = (
        SELECT MAX(s2.salary)
        FROM dept_emp de2
        JOIN salaries s2 ON de2.emp_no = s2.emp_no
        WHERE de2.dep_no = d.dep_no)
AND s.to_date = '9999-01-01';

SELECT e.emp_no,e.first_name,e.last_name,d.dept_name -- question 25
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dep_no = d.dep_no;

select count(*) -- question 26
from titles t 
where t.title = 'senior manager';

SELECT d.dep_no,d.dept_name,COUNT(de.emp_no) -- question 27
FROM departments d
JOIN dept_emp de ON d.dep_no = de.dep_no
WHERE TIMESTAMPDIFF(YEAR, de.from_date, IFNULL(de.to_date, CURDATE())) > 5
GROUP BY de.dep_no, d.dept_name;

SELECT emp_no,first_name,last_name,hire_date, -- question 28
TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS 'Tenure (Years)'
FROM employees
ORDER BY hire_date ASC
LIMIT 1;

SELECT e.emp_no,e.first_name,e.last_name,t.title -- question 29
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE e.hire_date BETWEEN '2005-01-01' AND '2006-01-01'; 

SELECT d.dep_no,d.dept_name,MIN(e.birth_date) AS 'Oldest Employee Birth Date' -- question 30
FROM departments d
JOIN dept_emp de ON d.dep_no = de.dep_no
JOIN employees e ON de.emp_no = e.emp_no
GROUP BY d.dep_no, d.dept_name;