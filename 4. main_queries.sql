-- After importing employees CSV, we need to change the datatype of birth_date 
-- and hire_date from VARCHAR to Date. (When importing, the date format was not matched.)
ALTER TABLE employees ALTER COLUMN birth_date TYPE DATE 
using to_date(birth_date, 'MM/DD/YYYY');
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM/DD/YYYY');


-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS "Employee Number"
		, e.last_name AS "Last Name"
		, e.first_name AS "First Name"
		, e.sex AS "Sex"
		, s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name AS "First Name"
		, last_name AS "Last Name"
		, hire_date AS "Hire Date"
FROM employees
WHERE extract(year from hire_date) = 1986;


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no AS "Department Number"
		, d.dept_name AS "Department Name"
		, dm.emp_no AS "Manager Emp Num"
		, e.last_name AS "Last Name"
		, e.first_name AS "First Name"
FROM dept_manager AS dm
JOIN departments AS d
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no
ORDER BY dm.dept_no, dm.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT de.emp_no AS "Employee Number"
		, e.last_name AS "Last Name"
		, e.first_name AS "First Name"
		, d.dept_name AS "Department Name"
FROM dept_emp AS de
JOIN employees AS e
	ON e.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
ORDER BY de.emp_no;


-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT first_name AS "First Name"
		, last_name AS "Last Name"
		, sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name like 'B%';


-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number"
	, e.last_name AS "Last Name"
	, e.first_name AS "First Name"
	, d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number"
		, e.last_name AS "Last Name"
		, e.first_name AS "First Name"
		, d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name AS "Last Name"
		, count(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC;