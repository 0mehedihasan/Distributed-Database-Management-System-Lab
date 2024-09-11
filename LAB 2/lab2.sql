--Horizontal fragmentation of product table
CREATE TABLE product1 AS
SELECT * FROM product
WHERE price<=1300

CREATE TABLE product2 AS
SELECT * FROM product
WHERE price>1300

--Union of product table
CREATE TABLE product_union SELECT * FROM product1 UNION SELECT * FROM product2

--lab -2: (4 September, 2024)

--Supplier table:
create table suppliers(
    SupplierID int(3),
    SupplierName varchar(20),
    ContactName varchar(20),
    PhoneNumber varchar(20),
    Address varchar(10),
    PRIMARY KEY(SupplierID)
);

--Product table:
create table products(
    ProductID int(3),
    ProductName varchar(20),
    Catagory varchar(20),
    SupplierID int(3),
    Price numeric(6,2),
    PRIMARY KEY(ProductID),
    FOREIGN KEY(SupplierID) REFERENCES suppliers (SupplierID) ON DELETE CASCADE
);

--Suppliers value:
INSERT into suppliers(SupplierID, SupplierName, ContactName, PhoneNumber, Address) VALUES
(101, "Tech Solutions", "Dustin", "555-1234", "LA"),
(102, "Gadget World", "Smith", "555-5678", "NY"),
(103, "FurnishCo", "Steve", "555-9876", "Texus"),
(104, "Furnish LTD", "Smith", "555-6543", "NY"),
(105, "PrintPros", "Jake", "555-4321", "Texus")

--Products value:
INSERT into products(ProductID, ProductName, Catagory, SupplierID, Price) VALUES
(1, "Laptop", "Electronics", 101, 999.99),
(2, "Wireless Mouse", "Electronics", 102, 25.99),
(3, "Office Chair", "Furniture", 103, 150.00),
(4, "Desk Lamp", "Furniture", 104, 45.00),
(5, "Smartphone", "Electronics", 101, 599.99),
(6, "Printer", "Electronics", 105, 120.00),
(7, "Desk", "Furniture", 103, 300.00),
(8, "Monitor", "Electronics", 102, 200.00),
(9, "Keyboard", "Electronics", 101, 50.00),
(10, "Bookshelf", "Furniture", 104, 85.00)


--Supplier table HF:
CREATE TABLE LA_supplier AS
SELECT * FROM suppliers
WHERE Address="LA";

CREATE TABLE NY_supplier AS
SELECT * FROM suppliers
WHERE Address="NY";

CREATE TABLE Texus_supplier AS
SELECT * FROM suppliers
WHERE Address="Texus";

--Products table HF:
CREATE TABLE products_1 AS
SELECT * FROM products
WHERE Catagory="Electronics" AND Price<300;

CREATE TABLE products_2 AS
SELECT * FROM products
WHERE Catagory!="Electronics" AND Price>=300;

CREATE TABLE products_3 AS
SELECT * FROM products
WHERE Catagory="Electronics" AND Price>=300;

CREATE TABLE products_4 AS
SELECT * FROM products
WHERE Catagory!="Electronics" AND Price<300;

--Products table union:
CREATE TABLE products_union SELECT * FROM products_1 UNION SELECT * FROM products_2 UNION SELECT * FROM products_3 UNION SELECT * FROM products_4;

--Suppliers table union:
CREATE TABLE suppliers_union SELECT * FROM LA_supplier UNION SELECT * FROM NY_supplier UNION SELECT * FROM Texus_supplier;
