create DATABASE product;

use product;

create table productDetail(
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Products VARCHAR(50) NOT NULL
)

-- To achieve 1NF, ensure atomicity by splitting the Products column into separate rows for each product.
-- Create a new table to normalize the Products column.

create table productItems(
    OrderID INT NOT NULL,
    Products VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES productDetail(OrderID)
);

CREATE TABLE OrderDetails(
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL PRIMARY KEY
)

CREATE TABLE customerdetails(
    OrderID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID)
)

-- To achieve 2NF, ensure that all non-key attributes are fully functionally dependent on the primary key.
-- In this case, we need to separate the Quantity from the OrderID and Product combination.
-- Create a new table to store the quantity of each product in an order.
create table productQuantity(
    OrderID INT NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID)
)



show tables;
