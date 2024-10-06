Con las referencias cruzadas conseguimos mostrar consultas en tablas de forma distinta a la habitual. En este primer caso mostraremos en las columnas cada SECCIÓN, en las filas cada NOMBRE DE ARTÍCULO y en la llamada zona de totales, la suma de los precios. El código sería así:

```sql
TRANSFORM SUM(PRECIO) AS TOTAL

SELECT NOMBREARTÍCULO FROM PRODUCTOS GROUP BY NOMBREARTÍCULO

PIVOT SECCIÓN;
```

Tenemos que usar siempre la cláusula TRANSFORM para la zona de totales, la de GROUP BY para la zona de filas y la de PIVOT para la zona de columnas.

```sql
SELECT EMPRESA, POBLACIÓN, [FORMA DE PAGO] FROM CLIENTES INNER JOIN PEDIDOS ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.[CÓDIGO CLIENTE];

TRANSFORM COUNT(POBLACIÓN) AS TOTAL

SELECT EMPRESA FROM PREVIA GROUP BY EMPRESA

PIVOT [FORMA DE PAGO];
```

# EJERCICIOS DE REFERENCIAS CRUZADAS.

1. Realiza una consulta de referencias cruzadas que muestre cuántos artículos hay en la tabla de productos por cada año. El resultado obtenido sea el siguiente: (_Ayuda: Para agrupar por año utiliza la función Format: Format(FECHA,"yyyy")_)
![[EJ1 RC.png]]
```sql
TRANSFORM COUNT(PRECIO) AS TOTAL

SELECT PAÍSDEORIGEN FROM PRODUCTOS GROUP BY PAÍSDEORIGEN

PIVOT FORMAT(FECHA, "yyyy");
```
2. Realiza una consulta de referencias cruzadas que muestre cuántos artículos importados y no importados han sido enviados, y cuántos importados y no importados hay sin enviar. El resultado sea el siguiente:
![[EJ2 RC.png]]
```sql
SELECT PRODUCTOS.CÓDIGOARTÍCULO, IMPORTADO, ENVIADO FROM PRODUCTOS INNER JOIN (PEDIDOS INNER JOIN PRODUCTOSPEDIDOS ON PEDIDOS.[NÚMERO DE PEDIDO]=PRODUCTOSPEDIDOS.[NÚMERO DE PEDIDO]) ON PRODUCTOS.CÓDIGOARTÍCULO=PRODUCTOSPEDIDOS.[CÓDIGO ARTÍCULO];
```
Hacemos la consulta PREVIA y después:
```sql
TRANSFORM COUNT(CÓDIGOARTÍCULO) AS TOTAL

SELECT IMPORTADO FROM PREVIA GROUP BY IMPORTADO

PIVOT ENVIADO;
```