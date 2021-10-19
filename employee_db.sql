SELECT * FROM "public"."employees"

SELECT * FROM public.departments

SELECT * FROM public.salaries WHERE emp_no=10001

SELECT * FROM public.titles WHERE emp_no=10006

--------------------------------------------------------------

SELECT emp_no AS "Employee #", title AS "Title" FROM public.titles

--------------------------------------------------------------

SELECT concat(emp_no, ' is a ', title) AS "Employee Title" FROM public.titles

SELECT emp_no, concat(first_name, ' ', last_name) AS "Name" FROM public.employees

--------------------------------------------------------------

SELECT count(emp_no) FROM public.employees

SELECT max(salary) FROM public.salaries

SELECT sum(salary) FROM public.salaries

SELECT avg(salary) FROM public.salaries

SELECT max(birth_date) FROM public.employees

-------------------------------------------------------------

SELECT * FROM public.employees WHERE first_name='Mayumi' AND last_name='Schueller'

-------------------------------------------------------------

SELECT first_name FROM employees WHERE gender='F';

-------------------------------------------------------------

SELECT first_name, last_name FROM employees
WHERE first_name='Georgi' AND last_name='Facello'
OR first_name='Bezalel' AND last_name='Simmel'

SELECT * FROM employees
WHERE first_name='Georgi'
OR first_name='Bezalel'

------------------------------------------------------------

SELECT count("gender") FROM employees
WHERE gender='F'

SELECT EXTRACT (YEAR FROM AGE(birth_date)) AS "age" FROM employees
WHERE first_name LIKE 'M%'

SELECT * FROM employees
WHERE first_name LIKE 'A%r'

SHOW timezone;

-- create table timezones (
--     ts timestamp without time zone,
--     tz timestamp with time zone
-- )

-- insert into timezones values (
--     '2021-10-19 10:00:00+05',
--     '2021-10-19 10:00:00-05'
-- )

-- select * from timezones;

SELECT now();
SELECT CURRENT_DATE;

SELECT to_char(CURRENT_DATE, 'dd/mm/yyyy')
SELECT to_char(now(), 'dd/mm/yyyy hh:mm:ss')

SELECT date '2021/10/19'

SELECT now() - '2021-10-18 13:20:00+05:30'

SELECT age(date '1997/01/10')

SELECT age(date '2000/02/25', date '1997/01/10')

SELECT EXTRACT(DAY FROM date '1997/01/10') AS DAY;
SELECT EXTRACT(MONTH FROM date '1997/01/10') AS MONTH;
SELECT EXTRACT(YEAR FROM date '1997/01/10') AS YEAR;

SELECT date_trunc('year', date '1997/01/10')
SELECT date_trunc('month', date '1997/01/10')

SELECT now() + INTERVAL '1 year'

SELECT age(date '2000/02/25', date '1997/01/10')
SELECT date '1997/01/10' + INTERVAL '3 years 1 months 15 days'

SELECT age(birth_date), * FROM employees
WHERE EXTRACT(YEAR FROM age(birth_date)) >= 61

SELECT AGE(birth_date), * FROM employees
WHERE (
   EXTRACT (YEAR FROM AGE(birth_date))
) > 60 ;

SELECT count(hire_date) FROM employees
WHERE EXTRACT (MONTH FROM hire_date) = 2

SELECT max(age(birth_date)) FROM employees

SELECT DISTINCT title FROM titles

SELECT DISTINCT birth_date FROM employees