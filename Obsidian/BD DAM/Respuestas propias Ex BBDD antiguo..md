
*CENTRO (CODCENTRO, DIRECCION, LOCALIDAD); 

*DPTO (CODDPTO, DENOMINACION, CODCENTRO, 
CODDPTODEPENDE, CODEMPLEJEFE);

*EMPLEADO (CODEMPLE, APE1, APE2, NOMBRE, LOCALIDAD, CODDPTO, CODCATE, SALARIO, COMISION, EDAD);

*CATEGORIA (CODCATE, DENON, JULIO, DICIEMBRE);
### 1. Obtener los nombres y apellidos de empleados o empleado, que más cobran en la empresa. Considerar el salario más la comisión ordenados por APE1, APE2, NOMBRE.
```sql
SELECT E.APE1, E.APE2, E.NOMBRE, SALARIO+COMISION AS SALARIO_TOTAL FROM EMPLEADO E WHERE SALARIO+COMISION>=(SELECT MAX(SALARIO+COMISION) FROM EMPLEADO);
```
Esta consulta de arriba nos devuelve el empleado o los empleados que tienen el sueldo más alto de la empresa, estamos hablando de concretamente una cifra, los que tienen la misma cifra, los que cobren un euro menos no aparecerán.
```SQL
SELECT E.APE1, E.APE2, E.NOMBRE, SALARIO+COMISION AS SALARIO_TOTAL FROM EMPLEADO E WHERE SALARIO+COMISION>=(SELECT MAX(SALARIO) FROM EMPLEADO);
```
Esta consulta nos devuelve todos los empelados que cobren más (salario y comisión) que el máximo salario, sin comisión, aquí podrían salir varios empleados que serían los que más cobran de la empresa.
### 2. Obtener listado de departamentos (CODDPTO, DENOMINACION) acompañado del importe del salario máximo de cada departamento (sin tener en cuenta la comisión).
```sql
SELECT D.CODDPTO, D.DENOMINACION, MAX(E.SALARIO) FROM DPTO D JOIN EMPLEADO E ON CODDPTO.D=CODDPTO.E GROUP BY D.CODDPTO, D.DENOMINACION;
```
### 3. Obtener el CODDPTO y su DENOMINACION, de departamentos que no tengan ningún empleado.
```SQL
SELECT D.CODDPTO, D.DENOMINACION FROM DPTO D WHERE D.CODDPTO NOT IN (SELECT CODDPTO FROM EMPLEADO);
```
### 4. Obtener el listado de departamentos (CODDPTO, DENOMINACION), número de empleados en el departamento, total de salario de los empleados que pertenezcan al mismo. Pero sin considerar a empleados que tengan un salario inferior a 1.500 euros, ni tampoco departamentos de menos de 3 empleados, ni tampoco deben aparecer departamentos cuyo salario total de empleados sea inferior a 6.000 euros. (no considerar la comisión).
```SQL
SELECT D.CODDPTO, D.DENOMINACION, COUNT(E.CODEMPLE) AS NUM_EMPLEADOS, SUM(E.SALARIO) AS TOTAL_SALARIO FROM DPTO D JOIN EMPLEADO E ON D.CODDPTO=E.CODDPTO GROUP BY D.CODDPTO, D.DENOMINACION HAVING COUNT(E.CODEMPLE)>=3 AND SUM(E.SALARIO)>=6000 AND MIN(E.SALARIO)>=1500;
```
### 5. Listado de jefes de departamento (CODEMPLE, APE1, APE2, NOMBRE, SALARIO), que cobren menos que alguno de los empleados del departamento que dirigen.
```sql
SELECT E.CODEMPLE, E.APE1, E.APE2, E.NOMBRE, E.SALARIO FROM EMPLEADO E JOIN DPTO D ON E.CODEMPLE=D.CODEMPLEJEFE WHERE E.SALARIO<(SELECT MIN(SALARIO) FROM EMPLEADO WHERE CODDPTO=E.CODDPTO);
```
### 6. Incrementar el salario un 5% a los empleados de departamentos de más de 10 empleados.
```SQL
UPDATE EMPLEADO SET SALARIO=SALARIO*1.05 WHERE CODDPTO IN (SELECT CODDPTO, COUNT(CODEMPLE) FROM EMPLEADO GROUP BY CODDPTO HAVING COUNT(CODEMPLE)>10);
```
### 7. Eliminar los centros que no sean de MADRID y que no tengan asociado ningún departamento.
```SQL
DELETE FROM CENTRO WHERE LOCALIDAD='MADRID' AND CODCENTRO NOT IN (SELECT CODCENTRO FROM DPTO);
```
### 8. Obtener un listado de departamentos (CODDPTO, DENOMINACION), donde todos sus empleados tengan la misma edad, y que dichos empleados trabajen en centros de su misma localidad (que la localidad del empleado y la del centro sea la misma).
```sql
SELECT D.CODDPTO, D.DENOMINACION FROM DPTO D JOIN EMPLEADO E ON D.CODDPTO=D.CODDPTO JOIN CENTRO C ON E.CODCENTRO=C.CODCENTRO GROUP BY D.CODDPTO, D.DENOMINACON HAVING COUNT(DISTINCT E.NOMBRE)=1 AND COUNT(DISTINCT C.LOCALIDAD)=1;
```
### 9. Obtener el listado de empleados (CODEMPLE, NOMBRE) con su denominación de departamento, localidad de centro y denominación de categoría (DENON).
```SQL
SELECT E.CODEMPLE, E.NOMBRE, D.DENOMINACION, C.LOCALIDAD, CA.DENON FROM EMPLEADO E JOIN DPTO D ON E.CODDPTO=D.CODDPTO JOIN CENTRO C ON E.CODCENTRO=C.CODCENTRO JOIN CATEGORIA CA ON E.CODCATE=CA.CODCATE;
```
### 10. Obtener CODEMPLE y NOMBRE de parejas de empleados de la misma LOCALIDAD y distinta CATEGORIA. Considerar que dado el empleado e1 y el empleado e2, la pareja e1 e2 es igual a la pareja e2 e1.
```SQL
SELECT E1.CODEMPLE, E2.CODEMPLE, E1.NOMBRE, E2.NOMBRE FROM EMPLEADO E1, EMPLEADO E2 WHERE E1.LOCALIDAD=E2.LOCALIDAD AND E1.CODCAT!=E2.CODCAT;
```