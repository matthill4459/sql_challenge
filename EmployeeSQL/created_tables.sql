


-- Create the "departments" table
CREATE TABLE departments(
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR(40) NOT NULL
);

DROP TABLE employees
-- Create the "employees" table
CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id CHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);
ALTER TABLE employees
	  ADD CONSTRAINT fk_employees_titles FOREIGN KEY (emp_title_id) REFERENCES titles (title_id);

-- Create the "dept_emp" table
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no CHAR(10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


-- Create the "dept_manager" table
CREATE TABLE dept_manager (
    dept_no CHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


-- Create the corrected "salaries" table
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


-- Create the "titles" table
CREATE TABLE titles (
    title_id CHAR(10) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);
