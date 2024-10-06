Estos operadores se usan para establecer criterios tales como "los registros en el que el campo 'EJEMPLO' empiece por la letra "A" (A%)" o "los registros en el que en el campo 'EJEMPLO' contengan la cadena "da" (%da%)"
### %:
El operador "%" se usa como carácter comodín que representa cualquier número de caracteres incluido ninguno. Ejemplos:
- S% muestra los registros que empiezan con el carácter "S".
- &s muestra los registros que empiezan con el carácter "s".
- %s% muestra los registros que contengan el carácter "s".
También funcionan con cadenas de caracteres o números, es decir, puedes poner Sa% y serán los registros que empiecen por "Sa" o poner %65% y aparecerá el registro en cuestión que contenga la cadena "65".
Se escribirían así:

```sql
SELECT * FROM PERSONAS WHERE NOMBRE LIKE 'A%';

SELECT * FROM PERSONAS WHERE APELLIDO LIKE '%z';

SELECT * FROM PERSONAS WHERE TELEFONO LIKE '%968%'
```

### \_:
El operador "\_" se usa como carácter comodín que representa un solo carácter. Ejemplos:
- A_a nos devuelve los registros que empiecen por la palabra "A" y terminen en la palabra "a".
- %\_a% nos devuelve los registros donde la letra "A" esté en cualquier posición.
- %\_\[ao] devuelve los registros que terminen en "a" o en "o".
- \[A-Z]\_\[a-z] nos devuelve los registros que empiezan por una letra mayúscula y terminen por una minúscula.

```sql
SELECT * FROM PERSONAS WHERE NOMBRE LIKE 'A_a';

SELECT * FROM PERSONAS WHERE APELLIDO LIKE '%_a%';

SELECT * FROM PERSONAS WHERE NOMBRE '[A-Y]_[a-z]';
```

En esa última sentencia SQL se contempla los nombres cuya letra inicial esté entre la "A" y la "Y", mayúsculas todas ellas, excluyendo la "Z" y cuya última letra sea minúscula incluyendo la "z".

### \[ ]:
El operador de rango de caracteres \[ ] sirve para delimitar el rango de los caracteres y operar con los operadores anteriormente mencionados. En la última sentencia mencionada se hace uso de él. También contempla números, es decir, podemos poner \[1-9] y estamos contemplando los números mayores que 1 y menores que 9 ambos inclusive. Ejemplo:

```sql
SELECT * FROM PERSONAS WHERE TELEFONO LIKE '[100-200]%';

SELECT TELEFONO FROM PERSONAS WHERE TELEFONO LIKE '[^6-7]%';
```

En la primera sentencia pedimos que nos muestre los teléfonos que empiecen por un número entre 100 y 200, ambos inclusive.

En la segunda sentencia pedimos que nos muestre únicamente el campo TELEFONO (en la primera sentencia mostrará todos los campos de los registros que cumplan con el criterio, en esta segunda, solo el campo TELEFONO) donde el teléfono empiece por un número distinto a al rango 6-7, ambos inclusive.

### \[^]:
Este último operador \[^] tiene un funcionamiento parecido al != de Java, es decir, si pones \[^A-E] estaremos seleccionando todas las letras distintas del rango A-E, ambos inclusive, realizamos la búsqueda de las letras que no sean A-B-C-D-E. En la última sentencia se muestra su funcionamiento.

