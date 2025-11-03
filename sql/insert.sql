ALTER TABLE dbo.Movie         NOCHECK CONSTRAINT CHK_Movie_Rating;
ALTER TABLE dbo.Actor         NOCHECK CONSTRAINT CHK_Actor_Rating;
ALTER TABLE dbo.Customer      NOCHECK CONSTRAINT CHK_Customer_Rating;
ALTER TABLE dbo.RentalHistory NOCHECK CONSTRAINT CHK_CustomerMovie_Rating;
GO
DELETE FROM RentalHistory;
DELETE FROM MovieQueue;
DELETE FROM RentalOrder;
DELETE FROM PhoneNumber;
DELETE FROM MovieActor;
DELETE FROM Employee;
DELETE FROM Customer;
DELETE FROM Actor;
DELETE FROM Movie;
GO

INSERT INTO Movie (id, title, genre, distribution_fee, copies_available, rating)
VALUES
(1, 'Movie A', 'Drama', 5.00, 10, 5),
(2, 'Movie B', 'Comedy', 7.50, 5, 6),
(3, 'Movie C', 'Action', 3.00, 8, 4);
GO

INSERT INTO Actor (id, full_name, gender, birth_date, rating)
VALUES
(1, 'John Actor', 'M', '1964-09-02', 5),
(2, 'Jane Actor', 'F', '1961-07-30', 6),
(3, 'Jim Actor', 'M', '1924-04-03', 4),
(4, 'Jill Actor', 'F', '1940-04-25', 5),
(5, 'Joe Actor', 'M', '1958-01-26', 3);
GO

INSERT INTO MovieActor (movie_id, actor_id, role_name)
VALUES
(1, 1, 'Role 1'),
(1, 2, 'Role 2'),
(2, 3, 'Role 3'),
(2, 4, 'Role 4'),
(3, 5, 'Role 5');
GO

INSERT INTO Customer (id, last_name, first_name, address, city, state, zip_code, email, account_number, account_created, birth_date, credit_card_token, rating)
VALUES
(1, 'Smith', 'John', '123 Elm St', 'New York', 'NY', '10001', 'john.smith@example.com', 1001, '2020-01-15', '1990-05-12', '1234567890123456', 5),
(2, 'Doe', 'Jane', '456 Oak St', 'Chicago', 'IL', '60601', 'jane.doe@example.com', 1002, '2021-03-10', '1988-11-02', '6543210987654321', 6);
GO

INSERT INTO Employee (id, ssn, last_name, first_name, address, city, state, zip_code, hire_date, birth_date)
VALUES
(1, '123-45-6789', 'Johnson', 'Mary', '789 Pine St', 'Boston', 'MA', '02108', '2015-06-01', '1985-09-14'),
(2, '987-65-4321', 'Brown', 'Robert', '321 Cedar St', 'Seattle', 'WA', '98101', '2018-02-12', '1992-01-25');
GO

INSERT INTO PhoneNumber (id, phone, type, customer_id, employee_id, note)
VALUES
(1, '555-111-2222', 'Mobile', 1, NULL, 'Primary contact for John Smith'),
(2, '555-333-4444', 'Home', 2, NULL, 'Jane prefers evenings'),
(3, '555-555-6666', 'Work', NULL, 1, 'Mary Johnson office line');
GO

INSERT INTO RentalOrder (id, movie_id, customer_id, employee_id, checkout_at, returned_at, note)
VALUES
(1, 1, 1, 1, '2024-10-01 14:00:00', '2024-10-05 16:00:00', 'Returned in good condition'),
(2, 2, 2, 2, '2024-10-03 09:30:00', NULL, 'Still rented');
GO

INSERT INTO MovieQueue (id, customer_id, movie_id, queue_position, added_at)
VALUES
(1, 1, 3, 1, '2024-10-10 10:00:00'),
(2, 2, 1, 1, '2024-10-12 11:30:00');
GO

INSERT INTO RentalHistory (id, customer_id, movie_id, employee_id, rented_at, returned_at, customer_rating)
VALUES
(1, 1, 1, 1, '2024-09-01 12:00:00', '2024-09-04 15:00:00', 5),
(2, 2, 2, 2, '2024-09-10 13:00:00', '2024-09-15 09:00:00', 6);
GO


UPDATE dbo.Movie         SET rating = 5 WHERE rating > 5;
UPDATE dbo.Actor         SET rating = 5 WHERE rating > 5;
UPDATE dbo.Customer      SET rating = 5 WHERE rating > 5;
UPDATE dbo.RentalHistory SET customer_rating = 5 WHERE customer_rating > 5;

ALTER TABLE dbo.Movie         WITH CHECK CHECK CONSTRAINT CHK_Movie_Rating;
ALTER TABLE dbo.Actor         WITH CHECK CHECK CONSTRAINT CHK_Actor_Rating;
ALTER TABLE dbo.Customer      WITH CHECK CHECK CONSTRAINT CHK_Customer_Rating;
ALTER TABLE dbo.RentalHistory WITH CHECK CHECK CONSTRAINT CHK_CustomerMovie_Rating;
GO
