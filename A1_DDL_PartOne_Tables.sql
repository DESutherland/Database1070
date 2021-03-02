/*
 Part One Assignment One DBAS1007
 Evan Sutherland W0443868
 A1_DDL_PartOne_Tables.sql
 11/13/2020
 */

-- will wipe any previous Databases and rebuild from this script
DROP DATABASE IF EXISTS products_ddl;
CREATE DATABASE IF NOT EXISTS products_ddl;

-- Will use products.ddl database
USE products_ddl;

-- Will wipe any previous table
DROP TABLE IF EXISTS Supplier;

-- Create a Supplier table
CREATE TABLE Supplier
(
    SupplierID int,
    SupplierName varchar(100),
    Address varchar(255),
    ContactName varchar(100),
    ContactPhone varchar(20),
    ContactEmail varchar(50),
    IsActive BINARY(10)
);

-- Will wipe any previous table
DROP TABLE IF EXISTS Product;

-- Create a Product table
CREATE TABLE Product
(
	ProductID int,
	ProductCode char(8),
	ProductName varchar(50),
	Description varchar(100),
	RetailPrice decimal(10,2),
	SalePrice decimal(10,2),
	ProductRating int,
	NumberInStock int,
	IsActive bit,
	IsDiscontinued bit
);

-- Will wipe any previous table
DROP TABLE IF EXISTS ClothingCategory;

-- Create a ClothingCategory table
CREATE TABLE ClothingCategory
(
    CategoryID int,
    CategoryName varchar(50),
    IsActive bit
);

-- Will wipe any previous table
DROP TABLE IF EXISTS ClothingSize;

-- Create a ClothingSize table
CREATE TABLE ClothingSize
(
    SizeID int,
    SizeName varchar(50),
    SizeAbbreviation varchar(3),
    IsActive bit
);

-- Will wipe any previous table
DROP TABLE IF EXISTS Colour;

-- Create a Colour table
CREATE TABLE Colour
(
    ColourID int,
    ColourName varchar(50),
    ColourCode varchar(3),
    IsActive bit
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
