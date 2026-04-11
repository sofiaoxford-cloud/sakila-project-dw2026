# sakila-project-dw2026
Sakila Project Data Warehouses, contains SQL code, Bronze, Silver and Gold tiers.

# Proyecto Data Warehouse - Sakila con ClickHouse

## Descripción
Implementación de un Data Warehouse usando la base de datos Sakila. 
Se realizaron las capas Bronze, Silver y Gold en ClickHouse.

## Video de la presentación
Ver video de explicación del proyecto
https://www.youtube.com/watch?v=OJ0pA2vFZ78

## Estructura del proyecto

- `bronze.sql` → Creación de la capa Bronze (copia desde MySQL)
- `silver.sql` → Vistas y limpieza de datos (Silver layer)
- `gold.sql`  → Esquema estrella (fact_rentals + dimensiones)
- `business.sql` → Consultas para responder las 5 preguntas de negocio
- `sakila_analysis.ipynb` → Análisis en Python + visualizaciones

## Tecnologías utilizadas
- MySQL (fuente original)
- ClickHouse
- Python (clickhouse-connect + pandas + matplotlib)

## Cómo ejecutar

1. Ejecutar los scripts SQL en orden: bronze → silver → gold → business
2. Abrir el notebook `sakila_analysis.ipynb`

## Preguntas de negocio respondidas
1. Top 10 películas más rentadas
2. País donde más se rentan películas
3. Montos totales pagados por clientes
4. Actor con más rentas
5. Serie temporal de ingresos por mes (gráfico)
