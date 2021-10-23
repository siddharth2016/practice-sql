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

SELECT first_name, last_name, gender FROM employees
ORDER BY first_name, last_name DESC

SELECT * FROM employees
WHERE first_name='Aamer' AND last_name LIKE 'Z%'

SELECT * FROM employees
ORDER BY age(birth_date)

SELECT * FROM employees
WHERE first_name ILIKE 'k%'
ORDER BY hire_date

SELECT * FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no
INNER JOIN titles AS t ON t.emp_no = s.emp_no
AND (
t.from_date = s.from_date
OR
t.from_date = s.from_date + INTERVAL '2 days')
ORDER BY e.emp_no


SELECT * FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no

SELECT dept_no, count(emp_no)
FROM dept_emp
GROUP BY dept_no

SELECT hire_date, count(emp_no)
FROM employees
GROUP BY hire_date
ORDER BY hire_date

SELECT e.emp_no, count(t.title)
FROM employees AS e
INNER JOIN titles AS t ON t.emp_no = e.emp_no
WHERE EXTRACT(YEAR FROM hire_date) > 1991
GROUP BY e.emp_no

SELECT e.emp_no, de.from_date, de.to_date
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no

SELECT e.emp_no, count(t.title)
FROM employees AS e
INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR FROM hire_date) > 1991
GROUP BY e.emp_no
HAVING count(t.title) > 2
ORDER BY e.emp_no

SELECT s.emp_no, count(s.salary) AS "# Salary Changed"
FROM salaries AS s
INNER JOIN dept_emp AS de ON s.emp_no = de.emp_no
WHERE de.dept_no = 'd005'
GROUP BY s.emp_no
HAVING count(s.salary) > 15
ORDER BY s.emp_no

SELECT e.emp_no, count(s.from_date) AS "amount of raises"
FROM employees AS e
JOIN salaries AS s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no
HAVING count(s.from_date) > 15
ORDER BY e.emp_no;

SELECT e.emp_no, count(de.dept_no)
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
GROUP BY e.emp_no
HAVING count(de.dept_no) > 1
ORDER BY e.emp_no

SELECT *, avg(salary) OVER()
FROM salaries

SELECT *, avg(salary) OVER(ORDER BY emp_no)
FROM salaries


SELECT DISTINCT emp_no,
last_value(salary) OVER(
    PARTITION BY emp_no
    ORDER BY from_date
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
)
FROM salaries
ORDER BY emp_no


CREATE VIEW "90-95" AS
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1995
ORDER BY emp_no

SELECT * FROM "90-95"

CREATE VIEW "bigbucks" AS 
SELECT e.emp_no, s.salary FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.salary > 80000

SELECT * FROM "bigbucks"


SELECT s.emp_no, s.salary
FROM salaries AS s
INNER JOIN (
    SELECT emp_no, max(from_date) AS "max"
    FROM salaries
    GROUP BY emp_no
) AS ls ON ls.emp_no = s.emp_no
WHERE ls.max = s.from_date