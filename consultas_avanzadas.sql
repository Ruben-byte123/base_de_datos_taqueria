-- Proyecto: Taquería El Güero
-- Etapa 3: Consultas Avanzadas y Rutinas
-- Fecha: 2025-11-27

/*****************************************************************
 * NOTE:
 * - Ejecutar este fichero únicamente DESPUÉS de haber importado
 *   bd_equipo9_final.sql (las tablas usadas vienen de ese dump).
 * - Este script es idempotente: DROP IF EXISTS en rutinas/vistas/triggers.
 * - Contiene:
 *   A) 10 consultas avanzadas (comentadas + propósito + SQL)
 *   B) 1 función (calcula costo de receta)
 *   C) 1 procedimiento almacenado (reporte de ventas con OUT param)
 *   D) 1 trigger (actualiza stock en ingrediente al insertar detalle_venta)
 *   E) 1 vista (productos más vendidos / inventario crítico)
 *****************************************************************/

-- ================================================================
-- A. 10 CONSULTAS AVANZADAS
-- Cada bloque: propósito, insight y consulta SQL.
-- ================================================================

/* 1) JOIN múltiple + agregación
   Propósito: Obtener ventas totales por empleado y categoría de producto
   Insight: Permite ver qué empleados venden más por categoría.
*/
-- Descripción: suma total vendido por empleado y categoría (ultimo trimestre completo)
SELECT
  e.id_empleado,
  e.nombre AS empleado,
  p.categoria,
  SUM(dv.cantidad * dv.precio_unitario) AS ventas_totales
FROM venta v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
JOIN producto p ON dv.id_producto = p.id_producto
JOIN empleado e ON v.id_empleado = e.id_empleado
WHERE v.fecha_hora >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY e.id_empleado, p.categoria
ORDER BY e.id_empleado, ventas_totales DESC;

-- ================================================================

/* 2) Subconsulta correlacionada
   Propósito: Para cada producto devolver su precio de venta y el
              promedio de precio_unitario históricamente vendido.
   Insight: Detectar desviaciones entre precio listado y precio real medio.
*/
SELECT
  p.id_producto,
  p.nombre,
  p.precio_venta,
  (
    SELECT ROUND(AVG(dv.precio_unitario),2)
    FROM detalle_venta dv
    WHERE dv.id_producto = p.id_producto
  ) AS avg_historical_sale_price
FROM producto p
ORDER BY avg_historical_sale_price DESC;

-- ================================================================

/* 3) Funciones de ventana (ROW_NUMBER, RANK)
   Propósito: Ranking de productos por cantidad vendida en los últimos 90 días
   Insight: Top-N productos por volumen vendido (útil para promociones/stock).
*/
SELECT
  id_producto,
  nombre,
  total_qty,
  ROW_NUMBER() OVER (ORDER BY total_qty DESC) AS rn,
  RANK() OVER (ORDER BY total_qty DESC) AS rnk
FROM (
  SELECT p.id_producto, p.nombre, SUM(dv.cantidad) AS total_qty
  FROM detalle_venta dv
  JOIN producto p ON dv.id_producto = p.id_producto
  JOIN venta v ON dv.id_venta = v.id_venta
  WHERE v.fecha_hora >= DATE_SUB(NOW(), INTERVAL 90 DAY)
  GROUP BY p.id_producto, p.nombre
) t
ORDER BY total_qty DESC;

-- ================================================================

/* 4) Consulta recursiva (CTE) - serie de fechas y ventas diarias acumuladas
   Propósito: Generar serie de días en un rango y calcular ventas diarias y acumuladas.
   Insight: Útil para ver tendencia y completar días sin ventas (0).
*/
WITH RECURSIVE days AS (
  SELECT DATE(DATE_SUB(CURDATE(), INTERVAL 120 DAY)) AS d
  UNION ALL
  SELECT DATE_ADD(d, INTERVAL 1 DAY) FROM days WHERE d < DATE(DATE_SUB(CURDATE(), INTERVAL 1 DAY))
),
sales AS (
  SELECT DATE(v.fecha_hora) AS fecha, SUM(dv.cantidad * dv.precio_unitario) AS ventas
  FROM venta v
  JOIN detalle_venta dv ON v.id_venta = dv.id_venta
  GROUP BY DATE(v.fecha_hora)
)
SELECT
  days.d AS fecha,
  COALESCE(sales.ventas, 0) AS ventas_diarias,
  SUM(COALESCE(sales.ventas, 0)) OVER (ORDER BY days.d) AS ventas_acumuladas
FROM days
LEFT JOIN sales ON sales.fecha = days.d
ORDER BY days.d desc;

-- ================================================================+


/* ---------------------------
   B.1 FUNCIÓN: calculate_recipe_cost
   - Propósito de negocio: calcular costo estimado de los ingredientes necesarios
     para preparar 1 unidad de un producto, usando el precio actual mínimo del proveedor.
   - Retorna: DECIMAL(12,2)
   - Idempotencia: DROP IF EXISTS
   - Nota de prueba: SELECT calculate_recipe_cost(<id_producto>);
--------------------------- */
DROP FUNCTION IF EXISTS calculate_recipe_cost;

DELIMITER $$
CREATE FUNCTION calculate_recipe_cost(pid INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE total_cost DECIMAL(12,4) DEFAULT 0.00;

  SELECT ROUND(SUM(pi.cantidad_necesaria * COALESCE(pi_price.min_price, 0)), 2)
  INTO total_cost
  FROM producto_ingrediente pi
  LEFT JOIN (
    -- obtener precio mínimo por ingrediente desde proveedores
    SELECT id_ingrediente, MIN(precio_actual) AS min_price
    FROM proveedor_ingrediente
    GROUP BY id_ingrediente
  ) pi_price ON pi.id_ingrediente = pi_price.id_ingrediente
  WHERE pi.id_producto = pid;

  RETURN COALESCE(total_cost, 0.00);
END$$
DELIMITER ;

-- Prueba:
SELECT calculate_recipe_cost(16) AS costo_producto_1;


/* 5) Consulta con CASE condicional
   Propósito: Clasificar productos según margen de beneficio estimado
   Insight: Identificar productos 'High margin', 'Medium', 'Low' para promoción.
   Nota: usamos la función de costo que definiremos inmediatamente abajo (calculate_recipe_cost).
*/
SELECT
  p.id_producto,
  p.nombre,
  p.precio_venta,
  ROUND(IFNULL(calculate_recipe_cost(p.id_producto),0),2) AS estimated_cost,
  ROUND( (p.precio_venta - IFNULL(calculate_recipe_cost(p.id_producto),0)) / p.precio_venta * 100,2) AS margin_pct,
  CASE
    WHEN (p.precio_venta - IFNULL(calculate_recipe_cost(p.id_producto),0)) / p.precio_venta >= 0.40 THEN 'High'
    WHEN (p.precio_venta - IFNULL(calculate_recipe_cost(p.id_producto),0)) / p.precio_venta >= 0.20 THEN 'Medium'
    ELSE 'Low'
  END AS margin_category
FROM producto p
ORDER BY margin_pct DESC;

-- ================================================================

/* 6) CONSULTA de existencia/inexistencia (NOT EXISTS)
   Propósito: Encontrar ingredientes sin proveedores registrados
   Insight: Muestra riesgo de ruptura por falta de proveedor.
*/
SELECT i.id_ingrediente, i.nombre, i.stock_actual, i.stock_minimo
FROM ingrediente i
WHERE NOT EXISTS (
  SELECT 1 FROM proveedor_ingrediente pi WHERE pi.id_ingrediente = i.id_ingrediente
)
ORDER BY i.stock_actual ASC;

-- ================================================================

/* 7) Agrupación avanzada (GROUPING + ROLLUP)
   Propósito: Ventas por categoría por día con totales por día y total general.
   Insight: Resumen jerárquico (día -> categoría -> total).
   IMPORTANTE: Los valores NULL en los resultados son NORMALES y representan:
   • NULL en 'categoria' = TOTAL del día para todas las categorías
   • NULL en 'fecha'     = TOTAL GENERAL de todas las fechas
 
	EJEMPLO: 
	| 2025-10-05 | NULL      | 21665.00 | = Total ventas del 5-oct
	| NULL       | NULL      | 90250.00 | = Total general del período
*/
SELECT
  DATE(v.fecha_hora) AS fecha,
  p.categoria,
  SUM(dv.cantidad * dv.precio_unitario) AS ventas
FROM venta v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
JOIN producto p ON dv.id_producto = p.id_producto
WHERE v.fecha_hora >= DATE_SUB(CURDATE(), INTERVAL 60 DAY)
GROUP BY DATE(v.fecha_hora), p.categoria WITH ROLLUP
ORDER BY DATE(v.fecha_hora) DESC, p.categoria;

-- ================================================================

/* 8) Consultas temporales (por fecha/rango) - ventas por hora del día
   Propósito: Identificar horas pico por promedio de ventas (ultimos 90 dias)
   Insight: Optimizar horarios y dotación de personal.
*/
SELECT
  HOUR(v.fecha_hora) AS hora,
  COUNT(DISTINCT v.id_venta) AS tickets,
  SUM(dv.cantidad * dv.precio_unitario) AS total_ventas,
  ROUND(AVG(dv.cantidad * dv.precio_unitario),2) AS avg_ticket_value
FROM venta v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
WHERE v.fecha_hora >= DATE_SUB(NOW(), INTERVAL 90 DAY)
GROUP BY HOUR(v.fecha_hora)
ORDER BY total_ventas DESC;

-- ================================================================

/* 9) Optimización de inventario (productos que se pueden preparar con stock disponible)
   Propósito: Listar productos que actualmente pueden prepararse con el stock actual.
   Insight: Evita ofrecer productos que no se pueden servir por falta de ingredientes.
*/
SELECT
  p.id_producto,
  p.nombre,
  CASE WHEN MIN(i.stock_actual / pi.cantidad_necesaria) >= 1 THEN 'Available' ELSE 'Not Available' END AS availability_estimate,
  FLOOR(MIN(i.stock_actual / pi.cantidad_necesaria)) AS possible_servings
FROM producto p
JOIN producto_ingrediente pi ON p.id_producto = pi.id_producto
JOIN ingrediente i ON pi.id_ingrediente = i.id_ingrediente
GROUP BY p.id_producto, p.nombre
ORDER BY possible_servings DESC;

-- ================================================================

/* 10) Análisis de ventas por categoría con subconsulta correlacionada
    Propósito: Mostrar categoría, total vendido y porcentaje sobre el total general
    Insight: Priorizar categorías más rentables.
*/
SELECT
  t.categoria,
  t.total_categoria,
  ROUND(t.total_categoria / tot.total_general * 100,2) AS pct_of_total
FROM (
  SELECT p.categoria, SUM(dv.cantidad * dv.precio_unitario) AS total_categoria
  FROM detalle_venta dv
  JOIN producto p ON dv.id_producto = p.id_producto
  JOIN venta v ON dv.id_venta = v.id_venta
  WHERE v.fecha_hora >= DATE_SUB(NOW(), INTERVAL 90 DAY)
  GROUP BY p.categoria
) t
CROSS JOIN (
  SELECT SUM(dv.cantidad * dv.precio_unitario) AS total_general
  FROM detalle_venta dv
  JOIN venta v ON dv.id_venta = v.id_venta
  WHERE v.fecha_hora >= DATE_SUB(NOW(), INTERVAL 90 DAY)
) tot
ORDER BY t.total_categoria DESC;

-- ================================================================
-- B. RUTINAS DE BASE DE DATOS (Función, Procedimiento, Trigger, Vista)
-- ================================================================


/* ---------------------------
B.2 PROCEDIMIENTO ALMACENADO: sp_generate_sales_summary
Propósito: calcular costo estimado de los ingredientes necesarios
para preparar 1 unidad de un producto, usando el precio actual mínimo del proveedor.
Retorna: DECIMAL(12,2)
Idempotencia: DROP IF EXISTS
--------------------------- */

DROP PROCEDURE IF EXISTS sp_generate_sales_summary;

DELIMITER $$
CREATE PROCEDURE sp_generate_sales_summary(
  IN p_start DATE,
  IN p_end DATE,
  OUT p_total_sales DECIMAL(14,2)
)
BEGIN

  -- sum total
  SELECT ROUND(COALESCE(SUM(dv.cantidad * dv.precio_unitario), 0), 2)
  INTO p_total_sales
  FROM venta v
  JOIN detalle_venta dv ON v.id_venta = dv.id_venta
  WHERE DATE(v.fecha_hora) BETWEEN p_start AND p_end;

  -- devolver detalle por día (como resultado de la SP)
  SELECT
    DATE(v.fecha_hora) AS fecha,
    COUNT(DISTINCT v.id_venta) AS tickets,
    ROUND(SUM(dv.cantidad * dv.precio_unitario), 2) AS total_ventas
  FROM venta v
  JOIN detalle_venta dv ON v.id_venta = dv.id_venta
  WHERE DATE(v.fecha_hora) BETWEEN p_start AND p_end
  GROUP BY DATE(v.fecha_hora)
  ORDER BY DATE(v.fecha_hora);

END$$
DELIMITER ;

-- Instrucciones de prueba:
CALL sp_generate_sales_summary('2025-10-01','2025-10-07', @total);
SELECT @total;

/* ---------------------------
   B.3 TRIGGER: trg_after_insert_detalle_venta
Propósito: al insertar detalle_venta, decrementar stock_actual de los ingredientes
usando la receta (producto_ingrediente). Si no hay suficiente stock -> SIGNAL error.
Restricciones: trigger AFTER INSERT en detalle_venta; idempotente DROP IF EXISTS
--------------------------- */
DROP TRIGGER IF EXISTS trg_after_insert_detalle_venta;

DELIMITER $$

CREATE TRIGGER trg_after_insert_detalle_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE ingr_id INT;
  DECLARE req_qty DECIMAL(10,3);
  DECLARE to_decrement DECIMAL(12,4);
  DECLARE current_stock DECIMAL(10,2);
  DECLARE error_msg VARCHAR(255);
  
  DECLARE cur_prod_ing CURSOR FOR
    SELECT id_ingrediente, cantidad_necesaria
    FROM producto_ingrediente
    WHERE id_producto = NEW.id_producto;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
  
  OPEN cur_prod_ing;
  
  read_loop: LOOP
    FETCH cur_prod_ing INTO ingr_id, req_qty;
    
    IF done = 1 THEN
      LEAVE read_loop;
    END IF;
    
    -- Calcula cantidad total a decrementar
    SET to_decrement = req_qty * NEW.cantidad;
    
    -- Verificar stock suficiente
    SELECT stock_actual INTO current_stock 
    FROM ingrediente 
    WHERE id_ingrediente = ingr_id;
    
    -- Validación de stock
    IF current_stock < to_decrement THEN
      SET error_msg = CONCAT('Stock insuficiente para ingrediente ID: ', ingr_id, 
                             '. Disponible: ', current_stock, 
                             ', Requerido: ', to_decrement);
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END IF;
    
    -- Decrementar stock
    UPDATE ingrediente
    SET stock_actual = stock_actual - to_decrement
    WHERE id_ingrediente = ingr_id;
    
  END LOOP;
  
  CLOSE cur_prod_ing;
END$$

DELIMITER ;

-- ============================================
-- EJEMPLO DE USO DEL TRIGGER
-- ============================================
-- VERIFICAR STOCK ACTUAL ANTES DE VENDER
SELECT 
    i.id_ingrediente,
    i.nombre,
    i.stock_actual,
    i.unidad_medida
FROM ingrediente i
WHERE i.id_ingrediente IN (1, 4, 5, 9);

-- INICIAR TRANSACCIÓN 
START TRANSACTION;

-- Verificar stock antes
SELECT 
    i.id_ingrediente,
    i.nombre,
    i.stock_actual,
    i.unidad_medida
FROM ingrediente i
WHERE i.id_ingrediente IN (1, 4, 5, 9);

-- Crear venta
INSERT INTO venta (fecha_hora, total, id_empleado) 
VALUES (NOW(), 150.00, 2);

SET @venta_id = LAST_INSERT_ID();

-- Intentar vender (si falla, ejecuta ROLLBACK manualmente)
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario)
VALUES (@venta_id, 1, 10, 15.00);

-- Si llegaste aquí sin error:
COMMIT;
SELECT 'Venta exitosa' AS resultado;

-- Si hubo error, ejecuta:
-- ROLLBACK;
-- SELECT 'Venta cancelada' AS resultado;

-- Verificar resultado
SELECT 
    i.id_ingrediente,
    i.nombre,
    i.stock_actual,
    i.unidad_medida
FROM ingrediente i
WHERE i.id_ingrediente IN (1, 4, 5, 9);

-- NOTA: Si las pruebas insertan muchos detalles en lote, este trigger
-- resta stock por cada detalle insertado. Para revertir una venta de prueba,
-- hay que re-incrementar manualmente el stock o eliminar el detalle_venta.

/* ---------------------------
   B.4 VISTA: view_top_products_and_inventory
  Propósito: vista que combina top productos (por cantidad vendida) y estado de inventario
  Insight: facilita dashboards sobre producto + disponibilidad
--------------------------- */

DROP VIEW IF EXISTS view_top_products_and_inventory;

CREATE VIEW view_top_products_and_inventory AS
SELECT
  p.id_producto,
  p.nombre AS producto,
  p.categoria,
  p.precio_venta,
  COALESCE(sales.total_qty, 0) AS total_sold_30d,
  -- calcular servings posible por ingrediente (mínimo)
  COALESCE(
    (SELECT FLOOR(MIN(i2.stock_actual / pi2.cantidad_necesaria))
     FROM producto_ingrediente pi2 
     JOIN ingrediente i2 ON pi2.id_ingrediente = i2.id_ingrediente
     WHERE pi2.id_producto = p.id_producto
     AND pi2.cantidad_necesaria > 0
    ), 0
  ) AS possible_servings,
  CASE 
    WHEN (
      SELECT FLOOR(MIN(i2.stock_actual / pi2.cantidad_necesaria))
      FROM producto_ingrediente pi2 
      JOIN ingrediente i2 ON pi2.id_ingrediente = i2.id_ingrediente
      WHERE pi2.id_producto = p.id_producto
      AND pi2.cantidad_necesaria > 0
    ) >= 1 THEN 'Available' 
    ELSE 'Not Available' 
  END AS availability
FROM producto p
LEFT JOIN (
  SELECT dv.id_producto, SUM(dv.cantidad) AS total_qty
  FROM detalle_venta dv
  JOIN venta v ON dv.id_venta = v.id_venta
  WHERE v.fecha_hora >= DATE_SUB(NOW(), INTERVAL 30 DAY)
  GROUP BY dv.id_producto
) sales ON p.id_producto = sales.id_producto
ORDER BY total_sold_30d DESC;


-- Prueba:
SELECT * FROM view_top_products_and_inventory LIMIT 20;

-- ================================================================
-- Final notes / extra idempotencia (no-op drops ya realizados arriba)
-- ================================================================

/*
  SOURCE: este script asume la existencia y estructura de tablas definidas
  en bd_equipo9_final.sql (productos, ingredientes, producto_ingrediente,
  proveedor_ingrediente, venta, detalle_venta, empleado, compra, detalle_compra, etc.)
  (ver bd_equipo9_final.sql). :contentReference[oaicite:1]{index=1}

  Recomendaciones de ejecución:
  1) Importa bd_taqueria.sql.
  2) Ejecuta este archivo: consultas_avanzadas.sql
  3) Probar funciones/procedimientos:
     - SELECT calculate_recipe_cost(1);
     - CALL sp_generate_sales_summary('2025-10-01','2025-10-05', @total); SELECT @total;
     - INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario)
       VALUES (<venta existente>, <producto_id>, 1, <precio>);
       -- observar la disminución en ingrediente.stock_actual
  4) Si al insertar detalle_venta el trigger lanza 'Insufficient stock...' significa
     que uno de los ingredientes no tiene stock suficiente; revertir la inserción y
     planear compra.

  Observaciones de diseño:
  - calculate_recipe_cost usa el precio mínimo disponible por ingrediente entre proveedores.
  - El trigger es AFTER INSERT y lanzará error (SQLSTATE '45000') si detecta stock insuficiente.
  - La vista view_top_products_and_inventory agrupa y calcula 'possible_servings' usando MIN(...) de las proporciones.
*/

-- FIN DEL SCRIPT
