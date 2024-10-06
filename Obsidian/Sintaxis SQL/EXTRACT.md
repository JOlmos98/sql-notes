La palabra EXTRACT se suele usar para extraer un número de una fecha u hora, por ejemplo:

```sql
SELECT EXTRACT(YEAR FROM(FECHA_INGRESO)) AS AÑO_DE_INGRESO FROM EMPLEADOS;
```

La consulta nos devolvería el año de ingreso. Si queremos hacer más compleja la consulta:

```sql
SELECT EXTRACT(YEAR FROM(NOW()))-EXTRACT(YEAR FROM(FECHA_INGRESO)) AS AÑOS_EN_LA_EMPRESA FROM EMPLEADOS;
```

Esta consulta nos devolvería la cantidad de años que lleva en la empresa cada empleado tomando como referencia su fecha de ingreso.

Podemos extraer distintos elementos de una fecha u hora o ambas:
1. YEAR.
2. MONTH (MON en algunos entornos).
3. DAY.
4. DAYOFWEEK.
5. HOUR.
6. MINUTE.
7. SECOND.
Si la fecha está en formato fecha y hora podemos extraer la fecha o la hora con las palabras DATE y TIME.