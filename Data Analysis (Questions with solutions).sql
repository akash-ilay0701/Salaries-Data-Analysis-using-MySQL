-- Questions :
create database salaries_data; -- created database
use salaries_data; -- select database to be used

-- Que. 1 Show all rows and columns from table
select * from salaries;

-- Que. 2 Show only the Employee Name and Job title column
select EmployeeName, JobTitle from salaries;

-- Que. 3 Show the number of emplyees in the table
select count(EmployeeName) from salaries;

-- Que. 4 Show the unique job titles in the table
select distinct JobTitle from salaries;
select count(distinct JobTitle) from salaries;

-- Que. 5 Show the job title and overtime pay for all employees with overtime pay greater than 1000.
select JobTitle, OvertimePay from salaries where OvertimePay > 50000; -- ORDER BY OvertimePay DESC limit 100;

-- Que. 6 Show the average pay for all employees
select AVG(BasePay) as "Avg BasePay" from salaries;

-- Que. 7 Show the top 10 highest paid employees
select EmployeeName, TotalPay from salaries ORDER BY TotalPay DESC limit 10;

-- Que. 8 Show the average of BasePay, OvertimePay and OtherPay for each employee
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as "Average Pay" from salaries;

-- Que. 9 Show all the employees who have the word 'Manager' in their JobTitle
select EmployeeName, JobTitle from salaries where JobTitle LIKE "%Manager%";
select count(EmployeeName) from salaries where JobTitle LIKE "%Manager%";

-- Que. 10 Show all the employees with the jobTitle is not equal to "Manager"
select EmployeeName, JobTitle from salaries where JobTitle  NOT LIKE "%Manager%";
select count(JobTitle) from salaries where JobTitle  NOT LIKE "%Manager%";

-- Que. 11 Show all employees with total pay is between 50,000 and 75,000
select EmployeeName, TotalPay from salaries where TotalPay >= 50000 and TotalPay <= 75000;
select EmployeeName, TotalPay from salaries where TotalPay BETWEEN 50000 and 75000;

-- Que. 12 Show all employees with BasePay is less than 50,000 adn totalPay greater than 1,00,000
select EmployeeName, BasePay, OvertimePay, OtherPay, Benefits, TotalPay, TotalPayBenefits from salaries where BasePay < 50000 and TotalPay > 100000;

-- Que. 13 Show all employees with a total pay benefits value is between 1,25,000 and 1,50,000 and a job title containing a word "Director"
select EmployeeName, JobTitle, TotalPayBenefits from salaries where JobTitle LIKE "%Director%" and TotalPayBenefits BETWEEN 125000 and 150000;

-- Que. 14 Show all employees order by their total pay benefits in descending order
select EmployeeName, TotalPayBenefits from salaries ORDER BY TotalPayBenefits DESC;

-- Que. 15 Show all job titles with an average base pay of at least 1,00,000 and order them by average base pay in descending order
select JobTitle, AVG(BasePay) as "Avg_BasePay" from salaries 
GROUP BY JobTitle 
HAVING AVG(BasePay) >= 100000 
ORDER BY Avg_BasePay DESC;

-- Que. 16 Delete the un necessary columns 
select * from salaries;
Alter Table salaries DROP column Notes;

-- Que. 17 Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%
SET SQL_SAFE_UPDATES = 0;
UPDATE salaries SET BasePay = BasePay * 1.1 where JobTitle LIKE "%Manager%";
SET SQL_SAFE_UPDATES = 1;
select * from salaries;

-- Que. 18 Delete all employees who have no base pay
select count(*) from salaries where OvertimePay = 0;
delete from salaries where OvertimePay = 0;

