CREATE TABLE departments (
dept_id SERIAL PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY,
emp_name VARCHAR(50),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


CREATE TABLE projects(
project_id SERIAL PRIMARY KEY,
project_name VARCHAR(50),
emp_id INT,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO departments (dept_name) VALUES
('IT'),
('HR'),
('Finance');


INSERT INTO employees (emp_name,salary,dept_id) VALUES
('Ali',60000,1),
('Sara',50000,2),
('Ahmed',70000,1),
('John',45000,3),
('Mike',55000,1);


INSERT INTO projects (project_name,emp_id) VALUES
('AI System',1),
('Website',3),
('Payroll',4),
('HR System',2),
('Cyber Security',1);


TASK 1
-- SHOW: employee name, department name, salary.


SELECT e.emp_name, d.dept_name, e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;


-- Task 2
-- Show total employees in each department


SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;



-- Task 3
-- Show employees working on projects



SELECT e.emp_name,p.project_name
FROM employees e
JOIN projects p
ON p.emp_id = e.emp_id;


-- Task 4
-- Find the employee working on the most projects


SELECT e.emp_name, COUNT(p.project_id) AS total_projects
FROM employees e
JOIN projects p
ON p.emp_id = e.emp_id
GROUP BY e.emp_name 
ORDER BY total_projects DESC
LIMIT 1;



-- Task 5
-- Show employees who are not assigned to any project.



SELECT e.emp_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;




-- Task 6
-- Show:
-- department name
-- total salary of department



SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;



-- Task 7
-- Find top 2 highest paid employees with their department name



SELECT e.emp_name,d.dept_name,e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY e.salary DESC
LIMIT 2;
