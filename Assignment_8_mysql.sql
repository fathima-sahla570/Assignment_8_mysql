create database Assignment;
use Assignment;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT);
-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50));
    -- Insert rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'UK', 67800000, 243000),
(4, 'India', 1393000000, 3287000),
(5, 'Australia', 25600000, 7692000),
(6, 'Germany', 83200000, 357000),
(7, 'France', 65400000, 551000),
(8, 'Brazil', 213000000, 8516000),
(9, 'Japan', 126000000, 377975),
(10, 'South Korea', 52000000, 100210);
-- Insert rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 38000000, 3.8, 2, 'Canada'),
(3, 'Alice', 'Johnson', 67800000, 4.2, 3, 'UK'),
(4, 'Rahul', 'Verma', 1393000000, 3.6, 4, 'India'),
(5, 'Emily', 'Davis', 25600000, 4.8, 5, 'Australia'),
(6, 'Carlos', 'Garcia', 213000000, 4.1, 8, 'Brazil'),
(7, 'Sophie', 'Miller', 65400000, 3.9, 6, 'France'),
(8, 'Akira', 'Tanaka', 126000000, 4.7, 9, 'Japan'),
(9, 'Min', 'Choi', 52000000, 3.5, 10, 'South Korea'),
(10, 'Anna', 'Brown', 38000000, 4.6,5,'france');
-- 1. Find the number of persons in each country
select Country_name, count(*)as Numberofperson from persons group by  Country_name;
-- 2 .find the number of persons in each country sorted from high to low.
select Country_name, count(*)as Numberofperson from persons group by  Country_name order by Numberofperson desc;
-- 3find the average rating for persons in respective countries if the average is greater than 3.0.
select Country_name,avg(Rating) from persons where (select avg(Rating)>3.0) group by Country_name;
-- 4Find the countries with the same rating as the USA:
SELECT DISTINCT Country_name
FROM Persons
WHERE Country_name != 'USA'
AND Rating IN (
    SELECT Rating
    FROM Persons
    WHERE Country_name = 'USA'
);
-- 5.Select all countries whose population is greater than the average population of all nations:
select Country_name from country where Population > ( select avg(Population) from country);
-- --- Create the database and table:
 CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
--  Insert sample data into the Customer table
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'US'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St', 'New York', 'New York', '10001', 'US'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5555555555', '789 Pine St', 'Austin', 'Texas', '73301', 'US'),
('Bob', 'Brown', 'bob.brown@example.com', '4444444444', '321 Oak St', 'San Francisco', 'California', '94101', 'US'),
('Charlie', 'Davis', 'charlie.davis@example.com', '3333333333', '654 Maple St', 'Seattle', 'Washington', '98101', 'US');
-- 2. Create a view named customer_info and perform SELECT:
create view customer_info as select  CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;
SELECT * FROM customer_info;
-- 3Create another view named Customer_details:
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';
SELECT * FROM US_Customers;
-- 4 Create another view named Customer_details:
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;
-- 5. Update phone numbers of customers who live in California:
set sql_safe_updates=0;
UPDATE Customer
SET Phone_no = 'NewPhoneNumber'
WHERE State = 'California';
-- 6. Count the number of customers in each state and show only states with more than 5 customers
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
-- 7Query to return the number of customers in each state
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;
-- 8. Query to return all columns from Customer_details, sorted by state
SELECT *
FROM Customer_details
ORDER BY State ASC;



















