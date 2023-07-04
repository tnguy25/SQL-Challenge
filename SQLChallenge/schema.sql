-- Creating tables for EmployessDB
CREATE TABLE departments (
	dept_no VARCHAR (40)NOT NULL,
	dept_name VARCHAR (40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);
CREATE TABLE dept_emp(
    emp_no int NOT NULL,
    dept_no VARCHAR(40) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR (40)NOT NULL,
    emp_no int NOT NULL,
 PRIMARY KEY (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE Employees (
    emp_no int NOT NULL,
    emp_title_id VARCHAR (40) NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES salaries (emp_title_id)
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
	PRIMARY KEY (emp_no),
);

CREATE TABLE titles (	
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);	

--CHALLENGES
SELECT e.emp_no, e.first_name, e.last_name,e.sex, e.birth_date, s.salary, 
	t.title 
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS t
ON (e.emp_title_id=t.title_id);

SELECT  e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT e.emp_no, e.first_name, e.last_name,
	d.dept_no, d.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_manager AS d ON de.dept_no = d.dept_no)
INNER JOIN employees AS e ON d.emp_no = e.emp_no);

SELECT e.emp_no, e.first_name, e.last_name,
	dp.dept_no, dp.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_emp AS dp ON de.dept_no = dp.dept_no)
INNER JOIN employees AS e ON dp.emp_no = e.emp_no);

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules%' AND last_name LIKE 'B%';

 SELECT e.emp_no, e.first_name, e.last_name,
	dp.dept_no, dp.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_emp AS dp ON de.dept_no = dp.dept_no)
INNER JOIN employees AS e ON dp.emp_no = e.emp_no)
WHERE dept_name IN ('Sales');

SELECT e.emp_no, e.first_name, e.last_name,
	dp.dept_no, dp.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_emp AS dp ON de.dept_no = dp.dept_no)
INNER JOIN employees AS e ON dp.emp_no = e.emp_no)
WHERE dept_name IN ('Sales','Development');

SELECT DISTINCT (last_name), COUNT (last_name)
FROM employees  
GROUP BY last_name
ORDER BY last_name DESC;

