--- cleaned , transformed and added columns on excel and saved as csv file. added columns like agegroup,
--lengthofservicecategory,absentdays. created table and imported csv file--


CREATE TABLE arimaemployeetable(

EmployeeNumber BIGINT PRIMARY KEY,
Surname VARCHAR(50),
GivenName VARCHAR(50),	
FullName VARCHAR(100),
Gender VARCHAR(50),
City VARCHAR(50),
JobTitle VARCHAR(50),
DepartmentName VARCHAR(50),
StoreLocation VARCHAR(50),	
Division VARCHAR(50),
Age INT,
Agegroup VARCHAR(50),	
LengthService INT,
lengthofservicecategory	VARCHAR(50),
AbsentHours INT,
AbsentCategory	VARCHAR(50),
AbsentDays INT,
BusinessUnit VARCHAR(50)
);

SELECT * 
FROM arimaemployeetable


-- Exploratory Data Analysis
-- 1. What is the proportion of Male and Female employees?

SELECT gender, COUNT(employeenumber) AS noofemployee
FROM arimaemployeetable
GROUP BY gender

-- 2. What city has the most and least employees?

SELECT city, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY city
ORDER BY Noofemployee DESC
LIMIT 1


SELECT city, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY city
ORDER BY Noofemployee ASC
LIMIT 1


-- 3. What Job Title has the most and least employees?



SELECT jobtitle, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY jobtitle
ORDER BY Noofemployee DESC
LIMIT 1


SELECT jobtitle, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY jobtitle
ORDER BY Noofemployee ASC
LIMIT 1



-- 4. What Department has the most and least employees?

SELECT departmentname, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY departmentname
ORDER BY Noofemployee DESC
LIMIT 1


SELECT departmentname, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY departmentname
ORDER BY Noofemployee ASC
LIMIT 1



-- 5. What Store Location has the most and least employees?

SELECT storelocation, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY storelocation
ORDER BY Noofemployee DESC
LIMIT 1


SELECT storelocation, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY storelocation
ORDER BY Noofemployee ASC
LIMIT 1

-- 6. What Division has the most and least employees?

SELECT division, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY division
ORDER BY Noofemployee DESC
LIMIT 1


SELECT division, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY division
ORDER BY Noofemployee ASC
LIMIT 1


-- 7. Group Employee age into 5 categories (20 – 29, 30 – 39, 40-
-- 49, 50-59, >60). What age group has the highest and lowest 
-- employees



SELECT agegroup, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY agegroup
ORDER BY Noofemployee DESC



-- 8. Group Employee length of service into 6 categories (1-5, 6-10, 
-- 10-15, 15-20, 20-25, >25). What age group has the highest and 
-- lowest employees.

SELECT lengthofservicecategory, COUNT(employeenumber) as Noofemployee
FROM arimaemployeetable
GROUP BY lengthofservicecategory
ORDER BY Noofemployee DESC



-- 9. What is the Min and Max employee Absent Hours?

SELECT MAX(absenthours) as maximumabsenthours
FROM arimaemployeetable

SELECT MIN(absenthours) as maximumabsenthours
FROM arimaemployeetable
WHERE absenthours <> 0


-- 10. What is the total number of employees that works in each 
-- business unit?

SELECT businessunit, COUNT(employeenumber) AS noofemployee
FROM arimaemployeetable
GROUP BY businessunit


-- Tailored Data Analytics
-- 1. Group Employee Absent Hour into 7 categories (0-39, 40-
-- 79, 80-119, 120-158, 159-198, 199-238, 239-278). What 
-- group has the highest and lowest employees.



SELECT absentcategory, COUNT(employeenumber) AS noofemployee
FROM arimaemployeetable
GROUP BY absentcategory
ORDER BY Noofemployee desc
LIMIT 1

SELECT absentcategory, COUNT(employeenumber) AS noofemployee
FROM arimaemployeetable
GROUP BY absentcategory
ORDER BY Noofemployee ASC
LIMIT 1





-- 2. Convert absent hours into days. What is the Min and Max 
-- absent days.

SELECT MAX(absentdays) as maximumabsentdays
FROM arimaemployeetable

SELECT MIN(absentdays) as minimumabsentdays
FROM arimaemployeetable
WHERE absentdays <> 0


-- 3. What is the gender split of employees in each absent group? 
SELECT * 
FROM arimaemployeetable


SELECT absentcategory, gender , COUNT(employeenumber) AS noofemployee
FROM arimaemployeetable
GROUP BY absentcategory , gender
ORDER BY absentcategory, gender





-- 5. What Job Title has the maximum total number of absent 
-- days?

SELECT jobtitle, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY jobtitle
ORDER BY Totalabsentdays DESC
limit 1

-- 6. What Department has the maximum total number of 
-- absent days?

SELECT departmentname, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY departmentname
ORDER BY Totalabsentdays DESC
LIMIT 1

-- 7. What Store Location has the maximum total number of 
-- absent days?


SELECT storelocation, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY storelocation
ORDER BY Totalabsentdays DESC
LIMIT 1

-- 8. What Division has the maximum total number of absent 
-- days?

SELECT division, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY division
ORDER BY Totalabsentdays DESC
LIMIT 1

-- 9. What age group has the maximum total number of absent 
-- days?

SELECT agegroup, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY agegroup
ORDER BY Totalabsentdays DESC
LIMIT 1

-- 10. What length of service group has the maximum total 
-- number of absent days?

SELECT lengthofservicecategory, SUM(absentdays) as Totalabsentdays
FROM arimaemployeetable
GROUP BY lengthofservicecategory
ORDER BY Totalabsentdays DESC
LIMIT 1
