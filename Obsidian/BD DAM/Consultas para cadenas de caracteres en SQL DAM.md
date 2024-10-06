- `CHR(n)`
    
    Devuelve el carácter cuyo valor codificado es n.
    
    Ejemplo:
    
    ```sql
    SELECT CHR(81) FROM DUAL; --Resultado: Q
    ```
    
- `ASCII(n)`
    
    Devuelve el valor [ASCII](https://ead.murciaeduca.es/pluginfile.php/1489297/mod_resource/content/1/singlepage_index.html#t9ba3e3f6-6318-1c7f-ceea-ba9c22427c27) de n.
    
    Ejemplo:
    
    ```sql
    SELECT ASCII('O') FROM DUAL; --Resultado: 79
    ```
    
- `CONCAT(cad1, cad2)`
    
    Devuelve las dos cadenas concatenada o unidas. Es equivalente al operador ||
    
    Ejemplo:
    
    ```sql
    SELECT CONCAT('Hola', 'Mundo') FROM DUAL; --Resultado: HolaMundo
    ```
    
- `LOWER(cad)`
    
    Devuelve la cadena cad con todos sus caracteres en minúsculas.
    
    Ejemplo:
    
    ```sql
    SELECT LOWER('En MInúsculAS') FROM DUAL; --Resultado: en minúsculas
    ```
    
- `UPPER(cad)`
    
    Devuelve la cadena cad con todos sus caracteres en mayúsculas.
    
    Ejemplo:
    
    ```sql
    SELECT UPPER('En MAyúsculAS') FROM DUAL; --Resultado: EN MAYÚSCULAS
    ```
    
    Esta función y la siguiente son muy utilizadas, y necesarias,  al comparar con cadenas cuando hay dudas sobre si todos los caracteres de la cadena a comparar están en mayúsculas, minúsculas o mezcla. Por ejemplo si queremos conocer los datos de la tabla JUEGOS cuyo nombre es AJEDREZ podemos utilizar cualquiera de las dos sentencias siguientes. Así se seleccionará la fila, tanto si está escrito en la tabla como AJEDREZ, ajedrez o Ajedrez.
    
    ```sql
    SELECT * FROM JUEGOS WHERE UPPER(NOMBRE)='AJEDREZ'; 
    SELECT * FROM JUEGOS WHERE LOWER(NOMBRE)='ajedrez';
    ```
    
- `INITCAP(cad)`
    
    Devuelve la cadena cad con su primer carácter en mayúscula.
    
    Ejemplo:
    
    ```sql
    SELECT INITCAP('hola') FROM DUAL; --Resultado: Hola
    ```
    
- `LPAD(cad1, n, cad2)`
    
    Devuelve cad1 con longitud n, ajustada a la derecha, rellenando por la izquierda con cad2.
    
    Ejemplo:
    
    ```sql
    SELECT LPAD('M', 5, '*') FROM DUAL; --Resultado: ****M
    ```
    
- `RPAD(cad1, n, cad2)`
    
    Devuelve cad1 con longitud n, ajustada a la izquierda, rellenando por la derecha con cad2.
    
    Ejemplo:
    
    ```sql
    SELECT RPAD('M', 5, '*') FROM DUAL; --Resultado: M****
    ```
    
- `REPLACE(cad, ant, nue)`
    
    Devuelve cad en la que cada ocurrencia de la cadena ant ha sido sustituida por la cadena nue.
    
    Ejemplo:
    
    ```sql
    SELECT REPLACE('correo@gmail.es', 'es', 'com') FROM DUAL; --Resultado: correo@gmail.com
    ```
    
- `SUBSTR(cad, m, n)`
    
    Obtiene una subcadena de una cadena. Devuelve la cadena cad compuesta por n caracteres a partir de la posición m.
    
    Ejemplo:
    
    ```sql
    SELECT SUBSTR('1234567', 3, 2) FROM DUAL; --Resultado: 34
    ```
    
- `LENGTH(cad)`
    
    Devuelve la longitud de cad.
    
    Ejemplo:
    
    ```sql
    SELECT LENGTH('hola') FROM DUAL; --Resultado: 4
    ```
    
- `TRIM(cad)`
    
    Elimina los espacios en blanco a la izquierda y la derecha de cad y los espacios dobles del interior.
    
    Ejemplo:
    
    ```sql
    SELECT TRIM(' Hola de nuevo ') FROM DUAL; --Resultado: Hola de nuevo
    ```
    
- `LTRIM(cad)`
    
    Elimina los espacios a la izquierda que posea cad.
    
    Ejemplo:
    
    ```sql
    SELECT LTRIM(' Hola') FROM DUAL; --Resultado: Hola
    ```
    
- `RTRIM(cad)`
    
    Elimina los espacios a la derecha que posea cad.
    
    Ejemplo:
    
    ```sql
    SELECT RTRIM('Hola ') FROM DUAL; --Resultado: Hola
    ```
    
- `INSTR(cad, cadBuscada [, posInicial [, nAparición]])`
    
    Obtiene la posición en la que se encuentra la cadena buscada en la cadena inicial cad. Se puede comenzar a buscar desde una posición inicial concreta e incluso indicar el número de aparición de la cadena buscada. Si no encuentra nada devuelve cero.
    
    Ejemplo:
    
    ```sql
    SELECT INSTR('usuarios', 'u') FROM DUAL; --Resultado: 1
    SELECT INSTR('usuarios', 'u', 2) FROM DUAL; --Resultado: 3
    SELECT INSTR('usuarios', 'u', 2, 2) FROM DUAL; --Resultado: 0
    ```