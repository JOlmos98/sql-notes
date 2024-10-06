
A veces tendremos que hacer consultas de dos o más tablas, para unir las tablas usaremos UNION y que no aparezcan los registros repetidos (literalmente la función contraria a la palabra INTERSECT), lo haríamos así:

```sql
SELECT * FROM TABLA1 WHERE SECCIÓN='DEPORTES' UNION SELECT * FROM TABLA1 WHERE SECCION='CERÁMICA';
```

Si en vez de usar UNION usamos UNION ALL la consulta mostrará todos los datos aunque se repitan, es decir, el uso de UNION suprime los datos repetidos mostrándolos una única vez.