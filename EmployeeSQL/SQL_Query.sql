-- 1) List the following details of each employee: employee number, 
--    last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
JOIN salaries as s ON e.emp_no = s.emp_no;

-- 2) List first name, last name, and hire date for employees who 
--    were hired in 1986.

select first_name, last_name, hire_date from employees where hire_date >= '1986-01-01';

-- 3) List the manager of each department with the following 
--    information: department number, department name, the manager's 
--    employee number, last name, first name.

select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
join dept_manager as m on d.dept_no = m.dept_no
join employees as e on m.emp_no = e.emp_no;

-- 4) List the department of each employee with the following 
--    information: employee number, last name, first name, and 
--    department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as q on e.emp_no = q.emp_no
join departments as d on q.dept_no = d.dept_no;

-- 5) List first name, last name, and sex for employees whose first 
--    name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%';

-- 6) List all employees in the Sales department, including their 
--    employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as q on e.emp_no = q.emp_no
join departments as d on q.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.last_name, e.first_name;

-- 7) List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and 
--    department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as q on e.emp_no = q.emp_no
join departments as d on q.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.last_name, e.first_name;

-- 8) In descending order, list the frequency count of employee last 
--    names, i.e., how many employees share each last name.

-- Instructions unclear...
-- In order by last name:
select last_name, count(last_name) from employees
group by last_name
order by last_name desc;
-- In order by frequency:
select last_name, count(last_name) from employees
group by last_name
order by count(last_name) desc;
