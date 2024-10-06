La palabra reservada SOME tiene un funcionamiento parecido a IN, por ejemplo:

```sql
SELECT * FROM EMPLEADOS WHERE SALARIO=SOME (SELECT SALARIO FROM EPLEADOS WHERE DEPARTAMENTO='VENTAS');
```

La consulta anterior devolverá los registros de los empleados los cuales su salario sea igual a alguno de los salarios devueltos por la subconsulta, que dicha subconsulta mostraría los salarios de los empleados del departamento de ventas. Es decir, la consulta total mostraría los registros de los empleados del departamento de ventas y los registros de los empleados de otros departamentos que coincidan en salario con algún empleado del departamento de ventas.

Otro ejemplo:

```sql
SELECT FROM PRODUCTOS WHERE PRECIO>SOME (SELECT PRECIO FROM PRODUCTOS WHERE CATEGORIA='ELECTRÓNICOS');
```

Esta última consulta mostrará todos los productos que tengan un precio superior a algún producto de la categoría electrónicos, o lo que es lo mismo, mostrará todos los productos que tengan un precio mayor al producto más barato de la categoría electrónicos.