-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from "Employees" e
inner join "Salaries" s on
(e.emp_no = s.emp_no);

-- 2. List employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date
from "Employees" e
inner join "Dept_emp" d on
e.emp_no = d.emp_no
where e.hire_date >= '1/1/1986' 
and e.hire_date <= '12/31/1986'
and d.to_date = '1/1/9999'
order by e.hire_date asc;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.

select d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name, de.from_date, de.to_date
from "Departments" as d
inner join "Dept_manager" as m on
d.dept_no = m.dept_no
inner join "Employees" as e on
m.emp_no = e.emp_no
inner join "Dept_emp" as de on
m.emp_no = de.emp_no
where m.to_date = '1/1/9999'
order by d.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e
join "Dept_emp" de
on (e.emp_no = de.emp_no) and de.to_date = '1/1/9999'
join "Departments" d
on (de.dept_no = d.dept_no)
order by e.emp_no

-- 5. List all employees whose first name is "Hercules" 
-- and last names begin with "B."

select e.* 
from "Employees" e, "Dept_emp" de
where e.first_name = 'Hercules'
and e.last_name like 'B%'
and e.emp_no = de.emp_no
and de.to_date = '1/1/9999'
order by e.emp_no

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e
join "Dept_emp" de
on (e.emp_no = de.emp_no) 
and de.to_date = '1/1/9999'
join "Departments" d
on (de.dept_no = d.dept_no and d.dept_name = 'Sales')
order by e.emp_no;

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Employees" e
join "Dept_emp" de
on (e.emp_no = de.emp_no) 
and de.to_date = '1/1/9999'
join "Departments" d
on (de.dept_no = d.dept_no and (d.dept_name = 'Sales' or d.dept_name = 'Development'))
order by e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select e.last_name, count(e.last_name) as number
from "Employees" e
join "Dept_emp" de
on (e.emp_no = de.emp_no) 
and de.to_date = '1/1/9999'
group by e.last_name
order by number desc;
