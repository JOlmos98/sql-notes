- **`ABS(n)`**
    
    Calcula el [valor absoluto](https://ead.murciaeduca.es/pluginfile.php/1489297/mod_resource/content/1/singlepage_index.html#t23513ab4-5cc6-5e86-654e-e8f17177934b) de un número n.
    
    Ejemplo:
    
    ```sql
    SELECT ABS(-17) FROM DUAL; -- Resultado: 17
    ```
    
- **`EXP(n)`**
    
    Calcula еn , es decir, el exponente en base e del número n.
    
    Ejemplo: 
    
    ```sql
    SELECT EXP(2) FROM DUAL; -- Resultado: 7,38
    ```
    
- `CEIL(n)`
    
    Calcula el valor entero inmediatamente superior o igual al argumento n.
    
    Ejemplo:
    
    ```sql
    SELECT CEIL(17.4) FROM DUAL; -- Resultado: 18
    ```
    
- `FLOOR(n)`
    
    Calcula el valor entero inmediatamente inferior o igual al parámetro n.
    
    Ejemplo:
    
    ```sql
    SELECT FLOOR(17.4) FROM DUAL; -- Resultado: 17
    ```
    
- `MOD(m,n)`
    
    Calcula el [resto](https://ead.murciaeduca.es/pluginfile.php/1489297/mod_resource/content/1/singlepage_index.html#td95815c3-c844-9706-748d-3a0a2ce24e9a) resultante de dividir m entre n.
    
    Ejemplo: 
    
    ```sql
    SELECT MOD(15, 2) FROM DUAL; --Resultado: 1
    ```
    
- `POWER(valor, exponente)`
    
    Eleva el valor al exponente indicado.
    
    Ejemplo: 
    
    ```sql
    SELECT POWER(4, 5) FROM DUAL; -- Resultado: 1024
    ```
    
- `ROUND(n, decimales)`
    
    Redondea el número n al siguiente número con el número de decimales que se indican.
    
    Ejemplo: 
    
    ```sql
    SELECT ROUND(12.5874, 2) FROM DUAL; -- Resultado: 12.59
    ```
    
- `SQRT(n)`
    
    Calcula la raíz cuadrada de n.
    
    Ejemplo: 
    
    ```sql
    SELECT SQRT(25) FROM DUAL; --Resultado: 5
    ```
    
- `TRUNC(m,n)`
    
    [Trunca](https://ead.murciaeduca.es/pluginfile.php/1489297/mod_resource/content/1/singlepage_index.html#t572201d4-22bc-c8fc-1d2d-9742612e3022) un número a la cantidad de decimales especificada por el segundo argumento. Si se omite el segundo argumento, se truncan todos los decimales. Si "n" es negativo, el número es truncado desde la parte entera.
    
    Ejemplos: 
    
    ```sql
    SELECT TRUNC(127.4567, 2) FROM DUAL; -- Resultado: 127.45
    SELECT TRUNC(4572.5678, -2) FROM DUAL; -- Resultado: 4500
    SELECT TRUNC(4572.5678, -1) FROM DUAL; -- Resultado: 4570
    SELECT TRUNC(4572.5678) FROM DUAL; -- Resultado: 4572
    ```
    
- `SIGN(n)`
    
    Si el argumento "n"es un valor positivo, retorna 1, si es negativo, devuelve -1 y 0 si es 0. 
    
    ```sql
    SELECT SIGN(-23) FROM DUAL; – Resultado: -1
    ```