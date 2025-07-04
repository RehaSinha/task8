CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;
CREATE TABLE Employees (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (Name, Department, Salary) VALUES
('Amit Sharma', 'HR', 45000),
('Neha Gupta', 'Finance', 55000),
('Rohit Das', 'IT', 60000),
('Anjali Rao', 'IT', 52000),
('Kiran Joshi', 'Marketing', 48000),
('Pooja Mehta', 'Finance', 61000);
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(30))
BEGIN
    SELECT * FROM Employees WHERE Department = dept_name;
END //
DELIMITER ;
CALL GetEmployeesByDept('IT');
DELIMITER //
CREATE FUNCTION GetBonusAmount(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10,2);
    IF salary >= 60000 THEN
        SET bonus = salary * 0.10;
    ELSE
        SET bonus = salary * 0.05;
    END IF;
    RETURN bonus;
END //
DELIMITER ;
SELECT Name, Salary, GetBonusAmount(Salary) AS Bonus FROM Employees;
CALL GetEmployeesByDept('Finance');
SELECT Name, Salary, GetBonusAmount(Salary) AS Bonus
FROM Employees
WHERE Department = 'Finance';

