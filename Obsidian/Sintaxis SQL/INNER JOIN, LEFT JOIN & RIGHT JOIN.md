**INNER JOIN:** Esta sentencia fusiona dos tablas según su clave primaria y foránea respectivamente, y muestra los registros que coincidan, por ejemplo, en la tabla CLIENTES es clave primaria CÓDIGO CLIENTE y en la tabla PEDIDOS es clave foránea CÓDIGO CLIENTE, para que nos muestre los datos relacionados de ambas tablas escribimos:

```sql
SELECT * FROM CLIENTES INNER JOIN PEDIDOS ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.[CÓDIGO CLIENTE] WHERE POBLACIÓN='MADRID'; 
```

Esta sentencia muestra los clientes QUE HAN HECHO PEDIDOS y todos sus datos, los clientes de la tabla CLIENTES que no hayan hecho pedidos no se mostrarán porque no están relacionados con la tabla PEDIDOS.

Si un nombre tiene espacios, en Access, se pone el nombre entre corchetes.

**LEFT JOIN:** Esta sentencia muestra los registros que coinciden, como ocurre con INNER JOIN, pero además muestra todos los registros de una de las tablas, en nuestro caso, la izquierda, CLIENTES:

```sql
SELECT * FROM CLIENTES LEFT JOIN PEDIDOS ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.[CÓDIGO CLIENTE] WHERE POBLACIÓN='MADRID'; 
```

Ahora se mostrará lo mostrado con INNER JOIN y también los clientes que NO han hecho pedidos.

**RIGHT JOIN:** Esta sentencia mostraría sólo los registros que coincidan en ambas tablas y además las de CLIENTES, pero por la naturaleza de las tablas, no va a existir ningún pedido que no esté relacionado con un cliente de la tabla CLIENTES.

```sql
SELECT * FROM CLIENTES RIGHT JOIN PEDIDOS ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.[CÓDIGO CLIENTE] WHERE POBLACIÓN='MADRID';
```
