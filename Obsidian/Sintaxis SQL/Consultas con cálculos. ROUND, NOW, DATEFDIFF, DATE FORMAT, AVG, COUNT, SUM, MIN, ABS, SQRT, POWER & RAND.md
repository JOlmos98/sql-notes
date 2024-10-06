Si queremos mostrar la columna NOMBREARTÍCULOS, la de PRECIO y otra que se llame IVA y contengo el 21% del precio:

```sql
SELECT NOMBREARTÍCULO, PRECIO, PRECIO*0.21 AS IVA FROM PRODUCTOS;
```

Si en vez de eso quisiésemos una tabla con el precio y el iva sumado sería:

```sql
PRECIO*1.21 AS PRECIO_CON_IVA.
```

ROUND(): Si ponemos ROUND(PRECIO*1.21,2) redondeará a dos decimales y no quedará tan largo el precio.

NOW(): Si incluimos en los campos NOW() AS DIA_DE_HOY, nos aparecerá otra columna que contiene la fecha y la hora actual.

DATEFIFF(): Nos devuelve la diferencia en días de dos fechas, en este caso sería DATEDIFF(NOW(),FECHA) y nos daría la columna.

DATE_FORMAT(): NOW() Nos devuelve la fecha completa y su hora, si queremos que solo muestre el día y el mes podemos hacerlo con DATE_FORMAT(NOW(),'%D-%M').

AVG(): Se usa para calcular la media de una columna numérica. Por ejemplo: 

```sql
AVG(PRECIO) AS MEDIA_PRECIO.
```

COUNT(): Cuenta el número de filas.

SUM(): Suma la columna.

MIN() y MAX(): Devuelve el valor mínimo o máximo.

ABS(): Valor absoluto.

SQRT(): Raíz cuadrada.

POWER(): Potencia.GR

RAND(): Número random.

MOD(n, m): Divide n entre m.

TRUNC(n, m): [Trunca](https://ead.murciaeduca.es/pluginfile.php/1489297/mod_resource/content/1/singlepage_index.html#t572201d4-22bc-c8fc-1d2d-9742612e3022) un número a la cantidad de decimales especificada por el segundo argumento. Si se omite el segundo argumento, se truncan todos los decimales. Si "m" es negativo, el número es truncado desde la parte entera.

```sql
SELECT TRUNC(127.4567, 2) FROM DUAL; -- Resultado: 127.45
SELECT TRUNC(4572.5678, -2) FROM DUAL; -- Resultado: 4500
SELECT TRUNC(4572.5678, -1) FROM DUAL; -- Resultado: 4570
SELECT TRUNC(4572.5678) FROM DUAL; -- Resultado: 4572
```

SIGN(n): Si el argumento "n" es un valor positivo, retorna 1, si es negativo, devuelve -1 y 0 si es 0.