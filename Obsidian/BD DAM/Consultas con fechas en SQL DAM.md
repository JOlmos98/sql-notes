- `SYSDATE` Devuelve la fecha y hora actuales. Ejemplo:

```sql
SELECT SYSDATE FROM DUAL; --Resultado: 15/08/20
```

- `SYSTIMESTAMP` Devuelve la fecha y hora actuales en formato `TIMESTAMP.` Ejemplo:

```sql
SELECT SYSTIMESTAMP FROM DUAL; --Resultado: 15/08/20 11:40:41,969000 +02:00
```

- `ADD_MONTHS(fecha, n)` Añade a la fecha el número de meses indicado con n. Ejemplo:

```sql
SELECT ADD_MONTHS('27/07/11', 5) FROM DUAL; --Resultado: 27/12/11
```

- `MONTHS_BETWEEN(fecha1, fecha2)` Devuelve el número de meses que hay entre fecha1 y fecha2. Ejemplo:

```sql
SELECT MONTHS_BETWEEN('12/07/11','12/03/11') FROM DUAL; --Resultado: 4
```

- `LAST_DAY(fecha)` Devuelve el último día del mes al que pertenece la fecha. El valor devuelto es tipo `DATE.` Ejemplo:

```sql
SELECT LAST_DAY('27/07/11') FROM DUAL; --Resultado: 31/07/11
```

- `NEXT_DAY(fecha, d)` Indica el día que corresponde si añadimos a la fecha el día d. El día devuelto puede ser texto ('Lunes', Martes', ..) o el número del día de la semana (1=lunes, 2=martes, ..) dependiendo de la configuración. Ejemplo:

```sql
SELECT NEXT_DAY('31/12/11','LUNES') FROM DUAL; --Resultado: 02/01/12
```

- `EXTRACT(valor FROM fecha)` Extrae un valor de una fecha concreta. El valor puede ser day, month, year, hours, etc. Ejemplo:

```sql
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL; --Resultado: 8
```

En Oracle: Los operadores aritméticos "+" (más) y "-" (menos) pueden emplearse para las fechas. Por ejemplo:

```sql
SELECT SYSDATE – 5 FROM DUAL; -- Devuelve la fecha correspondiente a 5 días antes de la fecha actual
```