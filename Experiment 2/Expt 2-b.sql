/*
Problem Title: NPV Lookup Using LEFT JOIN

You have two tables:
1. Year_tbl: contains actual NPV (Net Present Value) for different years and IDs.
2. Queries: contains (ID, YEAR) pairs for which you want to find the NPV.

Goal:
Return the queried (ID, YEAR) pairs along with the corresponding NPV value.
If NPV doesn't exist for that (ID, YEAR), show 0.
*/

CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

select * from Year_tbl
select * from Queries

SELECT q.ID, q.YEAR, y.NPV
FROM
    Queries AS q 
LEFT JOIN
    Year_tbl AS y ON q.ID = y.ID AND q.YEAR = y.YEAR 
ORDER BY
    q.ID ASC;

