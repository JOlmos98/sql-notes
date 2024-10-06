Esta palabra reservada nos devuelve la posición donde comienza una subcadena de caracteres dentro de una cadena de caracteres. Por ejemplo:

```sql 
SELECT INSTR("Hola mundo", "Hola");
```

Esta consulta nos devolverá un campo con el nombre de la consulta y el resultado será 1, ya que la subcadena comienza en la posición 1. En el siguiente ejemplo usamos una consulta del estilo:

```sql 
SELECT INSTR("Hola mundo", " ");
```

Esta consulta nos devolverá un resultado de 5, ya que la subcadena comienza en el carácter 5. 

```sql 
SELECT INSTR("Hola mundo", "mundo");
```

Y esta última consulta nos devuelve un resultado de 6.

Otro ejemplo de su uso llevándolo a la práctica sería:

```sql
SELECT * FROM CLIENTES WHERE INSTR (NOMBRE, "Juan")>0;
```

En nuestra tabla CLIENTES relacionada con PRODUCTOS y PEDIDOS, podríamos hacer la siguiente consulta:

```sql
SELECT * FROM CLIENTES WHERE INSTR (EMPRESA, "LA")>0;
```

Y nos mostraría todos los registros donde el nombre de la empresa contiene la subcadena "LA", esté donde esté:
![[consulta INSTR.PNG]]