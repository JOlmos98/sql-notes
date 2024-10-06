Esta palabra reservada es TRUNC en SQLPlus, SQLDeveloper y alguno más, en MySQL se usa TRUNCATE. Se usa para redondear el valor a un valor con precisión especificada, por ejemplo:

```sql
SELECT TRUNC(1.2723, 1) AS TRUNCADO_1;
```

Esta consulta devolverá un campo llamado TRUNCADO_1 con un resultado de 1.2. 

```sql
SELECT TRUNC(23.1364, 2) AS TRUNCADO_2;
```

Esta consulta nos devolverá un resultado de 23.13, es decir, no redondea para devolver un 23.14. 

La cláusula TRUNCATE en MySQL elimina las filas donde el precio tenga más decimales de los especificados, es decir, en nuestra tabla PRODUCTOS usamos la sentencia:

```sql
SELECT * FROM PRODUCTOS WHERE PRECIO=TRUNCATE(PRECIO, 3);
```

Esa sentencia no mostraría los productos donde el precio tuviese un cuarto decimal que no fuese 0. Es decir, los productos donde los decimales lleguen hasta el tercer dígito o menos, si los mostraría.

También podemos usar TRUNCATE para eliminar registros:

```sql
TRUNCATE TABLE PRODUCTOS WHERE IMPORTADO='FALSO';
```

Esta sentencia eliminaría todos los registros donde IMPORTADO sea FALSO.
En definitiva, la cláusula TRUNCATE puede eliminar los registros de una tabla sin eliminar la tabla.