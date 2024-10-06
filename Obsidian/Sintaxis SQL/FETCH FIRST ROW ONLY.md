Muestra sólo el primer registro de la consulta. Por ejemplo:

```sql
SELECT NOMBRE FROM EMPLEADO ORDER BY NOMBRE;
```

La consulta anterior nos dará una lista de los nombres de los empleados ordenados alfabéticamente.

```sql 
SELECT NOMBRE FROM EMPLEADO ORDER BY NOMBRE FETCH FIRST ROW ONLY;
```

Y esta consulta mostraría sólo el primer nombre según el alfabeto.