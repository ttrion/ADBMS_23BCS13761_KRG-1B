/*
Easy-Level Problem
Problem Title: Author-Book Relationship Using Joins and Basic SQL Operations

Step-by-Step:
1. Design two tables — one for storing author details and the other for book details.
2. Ensure a foreign key relationship from the book to its respective author.
3. Insert at least three records in each table.
4. Perform an INNER JOIN to link each book with its author using the common author ID.
5. Select the book title, author name, and author’s country.

Expected Output: Each book title along with its author's name and country.
*/

CREATE DATABASE KRG_1B;
USE KRG_1B;

CREATE TABLE TBL_AUTHOR (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(50),
    COUNTRY VARCHAR(50)
);

CREATE TABLE TBL_BOOK (
    BOOK_ID INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(50),
    AUTHORID INT,
    FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
);

INSERT INTO TBL_AUTHOR (AUTHOR_ID, AUTHOR_NAME, COUNTRY) VALUES
(1, 'R.K. Narayan', 'India'),
(2, 'J.K. Rowling', 'UK'),
(3, 'George Orwell', 'UK');

INSERT INTO TBL_BOOK (BOOK_ID, BOOK_TITLE, AUTHORID) VALUES
(101, 'Malgudi', 1),
(102, '1984', 3),
(103, 'HarryPotter', 2);

SELECT * FROM TBL_AUTHOR;
SELECT * FROM TBL_BOOK;

SELECT
    B.BOOK_TITLE,
    A.AUTHOR_NAME,
    A.COUNTRY
FROM
    TBL_BOOK AS B
INNER JOIN
    TBL_AUTHOR AS A
ON
    B.AUTHORID = A.AUTHOR_ID;