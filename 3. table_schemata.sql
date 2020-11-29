-- Check and drop existing tables
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- 1. Create table for Departments
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- 2. Create table for Employee Titles
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(20) NOT NULL,
	PRIMARY KEY (title_id)
);

-- 3. Create table for Employees
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id)
		REFERENCES titles(title_id)
);

-- 4. Create table for Department Employees
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) 
		REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) 
		REFERENCES departments(dept_no)
);

-- 5. Create table for Department Managers
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) 
		REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);

-- 6. Create table for Salaries
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);

-- Follow the table order (1~6) above to import CSVs