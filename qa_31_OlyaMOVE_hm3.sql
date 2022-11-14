create table employees(
     id serial primary key,
     employee_name varchar (50) unique not null
 );

create table salary(
       id serial primary key,
       monthly_salary int not null
);
      
create table employee_salary(
       id serial primary key,
       employee_id int not null unique, 
       salary_id int not null);      
 
create table roles1(
     id serial primary key,
     role_name int not null unique
);      
      
create table roles_employee(
       id serial primary key,
       employee_id int not null unique,
       role_id int not null,
       foreign key (employee_id)
        references employees (id),
        foreign key (role_id)
        references roles1 (id)
);

alter table roles1 alter column role_name type varchar (30);


drop table employee_salary;
drop table roles;


select * from employees;
select * from salary;
select * from employee_salary;
select * from roles1;
select * from roles_employee;

insert into roles_employee (employee_id, role_id)
values (5, 20),
       (6, 19),
       (7, 18),
       (8, 17),
       (9, 16),
       (10, 15),
       (11, 14),
       (12, 13),
       (13, 12),
       (1, 11),
       (4, 10),
       (14, 9),
       (15, 8),
       (20, 7),
       (70, 6),
       (71, 5),
       (72, 4),
       (73, 3),
       (117, 2),
       (116, 1),
       (100, 1),
       (101, 2),
       (102, 3),
       (103, 4),
       (104, 5),
       (108, 6),
       (110, 7),
       (111, 8),
       (113, 9),
       (114, 10),
       (115, 11),
       (80, 12),
       (85, 13),
       (86, 14),
       (90, 15),
       (97, 16),
       (98, 17),
       (99, 18),
       (96, 19),
      (105, 20);


insert into roles1 (role_name)
values ('Junior_Python_developer'),
       ('Middle_Python_developer'),
       ('Senior_Python_developer'),
       ('Junior_Java_developer'),
       ('Middle_Java_developer'),
       ('Senior_Java_developer'),
       ('Junior_JavaScript_developer'),
       ('Middle_JavaScript_developer'),
       ('Senior_JavaScript_developer'),
       ('Junior_Manual_QA_engineer'),
       ('Middle_Manual_QA_engineer'),
       ('Senior_Manual_QA_engineer'),
       ('Project_Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales_manager'),
       ('Junior_Automation_QA_engineer'),
       ('Middle_Automation_QA_engineer'),
       ('Senior_Automation_QA_engineer');
       
       
       


insert into employee_salary(employee_id, salary_id)
values (1, 4),
       (4, 1),
       (5, 2),
       (6, 3),
       (7, 5),
       (8, 6),
       (9, 7),
       (10, 8),
       (11, 9),
       (12, 10),
       (13, 11),
       (14, 12),
       (15, 13),
       (16, 14),
       (17, 15),
       (18, 16),
       (20, 17),
       (21, 18),
       (22, 19),
       (23, 20),
       (24, 21),
       (25, 22),
       (70, 23),
       (71, 24),
       (72, 25),
       (73, 20),
       (74, 4),
       (75, 5),
       (76, 6),
       (77, 8),
       (140, 9),
       (141, 11),
       (142, 15),
       (143, 22),
       (144, 25),
       (145, 18),
       (146, 7),
       (147, 15),
       (148, 17),
       (150, 16);

insert into salary(monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);



insert into employees (employee_name)
values ('Robert'),
       ('Elizaveta'),
       ('Ulyana'),
       ('Vasiliy'),
       ('Grigoriy'),
       ('Valentina'),
       ('Maksim'),
       ('Daniel'),
       ('Elza'),
       ('Vitaliy'),
       ('Vadzim'),
       ('Roma');
       
      
      
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employee_salary
join salary on salary.id = employee_salary.salary_id
join employees on employees.id = employee_salary.employee_id
where monthly_salary < 2000;


--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary
left join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
where employee_name is null


--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary from employee_salary
left join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
where employee_name is null
and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary from employee_salary
join salary on salary.id = employee_salary.salary_id
right join employees on employees.id = employee_salary.employee_id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id;

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id
where role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id
where role_name like '%QA_engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id
where role_name like '%Manual_QA_engineer%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from roles_employee
join employees on employees.id = roles_employee.employee_id
join roles1 on roles1.id = role_id
where role_name like '%Manual_QA_engineer%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select role_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков
select role_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Junior_Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Middle_JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Senior_Java%';

--20. Вывести зарплаты Junior QA инженеров
select role_name, salary.monthly_salary from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Junior%QA_engineer%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%QA_engineer%';

--24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%QA_engineer%';

--25. Вывести количество QA инженеров
select count(role_name) from roles1
where role_name like '%QA_engineer%';

-- 26. Вывести количество Middle специалистов.
select count(role_name) from roles1
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count(role_name) from roles1
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary; 

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where monthly_salary < 2300
order by monthly_salary; 

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, salary.monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles1 on roles1.id = roles_employee.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary; 