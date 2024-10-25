CREATE TABLE `ProductType` (
  `ProductType_ID` INT PRIMARY KEY,
  `Name` VARCHAR(255)
);

CREATE TABLE `MaterialType` (
  `MaterialType_ID` INT PRIMARY KEY,
  `Name` VARCHAR(255),
  `Fineness` DECIMAL(5,2)
);

CREATE TABLE `StoneType` (
  `StoneType_ID` INT PRIMARY KEY,
  `Name` VARCHAR(255)
);

CREATE TABLE `Product` (
  `Product_ID` INT PRIMARY KEY,
  `ProductType_ID` INT,
  `MaterialType_ID` INT,
  `VendorCode` VARCHAR(255),
  `Name` VARCHAR(255),
  `Equipment` TEXT,
  `Price` DECIMAL(10,2),
  `Size` VARCHAR(50),
  `Description` TEXT,
  `Rest` INT,
  `Gender` TINYINT,
  `Is_Deleted` BOOLEAN
);

CREATE TABLE `ProductPhoto` (
  `ProductPhoto_ID` INT PRIMARY KEY,
  `Product_ID` INT,
  `Photo` TEXT,
  `Is_Cover` BOOLEAN
);

CREATE TABLE `InsertItem` (
  `InsertItem_ID` INT PRIMARY KEY,
  `StoneType_ID` INT,
  `Product_ID` INT,
  `Weight` DECIMAL(10,2)
);

CREATE TABLE `Orders` (
  `Order_ID` INT PRIMARY KEY,
  `FirstName` VARCHAR(255),
  `LastName` VARCHAR(255),
  `Email` VARCHAR(255),
  `Phone` VARCHAR(50),
  `OriginalAddress` TEXT,
  `ValidatedAddress` TEXT,
  `ValidationCode` VARCHAR(50),
  `OrderDate` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `TotalAmount` DECIMAL(10,2),
  `Status` VARCHAR(50)
);

CREATE TABLE `OrderItem` (
  `OrderItem_ID` INT PRIMARY KEY,
  `Order_ID` INT,
  `Product_ID` INT,
  `Quantity` INT,
  `UnitPrice` DECIMAL(10,2),
  `TotalPrice` DECIMAL(10,2)
);

CREATE TABLE `Supplies` (
  `Supply_ID` INT PRIMARY KEY,
  `SupplyDate` DATE,
  `Supplier_ID` INT,
  `Comment` TEXT,
  `SupplyStatus` VARCHAR(50)
);

CREATE TABLE `SupplyItems` (
  `SupplyItem_ID` INT PRIMARY KEY,
  `Supply_ID` INT,
  `Product_ID` INT,
  `Quantity` INT
);

CREATE TABLE `Suppliers` (
  `Supplier_ID` INT PRIMARY KEY,
  `SupplierName` VARCHAR(255),
  `ContactInfo` VARCHAR(255)
);

CREATE TABLE `AddressValidation` (
  `AddressValidation_ID` INT PRIMARY KEY,
  `OriginalAddress` TEXT,
  `ValidatedAddress` TEXT,
  `ValidationCode` VARCHAR(50),
  `ValidationDate` DATETIME DEFAULT (CURRENT_TIMESTAMP),
  `Order_ID` INT
);

ALTER TABLE `Product` ADD FOREIGN KEY (`ProductType_ID`) REFERENCES `ProductType` (`ProductType_ID`);

ALTER TABLE `Product` ADD FOREIGN KEY (`MaterialType_ID`) REFERENCES `MaterialType` (`MaterialType_ID`);

ALTER TABLE `ProductPhoto` ADD FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

ALTER TABLE `InsertItem` ADD FOREIGN KEY (`StoneType_ID`) REFERENCES `StoneType` (`StoneType_ID`);

ALTER TABLE `InsertItem` ADD FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

ALTER TABLE `OrderItem` ADD FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`);

ALTER TABLE `OrderItem` ADD FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

ALTER TABLE `Supplies` ADD FOREIGN KEY (`Supplier_ID`) REFERENCES `Suppliers` (`Supplier_ID`);

ALTER TABLE `SupplyItems` ADD FOREIGN KEY (`Supply_ID`) REFERENCES `Supplies` (`Supply_ID`);

ALTER TABLE `SupplyItems` ADD FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

ALTER TABLE `AddressValidation` ADD FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`);
