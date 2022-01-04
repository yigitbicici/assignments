/*Single-Row Subqueries:

Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
*/

SELECT TrackId, name, MAX(Milliseconds)
FROM tracks;

/*Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
*/

SELECT TrackId, name, MIN(Milliseconds)
FROM tracks;


/*Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. 
Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. 
General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)
*/

SELECT TrackId, name,  Bytes, avg(Bytes) over () as avg_bytes --dogru ortalamayi yazdiramadim bir turlu
From tracks
WHERE Bytes > (SELECT AVG(Bytes) FROM tracks)
ORDER BY Bytes DESC;

--SELECT AVG(Bytes) FROM tracks;
/*
   Multiple-Row Subqueries:

Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. Your query should include CustomerID, First Name and Last Name of the customers.
*/

SELECT cst.CustomerId, cst.FirstName, cst.LastName  --, em.FirstName rep_name, em.LastName rep_surname
FROM employees em
LEFT JOIN customers cst
ON em.EmployeeId = cst.SupportRepId
WHERE em.FirstName = 'Jane' OR em.FirstName = 'Margaret';


/*Rewrite the subquery above using the JOIN.
*/

SELECT cst.CustomerId, cst.FirstName, cst.LastName , em.FirstName rep_name, em.LastName rep_surname
FROM employees em
LEFT JOIN customers cst
ON em.EmployeeId = cst.SupportRepId
WHERE em.FirstName IN (SELECT FirstName FROM employees WHERE FirstName = 'Margaret' OR FirstName = 'Jane');


  /* DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice
*/

CREATE TABLE courses(
CourseId INT,
CourseName NOT NULL,
EmployeeId INT, 
CoursePrice INT,
PRIMARY KEY(CourseId),
FOREIGN KEY(EmployeeId) REFERENCES employees(EmployeeId));



/*      2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table.
You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)*/

INSERT INTO courses(EmployeeId, CourseId, CourseName, CoursePrice)
VALUES 	(2, 2, 'AWS', 100000),
		(5, 3, 'DEVOPS', 1000),
		(3, 4, 'FRONTEND', 100000),
		(1, 6, 'CYBER', 10000),
		(6, 8, 'DATASCIENCE', 1000);
		
/*
Delete the last row of your courses table.*/

DELETE FROM courses 
WHERE  CourseId = (SELECT MAX(CourseId) FROM courses);

/*Add a new column to your courses table named StartDate. The new column cannot be null.*/

ALTER TABLE courses
ADD StartDate NOT NULL DEFAULT '2021-01-10';

/*Delete the CoursePrice column.*/

ALTER TABLE courses
DROP COLUMN CoursePrice;


/*Delete the courses table.*/


DROP TABLE courses;
