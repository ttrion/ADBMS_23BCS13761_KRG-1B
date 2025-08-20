--------------------EXPERIMENT 03: (MEDIUM LEVEL)
/*
In a bustling corporate organization, each department strives to retain the most talented (and well-compensated) 
employees. You have access to two key records: one lists every employee along with their salary and department, 
while the other details the names of each department. Your task is to identify the top earners in every department.

If multiple employees share the same highest salary within a department, all of them should be celebrated equally. 
The final result should present the department name, employee name, and salary of these top-tier professionals 
arranged by department.
*/

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1)

SELECT * FROM employee;
SELECT * FROM department;

SELECT E.department_id, E.salary, D.id
FROM EMPLOYEE AS E
INNER JOIN
DEPARTMENT AS D
ON
E.department_id=D.id
WHERE E.salary IN
( 
 SELECT MAX(E2.salary)
 FROM EMPLOYEE AS E2
 WHERE E2.department_id=E.department_id
)