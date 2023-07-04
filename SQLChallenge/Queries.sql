--Challenge
-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.first_name, e.last_name,e.sex, e.birth_date, s.salary, 
	t.title 
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS t
ON (e.emp_title_id=t.title_id);

-- List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT  e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- #List the manager of each department along with their department number, department name, employee number, last name, and first name 
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

-- #List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules%' AND last_name LIKE 'B%';

-- #List each employee in the Sales department, including their employee number, last name, and first name
 SELECT e.emp_no, e.first_name, e.last_name,
	dp.dept_no, dp.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_emp AS dp ON de.dept_no = dp.dept_no)
INNER JOIN employees AS e ON dp.emp_no = e.emp_no)
WHERE dept_name IN ('Sales');

-- #List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT e.emp_no, e.first_name, e.last_name,
	dp.dept_no, dp.emp_no, de.dept_no, de.dept_name
FROM ((departments AS de
INNER JOIN dept_emp AS dp ON de.dept_no = dp.dept_no)
INNER JOIN employees AS e ON dp.emp_no = e.emp_no)
WHERE dept_name IN ('Sales','Development');

-- #List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT DISTINCT (last_name), COUNT (last_name)
FROM employees  
GROUP BY last_name
ORDER BY last_name DESC;

