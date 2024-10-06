La palabra reservada REPLACE, como bien indica, reemplaza unas cadenas de caracteres por otras, por ejemplo:

```sql
SELECT REPLACE ('Hola mundo', 'Hola', 'Adiós');
```

Esta sentencia cambiaría el "Hola" del "Hola mundo" por un "Adiós", quedando un "Adiós mundo". También se puede usar así:

```sql
SELECT REPLACE ('Cadena de ejemplo', 'A-Z', 'a-z');
```

Esta sentencia sustituiría todas las mayúsculas por minúsculas, es decir, la primera "C" la haría minúscula.