La palabra RPAD se usa para rellenar con un carácter una longitud determinada, por ejemplo:

```sql
SELECT RPAD("HOLA", 10, "X") AS EJEMPLO_1_RPAD;
```

Esto nos debería devolver una consulta de un campo llamado EJEMPLO_1_RPAD donde el resultado es HOLAXXXXXX. Las X llegan hasta el carácter 10, es decir, la sentencia no significa que vaya a haber diez X, si no que se rellenará hasta la posición 10 con X, en este caso haciendo falta seis X.

Llevado a la práctica, por ejemplo, en la tabla clientes cada nombre del cliente ocupa un espacio determinado, no todos tienen la misma longitud, pero si hiciésemos la siguiente consulta todos ocuparían lo mismo y quedaría más uniforme:

```sql
UPDATE CLIENTES SET EMPRESA=RPAD(EMPRESA, 20);
```

Ahora todos los nombres de las empresas ocuparían 20 caracteres, el nombre más los espacios necesarios para que ocupen 20 caracteres. Si quisiésemos que quedase estéticamente como el índice de un libro, podríamos poner puntos en vez de espacios, aunque dependiendo de la longitud de las letras pueden quedar más adelantados unos nombres que otros aun teniendo 20 caracteres:

```sql
UPDATE CLIENTES SET EMPRESA=RPAD(EMPRESA, 20, '.')
```
