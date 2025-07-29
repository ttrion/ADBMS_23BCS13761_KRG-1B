/*
You are a Database Engineer at TalentTree Inc., an enterprise HR analytics platform that stores employee data, including their reporting relationships. 
The company maintains a centralized Employee relation that holds:Each employee’s ID, name, department, and manager ID (who is also an employee in the same table).
Your task is to generate a report that maps employees to their respective managers, showing:
The employee’s name and department
Their manager’s name and department (if applicable)
This will help the HR department visualize the internal reporting hierarchy.
*/

CREATE TABLE employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT
);

INSERT INTO employee (EmpID, EmpName, Department, ManagerID) VALUES
(101, 'Alice Smith', 'Engineering', NULL),
(102, 'Bob Johnson', 'Engineering', 101),
(103, 'Charlie Brown', 'HR', 101),
(104, 'David Lee', 'Engineering', 102),
(105, 'Eve Davis', 'HR', 103),
(106, 'Frank White', 'Sales', NULL),
(107, 'Grace Green', 'Sales', 106);

SELECT
    E1.EmpName AS [EMPLOYEE NAME],
    E1.Department AS [EMP_DEPARTMENT],
    E2.EmpName AS [MANAGER NAME],
    E2.Department AS [MANAGER_DEPARTMENT]
FROM
    employee AS E1
LEFT OUTER JOIN
    employee AS E2 ON E1.ManagerID = E2.EmpID;
