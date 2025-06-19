/*1.	Create a database named employee, then import data_science_team.csv proj_table.csv 
and emp_record_table.csv into the employee database from the given resources.*/
create database employee;

/*3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, 
and DEPARTMENT from the employee record table, and make a list of 
employees and details of their department.*/

use employee;
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT AS 'DEPARTMENT'
FROM
    emp_record_table;

/*4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and 
EMP_RATING if the EMP_RATING is: 
●	less than two
*/

SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    DEPT AS 'DEPARTMENT',
    EMP_RATING
FROM
    emp_record_table
WHERE
    EMP_RATING < 2
ORDER BY 1;

/*	greater than four */

SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    DEPT AS 'DEPARTMENT',
    EMP_RATING
FROM
    emp_record_table
WHERE
    EMP_RATING > 4
ORDER BY 1;

/*between two and four*/

SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    GENDER,
    DEPT AS 'DEPARTMENT',
    EMP_RATING
FROM
    emp_record_table
WHERE
    EMP_RATING BETWEEN 2 AND 4
ORDER BY 1;

/*5.	Write a query to concatenate the FIRST_NAME and the LAST_NAME of 
employees in the Finance department from the employee table and 
then give the resultant column alias as NAME.*/

SELECT 
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME,
    DEPT AS 'DEPARTMENT'
FROM
    emp_record_table
WHERE
    DEPT = 'FINANCE'
ORDER BY 1;

/*6.	Write a query to list only those employees who have someone 
reporting to them. Also, show the number of reporters (including the President).*/

SELECT 
    e.EMP_ID AS 'MANAGER_ID',
    COUNT(e.EMP_ID) AS 'NUMBER_OF_REPORTEES'
FROM
    emp_record_table e
        JOIN
    emp_record_table m ON e.EMP_ID = m.MANAGER_ID
GROUP BY 1
ORDER BY 1;

/*7.	Write a query to list down all the employees from the healthcare 
and finance departments using union. Take data from the employee record table.*/

SELECT 
    EMP_ID,
    CONCAT(TRIM(FIRST_NAME), ' ', TRIM(LAST_NAME)) AS 'NAME',
    DEPT AS 'DEPARTMENT'
FROM
    emp_record_table
WHERE
    DEPT = 'FINANCE' 
UNION 
SELECT 
    EMP_ID,
    CONCAT(TRIM(FIRST_NAME), ' ', TRIM(LAST_NAME)) AS 'NAME',
    DEPT AS 'DEPARTMENT'
FROM
    emp_record_table
WHERE
    DEPT = 'HEALTHCARE';
    
/*8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, 
LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include 
the respective employee rating along with the max emp rating for the department.*/

SELECT EMP_ID , concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS'NAME', ROLE , 
DEPT AS 'DEPARTMENT',EMP_RATING,
MAX(EMP_RATING) OVER(partition by DEPT) AS 'MAX_EMP_RATING'
FROM
emp_record_table
ORDER BY 6 desc;

/*9.	Write a query to calculate the minimum and the maximum salary of the 
employees in each role. Take data from the employee record table.*/

SELECT EMP_ID,concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS'NAME',ROLE,SALARY,
MAX(SALARY) OVER(partition by ROLE) AS 'MAX_SALARY',
MIN(SALARY) OVER(partition by ROLE) AS 'MIN_SALARY'
FROM
emp_record_table;

/*10.	Write a query to assign ranks to each employee based on their experience. 
Take data from the employee record table.*/

SELECT EMP_ID,concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS'NAME',EXP,
dense_rank() OVER(order by EXP ) AS 'EMP_EXPERIENCE'
FROM
emp_record_table;

/*11.	Write a query to create a view that displays employees in various countries 
whose salary is more than six thousand. Take data from the employee record table.*/

CREATE VIEW emp_salary_view
AS
SELECT EMP_ID,  concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS'NAME',COUNTRY,SALARY
FROM
emp_record_table
WHERE SALARY > 6000;
SELECT * FROM emp_salary_view;

/*12.	Write a nested query to find employees with experience of more than ten years. 
Take data from the employee record table.*/

select EMP_ID from emp_record_table where EXP > 10;
select * from emp_record_table 
where EMP_ID in(select EMP_ID from emp_record_table where EXP > 10);

/*13.	Write a query to create a stored procedure to retrieve the details of the employees 
whose experience is more than three years. Take data from the employee record table.*/

DELIMITER //
CREATE procedure EMP_DETAILS()
begin
SELECT * FROM emp_record_table
WHERE EXP > 3;
END //
DELIMITER ;
CALL EMP_DETAILS();

/*14.	Write a query using stored functions in the project table to check whether the 
job profile assigned to each employee in the data science team matches the 
organization’s set standard.
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
*/

DELIMITER //
CREATE FUNCTION ASSIGNED_JOB_PROFILE(EXP_IN_YEARS INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE JOB_PROFILE VARCHAR(50);
    IF EXP_IN_YEARS <= 2 THEN
        SET JOB_PROFILE = 'JUNIOR DATA SCIENTIST';
    ELSEIF EXP_IN_YEARS > 2 AND EXP_IN_YEARS <= 5 THEN
        SET JOB_PROFILE = 'ASSOCIATE DATA SCIENTIST';
    ELSEIF EXP_IN_YEARS > 5 AND EXP_IN_YEARS <= 10 THEN
        SET JOB_PROFILE = 'SENIOR DATA SCIENTIST';
    ELSEIF EXP_IN_YEARS > 10 AND EXP_IN_YEARS <= 12 THEN
        SET JOB_PROFILE = 'LEAD DATA SCIENTIST';
    ELSEIF EXP_IN_YEARS > 12 AND EXP_IN_YEARS <= 16 THEN
        SET JOB_PROFILE = 'MANAGER';
    ELSE
        SET JOB_PROFILE = 'NOT DEFINED';
    END IF;

    RETURN JOB_PROFILE;
END //
DELIMITER ;

SELECT 
    EMP_ID, EXP, ASSIGNED_JOB_PROFILE(EXP)
FROM
    data_science_team;

/*15.	Create an index to improve the cost and performance of the query to find the employee 
whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.*/

use employee;
CREATE INDEX idx_name ON emp_record_table(FIRST_NAME(50));
SELECT 
    *
FROM
    emp_record_table
WHERE
    FIRST_NAME = 'Eric';

/*16.	Write a query to calculate the bonus for all the employees, based on their 
ratings and salaries (Use the formula: 5% of salary * employee rating).*/

SELECT 
    EMP_ID,
    concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS'NAME',
    SALARY,
    EMP_RATING,
    (0.05 * SALARY * EMP_RATING) AS 'BONUS'
FROM
    emp_record_table;

/*17.	Write a query to calculate the average salary distribution based on the 
continent and country. Take data from the employee record table.*/

SELECT 
    CONTINENT,
    COUNTRY,
    GROUP_CONCAT(CONCAT(TRIM(FIRST_NAME), ' ', TRIM(LAST_NAME))) AS NAMES,
    AVG(SALARY) AS AVERAGE_SALARY
FROM emp_record_table
GROUP BY CONTINENT, COUNTRY;




























