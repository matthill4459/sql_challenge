--list employee # last name, first name, sex, and salary
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employees AS e
JOIN
    salaries AS s
ON
    e.emp_no = s.emp_no;

-- first name, last name, hire date for 1986
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
	
-- each dept manager and dept #, dept name, emp #, and first/last name 
SELECT
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    dept_manager AS dm
JOIN
    departments AS d
ON
    dm.dept_no = d.dept_no
JOIN
    employees AS e
ON
    dm.emp_no = e.emp_no;
	
--dept # for each employee with each employee #, and first/last name and dept name
SELECT
    de.dept_no AS department_number,
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    dept_emp AS de
JOIN
    employees AS e
ON
    de.emp_no = e.emp_no
JOIN
    departments AS d
ON
    de.dept_no = d.dept_no;


--last/first name, sex of each employee whos first name is Hercules ands whose last name begins with B
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
	
--each emp in sales dept, with emp# and lst/first name
SELECT
    emp.emp_no AS employee_number,
    emp.last_name,
    emp.first_name
FROM
    employees AS emp
WHERE
    emp.emp_no IN (
        SELECT
            de.emp_no
        FROM
            dept_emp AS de
            JOIN departments AS d ON de.dept_no = d.dept_no
        WHERE
            d.dept_name = 'Sales'
    );
	
	
--each emp in sales and development dept with emp# last/first name and dept name
SELECT
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM
    employees AS e
JOIN
    dept_emp AS de
ON
    e.emp_no = de.emp_no
JOIN
    departments AS d
ON
    de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
	
--frequency counts, in decending order, of all emp last names
SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;