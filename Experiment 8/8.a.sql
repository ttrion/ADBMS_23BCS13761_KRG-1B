------------------------------Experiment 08-------------------------------
---------------------Hard Level Problem-----------------------------
/*
Design a robust PostgreSQL transaction system for the students table where multiple student 
records are inserted in a single transaction. 

If any insert fails due to invalid data, only that insert should be rolled back while preserving the 
previous successful inserts using savepoints. 

The system should provide clear messages for both successful and failed insertions, ensuring data integrity 
and controlled error handling.

HINT: YOU HAVE TO USE SAVEPOINTS
*/

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    age INT,
    class INT
);

DO $$
BEGIN TRANSACTION 
    BEGIN 
        INSERT INTO students(name, age, class) VALUES ('Anisha',16,8);
        INSERT INTO students(name, age, class) VALUES ('Neha',17,8);
        INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);
        RAISE NOTICE ' Transaction Successfully Done';

    EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Transaction Failed..! Rolling back changes.';
            RAISE; 
    END;
END;
$$;


SELECT * FROM students;



DO $$
BEGIN TRANSACTION 
    BEGIN 
        INSERT INTO students(name, age, class) VALUES ('Anisha',16,8);
		INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);
        INSERT INTO students(name, age, class) VALUES ('Anisha',17,8); 
        INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);
        RAISE NOTICE ' Transaction Successfully Done';

    EXCEPTION WHEN OTHERS THEN
            RAISE NOTICE 'Transaction Failed..! Rolling back changes.';
            RAISE;  
    END;
END;
$$;