# SQL-Challenge
# Employee Database: A Mystery in Two Parts

## Background

We have employees data from Pewlett Hackard. **Six CSVs** are imported based on the ERD generated on ``quickdatabasediagrams.com``.

## File Index

Five files are attached:

1. <a href="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/1.%20ERD_hp_employees_db.txt">ERD_employees_db.txt</a>: Powered by ``quickdatabasediagrams``. A sharable link is enclosed below.
https://app.quickdatabasediagrams.com/#/d/jn0Mzf

2. <a href="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/2.%20ERD_QuickDBD.png">ERD_QuickDBD.png</a>: An exported image of ERD from above script and link.

3. <a href="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/3.%20table_schemata.sql">table_schemata.sql</a>: A SQL script to create 6 tables in a database.

4. <a href="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/4.%20main_queries.sql">main_queries.sql</a>: A SQL file with all required queries.

5. <a href="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/5.%20bonus.ipynb">bonus.ipynb</a>: A ``Jupyter Notebook`` file for bonus questions with **observation results**.

## Observations

* The average salary for all employees is **52,970**, while the median value is **48,681**. Because there are a large number of outliers between 90k and 130k.

* There are more than **50% employees** have salaries between *40k and 50k* which is the *most common* salary range (158,465 employees out of 300,024)
<img width=500 src="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/images/salary_range.png?raw=true">

* The top 10 high-earners (> 122k) in the company have titles either **Staff or Senior Staff**.

* **Staff and Senior Staff** have the highest average salaries in all titles, followed by Managers.
<img width=500 src="https://github.com/kk-deng/SQL-Challenge/blob/main/EmployeeSQL/images/avg_salaries_by_title.png?raw=true">

* **The data is fake**. My employee number 499942 has a name as *"April Foolsday"*, and a hire year of 1997.

## Misc

The birth date and hire date (MM-DD-YYYY) in ``employees`` CSV are not following the Postgres date format (YYYY-MM-DD), which renders the error when importing the csv into database. Thus ``VARCHAR(10)`` was used in the ERD for both dates. An ``Alter Table`` function was used to change them to SQL date datatype.

* CSV Import Order:
1. departments
2. titles
3. employees
4. dept_emp
5. dept_manager
6. salaries
