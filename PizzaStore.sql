CREATE DATABASE PizzaShop;
GO
USE PizzaShop;
CREATE TABLE Users (
    UserID VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    fullName NVARCHAR(100) NOT NULL,
    Type INT NOT NULL,
);

INSERT INTO Users (UserID, Password, fullName, Type)
VALUES 
    ('U001', 123, 'Tom', 1),
    ('U002', 456, 'David', 2),
    ('U003', 789, 'John', 2),
    ('U004', 012, 'Mark', 1),
    ('U005', 134, 'Kate', 2);

	select * from Users
	

CREATE TABLE Products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    UnitPrice float NOT NULL,
    Quantity INT NOT NULL,
	ProductImage NVARCHAR(100) NOT NULL,
	Description VARCHAR(100) NOT NULL
);

INSERT INTO Products (ProductID, ProductName, UnitPrice, Quantity,ProductImage,Description)
VALUES 
('P001', 'Capricciosa Pizza', 12.99, 50,'capricciosa.jpg','A normal pizza with a taste from the forest'),
('P002', 'Margarita Pizza', 9.99, 40,'margarita.jpg','A basic pizza for everyone'),
('P003', 'Hawaii Pizza', 10.99, 30,'hawaii.jpg','A nice tasting from Hawaii');

select * from Products

