/*
 Part Two Assignment One DBAS1007
 Evan Sutherland W0443868
 A1_DDL_PartTwo_TablesAndConstraints
 11/15/2020
 */

-- will wipe any previous Databases and rebuild from this script

DROP DATABASE IF EXISTS products_ddl;
CREATE DATABASE IF NOT EXISTS products_ddl;

-- Will use products.ddl database
USE products_ddl;

-- Will wipe any previous tables in order so the script will run properly
DROP TABLE IF EXISTS Colour;
DROP TABLE IF EXISTS ClothingSize;
DROP TABLE IF EXISTS ClothingCategory;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Product;

-- Create a Supplier table
CREATE TABLE Supplier
(
    SupplierID int AUTO_INCREMENT PRIMARY KEY,
    SupplierName varchar(100) NOT NULL,
    Address varchar(255) NOT NULL,
    ContactName varchar(100),
    ContactPhone varchar(20),
    ContactEmail varchar(50),
    IsActive binary(10) NOT NULL DEFAULT 1
);


-- Create a Product table
CREATE TABLE Product
(
	ProductID int AUTO_INCREMENT PRIMARY KEY,
	ProductCode char(8) NOT NULL UNIQUE ,
	ProductName varchar(50) NOT NULL ,
	Description varchar(100),
	RetailPrice decimal(10,2) NOT NULL CHECK ( RetailPrice >0 ),
	SalePrice decimal(10,2) CHECK ( SalePrice >0 ),
	ProductRating int NOT NULL CHECK ( ProductRating >=1 AND ProductRating <=5),
	NumberInStock int NOT NULL DEFAULT '0',
	IsActive bit NOT NULL DEFAULT 1,
	IsDiscontinued bit NOT NULL DEFAULT 0
);


-- Create a ClothingCategory table
CREATE TABLE ClothingCategory
(
    CategoryID int AUTO_INCREMENT PRIMARY KEY,
    CategoryName varchar(50) NOT NULL,
    IsActive bit NOT NULL DEFAULT 1
);


-- Create a ClothingSize table
CREATE TABLE ClothingSize
(
    SizeID int AUTO_INCREMENT PRIMARY KEY ,
    SizeName varchar(50) NOT NULL,
    SizeAbbreviation varchar(3) NOT NULL CHECK ( SizeAbbreviation = 'XS'
                                                                        OR SizeAbbreviation = 'S'
                                                                        OR SizeAbbreviation = 'M'
                                                                        OR SizeAbbreviation = 'L'
                                                                        OR SizeAbbreviation = 'XL'
                                                                        OR SizeAbbreviation = 'XXL' ),
    IsActive bit NOT NULL DEFAULT 1
);


-- Create a Colour table
CREATE TABLE Colour
(
    ColourID int AUTO_INCREMENT PRIMARY KEY,
    ColourName varchar(50) NOT NULL,
    ColourCode varchar(3) NOT NULL UNIQUE,
    IsActive bit NOT NULL DEFAULT 1
);


-- will use product.ddl database
USE products_ddl;

-- Will insert rows into tables
INSERT INTO product
VALUES (101, 'GLF10034', 'Mens Golf Shirt', 'Short-Sleeved golf shirt, 100% cotton.', 39.99, 31.99, 4, 48, 1, 0);
INSERT INTO supplier
VALUES (45, 'Wakefield Clothing & Fabrics, Ltd.', 'Suite 400, 248 Oak Street, Halifax NS', 'Robert Owens', '(902) 555-8394', 'Robert@WCF.com', 1);
INSERT INTO clothingcategory
VALUES (10, 'Pants', 1);
INSERT INTO clothingsize
VALUES (6, 'Extra Large', 'XL', 1);
INSERT INTO colour
VALUES (14, 'White', 'WHT', 1);
