/*
Medium-Level Problem
Problem Title: Department-Course Subquery and Access Control

Step-by-Step:
1. Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.
2. Insert five departments and at least ten courses across those departments.
3. Use a subquery to count the number of courses under each department (GROUP BY).
4. Display only departments that offer more than 2 courses.
*/

CREATE TABLE DEPARTMENTS (
    DEPTID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(50)
);

CREATE TABLE COURSE (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(50),
    DEPTID INT,
    FOREIGN KEY (DEPTID) REFERENCES DEPARTMENTS(DEPTID)
);

INSERT INTO DEPARTMENTS (DEPTID, DEPARTMENT_NAME) VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical'),
(4, 'Physics'),
(5, 'Mathematics');

INSERT INTO COURSE (COURSE_ID, COURSE_NAME, DEPTID) VALUES
(1, 'Data Structures', 1),
(2, 'Algorithms', 1),
(3, 'DBMS', 1),
(4, 'Circuits', 2),
(5, 'Signals', 2),
(6, 'Thermodynamics', 3),
(7, 'Fluid Mechanics', 3),
(8, 'Quantum Physics', 4),
(9, 'Linear Algebra', 5),
(10, 'Calculus', 5);

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPTID IN (
    SELECT DEPTID
    FROM COURSE
    GROUP BY DEPTID
    HAVING COUNT(*) > 2
);