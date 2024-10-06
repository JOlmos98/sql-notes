Las vistas nos permiten realizar una especie de consultas predefinidas sin tener que utilizar el motor de búsqueda de la base de datos.

Por ejemplo, si queremos crear una vista que nos muestre las columnas NOMBREARTÍCULO, SECCIÓN y PRECIO de los productos de la sección DEPORTES, sería asó:

```sql
CREATE VIEW ART_DEPORTES AS

SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO FROM PRODUCTOS WHERE SECCIÓN='DEPORTES';
```

Con esto ya tendríamos la vista creada y podemos consultarla, las vistas son fieles a los datos reflejados en la tabla original, es decir, si un valor cambia en la tabla, también se actualiza en la vista.

Las vistas permiten modificaciones con la palabra reservada ALTER. Por ejemplo, si queremos que también muestre la columna PAÍSDEORIGEN:

```sql
ALTER VIEW ART_DEPORTES AS

SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO, PAÍSDEORIGEN FROM PRODUCTOS WHERE SECCIÓN='DEPORTES';
```

Para eliminar la vista usamos una vez más la palabra reservada DROP:

```sql
DROP VIEW ART_DEPORTES;
```