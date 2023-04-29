-- list of the employee number, lastname, first name, sex and salary in assecding order.
select a.emp_no last_name, first_name, sex, salary
from employees a, salaries b 
where a.emp_no = b.emp_no 
order by a.emp_no, last_name, first_name asc;

-- List the first name, last name, and hire date for the employees who were hired in 1986.	
select a.emp_no, last_name, first_name, sex, salary, hire_date
from employees a inner join salaries b
on a.emp_no = b.emp_no 
where DATE_PART('year',hire_date) = 1986
order by a.emp_no asc;

-- List the manager of each department along with their department number, department name, 
-- employee number, last name and first name.
select  d.dept_no, d.dept_name,  a.emp_no, last_name,first_name
from dept_manager m left join departments d 
on m.dept_no = d.dept_no
left join employees a on a.emp_no = m.emp_no

-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
select  d.dept_name,  a.emp_no, em.dept_no, last_name,first_name
from dept_manager m left join departments d 
on m.dept_no = d.dept_no
left join employees a on a.emp_no = m.emp_no
left join dept_emp em on em.dept_no = d.dept_no

-- List the first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.
select a.emp_no , first_name, last_name, sex
from employees a
where first_name = 'Hercules'
and  last_name like 'B%';
--List each employee in the Sales department, including their employee number, last name, and 
--first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name FROM employees 
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name FROM employees 
LEFT JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')
ORDER BY departments.dept_name DESC;

-- List the frequency counts, in decending order, of all the employee last names
-- (that is, how many employees
SELECT last_name, COUNT(*) AS count 
FROM employees 
GROUP BY last_name
ORDER BY last_name DESC;