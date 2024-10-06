### **LIKE:**

La palabra reservada LIKE se usa para establecer un criterio en torno a una consulta junto con el operador "%", por ejemplo, queremos consultar todos los registros de la tabla 'PERSONAS' donde el nombre comience por A:

```sql
SELECT *
FROM PERSONAS
WHERE NOMBRE LIKE 'A%';
```

En este ejemplo recupera todos los registros de la tabla `personas` donde el nombre termine en la letra "a".

```sql
SELECT *
FROM PERSONAS
WHERE NOMBRE LIKE '%a';
```

En este caso recupera todos los registros de la tabla `personas` donde el nombre contenga la palabra "de"

```sql
SELECT *
FROM personas
WHERE nombre LIKE '%de%';

```

En definitiva, el operador "%" simboliza cualquier carácter o cadena de caracteres, en los ejemplos anteriores, sustituyendo % por su definición. simboliza algo así:
- A% = A(seguido de cualquier carácter siendo "A" el primero)
- %a = (cualquier carácter seguido de la letra "a", siendo esta el último carácter)a
- %de% = (cualquier carácter o cadena seguido de "de")de("de" seguido de cualquier carácter o cadena) Es decir, cualquier cadena de caracteres que contenga "de".

"%" representa cualquier número de caracteres, incluido ninguno.

### **HAVING:**
La palabra reservada HAVING  se usa de forma parecida a la cláusula WHERE, la principal diferencia es que WHERE se usa para filtrar registros individuales mientras que HAVING es para filtrar grupos de registros. Por ejemplo:

```sql
SELECT * FROM PERSONAS WHERE NOMBRE='ANTONIO';
```

Esta consulta anterior mostraría los registros de PERSONAS donde el nombre sea Antonio.
Y con HAVING:

```sql
SELECT * FROM PERSONAS GROUP BY PAIS HAVING SUM(EDAD)>50;
```

Esta consulta anterior mostraría los registros donde todos los registros de un mismo país, sumando sus edades, de un número mayor que 50, es decir, si sumamos las edades de las personas de España y da 49, esos registros no aparecerían, o lo que es lo mismo, el grupo donde PAIS='ESPAÑA' no aparece. Por otro lado, si sumando las edades de los registros donde PAIS='BOLIVIA' diese 65, ese grupo si aparecería.

La palabra reservada SUM suma en este caso las edades, si pusiésemos AVG nos devolvería la media en vez de la suma y sólo se mostrarían los grupos de personas que coincidan en el país y formen una media de edad superior a 50.
