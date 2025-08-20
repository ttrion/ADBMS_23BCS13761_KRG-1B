---experiment 03: easy (max value, excluding duplicates)---
/*
we are given with The Employee(EMP_ID)
2
3
4
5
6
7
8
TASK: FIND MAX VALUE FOR EMP_ID, BUT EXCLUDING DUPLICATES(WITH SUB QUERIES)
HINT: GROUP BY - GROUPS OF UNIQUE ELEMENTS
OUTPUT: 7
*/

CREATE TABLE Employ (
    EMP_ID INT,
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);

INSERT INTO Employ(EMP_ID, EmpName, Gender, Salary, City, Dept_id)
VALUES
(1, 'Amit', 'Male', 50000, 'Delhi', 2),
(2, 'Priya', 'Female', 60000, 'Mumbai', 1),
(3, 'Rajesh', 'Male', 45000, 'Agra', 3),
(4, 'Sneha', 'Female', 55000, 'Delhi', 4),
(5, 'Anil', 'Male', 52000, 'Agra', 2),
(6, 'Sunita', 'Female', 48000, 'Mumbai', 1),
(7, 'Vijay', 'Male', 47000, 'Agra', 3),
(8, 'Ritu', 'Female', 62000, 'Mumbai', 2),
(8, 'Alok', 'Male', 51000, 'Delhi', 1),
(9, 'Neha', 'Female', 53000, 'Agra', 4),
(9, 'Simran', 'Female', 33000, 'Agra', 3);

SELECT MAX(EMP_ID)
FROM (
    SELECT EMP_ID
    FROM Employ
    GROUP BY EMP_ID
    HAVING COUNT(EMP_ID) = 1
) AS UniqueEmployees;S
