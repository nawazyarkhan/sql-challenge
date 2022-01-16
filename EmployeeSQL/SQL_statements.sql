--List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees as e
inner join salaries as s on
e.emp_no=s.emp_no order by 1;

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name,hire_date from employees 
where extract(year from hire_date)='1986' ;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
	
	select dep.emp_no,e.last_name,e.first_name, d.dept_name 
	from employees as e inner join dept_manager as dep on e.emp_no=dep.emp_no
	inner join departments as d on dep.dept_no=d.dept_no;
	
				
--List the department of each employee with the following information: employee number, last name, first name, and department name.

	select e.emp_no,e.last_name,e.first_name, d.dept_name 
	from employees as e inner join dept_emp as dep on e.emp_no=dep.emp_no
	inner join departments as d on dep.dept_no=d.dept_no
	order by 1;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees
where first_name='Hercules' and last_name like 'B%'
order by 1;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

	select e.emp_no,e.last_name,e.first_name, d.dept_name 
	from employees as e inner join dept_emp as dep on e.emp_no=dep.emp_no
	inner join departments as d on dep.dept_no=d.dept_no
	where d.dept_name='Sales'
	order by 1;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


	select e.emp_no,e.last_name,e.first_name, d.dept_name 
	from employees as e inner join dept_emp as dep on e.emp_no=dep.emp_no
	inner join departments as d on dep.dept_no=d.dept_no
	where d.dept_name in ('Sales', 'Development')
	order by 1;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as count from employees
group by last_name order by count desc;