# পোস্টগ্রেসিকোয়েল ডাটাবেইস

১. পোস্টগ্রেসিকোয়েল বলতে কি বুঝ ?

উত্তরঃ পোস্টগ্রেসিকুয়েল (PostgreSQL) হলো একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS) যা উন্নত বৈশিষ্ট্য, স্কেলেবিলিটি এবং SQL কম্প্লায়েন্সের জন্য বিখ্যাত। এটি একটি এন্টারপ্রাইজ-গ্রেড ডাটাবেস হিসেবে ব্যবহৃত হয় এবং এটি MySQL-এর মতো অন্যান্য জনপ্রিয় ডাটাবেসের একটি বিকল্প।

২. পোস্টগ্রেসিকোয়েল ডাটাবেইসে ডাটাবেইস স্কিমার উদ্দেশ্য বা কাজ কি ?

উত্তরঃ ডাটাবেইস স্কিমা (Schema) হলো একটি লজিক্যাল কন্টেইনার বা নেমস্পেস যা ডাটাবেইস অবজেক্টগুলো (টেবিল, ভিউ, ফাংশন, ইন্ডেক্স ইত্যাদি) কে সংগঠিত করে। এটি ডাটাবেইস ম্যানেজমেন্টে কাঠামো ও নিরাপত্তা প্রদান করে।
স্কিমার প্রধান উদ্দেশ্য ও কাজ:

১. লজিক্যাল গ্রুপিং ও অর্গানাইজেশন
একই ডাটাবেইসে আলাদা স্কিমায় ভিন্ন ভিন্ন অ্যাপ্লিকেশন, টিম বা মডিউলের ডাটা সংরক্ষণ করা যায়।
১. ecommerce ডাটাবেইসে inventory, orders, users আলাদা স্কিমায় রাখা যেতে পারে।
২. school ডাটাবেইসে students, teachers, finance স্কিমা ব্যবহার করা যায়।

২. নেম কনফ্লিক্ট এড়ানো
৩. সিকিউরিটি ও অ্যাক্সেস কন্ট্রোল
৪. ডাটাবেইস মাইগ্রেশন ও ভার্সনিং
উদাহরণ ঃ

```javascript
CREATE SCHEMA inventory;
```

```javascript
CREATE TABLE inventory.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL
);

```

৩. প্রাইমারি কী এবং ফরেইন কী সম্পর্কে ব্যাখ্যা কর ।

উত্তরঃ

প্রাইমারি কী (PRIMARY KEY) হলো একটি ডাটাবেইস টেবিলের একটি ইউনিক (Unique) এবং নন-নাল (Non-Null) আইডেন্টিফায়ার, যা প্রতিটি রেকর্ডকে আলাদাভাবে চিহ্নিত করে। এটি ডাটাবেইসের ডেটা ইন্টিগ্রিটি (Data Integrity) এবং রিলেশনাল মডেল বজায় রাখতে গুরুত্বপূর্ণ ভূমিকা পালন করে।

বৈশিষ্ট্য ঃ

    ১. ইউনিক (Unique)
    ২. নন-নাল (Not Null)
    ৩. ইনডেক্সড (Indexed)
    ৪. সিঙ্গেল বা কম্পোজিট

উদ্দেশ্য ঃ

    ১. প্রতিটি রেকর্ডকে ইউনিকভাবে শনাক্ত করে।
    ২. ডুপ্লিকেট বা NULL ভ্যালু প্রতিরোধ করে।
    ৩. ফরেন কী (Foreign Key) এর মাধ্যমে অন্য টেবিলের   সাথে সম্পর্ক স্থাপন করে।
    ৪. ইনডেক্সিংয়ের মাধ্যমে দ্রুত সার্চ করা যায়।

উদাহরণ ঃ

```javascript
CREATE TABLE students (
 student_id INT PRIMARY KEY,  -- PK হিসেবে student_id
 name VARCHAR(50),
 email VARCHAR(100) UNIQUE
);

```

```javascript
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)  -- দুইটি কলাম PK
);

```

```javascript
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,  -- অটো-ইনক্রিমেন্ট PK
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

```

```javascript
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```

ফরেইন কী (Foreign Key - FK) হলো একটি ডাটাবেইস কলাম (বা কলামের গ্রুপ) যা অন্য একটি টেবিলের প্রাইমারি কী (Primary Key) বা ইউনিক কী (Unique Key)-কে রেফারেন্স করে। এটি রিলেশনাল ডাটাবেইসে টেবিলগুলোর মধ্যে সম্পর্ক (Relationship) স্থাপন করে এবং ডাটার রেফারেনশিয়াল ইন্টিগ্রিটি (Referential Integrity) বজায় রাখে।

বৈশিষ্ট্য ঃ

      ১. রিলেশনশিপ তৈরি করে।
      ২. রেফারেনশিয়াল ইন্টিগ্রিটি নিশ্চিত করে ।
      ৩. CASCADE, SET NULL, RESTRICT অপশনের মাধ্যমে ডাটা আপডেট/ডিলিট নিয়ন্ত্রণ করা যায়।
      ৪. নাল (NULL) হতে পারে

উদ্দেশ্যঃ

    ১.  ডাটার মধ্যে সম্পর্ক স্থাপন ।
    ২. ডাটা ইন্টিগ্রিটি বজায় রাখা (অবৈধ বা অস্তিত্বহীন ডাটা প্রবেশ প্রতিরোধ)।
    ৩.  ডাটা কনসিস্টেন্সি নিশ্চিত করা ।

উদাহরণ ঃ

```javascript
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),  -- FK → customers টেবিল
  order_date DATE
);

```

```javascript
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id, product_id) REFERENCES orders(order_id, product_id)
);

```

৪. ভার ক্যারেক্টার এবং ক্যারেক্টার ডাটা টাইপ এর মধ্যে পার্থক্য কি ?

উত্তরঃ

VARCHAR (Variable Character) এবং CHAR (Character) উভয়ই স্ট্রিং/টেক্সট ডাটা সংরক্ষণের জন্য ব্যবহৃত হয়, তবে এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য রয়েছে:

```http

```

| বৈশিষ্ট্য         | CHAR                       | VARCHAR                      |
| :---------------- | :------------------------- | :--------------------------- |
| `দৈর্ঘ্য`         | `ফিক্সড`                   | `	ভ্যারিয়েবল`                 |
| `স্টোরেজ`         | `সবসময় নির্দিষ্ট স্পেস`    | `	প্রয়োজনমতো স্পেস`           |
| `পারফরম্যান্স`    | `দ্রুত`                    | `	তুলনামূলক ধীর`              |
| `উপযুক্ত ক্ষেত্র` | `নির্দিষ্ট দৈর্ঘ্যের ডেটা` | `	পরিবর্তনশীল দৈর্ঘ্যের ডেটা` |

####

৫. সিলেক্ট(SELECT) স্টেটমেন্ট এ WHERE ক্লজ (clause) সম্পর্কে ব্যাখ্যা কর ।

উত্তরঃ

WHERE ক্লজ হলো SQL-এর একটি শক্তিশালী ফিল্টারিং মেকানিজম যা SELECT স্টেটমেন্টে ব্যবহার করে নির্দিষ্ট শর্ত (condition) অনুযায়ী ডাটা রিট্রিভ করতে সাহায্য করে। এটি টেবিল থেকে শুধুমাত্র সেই রো (rows) গুলো ফেরত দেয় যা প্রদত্ত কন্ডিশন পূরণ করে।

```javascript
SELECT column1, column2, ...
FROM table_name
WHERE condition;

```

```javascript
-- employees টেবিল থেকে যেসব কর্মচারীর বেতন 50000 এর বেশি
SELECT name, salary
FROM employees
WHERE salary > 50000;

```

WHERE ক্লজের প্রধান ব্যবহার ঃ

    ১. কন্ডিশন চেকিং

```javascript
SELECT * FROM products WHERE price = 100;  -- সমান
SELECT * FROM users WHERE age <> 30;       -- অসমান

```

    ২. লজিক্যাল অপারেটর (AND, OR, NOT)

```javascript
SELECT * FROM orders
WHERE total_amount > 1000 AND status = 'Paid';

```

    ৩. প্যাটার্ন ম্যাচিং (LIKE, ILIKE)

```javascript
SELECT * FROM customers
WHERE name LIKE 'A%';  -- 'A' দিয়ে শুরু (Case-sensitive)

SELECT * FROM customers
WHERE name ILIKE 'a%'; -- Case-insensitive (PostgreSQL)

```

    ৪. রেঞ্জ চেকিং (BETWEEN, IN)

```javascript
SELECT * FROM products
WHERE price BETWEEN 50 AND 100;
```

    ৫. NULL ভ্যালু চেক
    ৬. সাবকোয়েরি (Subquery) এর সাথে ব্যবহার

৬. লিমিট(LIMIT) এবং অফসেট(OFFSET) বলতে কি বুঝ ?

উত্তরঃ

LIMIT এবং OFFSET হচ্ছে SQL-এর দুটি খুবই গুরুত্বপূর্ণ ক্লজ (clause), যেগুলো সাধারণত pagination বা ডেটা কন্ট্রোল করার জন্য ব্যবহৃত হয়।

লিমিট (LIMIT)ঃ

এটি নির্দিষ্ট করে দেয় যে কতগুলো রেকর্ড (row) রিটার্ন করা হবে।

```javascript
SELECT * FROM products LIMIT 10;
```

অফসেট (OFFSET)ঃ

এটি নির্দিষ্ট করে দেয় যে কোথা থেকে রেকর্ড গণনা শুরু করতে হবে।

```javascript
SELECT * FROM products LIMIT 10 OFFSET 20;
```

৭. আপডেট স্টেটমেন্ট ব্যবহার করে কিভাবে ডাটা পরিবর্তন করা যায় ?

উত্তরঃ

UPDATE স্টেটমেন্ট দিয়ে টেবিলের নির্দিষ্ট রেকর্ড বা রেকর্ডগুলোর এক বা একাধিক কলামের মান পরিবর্তন করা হয়।

```javascript
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

```

```javascript
UPDATE customers
SET email = 'newemail@example.com'
WHERE customer_id = 3;
```

৮. JOIN এর কাজ এবং গুরুত্ব কি ? পোস্টগ্রেসিকোয়েল ডাটাবেইসে এটা কিভাবে কাজ করে ?

উত্তরঃ

JOIN হচ্ছে SQL-এর একটি খুবই শক্তিশালী ফিচার, যা ব্যবহার করে একাধিক টেবিল থেকে সম্পর্কিত ডেটা একত্রে আনা যায়। এটা বিশেষভাবে গুরুত্বপূর্ণ যখন তোমার ডেটা রিলেশনাল বা একাধিক টেবিলের মধ্যে সংযুক্ত থাকে—যেমন PostgreSQL বা অন্য রিলেশনাল ডেটাবেজে।

```javascript
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

```

```javascript
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

```javascript
SELECT customers.customer_name, orders.order_id
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id;

```

৯. GROUP BY ক্লজ (clause) সম্পর্কে ব্যাখ্যা কর এবং এগ্রিগেশন ফাংশন অপারেশন এ তার ভূমিকা ব্যাখ্যা কর ।

উত্তরঃ

GROUP BY ক্লজ ব্যবহার করে টেবিলের রেকর্ডগুলোকে একটি বা একাধিক কলামের মান অনুসারে গ্রুপ করা হয়। এর পর প্রতিটি গ্রুপে অ্যাগ্রিগেশন ফাংশন (যেমন SUM(), COUNT(), AVG() ইত্যাদি) প্রয়োগ করা হয়।

```javascript
SELECT column_name, AGGREGATE_FUNCTION(column)
FROM table_name
GROUP BY column_name;
```

```javascript
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

```

১০. পোস্টগ্রেসিকোয়েল এগ্রিগেশন ফাংশন কিভাবে পরিমাপ করবে যেমন COUNT(), SUM(), and AVG() ।

উত্তরঃ

PostgreSQL-এ Aggregation Functions ব্যবহার করে একাধিক রেকর্ড থেকে একটি সারাংশ মান (summary value) বের করা হয়—যেমন কত গুলো রেকর্ড আছে, যোগফল কত, গড় কত ইত্যাদি।

```javascript
SELECT COUNT(*) FROM orders;
```

```javascript
SELECT COUNT(customer_id) FROM orders;
```

```javascript
SELECT SUM(quantity) FROM orders;

```

```javascript
SELECT customer_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY customer_id;

```

```javascript
SELECT AVG(quantity) FROM orders;
```

```javascript
SELECT customer_id, AVG(quantity) AS avg_quantity
FROM orders
GROUP BY customer_id;

```
