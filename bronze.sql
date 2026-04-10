-- BRONZE LAYER - SAKILA PROJECT DATA WAREHOUSE

-- Crear bases de datos del proyecto
CREATE DATABASE IF NOT EXISTS sakila_bronze;
CREATE DATABASE IF NOT EXISTS sakila_silver;
CREATE DATABASE IF NOT EXISTS sakila_gold;

-- Crear conexión fuente a MySQL Sakila
CREATE DATABASE IF NOT EXISTS sakila_mysql_src
ENGINE = MySQL('127.0.0.1:3306', 'sakila', 'click_user', 'Click123!');

-- BRONZE TABLES

CREATE TABLE IF NOT EXISTS sakila_bronze.actor
ENGINE = MergeTree()
ORDER BY actor_id AS
SELECT * FROM sakila_mysql_src.actor;

CREATE TABLE IF NOT EXISTS sakila_bronze.film
ENGINE = MergeTree()
ORDER BY film_id AS
SELECT * FROM sakila_mysql_src.film;

CREATE TABLE IF NOT EXISTS sakila_bronze.customer
ENGINE = MergeTree()
ORDER BY customer_id AS
SELECT * FROM sakila_mysql_src.customer;

CREATE TABLE IF NOT EXISTS sakila_bronze.payment
ENGINE = MergeTree()
ORDER BY payment_id AS
SELECT * FROM sakila_mysql_src.payment;

CREATE TABLE IF NOT EXISTS sakila_bronze.rental
ENGINE = MergeTree()
ORDER BY rental_id AS
SELECT * FROM sakila_mysql_src.rental;

CREATE TABLE IF NOT EXISTS sakila_bronze.inventory
ENGINE = MergeTree()
ORDER BY inventory_id AS
SELECT * FROM sakila_mysql_src.inventory;

CREATE TABLE IF NOT EXISTS sakila_bronze.address
ENGINE = MergeTree()
ORDER BY address_id AS
SELECT * FROM sakila_mysql_src.address;

CREATE TABLE IF NOT EXISTS sakila_bronze.city
ENGINE = MergeTree()
ORDER BY city_id AS
SELECT * FROM sakila_mysql_src.city;

CREATE TABLE IF NOT EXISTS sakila_bronze.country
ENGINE = MergeTree()
ORDER BY country_id AS
SELECT * FROM sakila_mysql_src.country;

CREATE TABLE IF NOT EXISTS sakila_bronze.film_actor
ENGINE = MergeTree()
ORDER BY (film_id, actor_id) AS
SELECT * FROM sakila_mysql_src.film_actor;

CREATE TABLE IF NOT EXISTS sakila_bronze.store
ENGINE = MergeTree()
ORDER BY store_id AS
SELECT * FROM sakila_mysql_src.store;

SHOW TABLES FROM sakila_bronze;
SELECT count(*) FROM sakila_bronze.payment;
SELECT count(*) FROM sakila_bronze.customer;
SELECT count(*) FROM sakila_bronze.film;
