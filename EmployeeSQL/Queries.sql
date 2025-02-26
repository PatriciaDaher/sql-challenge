
--1- EMPLOYEE SALARIES
---- List the employee number, last name, first name, sex, and salary of each employee

SELECT -- selected 5 columns from two different tables
	e.emp_no, 
	e.last_name, 
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e -- the tables are employees aliased as e and sallaries aliased as s connected via an inner join on the emp_no column
INNER JOIN salaries AS s ON (e.emp_no = s.emp_no);
	
--2- EMPLOYEES HIRED IN 1896
---- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT --selected three columns from the employees table 
	first_name, 
	last_name,
	hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986; -- Specified a condition where the year from hire date is 1986


--3- DEPARTMENT MANAGERS 
---- List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT -- selected 5 columns from 3 different tables indicated by their aliases
	dm.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	e.last_name, 
	e.first_name 
FROM dept_manager AS dm -- connected the three tables, dept_manager , departments, and employees, via an inner join on the dept_no and emp_no columns
INNER JOIN departments AS d ON (dm.dept_no = d.dept_no) 
INNER JOIN employees AS e ON (dm.emp_no = e.emp_no)


--4- EMPLOYEE & DEPARTMENT 
---- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT -- selected 5 columns from three different tables identified by their aliases
    de.dept_no, 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM employees AS e --- the three tables, employees, dept_emp, and departments are connected via an inner join on the emp_no and dep_no columns
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no)


--5- HERCULES B
---- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT --Selected three columns
    first_name, 
    last_name, 
    sex
FROM employees -- From the employees table 
WHERE first_name = 'Hercules' -- On condition that the first name is hercules
AND last_name LIKE 'B%';  -- and last name starts with the letter B


--6- SALES DEPARTMENT EMPLOYEES
---- List each employee in the Sales department, including their employee number, last name, and first name

SELECT --selected the three columns
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM employees AS e -- From the employee table aliased e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no) --joined via inner join with the department employee table having the employee number in common
INNER JOIN departments AS d ON (de.dept_no = d.dept_no) -- then joined again via inner join with the departments table on department number 
WHERE d.dept_name = 'Sales'; -- on condition that the department name in the department table , previously aliased as d is sales 


--7- SALES AND DEVELOPMENT DEPARTMENT EMPLOYEES
---- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT --selected the four columns
    e.emp_no, 
    e.last_name, 
    e.first_name,
	d.dept_name
FROM employees AS e --from the employee table aliased as e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no) -- joined via inner join on employee number
INNER JOIN departments AS d ON (de.dept_no = d.dept_no) -- joined again on an inner join via department number
WHERE d.dept_name IN ('Sales','Development'); -- conditions are set such that department entries include either sales or development 


--8- LAST NAME FREQUENCY 
---- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name, --selected last name column
COUNT(*) AS frequency --count last name column
FROM employees -- last name column is selected from the employees table
GROUP BY last_name -- grouped by last name 
ORDER BY frequency DESC; -- results are shown in a column titled frequency organized in descending order 

