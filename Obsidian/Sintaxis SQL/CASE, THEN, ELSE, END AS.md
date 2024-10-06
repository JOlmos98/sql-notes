Se usa para crear una columna que devuelva un resultado en función de si un campo contiene unos valores u otros, funciona como un IF-ELSE de Java con un Return. Se usa así:

```sql
SELECT NOMBRE, APE1, 
	CASE 
		WHEN COMISION IS NOT NULL THEN 'TIENE COMISION' 
		ELSE 'NO TIENE COMISION' 
	END AS TENER_COMISION 
FROM EMPLEADO ORDER BY NOMBRE;
```

En este caso, si el empleado en cuestión tiene un número (no es null) en la columna de comisión, la columna que hemos creado tendría en su respectivo registro "TIENE COMISION", si no, "NO TIENE COMISION". Y el END AS define el nombre de la nueva columna.