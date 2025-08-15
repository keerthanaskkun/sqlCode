
CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employee (EmpID, FirstName, LastName, DepartmentID, Salary, HireDate) VALUES
(101, 'Keerthana', 'Balakrishnan', 2, 60000, '2022-06-15'),
(102, 'Arun', 'Kumar', 1, 45000, '2021-03-01'),
(103, 'Meera', 'Sharma', 3, 70000, '2020-11-20'),
(104, 'Vikram', 'Rao', 2, 65000, '2023-01-10'),
(105, 'Ananya', 'Iyer', 4, 50000, '2022-09-05');

SELECT e.EmpID, e.FirstName, e.LastName, d.DepartmentName, e.Salary
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID;

SELECT d.DepartmentName, e.FirstName, e.LastName, MAX(e.Salary) AS MaxSalary
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT * FROM Employee
WHERE HireDate > '2022-01-01';

SELECT d.DepartmentName, ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
