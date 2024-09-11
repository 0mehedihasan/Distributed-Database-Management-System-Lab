--Order table:

CREATE TABLE orders(
    o_id varchar(15),
    u_id varchar(15),
    p_id varchar(15),
    PRIMARY KEY(o_id),
    FOREIGN KEY(u_id) REFERENCES users (u_id) ON DELETE CASCADE,
    FOREIGN KEY(p_id) REFERENCES product (p_id) ON DELETE CASCADE);

--Add primary key after:
ALTER TABLE users 
ADD PRIMARY KEY(u_id);


--User value:

INSERT into users(u_id, u_name, address) VALUES
("u1", "Mushfiq", "Dhaka"),
("u2", "Raisul", "Dhaka");

--Product value:
INSERT into product(p_id, p_name, price) VALUES
("p1", "iphone", 1250.50),
("p2", "samsung", 1240.50),
("p3", "mpow", 1200.50),
("p4", "asus", 2540.50);

--Order value:
INSERT into orders(o_id, u_id, p_id) VALUES
("o1", "u2", "p1"),
("o2", "u4", "p2"),
("o3", "u1", "p1"),
("o4", "u1", "p3");
