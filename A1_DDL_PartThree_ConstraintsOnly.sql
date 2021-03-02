/*
 Part Three Assignment One DBAS1007
 Evan Sutherland W0443868
 A1_DDl_PartThree_ConstraintsOnly.sql
 11/15/2020
 */

-- Will Use the products_ddl Database
USE products_ddl;

-- Will alter the Product table and add constraints
ALTER TABLE Product ADD CONSTRAINT pk_ProductID PRIMARY KEY (ProductID);
ALTER TABLE Product AUTO_INCREMENT = 1;
ALTER TABLE Product MODIFY ProductName varchar(50)NOT NULL ;
ALTER TABLE Product MODIFY ProductCode char(8) NOT NULL ;
ALTER TABLE Product MODIFY RetailPrice decimal(10,2) NOT NULL;
ALTER TABLE Product MODIFY ProductRating int NOT NULL;
ALTER TABLE Product MODIFY NumberInStock int NOT NULL;
ALTER TABLE Product MODIFY IsActive bit NOT NULL;
ALTER TABLE Product MODIFY IsDiscontinued bit NOT NULL;
ALTER TABLE Product ADD CONSTRAINT unq_ProductCode UNIQUE (ProductCode);
ALTER TABLE Product ADD CONSTRAINT chk_RetailPrice CHECK ( RetailPrice >0 );
ALTER TABLE Product ADD CONSTRAINT chk_SalePrice CHECK ( SalePrice >0 );
ALTER TABLE Product ADD CONSTRAINT chk_ProductRating CHECK ( ProductRating >=1 AND ProductRating <=5);
ALTER TABLE Product ALTER NumberInStock SET DEFAULT '0';
ALTER TABLE Product ALTER IsActive SET DEFAULT 1;
ALTER TABLE Product ALTER IsDiscontinued SET DEFAULT 0;

-- Will alter the supplier table and add constraints
ALTER TABLE Supplier ADD CONSTRAINT pk_SupplierID PRIMARY KEY (SupplierID);
ALTER TABLE Supplier AUTO_INCREMENT = 1;
ALTER TABLE Supplier MODIFY SupplierName varchar(100) NOT NULL;
ALTER TABLE Supplier MODIFY Address varchar(255) NOT NULL;
ALTER TABLE Supplier MODIFY IsActive BINARY(10) NOT NULL;
ALTER TABLE Supplier ALTER IsActive SET DEFAULT 1;

-- Will alter the ClothingCategory table and add constraints
ALTER TABLE ClothingCategory ADD CONSTRAINT pk_CategoryID PRIMARY KEY (CategoryID);
ALTER TABLE ClothingCategory AUTO_INCREMENT = 1;
ALTER TABLE ClothingCategory MODIFY CategoryName varchar(50) NOT NULL;
ALTER TABLE ClothingCategory MODIFY IsActive bit NOT NULL;

ALTER TABLE ClothingSize ADD CONSTRAINT pk_SizeID PRIMARY KEY (SizeID);
ALTER TABLE ClothingSize AUTO_INCREMENT = 1;
ALTER TABLE ClothingSize MODIFY SizeName varchar(50) NOT NULL;
ALTER TABLE ClothingSize MODIFY SizeAbbreviation varchar(3) NOT NULL;
ALTER TABLE ClothingSize MODIFY IsActive bit NOT NULL;
ALTER TABLE ClothingSize ADD CONSTRAINT ensure_correct_size CHECK ( SizeAbbreviation = 'XS'
                                                                        OR SizeAbbreviation = 'S'
                                                                        OR SizeAbbreviation = 'M'
                                                                        OR SizeAbbreviation = 'L'
                                                                        OR SizeAbbreviation = 'XL'
                                                                        OR SizeAbbreviation = 'XXL' );
ALTER TABLE ClothingSize ALTER IsActive SET DEFAULT 1;

-- Will alter the Colour table and add constraints
ALTER TABLE Colour ADD CONSTRAINT pk_ColourID PRIMARY KEY (ColourID);
ALTER TABLE Colour AUTO_INCREMENT = 1;
ALTER TABLE Colour MODIFY ColourName varchar(50) NOT NULL;
ALTER TABLE Colour MODIFY ColourCode varchar(3) NOT NULL;
ALTER TABLE Colour MODIFY ColourCode varchar(3) UNIQUE;
ALTER TABLE Colour MODIFY IsActive bit NOT NULL;
ALTER TABLE Colour ALTER IsActive SET DEFAULT 1;



