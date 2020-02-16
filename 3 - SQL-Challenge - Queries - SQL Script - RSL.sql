-- 1. List the following details of each employee: employee number, last name,
--    first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
  FROM employees as e
  JOIN salaries as s
    ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
  FROM employees
 WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, 
--    last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name,e.first_name, dm.from_date, dm.to_date
  FROM departments as d
  JOIN department_manager as dm
    ON d.dept_no = dm.dept_no
  JOIN employees as e
    ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM department_employees as de
  JOIN employees as e
    ON de.emp_no = e.emp_no
  JOIN departments as d
    ON de.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names
--    begin with "B."
--    RSL - added an order by on last_name
  SELECT first_name, last_name
    FROM employees
   WHERE first_name = 'Hercules'
     AND last_name LIKE 'B%'
ORDER BY last_name ;

-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM department_employees as de
  JOIN employees as e
    ON de.emp_no = e.emp_no 
  JOIN departments as d
    ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including
--    their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM department_employees as de
  JOIN employees as e
    ON de.emp_no = e.emp_no
  JOIN departments as d
    ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales' 
    OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

  SELECT last_name,
   COUNT(last_name) AS "frequency 'count'"
    FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC,
         last_name;
         
----------------------------------------------------------- THE END ---------------------------------------------------------------------