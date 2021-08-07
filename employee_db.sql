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

