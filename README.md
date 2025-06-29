# ScienceQtech Data Analysis in SQL
## Project Objective: 
To facilitate a better understanding, managers have provided ratings for each employee which will help the HR department to finalize the employee performance mapping. As a DBA, you should find the maximum salary of the employees and ensure that all jobs are meeting the organization's profile standard. You also need to calculate bonuses to find extra cost for expenses. This will raise the overall performance of the organization by ensuring that all required employees receive training.
## Dataset Used:
- <a href="https://github.com/rajakumar8700/Project_1/blob/main/data_science_team.csv">data_science_team</a>
- <a href="https://github.com/rajakumar8700/Project_1/blob/main/emp_record_table.csv">emp_record_table</a>
- <a href="https://github.com/rajakumar8700/Project_1/blob/main/proj_table.csv">proj_table</a>

Questions (KPIs):
1.	Create a database named employee, then import data_science_team.csv proj_table.csv and emp_record_table.csv into the employee database from the given resources.
2.	Create an ER diagram for the given employee database.
3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.
4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four
5.	Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.
6.	Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).
7.	Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.
8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.
9.	Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
10.	Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
11.	Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.
12.	Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.
13.	Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.
14.	Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.
15.	Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.
16.	Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
17.	Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.

## Skills and Concept Used:
- Advanced SQL queries
- String manipulation & filtering
- Subqueries & nested logic
- Stored procedures & functions
- Views & indexing
- Data analytics and performance tuning
## Project Insights:
Fetched employee details like EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT.
### ***Salary Based on Departments***
- Automotive and Healthcare department's employee have the highest rating of 5.
- The President has the highest salary at ₹16,500.
- The Junior Data Scientist has the lowest salary at ₹2,800.
- The Manager role shows a big range, from ₹8,500 to ₹11,000.
- Among data science roles, Associate Data Scientists earn as low as ₹4,000, while Lead Data Scientists go up to ₹9,000.
### ***Salary Based on Country***
- The highest-paid employee is from the USA (Arthur Black with ₹16,500).
- The lowest salary is in China, where Nian Zhen earns ₹6,500.
- Germany shows a wide salary range—from ₹7,500 to ₹11,000—indicating both junior and senior roles.
- India's salaries range from ₹7,000 to ₹8,500, placing it in the lower-mid range.
### ***Experience***
- The most experienced employee is Arthur Black with 15 years of experience.
- The least experienced is Jenifer Jhones, who has just 1 year.
