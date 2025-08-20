--------------------Experiment 03: hard level
/*
2 legacy HR systems ,a and b, have seperate records of employee salaries. these records may overlap. management wnts to merge these 2 datasets 
and identify each unique employee(by empid) along with lowest recorded salary across both systems.

objective:
1) combine both tables a and b using join
2) return each empid with their lowest salary and corresponding ename
*/

CREATE TABLE TableA (
    Empid INT PRIMARY KEY,
    Ename VARCHAR(50),
    salary INT
);

CREATE TABLE TableB (
    Empid INT PRIMARY KEY,
    Ename VARCHAR(50),
    salary INT
);

INSERT INTO TableA(Empid, Ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300)

INSERT INTO TableB(Empid, Ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100)

SELECT Empid, Ename, MIN(salary) 
AS salary
FROM (
    SELECT Empid, Ename, Salary FROM TableA
    UNION ALL
    SELECT Empid, Ename, Salary FROM TableB
) 
AS intermediate_C
GROUP BY Empid, Ename;