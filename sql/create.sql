-- ============================================
-- Movie Rental System - Database Schema
-- ============================================

CREATE DATABASE MovieRentalDB;
GO

USE MovieRentalDB;
GO

-- ============================================
-- 1. MOVIES
-- ============================================
CREATE TABLE Movies (
    MovieID INT IDENTITY(1,1) PRIMARY KEY,
    MovieName NVARCHAR(100) NOT NULL,
    MovieType NVARCHAR(50) CHECK (MovieType IN ('Comedy','Drama','Action','Foreign')),
    DistributionFee DECIMAL(8,2) NOT NULL,
    NumCopies INT NOT NULL CHECK (NumCopies >= 0),
    Rating INT CHECK (Rating BETWEEN 1 AND 5)
);

-- ============================================
-- 2. ACTORS
-- ============================================
CREATE TABLE Actors (
    ActorID INT IDENTITY(1,1) PRIMARY KEY,
    ActorName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Male','Female')),
    Age INT CHECK (Age > 0),
    Rating INT CHECK (Rating BETWEEN 1 AND 5)
);

-- ============================================
-- 3. MOVIE–ACTOR RELATION
-- (A movie can have many actors, and an actor can appear in many movies)
-- ============================================
CREATE TABLE MovieActors (
    MovieID INT NOT NULL,
    ActorID INT NOT NULL,
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE,
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID) ON DELETE CASCADE
);

-- ============================================
-- 4. CUSTOMERS
-- ============================================
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    Telephone NVARCHAR(15),
    Email NVARCHAR(100),
    AccountNumber NVARCHAR(20) UNIQUE NOT NULL,
    AccountCreationDate DATE DEFAULT GETDATE(),
    CreditCardNumber NVARCHAR(20),
    Rating AS (
        (SELECT AVG(Rating) 
         FROM Orders o 
         WHERE o.CustomerID = Customers.CustomerID)
    ) PERSISTED
);

-- ============================================
-- 5. EMPLOYEES
-- ============================================
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    SSN NVARCHAR(15),
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    Telephone NVARCHAR(15),
    StartDate DATE DEFAULT GETDATE()
);

-- ============================================
-- 6. ORDERS
-- ============================================
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    MovieID INT NOT NULL,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    CheckoutDate DATETIME DEFAULT GETDATE(),
    ReturnDate DATETIME NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO
