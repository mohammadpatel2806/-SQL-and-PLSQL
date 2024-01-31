
--CONSTRAINTS
/* 
1. Check Constrain
2. Not-Null Constrain
3. Unique Constrain
4. Primary Key Constrain
5. Foreign Key Constrain
6. Exclusion Constrain
*/

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0)
);
INSERT INTO products(product_no,price)
VALUES(101,20)
INSERT INTO products(product_no,price)
VALUES(102,0)
/* ERROR:  Failing row contains (102, null, 0).new row for relation "products" violates check constraint "products_price_check" 

ERROR:  new row for relation "products" violates check constraint "products_price_check"
SQL state: 23514
Detail: Failing row contains (102, null, */

DROP TABLE products

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CONSTRAINT positive_price CHECK (price > 0)
);
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',20)
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',0)
/* ERROR:  Failing row contains (101, xyz, 0).new row for relation "products" violates check constraint "positive_price" 

ERROR:  new row for relation "products" violates check constraint "positive_price"
SQL state: 23514
Detail: Failing row contains (101, xyz, 0).  */
DROP table products

--2. Not-Null Constrain
CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric
);
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',20)
INSERT INTO products(price)
VALUES(20)
/* ERROR:  Failing row contains (null, null, 20).null value in column "product_no" of relation "products" violates not-null constraint 

ERROR:  null value in column "product_no" of relation "products" violates not-null constraint
SQL state: 23502
Detail: Failing row contains (null, null, 20). */
DROP TABLE products

--more then one constrain
CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL CHECK (price > 0)
);
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',20)
INSERT INTO products(price)
VALUES(0)
/* ERROR:  Failing row contains (null, null, 0).null value in column "product_no" of relation "products" violates not-null constraint 

ERROR:  null value in column "product_no" of relation "products" violates not-null constraint
SQL state: 23502
Detail: Failing row contains (null, null, 0).
*/
DROP TABLE products

--Unique Constrain
CREATE TABLE products (
    product_no integer UNIQUE,
    name text,
    price numeric
);
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',20)
INSERT INTO products(product_no,"name",price)
VALUES(101,'xyz',20)
/* ERROR:  Key (product_no)=(101) already exists.duplicate key value violates unique constraint "products_product_no_key" 

ERROR:  duplicate key value violates unique constraint "products_product_no_key"
SQL state: 23505
Detail: Key (product_no)=(101) already exists.
*/
DROP TABLE products

CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    UNIQUE (a, c)
);
INSERT INTO example(a,b,c) values(1,2,3)
INSERT INTO example(a,b,c) values(1,2,3)
/*
ERROR:  Key (a, c)=(1, 3) already exists.duplicate key value violates unique constraint "example_a_c_key" 
ERROR:  duplicate key value violates unique constraint "example_a_c_key"
SQL state: 23505
Detail: Key (a, c)=(1, 3) already exists.
*/

--Primary key constrain
CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
INSERT INTO products(product_no,"name",price)
VALUES(101,'abc',2000)
INSERT INTO products("name",price)
VALUES('abc',2000)
/*
ERROR:  Failing row contains (null, abc, 2000).null value in column "product_no" of relation "products" violates not-null constraint 

ERROR:  null value in column "product_no" of relation "products" violates not-null constraint
SQL state: 23502
Detail: Failing row contains (null, abc, 2000).
*/
