USE MovieRentalDB;
GO

-- ============================================
-- 1. MOVIES
-- ============================================
INSERT INTO Movies (MovieName, MovieType, DistributionFee, NumCopies, Rating)
VALUES
('The Office: The Movie', 'Comedy', 10.00, 5, 4),
('Edge of Tomorrow', 'Action', 12.50, 3, 5),
('Parasite', 'Foreign', 8.00, 4, 3),
('The Shawshank Redemption', 'Drama', 11.00, 2, 5);

-- ============================================
-- 2. ACTORS
-- ============================================
INSERT INTO Actors (ActorName, Gender, Age, Rating)
VALUES
('Tom Cruise', 'Male', 62, 5),
('Emma Stone', 'Female', 36, 4),
('Steve Carell', 'Male', 61, 5),
('Song Kang-ho', 'Male', 58, 4);

-- ============================================
-- 3. MOVIE–ACTOR LINKS
-- ============================================
INSERT INTO MovieActors (MovieID, ActorID) VALUES
(1, 3), -- The Office: The Movie -> Steve Carell
(2, 1), -- Edge of Tomorrow -> Tom Cruise
(3, 4), -- Parasite -> Song Kang-ho
(4, 1); -- Shawshank Redemption -> (pretend cameo)

-- ============================================
-- 4. CUSTOMERS
-- ============================================
INSERT INTO Customers (LastName, FirstName, Address, City, State, ZipCode, Telephone, Email, AccountNumber, CreditCardNumber)
VALUES
('Smith', 'John', '123 Maple St', 'Edmonton', 'AB', 'T5J0Y7', '780-555-1234', 'john.smith@email.com', 'ACC1001', '1111222233334444'),
('Doe', 'Jane', '456 Oak St', 'Calgary', 'AB', 'T2N1N4', '403-555-5678', 'jane.doe@email.com', 'ACC1002', '5555666677778888');

-- ============================================
-- 5. EMPLOYEES
-- ============================================
INSERT INTO Employees (SSN, LastName, FirstName, Address, City, State, ZipCode, Telephone)
VALUES
('111-22-3333', 'Johnson', 'Emily', '99 Broadway Ave', 'Edmonton', 'AB', 'T5K2G8', '780-555-9090'),
('222-33-4444', 'Wong', 'David', '77 Jasper Rd', 'Calgary', 'AB', 'T2P3H5', '403-555-1010');

-- ============================================
-- 6. ORDERS
-- ============================================
INSERT INTO Orders (MovieID, CustomerID, EmployeeID, CheckoutDate, ReturnDate)
VALUES
(1, 1, 1, GETDATE(), NULL),     -- John Smith rented "The Office"
(2, 2, 2, GETDATE(), NULL);     -- Jane Doe rented "Edge of Tomorrow"
GO
