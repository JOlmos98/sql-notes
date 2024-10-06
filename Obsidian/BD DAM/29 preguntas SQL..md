[[SQL]].
## 1. Obtener los nombres y salarios de los empleados con más de 1000 euros de salario por orden alfabético.
```sql
SELECT NOMBRE, SALARIO FROM EMPLEADO WHERE SALARIO>1000 ORDER BY 1;
```
## 2. Obtener el nombre de los empleados cuya comisión es superior al 20% de su salario.
```SQL
SELECT NOMBRE, SALARIO, COMISION FROM EMPLEADO WHERE COMISION>=0.2*SALARIO;
```
## 3. Obtener el código de empleado, código de departamento, nombre y sueldo total en pesetas de aquellos empleados cuyo sueldo total (salario más comisión) supera los 1800 euros. Presentarlos ordenados por código de departamento y dentro de éstos por orden alfabético.
```SQL
SELECT CODEMPLE, CODDPTO, NOMBRE, (SALARIO+COMISION)*166 AS SALARIO_TOTAL FROM EMPLEADO WHERE SALARIO+COMISION>1800 ORDER BY 2, 3;
```
## 4. Obtener por orden alfabético los nombres de empleados cuyo salario igualen o superen en más de un 5% al salario de la empleada ‘MARIA JAZMIN’.
```SQL
SELECT NOMBRE, SALARIO FROM EMPLEADO WHERE SALARIO=1000 OR SALARIO>(1000*1.05) ORDER BY NOMBRE;

--- 

SELECT NOMBRE, APE1, SALARIO FROM EMPLEADO WHERE SALARIO>=(SELECT SALARIO*1.05 FROM EMPLEADO WHERE NOMBRE='MARIA' AND APE1='JAZMIN') ORDER BY APE1;
```
## 5. Obtener una listado ordenado por años en la empresa con los nombres, y apellidos de los empleados y los años de antigüedad en la empresa.
```SQL
SELECT FECHAINGRESO, APE1, APE2, NOMBRE, (SYSDATE-FECHAINGRESO)/365.2 AS AGNOS_ANTIGUEDAD FROM EMPLEADO ORDER BY 1;
```
## 6. Obtener el nombre de los empleados que trabajan en un departamento con presupuesto superior a 50.000 euros. Hay que usar predicado cuantificado.
```SQL
SELECT E.NOMBRE, E.APE1 FROM EMPLEADO E JOIN DPTO D ON E.CODDPTO=D.CODDPTO WHERE D.PRESUPUESTO>50000;
```
## 7. Obtener los nombres y apellidos de empleados que más cobran en la empresa. Considerar el salario más la comisión.
```sql
SELECT APE1, APE2, NOMBRE, (SALARIO+COMISION) AS SALARIO_TOTAL FROM EMPLEADO WHERE SALARIO+COMISION>ALL (SELECT MAX(SALARIO) FROM EMPLEADO);
```
## 8. Obtener en orden alfabético los nombres de empleado cuyo salario es inferior al mínimo de los empleados del departamento 1.
```SQL
SELECT E.NOMBRE, E.SALARIO FROM EMPLEADO E JOIN DPTO D ON E.CODDPTO=D.CODDPTO WHERE E.SALARIO<ALL (SELECT MIN(E2.SALARIO) FROM EMPLEADO E2 JOIN DPTO D2 ON E2.CODDPTO=D2.CODDPTO WHERE D2.CODDPTO=1) ORDER BY NOMBRE;
---
SELECT NOMBRE, SALARIO FROM EMPLEADO WHERE SALARIO<(SELECT MIN(SALARIO) FROM EMPLEADO WHERE CODDPTO=1);
```
## 9. Obtener los nombre de empleados que trabajan en el departamento del cuál es jefe el empleado con código 1.
```SQL
SELECT NOMBRE FROM EMPLEADO WHERE CODDPTO=(SELECT CODDPTO FROM DPTO WHERE CODEMPLEJEFE=1);
```
## 10. Obtener los nombres de los empleados cuyo primer apellido empiece por las letras p, q, r, s.
```sql
SELECT NOMBRE FROM EMPLEADO WHERE NOMBRE LIKE 'P%' OR NOMBRE LIKE 'Q%' OR NOMBRE LIKE 'R%' OR NOMBRE LIKE 'S%';
```
## 11. Obtener los empleados cuyo nombre de pila contenga el nombre JUAN.
```SQL
SELECT NOMBRE, APE1, APE2 FROM EMPLEADO WHERE NOMBRE LIKE '%JUAN%';
```
## 12. Obtener los nombres de los empleados que viven en ciudades en las que hay algún centro de trabajo.
```SQL
SELECT NOMBRE, APE1 FROM EMPLEADO WHERE LOCALIDAD=SOME(SELECT LOCALIDAD FROM DPTO);
-- Podemos usar también el IN y borrar el "=SOME".
```
## 13. Obtener el nombre del jefe de departamento que tiene mayor salario de entre los jefes de departamento.
```SQL
SELECT E.NOMBRE, E.APE1, E.SALARIO FROM EMPLEADO E JOIN DPTO D ON E.CODEMPLE=D.CODEMPLEJEFE WHERE E.SALARIO>=(SELECT MAX(SALARIO) FROM EMPLEADO);
--En este caso no es de entre los jefes, es de entre TODOS los empleados.
```
## 14. Obtener en orden alfabético los salarios y nombres de los empleados cuyo salario sea superior al 60% del máximo salario de la empresa.
```sql
SELECT NOMBRE, APE1, SALARIO FROM EMPLEADO WHERE SALARIO>0.6*(SELECT MAX(SALARIO) FROM EMPLEADO);
```
## 15. Obtener en cuántas ciudades distintas viven los empleados.
```SQL
SELECT COUNT(DISTINCT LOCALIDAD) FROM EMPLEADO;
```
## 16. El nombre y apellidos del empleado que más salario cobra.
```sqL
SELECT NOMBRE, APE1, APE2, SALARIO FROM EMPLEADO WHERE SALARIO=(SELECT MAX(SALARIO) FROM EMPLEADO); 
```
## 17. Obtener las localidades y número de empleados de aquellas en las que viven más de 3 empleados.
```SQL
SELECT LOCALIDAD, COUNT(LOCALIDAD) AS NUMERO_EMPLEADOS FROM EMPLEADO GROUP BY LOCALIDAD HAVING COUNT(LOCALIDAD)>3;
```
## 18. Obtener para cada departamento cuántos empleados trabajan, la suma de sus salarios y la suma de sus comisiones para aquellos departamentos en los que hay algún empleado cuyo salario es superior a 1700 euros.
```SQL
SELECT CODDPTO, COUNT(CODEMPLE) AS NUMERO_EMPLEADOS, SUM(SALARIO) AS GASTO_SALARIOS, SUM(COMISION) AS GASTO_COMISIONES FROM EMPLEADO WHERE SALARIO>1700 GROUP BY CODDPTO;
```
## 19. Obtener el departamento que más empleados tiene.
```SQL
SELECT CODDPTO, COUNT(CODEMPLE) AS NUMERO_EMPLEADOS FROM EMPLEADO GROUP BY CODDPTO ORDER BY COUNT(CODEMPLE) DESC FETCH FIRST ROW ONLY;
```
## 20. Obtener los nombres de todos los centros y los departamentos que se ubican en cada uno, así como aquellos centros que no tienen departamentos.
```sql
SELECT CODDPTO, DENOMINACION, CODCENTRO FROM DPTO WHERE  ORDER BY CODCENTRO;
--No hay departamento 4.
```
## 21. Obtener el nombre del departamento de más alto nivel, es decir, aquel que no depende de ningún otro.
```sql
SELECT CODDPTO, DENOMINACION FROM DPTO WHERE CODDPTODEPENDE IS NULL;
```
## 22. Obtener todos los departamentos existentes en la empresa y los empleados (si los tiene) que pertenecen a él.
```SQL
SELECT CODDPTO, NOMBRE, APE1 FROM EMPLEADO ORDER BY CODDPTO;
```
## 23. Obtener un listado en el que aparezcan todos los departamentos existentes y el departamento del cual depende, si depende de alguno.
```SQL
SELECT CODDPTO, DENOMINACION, CODDPTODEPENDE AS DEPARTAMENTO_DEL_QUE_DEPENDE FROM DPTO;
```
## 24. Obtener un listado ordenado alfabéticamente donde aparezcan los nombres de los empleados y a continuación el literal "tiene comisión" si la tiene, y "no tiene comisión" si no la tiene.
```SQL
SELECT NOMBRE, APE1, 
	CASE 
		WHEN COMISION IS NOT NULL THEN 'TIENE COMISION' 
		ELSE 'NO TIENE COMISION' 
	END AS TENER_COMISION 
FROM EMPLEADO ORDER BY NOMBRE;
```
## 25.  Obtener un listado de las localidades en las que hay centros y no vive ningún empleado ordenado alfabéticamente.
```SQL
SELECT UPPER(LOCALIDAD) FROM CENTRO WHERE UPPER(LOCALIDAD) NOT IN (SELECT LOCALIDAD FROM EMPLEADO) ORDER BY LOCALIDAD;
```
## 26. Obtener un listado de las localidades en las que hay centros y además vive al menos un empleado ordenado alfabéticamente.
```SQL
SELECT UPPER(LOCALIDAD) FROM CENTRO WHERE UPPER(LOCALIDAD) IN (SELECT LOCALIDAD FROM EMPLEADO) AND (SELECT COUNT(NOMBRE) FROM EMPLEADO)>0 ORDER BY LOCALIDAD;
```
## 27. Esta cuestión puntúa por 2. Se desea dar una gratificación por navidades en función de la antigüedad en la empresa siguiendo estas pautas:
    - Si lleva entre 1 y 5 años, se le dará 100 euros
    - Si lleva entre 6 y 10 años, se le dará 50 euros por año
    - Si lleva entre 11 y 20 años, se le dará 70 euros por año
    - Si lleva más de 21 años, se le dará 100 euros por año
```SQL
SELECT NOMBRE, APE1, 
	CASE 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 1 AND 5 THEN 100 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 6 AND 10 THEN (50*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 11 AND 20 THEN (70*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
		ELSE (100*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
	END AS GRATIFICACION 
FROM EMPLEADO ORDER BY NOMBRE;
```
## 28. Obtener un listado de los empleados, ordenado alfabéticamente, indicando cuánto le corresponde de gratificación.
```SQL
SELECT NOMBRE, APE1, 
	CASE 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 1 AND 5 THEN 100 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 6 AND 10 THEN (50*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
		WHEN (SYSDATE-FECHAINGRESO)/365.2 BETWEEN 11 AND 20 THEN (70*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
		ELSE (100*ROUND((SYSDATE-FECHAINGRESO)/365.2)) 
	END AS GRATIFICACION 
FROM EMPLEADO ORDER BY NOMBRE;
```
Es exactamente la misma consulta en los dos ejercicios, porque el primero realmente no pide la consulta.
## 29. Obtener a los nombres, apellidos de los empleados que no son jefes de departamento.
```SQL
SELECT NOMBRE, APE1, APE2 FROM EMPLEADO WHERE NOMBRE NOT IN (SELECT E.NOMBRE FROM EMPLEADO E JOIN DPTO D ON E.CODEMPLE=D.CODEMPLEJEFE);
```