-- Active: 1744178808536@@127.0.0.1@5432@as7psql

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    price INT CHECK(price > 0),
    stock INT,
    published_year DATE 
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    joined_date DATE DEFAULT CURRENT_DATE,
    UNIQUE(email)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers( customer_id ),
    book_id INT REFERENCES books( book_id ),
    quantity INT CHECK(quantity>0),
    order_date DATE DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE customers CASCADE;

-- Inserting data into books table
INSERT INTO books (book_id, title, author, price, stock, published_year) VALUES
(1, 'The Pragmatic Programmer','Andrew Hunt', 40.00, 10, '1999-01-05'),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, '2008-02-02'),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, '2014-03-03'),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, '1999-02-12'),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, '2018-07-11'), -- stock : 0, id : 5
(6, 'The Fault in Our Stars', 'John Green', 60.00, 10, '2012-04-16'),
(7, 'Pride and Prejudice', 'Jane Austen', 35.00, 15, '1813-12-27'),
(8, 'The Kite Runner', 'Khalid Hossaini', 52.00, 48, '2003-6-28'),
(9, 'The Fellowship of the ring', 'J.R.R Talkien', 100.00, 39, '1954-08-23'),
(10, 'The Alchemist', 'Paulo Coelho', 700.00, 100, '1988-12-26'),
(11, 'The Naked Face', 'Sydney Sheldon', 900.00, 180, '1970-03-26'),
(12, 'The Other Side of Midnight', 'Sydney Sheldon', 350.00, 0, '1973-08-22'), -- stock : 0, id : 12
(13, 'A Stranger in the Mirror', 'Kyle Simpson', 580.00, 0, '1976-01-19'), -- stock : 0, id : 13
(14, 'Bloodline', 'Sydney Sheldon', 550.00, 0, '1977-05-20'), -- stock : 0, id : 14
(15, 'Rage of Angels', 'Sydney Sheldon', 800.00, 0, '1980-09-12'), -- stock : 0, id : 15
(16, 'Master of the Game', 'Sydney Sheldon', 460.00, 0, '1982-05-11'), -- stock : 0, id : 16
(17, 'If Tomorrow Comes', 'Sydney Sheldon', 650.00, 0, '1985-12-23'), -- stock : 0, id : 17
(18, 'Windmills of the Gods', 'Sydney Sheldon', 660.00, 80, '1987-09-12'),
(19, 'The Sands of Time', 'Sydney Sheldon', 500.00, 100, '1988-09-12'),
(20, 'Memories of Midnight', 'Sydney Sheldon', 880.00, 0, '1990-01-01'), -- stock : 0, id : 20
(21, 'The Doomsday Conspiracy', 'Sydney Sheldon', 650.00, 90, '1991-04-16'),
(22, 'The Stars Shine Down', 'Sydney Sheldon', 550.00, 5, '1992-06-26'),
(23, 'Nothing Lasts Forever', 'Sydney Sheldon', 650.00, 5, '1994-07-07'),
(24, 'Morning, Noon and Night', 'Sydney Sheldon', 358.00, 5, '1995-08-20'),
(25, 'The Best Laid Plans', 'Sydney Sheldon', 500.00, 5, '199-09-01'),
(26, 'Tell Me Your Dreams', 'Sydney Sheldon', 576.00, 5, '1998-12-07'),
(27, 'The Sky Is Falling', 'Sydney Sheldon', 900.00, 5, '2000-01-01'),
(28, 'Are You Afraid of the Dark?', 'Sydney Sheldon', 400.00, 5,  '2004-01-01'),
(29, 'Learning TypeScript', 'Boris Cherny', 45.00, 12, '2019-01-01'),
(30, 'Pro TypeScript', 'Steve Fenton', 38.00, 7, '2014-02-01'),
(31, 'Effective TypeScript', 'Dan Vanderkam', 42.00, 9, '2019-03-01'),
(32, 'Eloquent JavaScript', 'Marijn Haverbeke', 33.00, 6, '2018-04-01'),
(33, 'JavaScript,Good Parts','Douglas Crockford', 25.00, 10, '2008-05-01'),
(34, 'JavaScript The Definitive Guide', 'David Flanagan', 48.00, 4, '2020-06-01'),
(35, 'Learning React', 'Alex Banks & Eve Porcello', 39.00, 8, '2020-07-01'),
(36, 'React Up and Running', 'Stoyan Stefanov', 37.00, 5, '2016-08-01'),
(37, 'Fullstack React', 'Accomazzo, Murray, Lerner', 55.00, 6, '2017-09-01'),
(38, 'Pure React', 'Dave Ceddia', 30.00, 7, '2021-10-01'),
(39, 'Introduction to Algorithms', 'Thomas H. Cormen', 65.00, 6, '2009-11-01'),
(40, 'Algorithms', 'Robert Sedgewick & Kevin Wayne', 58.00, 5, '2011-12-01'),
(41, 'Grokking Algorithms', 'Aditya Bhargava', 40.00, 9, '2016-12-01'),
(42, 'Data Structures and Algorithms in Java', 'Michael T. Goodrich', 52.00, 4, '2014-11-01'),
(43, 'The Algorithm Design Manual', 'Steven S. Skiena', 60.00, 3, '2008-10-01'),
(44, 'Data Structures and Algorithm Analysis in C++', 'Mark Allen Weiss', 48.00, 6, '2014-09-01'),
(45, 'Cracking Interview', 'Gayle Laakmann', 45.00, 10, '2015-08-01'),
(46, 'Data Structures Using C', 'Reema Thareja', 30.00, 7, '2012-07-01'),
(47, 'Python Algorithms', 'Magnus Lie Hetland', 42.00, 8, '2014-06-01'),
(48, 'Algorithms and Data Structures', 'Bradley N. Miller', 36.00, 5, '2011-05-01'),
(49, 'Database System Concepts', 'Abraham Silberschatz', 55.00, 4, '2010-04-01'),
(50, 'SQL For Dummies', 'Allen G. Taylor', 28.00, 10, '2018-03-01'),
(51, 'Learning SQL', 'Alan Beaulieu', 35.00, 7, '2020-02-01'),
(52, 'SQL in 10 Minutes, Sams Teach Yourself', 'Ben Forta', 30.00, 12, '2019-01-01'),
(53, 'NoSQL Distilled', 'Pramod J. Sadalage & Martin Fowler', 40.00, 5, '2012-10-01'),
(54, 'Seven Databases in Weeks', 'Eric Redmond & Jim R. Wilson', 45.00, 6, '2018-06-01'),
(55, 'MongoDB: The Definitive Guide', 'Kristina Chodorow', 38.00, 8, '2013-04-01'),
(56, 'Pro SQL Server Internals', 'Dmitri Korotkevitch', 60.00, 3, '2016-05-01'),
(57, 'High Performance MySQL', 'Baron Schwartz', 50.00, 4, '2012-05-01'),
(58, 'Database Internals', 'Alex Petrov', 47.00, 6, '2019-01-01'),
(59, 'MongoDB in Action', 'Kyle Banker', 42.00, 5, '2016-04-01'),
(60, 'PostgreSQL: Up and Running', 'Regina Obe & Leo Hsu', 35.00, 7, '2017-02-01'),
(61, 'Mastering PostgreSQL', 'Dimitri Fontaine', 48.00, 6, '2019-02-01'),
(62, 'Beginning PostgreSQL on the Cloud', 'Baji Shaik', 40.00, 4, '2020-02-01'),
(63, 'Getting Started with Firebase', 'Anubhav Singh', 32.00, 5, '2021-03-01'),
(64, 'Learning Firebase', 'Kato Richardson', 29.00, 6, '2016-04-01');

-- Inserting data into customers table
INSERT INTO customers (customer_id, name, email, joined_date) VALUES
( 1, 'Alice Cullens', 'alice@email.com', '2023-01-10' ),
( 2, 'Emma Watson', 'emma@email.com', '2020-02-11' ),
( 3, 'Diana Penty', 'diana@email.com', '2013-02-20' ),
( 4, 'Irina Shyak', 'irina@email.com', '2013-01-20' ),
( 5, 'Hundai Adre', 'hundai@email.com', '2022-09-14' ),
( 6, 'Audre Hepburn', 'audre@email.com', '2022-02-22' ),
( 7, 'Erin Jacson', 'erin@email.com', '2019-10-19' ),
( 8, 'Elizabeth April', 'elizabeth@email.com', '2015-05-10' ),
( 9, 'Esha Kat', 'esha@email.com', '2015-01-17' ),
( 10, 'Alyna Ada', 'alyna@email.com', '2015-01-17' ),
( 11, 'Eve Audrey', 'eve@email.com', '2015-01-17'),
( 12, 'Alisha Andre', 'alisha@email.com', '2023-11-10' ),
( 13, 'Anusa Auri', 'anusa@email.com', '2023-11-16' ),
( 14, 'Anisa Asli', 'anisa@email.com', '2021-06-12' ),
( 15, 'Ashli Kutchar', 'ashli@email.com', '2021-06-12' ),
( 16, 'Billy Benson', 'billy@email.com', '2022-05-10' ),
( 17, 'Bertha Betsi', 'bertha@email.com', '2024-06-16' ),
( 18, 'Brunai Boston', 'brunai@email.com', '2024-03-18' ),
( 19, 'Bella Hadid', 'bella@email.com', '2025-03-07' ),
( 20, 'Isabella Isac', 'isabella@email.com', '2019-05-30' ),
( 21, 'Benny Bet', 'benny@email.com', '2019-08-31' ),
( 22, 'Castella Ratchel', 'castella@email.com', '2012-01-01' ),
( 23, 'Crane Crimson', 'crane@email.com', '2017-07-17' ),
( 24, 'Crooke Celsisus', 'crooke@email.com', '2023-04-18' ),
( 25, 'Liza Haily', 'liza@email.com', '2023-09-12' ),
( 26, 'Jack Smith', 'jack@email.com', '2018-07-30' ),
( 27, 'Michael Jackson', 'michael@email.com', '2016-06-15' ),
( 28, 'Janet Jackson', 'janet@email.com', '2025-01-11' ),
( 29, 'Misha Mountain', 'misha@email.com', '2024-09-14' ),
( 30, 'Ella Broker', 'ella@email.com', '2023-09-16' ),
( 31, 'Houton Bruise', 'houston@email.com', '2022-03-18' ),
( 32, 'Elisa Erin', 'elisa@email.com', '2021-08-19' ),
( 33, 'Malaika Munawar', 'malaika@email.com', '2022-11-11' ),
( 34, 'Shariyar Munawar', 'shariyar@email.com', '2017-09-19' ),
( 35, 'Mahira Maisath', 'mahira@email.com', '2019-09-19' ),
( 36, 'Zulfiquar Ali', 'ali@email.com', '2024-01-10' );


-- Inserting data into order table 
INSERT INTO orders (order_id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2019-03-10'),
(2, 1, 3, 2, '2020-08-30'),
(3, 1, 24, 1, '2024-11-30'),
(4, 1, 28, 2, '2025-03-01'),
(5, 1, 32, 1, '2025-01-10'),
(6, 1, 49, 1, '2024-06-25'),
(7, 3, 10, 2, '2024-03-05'),
(8, 3, 11, 1, '2022-03-05'),
(9, 4, 40, 1, '2023-03-05'),
(11,5, 22, 1, '2025-03-15'),
(12,6, 24, 1, '2024-07-22'),
(13,7, 25, 1, '2018-08-25'),
(14,8, 34, 1, '2023-06-30'),
(15,9, 37, 1, '2025-07-14'),
(16,10, 44, 1, '2025-11-01'),
(17,10, 56, 1, '2025-12-31'),
(18,10, 24, 1, '2024-12-31'),
(19,12, 33, 2, '2025-08-27'),
(20,12, 31, 3, '2022-04-19'),
(21,13, 39, 3, '2025-03-05'),
(22,14, 45, 2, '2025-03-05'),
(24,15, 46, 2, '2025-03-05'),
(25,17, 55, 2, '2025-03-05'),
(26,18, 54, 5, '2025-03-05'),
(27,19, 64, 4, '2025-06-11'),
(28,20, 62, 1, '2021-06-12'),
(29,21, 21, 1, '2021-06-11'),
(30,22, 18, 1, '2024-04-10'),
(31,23, 39, 1, '2023-04-10'),
(32,25, 45, 1, '2022-04-02'),
(33,25, 22, 1, '2024-08-02'),
(34,26, 27, 1, '2024-08-03'),
(35,27, 22, 1, '2024-08-07'),
(36,29, 11, 2, '2021-08-08'),
(37,30, 33, 2, '2020-03-09'),
(38,31, 34, 2, '2020-03-02'),
(39,32, 39, 3, '2020-03-05'),
(40,33, 35, 4, '2020-10-05'),
(41,34, 23, 3, '2020-10-05'),
(42,35, 28, 4, '2024-10-05'),
(43,36, 29, 1, '2023-01-05');

-- books table
SELECT book_id, title, author, price, stock, 
    EXTRACT(YEAR FROM published_year) AS published_year
    FROM books;
-- customers table 
SELECT * FROM customers;

-- orders table
SELECT * FROM orders;


-- PostgreSQL queries on sample data 
-----------------------------------------
-- 1. Find books that are out of stock.
SELECT title from books
    WHERE stock = 0;

-- 2. Retrieve the most expensive book in the store.
SELECT book_id, title, author, price, stock, 
    EXTRACT(YEAR FROM published_year) AS published_year
    FROM books
    WHERE price = (SELECT MAX(price) FROM books);


-- 3. Find the total number of orders placed by each customer.
SELECT name, COUNT(orders.order_id) AS total_orders
    FROM orders
    LEFT JOIN customers ON orders.customer_id = customers.customer_id
    GROUP BY name;


-- 4. Calculate the total revenue generated from book sales.

-- 5. List all customers who have placed more than one order.
-- 6. Find the average price of books in the store.
-- 7.  Increase the price of all books published before 2000 by 10%.
-- 8. Delete customers who haven't placed any orders.



-- UPDATE books
-- SET price = 2050.00
-- WHERE book_id = 1;









