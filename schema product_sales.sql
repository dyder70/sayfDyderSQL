-- CREATE SCHEMA
CREATE DATABASE IF NOT EXISTS product_sales/* !40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ ;
CREATE SCHEMA product_sales;
USE product_sales;

--CREATE TABLES
-- DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS  categories (
	category_id INT AUTO_INCREMENT  PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

-- DROP TABLE IF EXISTS brands;
CREATE TABLE IF NOT EXISTS  brands (
	brand_id INT AUTO_INCREMENT  PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL
);

-- DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS  products (
	product_id INT AUTO_INCREMENT  PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL
);

-- DROP TABLE IF EXISTS stocks;
CREATE TABLE IF NOT EXISTS  stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id)
);

-- DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
     customer_id INT AUTO_INCREMENT PRIMARY KEY,
	 first_name VARCHAR (255) NOT NULL,
	 last_name VARCHAR (255) NOT NULL,
	 phone VARCHAR (25),
	 email VARCHAR (255) NOT NULL UNIQUE,
	 street VARCHAR (255) NOT NULL,
	 city VARCHAR (255) NOT NULL,
	 state VARCHAR (45) NOT NULL,
	 zip_code CHAR (5) NOT NULL
);

-- DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	order_status TINYINT NOT NULL,
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL
);

-- DROP TABLE IF EXISTS order_items;
CREATE TABLE IF NOT EXISTS order_items (
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price  DECIMAL (10, 2) NOT NULL,
	discount  DECIMAL (4, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id)
);

-- DROP TABLE IF EXISTS stores;
CREATE TABLE IF NOT EXISTS  stores (
	store_id INT AUTO_INCREMENT PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL UNIQUE,
	street VARCHAR (255) NOT NULL,
	city VARCHAR (255) NOT NULL,
	state VARCHAR (45) NOT NULL,
	zip_code CHAR (5) NOT NULL
);

-- DROP TABLE IF EXISTS staffs;
CREATE TABLE IF NOT EXISTS  staffs (
	staff_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	email VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	active TINYINT NOT NULL,
	store_id INT NOT NULL,
	manager_id INT
);
