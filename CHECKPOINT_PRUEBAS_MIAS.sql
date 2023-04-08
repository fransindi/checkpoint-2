-- 11) ¿Cuál es el canal de venta que tiene la segunda posición en cantidad de ventas en 2020?
SELECT count(cantidad), idCanal from venta group by idCanal;
select * from canal_venta;

-- 13) ¿Cuál es el Id del empleado que menor cantidad de productos vendió en el histórico de ventas de la empresa?
select IdEmpleado, sum(cantidad) from venta group by IdEmpleado order by 2 asc limit 1;

-- 14) Se define el tiempo de entrega como el tiempo en días transcurrido entre que se realiza la compra y se efectua la entrega. 
-- Para realizar mejoras la dirección desea saber cuál es el mes con su respectivo año, con el promedio más bajo de este tiempo de entrega. 
-- (Fecha = Fecha de venta, Fecha_Entrega = Fecha de entrega)Proporcionar la respuesta con este formato: MMYYYY

SELECT AVG(timestampdiff(DAY, FECHA, FECHA_ENTREGA)) AS DIAS_DEMORA, CONCAT(MONTH(FECHA), YEAR(FECHA)) AS MES_ANIO FROM VENTA group by MES_ANIO ORDER BY 1;

-- 15) ¿Cuántos productos poseen un tipo que comienza con la letra 'I'?
SELECT count(tipo) FROM PRODUCTO where tipo like 'i%';

-- 16) ¿Cuantos productos tienen la palabra CD en alguna parte de
--  su descripción (Concepto = Descripción del Producto) y su precio es mayor a 500?

SELECT CONCEPTO, PRECIO FROM PRODUCTO WHERE CONCEPTO LIKE '%CD%' AND PRECIO > 500;

-- 17) ¿Cuál es el id del Producto cuyo nombre es EPSON COPYFAX 2000?
SELECT IDPRODUCTO FROM PRODUCTO WHERE CONCEPTO = 'EPSON COPYFAX 2000';

-- 18) Considerando el año 2017, ¿Cuál fue el mes (considerando la fecha de venta, es decir, usando el campo Fecha)
--  con mayor monto total de venta (monto de venta = Precio*Cantidad) para el empleado 1426?

SELECT IDEMPLEADO, MONTH(FECHA) AS MES, SUM(PRECIO * CANTIDAD) AS VENTA_TOTAL FROM VENTA WHERE IDEMPLEADO = 1426 AND YEAR(FECHA) = 2017 GROUP BY MES ORDER BY 3 DESC LIMIT 1;