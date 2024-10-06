
- SELECT: Se usa para seleccionar las columnas/campos con las que se quiere operar.

- FROM: Se usa posteriormente a SELECT para especificar de que relación/tabla se quieren seleccionar las columnas.

- WHERE: Se usa para condicionar la consulta y reducirla, por ejemplo, si quisiésemos hacer una consulta a las columnas SECCIÓN, NOMBREARTÍCULO y PRECIO y quisiésemos que en solo muestre las filas que en la columna SECCIÓN tenga escrito DEPORTES sería:

```SQL
SELECT SECCION, NOMBREARTÍCULO, PRECIO FROM PRODUCTOS WHERE SECCIÓN='DEPORTES';
```

Y nos mostraría las tres columnas de los registros donde SECCIÓN sea DEPORTES. Si quisiésemos que mostrase los registros donde SECCIÓN es DEPORTES, CERÁMICA y FERRETERÍA sería:

``` sql
SELECT SECCIÓN, NOMBREARTÍCULO, PRECIO FROM PRODUCTOS WHERE SECCIÓN='DEPORTES' OR SECCIÓN='CERÁMICA' OR SECCIÓN='FERRETERÍA';
```

# EJERCICIOS USO DEL WHERE, FROM, OR, AND, BETWEEN.

(Los ejercicios se hacen con la tabla PRODUCTOS y CLIENTES en PHPMyAdmin)

1. Realizar una consulta que muestre los campos “Empresa” y “Población” de la tabla “Clientes”.
```sql
SELECT EMPRESA, POBLACIÓN FROM CLIENTES;
```
2. Realizar una consulta que muestre los artículos d la sección “Cerámica”.
``` sql
SELECT * FROM PRODUCTOS WHERE SECCIÓN='CERÁMICA';
```
3. Realizar una consulta que muestre los productos de la sección “Deportes” cuyo precio esté entre 100 y 200 €. En la consulta solo se mostrarán los campos “Nombre de artículo” y “Precio”.
``` sql
SELECT NOMBREARTÍCULO, PRECIO FROM PRODUCTOS WHERE SECCIÓN='DEPORTES' AND PRECIO BETWEEN 100 AND 300;
```
4. Realizar una consulta que muestre los productos cuyo país no sea España.
``` sql
SELECT * FROM PRODUCTOS WHERE PAÍSDEORIGEN!='ESPAÑA';
```
5. Realizar una consulta que muestre los artículos españoles de la sección “Deportes” o aquellos cuyo precio sea superior a 350 € independientemente de cual sea su sección o país de origen.
``` sql
SELECT * FROM PRODUCTOS WHERE SECCIÓN='DEPORTES' AND PAÍSDEORIGEN='ESPAÑA' OR PRECIO>350;
```
6. Realizar una consulta que muestre los productos cuya fecha esté entre 1/05/2001 y 15/12/2001. En la consulta solo se visualizarán los campos “Nombre de artículo”, “Sección” y “Fecha”.
``` sql
SELECT NOMBREARTÍCULO, SECCIÓN, FECHA FROM PRODUCTOS WHERE FECHA BETWEEN '2001-05-01' AND '2001-12-15';
```