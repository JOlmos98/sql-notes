**GROUP BY:**

Si queremos agrupar los artículos por SECCIÓN y que nos muestre las columnas SECCIÓN Y PRECIO y en PRECIO aparezca la suma de sus artículos:

```sql
SELECT SECCIÓN, SUM(PRECIOS) FROM PRODUCTOS GROUP BY SECCIÓN;
```

Si queremos lo mismo, pero en vez de agrupados por SECCIÓN, sea por PAÍSDEORIGEN:

```sql
SELECT PAÍSDEORIGEN, SUM(PRECIOS) FROM PRODUCTOS GROUP BY PAÍSDEORIGEN;
```

Si además queremos que se ordenen las sumas de los precios de menor a mayor, tendríamos que darle un alias a SUM(PRECIOS), en este caso SUMPRECIOS.

```sql
SELECT PAÍSDEORIGEN, SUM(PRECIOS) AS SUMPRECIOS FROM PRODUCTOS GROUP BY PAÍSDEORIGEN ORDER BY SUMPRECIOS;

SELECT POBLACIÓN, COUNT(POBLACIÓN) AS CONTPOBLACIÓN FROM CLIENTES GROUP BY POBLACIÓN;

SELECT SECCIÓN, MAX(PRECIO) FROM PRODUCTOS GROUP BY SECCIÓN HAVING SECCIÓN="CONFECCIÓN";
```

**ORDER BY:**

Si quieres ordenarlos según la SECCIÓN, se pondría después de completar el WHERE,

```sql
ORDER BY SECCIÓN;
```

Si quieres ordenarlos por SECCIÓN y en cada sección se ordenen por precio pero en vez de menor a mayor, sea al revés,

```sql
ORDER BY SECCIÓN, PRECIO DESC;
```