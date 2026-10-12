CREATE DATABASE consultas_joins;

-- RETAILPRO. PRE-ENTREGA 5: CONSULTAS CON JOINS -- 

USE Ventas_Tech_DB;

-- CONSULTA 1: VISTA BASE DEL PROYECTO (INNER JOIN)

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- CONSULTA 2: CLIENTES SIN VENTAS (LEFT JOIN) 

SELECT
    c.nombre AS nombre_cliente,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.nombre;

-- CONSULTA 3: PRODUCTOS SIN VENTAS (LEFT JOIN)

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
LEFT JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL
ORDER BY p.nombre_producto;

-- CONSULTA 4: CONSOLIDADO POR ORIGEN (UNION ALL)

SELECT
    canal,
    SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, CAST('Primer periodo' AS VARCHAR(30)) AS canal
    FROM ventas
    WHERE fecha_venta >= '20240301'
      AND fecha_venta <  '20240311'

    UNION ALL

    SELECT fecha_venta, cantidad * precio_unitario AS total, CAST('Segundo periodo' AS VARCHAR(30)) AS canal
    FROM ventas
    WHERE fecha_venta >= '20240311'
      AND fecha_venta <  '20240401'
) AS consolidado
GROUP BY canal
ORDER BY canal;

