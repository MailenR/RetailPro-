CREATE DATABASE consultas_negocio; 

 -- PROYECTO RETAILPRO. PRE-ENTREGA 4: CONSULTAS SQL DE NEGOCIO -- 

USE Ventas_Tech_DB;

-- CONSULTA 1: RESUMEN EJECUTIVO MENSUAL 

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- CONSULTA 2: RANKING DE PRODUCTOS 

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- CONSULTA 3: CLIENTES RECURRENTES 

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;

-- CONSULTA 4: MESES POR ENCIMA O POR DEBAJO DEL PROMEDIO 

WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT
    mes,
    total_facturado,
    AVG(total_facturado) OVER () AS promedio_mensual,
    CASE
        WHEN total_facturado > AVG(total_facturado) OVER ()
            THEN 'Por encima'
        ELSE 'Por debajo o igual'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;

-- BLOQUE DE CIERRE: HALLAZGOS DEL ANALISIS --

-- 1: El producto con mayor facturacion fue el ID_1, con un total facturado de 3600.00.

-- 2: Todos los clientes registraron 2 pedidos, por lo que no se observan diferencias en la cantidad de compas entre los clientes analizados. 

-- 3: El mes con mayor facturacion fue el mes 3, con un total de 6444.00.
