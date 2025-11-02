IF OBJECT_ID('RentalHistory', 'U') IS NOT NULL DROP TABLE RentalHistory;
IF OBJECT_ID('MovieQueue', 'U') IS NOT NULL DROP TABLE MovieQueue;
IF OBJECT_ID('RentalOrder', 'U') IS NOT NULL DROP TABLE RentalOrder;
IF OBJECT_ID('PhoneNumber', 'U') IS NOT NULL DROP TABLE PhoneNumber;
IF OBJECT_ID('MovieActor', 'U') IS NOT NULL DROP TABLE MovieActor;
IF OBJECT_ID('Employee', 'U') IS NOT NULL DROP TABLE Employee;
IF OBJECT_ID('Customer', 'U') IS NOT NULL DROP TABLE Customer;
IF OBJECT_ID('Actor', 'U') IS NOT NULL DROP TABLE Actor;
IF OBJECT_ID('Movie', 'U') IS NOT NULL DROP TABLE Movie;
GO


CREATE TABLE Movie (
  id INT PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  distribution_fee DECIMAL(10,2) NOT NULL DEFAULT (0),
  copies_available INT NOT NULL DEFAULT (0),
  rating INT
);
GO

CREATE TABLE Actor (
  id INT PRIMARY KEY NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  gender CHAR(1),
  birth_date DATE,
  rating INT
);
GO

CREATE TABLE MovieActor (
  movie_id INT NOT NULL,
  actor_id INT NOT NULL,
  role_name VARCHAR(255),
  CONSTRAINT PK_MovieActor PRIMARY KEY (movie_id, actor_id)
);
GO

CREATE TABLE Customer (
  id INT PRIMARY KEY NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  address VARCHAR(255),
  city VARCHAR(100),
  state CHAR(2),
  zip_code CHAR(10),
  email VARCHAR(255) UNIQUE,
  account_number INT UNIQUE NOT NULL,
  account_created DATE NOT NULL,
  birth_date DATE,
  credit_card_token CHAR(16),
  rating INT
);
GO

CREATE TABLE Employee (
  id INT PRIMARY KEY NOT NULL,
  ssn CHAR(11) UNIQUE,
  last_name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  address VARCHAR(255),
  city VARCHAR(100),
  state CHAR(2),
  zip_code CHAR(10),
  hire_date DATE NOT NULL,
  birth_date DATE
);
GO

CREATE TABLE PhoneNumber (
  id INT PRIMARY KEY NOT NULL,
  phone VARCHAR(50) NOT NULL,
  type VARCHAR(20),
  customer_id INT,
  employee_id INT,
  note VARCHAR(255)
);
GO

CREATE TABLE RentalOrder (
  id INT PRIMARY KEY NOT NULL,
  movie_id INT NOT NULL,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  checkout_at DATETIME NOT NULL,
  returned_at DATETIME,
  note TEXT
);
GO

CREATE TABLE MovieQueue (
  id INT PRIMARY KEY NOT NULL,
  customer_id INT NOT NULL,
  movie_id INT NOT NULL,
  queue_position INT NOT NULL,
  added_at DATETIME
);
GO

CREATE TABLE RentalHistory (
  id INT PRIMARY KEY NOT NULL,
  customer_id INT NOT NULL,
  movie_id INT NOT NULL,
  employee_id INT,
  rented_at DATETIME NOT NULL,
  returned_at DATETIME,
  customer_rating INT
);
GO

ALTER TABLE MovieActor ADD CONSTRAINT FK_MovieActor_Movie FOREIGN KEY (movie_id) REFERENCES Movie(id);
ALTER TABLE MovieActor ADD CONSTRAINT FK_MovieActor_Actor FOREIGN KEY (actor_id) REFERENCES Actor(id);

ALTER TABLE PhoneNumber ADD CONSTRAINT FK_PhoneNumber_Customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE PhoneNumber ADD CONSTRAINT FK_PhoneNumber_Employee FOREIGN KEY (employee_id) REFERENCES Employee(id);

ALTER TABLE RentalOrder ADD CONSTRAINT FK_RentalOrder_Movie FOREIGN KEY (movie_id) REFERENCES Movie(id);
ALTER TABLE RentalOrder ADD CONSTRAINT FK_RentalOrder_Customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE RentalOrder ADD CONSTRAINT FK_RentalOrder_Employee FOREIGN KEY (employee_id) REFERENCES Employee(id);

ALTER TABLE MovieQueue ADD CONSTRAINT FK_MovieQueue_Customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE MovieQueue ADD CONSTRAINT FK_MovieQueue_Movie FOREIGN KEY (movie_id) REFERENCES Movie(id);

ALTER TABLE RentalHistory ADD CONSTRAINT FK_RentalHistory_Customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE RentalHistory ADD CONSTRAINT FK_RentalHistory_Movie FOREIGN KEY (movie_id) REFERENCES Movie(id);
ALTER TABLE RentalHistory ADD CONSTRAINT FK_RentalHistory_Employee FOREIGN KEY (employee_id) REFERENCES Employee(id);

ALTER TABLE Movie ADD CONSTRAINT CHK_Movie_Rating CHECK (rating IS NULL OR (rating BETWEEN 1 AND 5));
ALTER TABLE Actor ADD CONSTRAINT CHK_Actor_Rating CHECK (rating IS NULL OR (rating BETWEEN 1 AND 5));
ALTER TABLE Customer ADD CONSTRAINT CHK_Customer_Rating CHECK (rating IS NULL OR (rating BETWEEN 1 AND 5));
ALTER TABLE RentalHistory ADD CONSTRAINT CHK_CustomerMovie_Rating CHECK (customer_rating IS NULL OR (customer_rating BETWEEN 1 AND 5));
GO
