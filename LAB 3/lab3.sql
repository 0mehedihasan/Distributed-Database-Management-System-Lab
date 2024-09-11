--Vertical fragmentation:
create TABLE user1 AS select u_id, u_name from users;
create TABLE user2 AS select u_id, address from users;

--Join func:
CREATE table userjoin as select * from user1 NATURAL JOIN user2

CREATE TABLE `mehedi_334`.`User` (`u_id` VARCHAR(30) NOT NULL , `u_name` VARCHAR(30) NOT NULL , `address` VARCHAR(30) NOT NULL ) ENGINE = InnoDB;

INSERT into Users(u_id, u_name, address) VALUES
("u1", "Mehedi", "Dhaka"),
("u2", "Anim", "Dhaka"),
("u3", "Baki", "Dhaka");


CREATE TABLE `mehedi_334`.`Product` (`p_id` VARCHAR(30) NOT NULL , `p_name` VARCHAR(30) NOT NULL , `price` Numeric(8,2) NOT NULL ) ENGINE = InnoDB;

INSERT into Product(p_id, p_name, price) VALUES
("p1", "I-phone 16 Pro", 12000.20),
("p2", "Samsung J6", 12040.50),
("p3", "Airpod", 1800.50),
("p4", "Asus", 25040.50);

CREATE TABLE Orders (
    o_id VARCHAR(30) NOT NULL,
    u_id VARCHAR(30) NOT NULL,
    p_id VARCHAR(30) NOT NULL,
    PRIMARY KEY (o_id),
    FOREIGN KEY (u_id) REFERENCES User (u_id) ON DELETE CASCADE,
    FOREIGN KEY (p_id) REFERENCES Product (p_id) ON DELETE CASCADE
) ENGINE=InnoDB;

--Q1:
SELECT SUM(price) from Product;
--Q2:
SELECT p_name, price from Product WHERE price = (SELECT MAX(price) FROM Product);
--Q3:
SELECT p_name, price FROM Product
WHERE price = (
    SELECT MAX(price)
    FROM Product
    WHERE price < (SELECT MAX(price) FROM Product));
--Q4:
SELECT COUNT(u_id) FROM Users;
--Q5:
SELECT u_id, AVG(price) FROM Orders, Product WHERE Orders.u_id="u1" AND Orders.p_id=Product.p_id;
--Q6:
CREATE table Product1 as select * from Product where price >= 1000;
CREATE table Product2 as select * from Product where price < 1000;





