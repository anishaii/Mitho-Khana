create database coursework;
use coursework;

CREATE TABLE Customers (
    CustomerId VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    LocationId VARCHAR(10) NOT NULL
);
INSERT INTO Customers (CustomerId, FullName, Phone, Email, LocationId) VALUES
('C001', 'Ram', '9841234567', 'ram@gmail.com', 'L001'),
('C002', 'Sita', '9812345678', 'sita@gmail.com', 'L002'),
('C003', 'Hari', '9801122334', 'hari@gmail.com', 'L003'),
('C004', 'Gita', '9856543210', 'gita@outlook.com', 'L004'),
('C005', 'Nabin', '9807654321', 'nabin@gmail.com', 'L005'),
('C006', 'Sarita', '9841123456', 'sarita@gmail.com', 'L006');
SELECT * FROM Customers;


CREATE TABLE Locations (
    LocationId VARCHAR(10) PRIMARY KEY,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);
INSERT INTO Locations (LocationId, City, Country) VALUES
('L001', 'Kathmandu', 'Nepal'),
('L002', 'Pokhara', 'Nepal'),
('L003', 'Lalitpur', 'Nepal'),
('L004', 'Bhaktapur', 'Nepal'),
('L005', 'Chitwan', 'Nepal'),
('L006', 'Hetauda', 'Nepal');
SELECT * FROM Locations;

CREATE TABLE MembershipDetails (
    CustomerId VARCHAR(10),
    MembershipType VARCHAR(20) NOT NULL,
    RegistrationDate DATE NOT NULL,
    PRIMARY KEY (CustomerId),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);
INSERT INTO MembershipDetails (CustomerId, MembershipType, RegistrationDate) VALUES
('C001', 'Gold', '2022-01-15'),
('C002', 'Silver', '2021-05-22'),
('C003', 'Platinum', '2020-11-10'),
('C004', 'Gold', '2021-07-19'),
('C005', 'Silver', '2023-03-30'),
('C006', 'Platinum', '2020-08-25');
SELECT * FROM MembershipDetails;
/*2*/
CREATE TABLE Suppliers (
    SupplierID VARCHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
('S001', 'ABC Rice'),
('S002', 'Apple'),
('S003', 'Samsung'),
('S004', 'DDC'),
('S005', 'Clean X');
SELECT * FROM Suppliers;

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID VARCHAR(10),
    ImportDate DATE NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) ON DELETE SET NULL
);
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity, SupplierID, ImportDate) VALUES
('P001', 'ABC Rice', 'Food', 1200.00, 50, 'S001', '2024-06-10'),
('P002', 'Apple', 'Electronics', 150000.00, 10, 'S002', '2024-05-05'),
('P003', 'Samsung', 'Electronics', 55000.00, 20, 'S003', '2024-06-01'),
('P004', 'DDC', 'Dairy', 100.00, 200, 'S004', '2024-07-11'),
('P005', 'XYZ Flour', 'Food', 600.00, 75, 'S001', '2024-06-15'),
('P006', 'Clean X', 'Household Goods', 200.00, 100, 'S005', '2024-06-20');
SELECT * FROM Products;

CREATE TABLE Brands (
    BrandName VARCHAR(100) NOT NULL,
    ProductID VARCHAR(10),
    SupplierID VARCHAR(10),
    PRIMARY KEY (BrandName, ProductID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) 
);
INSERT INTO Brands (BrandName, ProductID, SupplierID) VALUES
('ABC Rice', 'P001', 'S001'),
('Apple', 'P002', 'S002'),
('Samsung', 'P003', 'S003'),
('DDC', 'P004', 'S004'),
('XYZ Flour', 'P005', 'S001'),
('Clean X', 'P006', 'S005');
SELECT * FROM Brands;
/*3*/
CREATE TABLE LocationsDetail (
    City_ID VARCHAR(10) PRIMARY KEY,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);
INSERT INTO LocationsDetail (City_ID, City, Country) VALUES
('C001', 'Kathmandu', 'Nepal'),
('C002', 'Lalitpur', 'Nepal'),
('C003', 'Bhaktapur', 'Nepal'),
('C004', 'Hetauda', 'Nepal'),
('C005', 'Pokhara', 'Nepal');
SELECT * FROM LocationsDetail;


CREATE TABLE Supplier (
    SupplierID VARCHAR(10) PRIMARY KEY,
    ContactPerson VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100)  NOT NULL,
    LastDeliveryDate DATE NOT NULL,
    City_ID VARCHAR(10),
    FOREIGN KEY (City_ID) REFERENCES LocationsDetail(City_ID)
);
SELECT * FROM Supplier;
INSERT INTO Supplier (SupplierID, ContactPerson, Phone, Email, LastDeliveryDate, City_ID) VALUES
('S001', 'Ramesh', '9841234567', 'ramesh@abcdistrib.com', '2024-06-15', 'C001'),
('S002', 'Sushil', '9812345678', 'sushil@techinnov.com', '2024-05-05', 'C002'),
('S003', 'Hari', '9801122334', 'hari@samsung.com.np', '2024-06-01', 'C003'),
('S004', 'Sunita', '9856543210', 'sunita@ddc.com', '2024-07-11', 'C004'),
('S005', 'Ramila', '9807654321', 'ramila@cleanx.com', '2024-06-20', 'C005');
/*4*/
CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
INSERT INTO Customer (CustomerID, CustomerName) VALUES
('C001', 'Rajesh Kumar'),
('C002', 'Maya Thapa'),
('C003', 'Pradeep Sharma'),
('C004', 'Nira Shrestha'),
('C005', 'Sunil Rathi'),
('C006', 'Anjali Rai');
SELECT * FROM Customer;
CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL
);
INSERT INTO Product (ProductID, ProductName) VALUES
('P001', 'Shampoo'),
('P002', 'iPhone'),
('P003', 'TV'),
('P004', 'Speaker'),
('P005', 'Flour'),
('P007', 'Washing Machine');
SELECT * FROM Product;

CREATE TABLE Cashiers (
    CashierID VARCHAR(10) PRIMARY KEY,
    CashierName VARCHAR(100) NOT NULL
);

INSERT INTO Cashiers (CashierID, CashierName) VALUES
('E001', 'Santosh Koirala'),
('E002', 'Sita Sharma'),
('E003', 'Hari Gurung'),
('E004', 'Gita Rai'),
('E005', 'Sarita Giri'),
('E006', 'Nabin Karki');
SELECT * from Cashiers;

CREATE TABLE Sales (
    SalesID VARCHAR(10) PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    CashierID VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ,
    FOREIGN KEY (CashierID) REFERENCES Cashiers(CashierID)
);

INSERT INTO Sales (SalesID, Date, CustomerID, ProductID, Quantity, TotalAmount, PaymentMethod, CashierID) 
VALUES
('S001', '2024-08-10', 'C001', 'P001', 1, 1200.00, 'Cash', 'E001'),
('S002', '2024-08-11', 'C003', 'P002', 1, 15000.00, 'Credit Card', 'E003'),
('S003', '2024-08-12', 'C004', 'P003', 1, 55000.00, 'Debit Card', 'E004'),
('S004', '2024-08-13', 'C002', 'P004', 5, 500.00, 'Cash', 'E002'),
('S005', '2024-08-14', 'C005', 'P005', 2, 1200.00, 'Mobile Payment', 'E005'),
('S006', '2024-08-15', 'C006', 'P007', 1, 80000.00, 'Credit Card', 'E006');
SELECT * FROM Sales;
/*5*/

CREATE TABLE Products_name (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL
);

CREATE TABLE Supplier_name (
    SupplierID VARCHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouse (
    WarehouseID VARCHAR(10) PRIMARY KEY,
    WarehouseLocation VARCHAR(100) NOT NULL
);

CREATE TABLE Inventory (
    ProductID VARCHAR(10),
    StockQuantity INT NOT NULL,
    ReorderLevel INT NOT NULL,
    LastRestockDate DATE NOT NULL,
    SupplierID VARCHAR(10),
    WarehouseID VARCHAR(10),
    PRIMARY KEY (ProductID, WarehouseID),  
    FOREIGN KEY (SupplierID) REFERENCES Supplier_name(SupplierID) ,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID) ,
    FOREIGN KEY (ProductID) REFERENCES Products_name(ProductID)
);
/*6*/
CREATE TABLE Department (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    DepartmentPhone VARCHAR(15) NOT NULL
);

INSERT INTO Department (DepartmentID, DepartmentName, DepartmentPhone) VALUES
('D001', 'Sales', '9856543210'),
('D002', 'Inventory', '9801122334'),
('D003', 'IT', '9807654321'),
('D004', 'Customer Care', '9841123456');
SELECT * FROM Department;

CREATE TABLE Employee (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL
);
INSERT INTO Employee (EmployeeID, FullName, Position, Phone, Email, HireDate) VALUES
('E001', 'Santosh Koirala', 'Cashier', '9841234567', 'santosh@bhatbhateni.com', '2022-01-15'),
('E002', 'Sita Sharma', 'Sales Executive', '9812345678', 'sita@bhatbhateni.com', '2021-05-22'),
('E003', 'Hari Gurung', 'Inventory Manager', '9801122334', 'hari@bhatbhateni.com', '2020-11-10'),
('E004', 'Gita Rai', 'Cashier', '9856543210', 'gita@bhatbhateni.com', '2021-07-19'),
('E005', 'Nabin Karki', 'IT Support', '9807654321', 'nabin@bhatbhateni.com', '2023-03-30'),
('E006', 'Sarita Giri', 'Customer Service', '9841123456', 'sarita@bhatbhateni.com', '2020-08-25');
SELECT * FROM Employee;
CREATE TABLE Employee_Department (
    EmployeeID VARCHAR(10),
    DepartmentID VARCHAR(10),
    PRIMARY KEY (EmployeeID, DepartmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Employee_Department (EmployeeID, DepartmentID) VALUES
('E001', 'D001'),
('E002', 'D001'),
('E003', 'D002'),
('E004', 'D001'),
('E005', 'D003'),
('E006', 'D004');

SELECT * FROM Employee_Department;
/*7*/
CREATE TABLE product_name (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

INSERT INTO product_name (ProductID, ProductName, Price) VALUES
('P001', 'Fashwash', 1200.00),
('P002', 'Luggage', 150000.00),
('P003', 'Microwave', 55000.00),
('P004', 'Juice', 100.00),
('P005', 'Hairbrush', 600.00),
('P006', 'Plates', 200.00);
SELECT * FROM product_name;

CREATE TABLE suppliers_names (
    SupplierID VARCHAR(10) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInformation VARCHAR(15) NOT NULL
);

INSERT INTO suppliers_names (SupplierID, SupplierName, ContactInformation) VALUES
('S001', 'Ram Sharma', '9851009530'),
('S002', 'Shayam Shrestha', '9841178298'),
('S003', 'Bhata Raj Thapa', '9843721127'),
('S004', 'Nabin Poudel', '9823710038'),
('S005', 'Suresh Lama', '9875643216');
SELECT * FROM suppliers_names;

CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY,
    Date DATE NOT NULL,
    SupplierID VARCHAR(10),
    ExpectedDelivery DATE NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES suppliers_names(SupplierID)
);
INSERT INTO OrderTable (OrderID, Date, SupplierID, ExpectedDelivery) VALUES
(1, '2024-06-15', 'S001', '2024-06-20'),
(2, '2024-05-05', 'S002', '2024-05-10'),
(3, '2024-06-01', 'S003', '2024-06-05'),
(4, '2024-07-11', 'S004', '2024-07-15'),
(5, '2024-06-15', 'S001', '2024-06-20'),
(6, '2024-06-20', 'S005', '2024-06-25');
SELECT * FROM OrderTable;

CREATE TABLE Order_Product (
    OrderID INT,
    ProductID VARCHAR(10),
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product_name(ProductID) 
);

INSERT INTO Order_Product (OrderID, ProductID, Quantity, TotalCost) VALUES
(1, 'P001', 100, 120000.00),
(2, 'P002', 20, 3000000.00),
(3, 'P003', 50, 2750000.00),
(4, 'P004', 500, 50000.00),
(5, 'P005', 200, 120000.00),
(6, 'P006', 150, 30000.00);
SELECT * FROM Order_Product;
/*8*/
CREATE TABLE Customertable (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Order_table (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customertable(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Payment (
    PaymentID VARCHAR(10) PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerID VARCHAR(10),
    OrderID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customertable(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Order_table(OrderID)
);
/*9*/
CREATE TABLE Customer_table (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Product_table (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Sales_table(
    SalesID VARCHAR(10) PRIMARY KEY,
    SalesDate DATE NOT NULL,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer_table(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product_table(ProductID)
);

CREATE TABLE Return_table (
    ReturnID VARCHAR(10) PRIMARY KEY,
    Date DATE NOT NULL,
    SalesID VARCHAR(10),
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT NOT NULL,
    Reason VARCHAR(255),
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (SalesID) REFERENCES Sales_table(SalesID),
    FOREIGN KEY (CustomerID) REFERENCES Customer_table(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product_table(ProductID)
);

CREATE TABLE Promotion (
    PromotionID VARCHAR(10) PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    ProductID VARCHAR(10),
    DiscountPercentage DECIMAL(5, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)  -- assuming the Product table already exists
);
CREATE TABLE Target_Audience (
    Target_Audience_ID VARCHAR(10) PRIMARY KEY,
    TargetAudience VARCHAR(100) NOT NULL
);
CREATE TABLE Promotion_Target_Audience (
    PromotionID VARCHAR(10),
    Target_Audience_ID VARCHAR(10),
    PRIMARY KEY (PromotionID, Target_Audience_ID),
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID),
    FOREIGN KEY (Target_Audience_ID) REFERENCES Target_Audience(Target_Audience_ID)
);
CREATE TABLE Manager (
    ManagerID VARCHAR(10) PRIMARY KEY,
    ManagerName VARCHAR(100) NOT NULL
);
CREATE TABLE Department_Table (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID VARCHAR(10),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

CREATE TABLE Location_table (
    Department_Location_ID VARCHAR(10) PRIMARY KEY,
    Location VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);
CREATE TABLE Department_Location (
    DepartmentID VARCHAR(10),
    Department_Location_ID VARCHAR(10),
    PRIMARY KEY (DepartmentID, Department_Location_ID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (Department_Location_ID) REFERENCES Location_table(Department_Location_ID)
);
CREATE TABLE Department_Budget (
    DepartmentID VARCHAR(10),
    Budget DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (DepartmentID),
    FOREIGN KEY (DepartmentID) REFERENCES Department_Table(DepartmentID)
);

CREATE TABLE customers_tables (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);
CREATE TABLE Employee_table (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL
);
CREATE TABLE Feedback (
    FeedbackID VARCHAR(10) PRIMARY KEY,
    Date DATE NOT NULL,
    CustomerID VARCHAR(10),
    EmployeeID VARCHAR(10),
    FeedbackText TEXT,
    Rating INT,
    FollowUpRequired VARCHAR(3),
    FOREIGN KEY (CustomerID) REFERENCES Customertable(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee_table(EmployeeID)
);




















