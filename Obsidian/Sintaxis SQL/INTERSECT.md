La palabra reservada INTERSECT se usa para consultar las filas o registros que están presentes en dos o más tablas a la vez. Es el contrario de la palabra UNION. Por ejemplo, si tenemos las tablas CLIENTES y PEDIDOS y hacemos la consulta siguiente: 

```sql
SELECT NOMBRE, APELLIDO FROM CLIENTES 
INTERSECT 
SELECT NOMBRE, APELLIDO FROM PEDIDOS;
```

El resultado de la consulta nos mostraría los campos NOMBRE y APELLIDO de los registros que estén en ambas tablas.

Otro ejemplo sería, en las tablas de PRODUCTOS, CLIENTES y PEDIDOS, podemos hacer la siguiente consulta y sólo nos mostraría los clientes que han hecho pedidos realmente:

```sql
SELECT CÓDIGOCLIENTE FROM CLIENTES
INTERSECT
SELECT CÓDIGOCLIENTE FROM PEDIDOS WHERE [FECHA DE PEDIDO]>'01/05/2000';
```

En Access se usan los corchetes \[] para los nombres de campos con espacios, en MySQL se suelen usar las comillas dobles "", aunque teóricamente también se pueden usar las comillas simples ''.