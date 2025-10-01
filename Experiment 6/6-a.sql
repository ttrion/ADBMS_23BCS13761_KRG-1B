/*HR-Analytics: Employee count based on dynamic gender passing (Medium)
TechSphere Solutions, a growing IT services company with offices across India, wants to track and monitor 
gender diversity within its workforce. The HR department frequently needs to know the total number of 
employees by gender (Male or Female) .
To solve this problem, the company needs an automated database-driven solution that can instantly return 
the count of employees by gender through a stored procedure that:
1. Create a PostgreSQL stored procedure that:
2. Takes a gender (e.g., 'Male' or 'Female') as input.
3. Calculates the total count of employees for that gender.
4. Returns the result as an output parameter.
5. Displays the result clearly for HR reporting purposes.
*/
drop table if exists employee;

CREATE TABLE Employee (
    id int PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO Employee (id, name, gender, salary, city)
VALUES
(10, 'Karan', 'Male', 70000.00, 'Gurgaon'),
(11, 'Seema', 'Female', 75000.00, 'Mumbai'),
(12, 'Zahra', 'Female', 65000.00, 'Hyderabad'),
(13, 'Leo', 'Other', 50000.00, 'Bangalore'),
(14, 'Raj', 'Male', 68000.00, 'Delhi'),
(15, 'Sonia', 'Female', 72000.00, 'Chennai');


create or replace procedure count_employee(in gender varchar(50), out tCount int)
language plpgsql as
$$
	Begin
	select count(*) into tCount
	from
	Employee as e
	where e.gender = count_employee.gender;

	raise notice 'Total number of % employees: %',gender,tCount;
	end;
$$;

call count_employee('Female',0);
call count_employee('Other',0);