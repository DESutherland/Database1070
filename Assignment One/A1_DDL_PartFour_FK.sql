/*
 Part Four Assignment One DBAS1007
 Evan Sutherland W0443868
 A1_DDL_PartFour_FK.sql
 11/16/2020
 */

-- Will use the products_ddl Database
USE products_ddl;

-- Will drop any tables if they exist
DROP TABLE IF EXISTS ProductCategory;
DROP TABLE IF EXISTS ProductSize;
DROP TABLE IF EXISTS ProductColour;

-- Will Alter the Products table to add a foreign key that references the Supplier table
ALTER TABLE Product ADD COLUMN SupplierID int;
ALTER TABLE Product ADD CONSTRAINT fk_SupplierProduct FOREIGN KEY (SupplierID) REFERENCES  Supplier(SupplierID);


CREATE TABLE IF NOT EXISTS ProductCategory
(
    ProductID int,
    CategoryID int,
    PRIMARY KEY (ProductID, CategoryID)
);
ALTER TABLE ProductCategory ADD CONSTRAINT fk_ProductProductCategory FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
ALTER TABLE ProductCategory ADD CONSTRAINT fk_ClothingCategoryProductCategory FOREIGN KEY (CategoryID) REFERENCES ClothingCategory(CategoryID);

CREATE TABLE IF NOT EXISTS ProductSize
(
    ProductID int,
    SizeID int,
    PRIMARY KEY (ProductID, SizeID)
);
ALTER TABLE ProductSize ADD CONSTRAINT fk_ProductProductSize FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
ALTER TABLE ProductSize ADD CONSTRAINT fk_ClothingSizeProductSize FOREIGN KEY (SizeID) REFERENCES ClothingSize(SizeID);

CREATE TABLE IF NOT EXISTS ProductColour
(
    ProductID int,
    ColourID int,
    PRIMARY KEY (ProductID, ColourID)
);
ALTER TABLE ProductColour ADD CONSTRAINT fk_ProductProductColour FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
ALTER TABLE ProductColour ADD CONSTRAINT fk_ColourColourID FOREIGN KEY (ColourID) REFERENCES Colour(ColourID);





