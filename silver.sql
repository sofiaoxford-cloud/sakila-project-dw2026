-- Capa Silver, Data Warehouses Project

-- Tabla Silver principal: pagos
CREATE TABLE IF NOT EXISTS sakila_silver.payments_enriched
ENGINE = MergeTree()
ORDER BY payment_id AS
SELECT
    p.payment_id,
    p.payment_date,
    p.amount,
    p.customer_id AS `p.customer_id`,
    concat(c.first_name, ' ', c.last_name) AS customer_name,
    p.rental_id AS `p.rental_id`,
    r.inventory_id AS `r.inventory_id`,
    i.film_id AS `i.film_id`,
    f.title
FROM sakila_bronze.payment p
LEFT JOIN sakila_bronze.customer c
    ON p.customer_id = c.customer_id
LEFT JOIN sakila_bronze.rental r
    ON p.rental_id = r.rental_id
LEFT JOIN sakila_bronze.inventory i
    ON r.inventory_id = i.inventory_id
LEFT JOIN sakila_bronze.film f
    ON i.film_id = f.film_id;


-- Validación de la información.

-- Conteo general
SELECT count(*) AS total_rows
FROM sakila_silver.payments_enriched;

-- Muestra de registros
SELECT *
FROM sakila_silver.payments_enriched
LIMIT 5;

-- Validación de calidad de datos
SELECT
    count() AS total_rows,
    countIf(title IS NULL) AS null_title,
    countIf(customer_name IS NULL) AS null_customer_name,
    countIf(`i.film_id` IS NULL) AS null_film_id
FROM sakila_silver.payments_enriched;
