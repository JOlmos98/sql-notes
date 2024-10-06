Ejercicios sobre consultas del PDF adjunto.
### PDF de los ejercicios.
![[BASE_DE_DATOS_EMPLEADOS y ejercicios.pdf]]
### 1. Hallar la comisión, el nombre y el salario de los empleados con más de tres hijos, ordenados por comisión y, dentro de comisión, alfabéticamente.
```SQL
SELECT COMISION, NOMBRE, SALARIO FROM EMPLEADOS WHERE NUM_HIJOS>3 ORDER BY COMISION, NOMBRE;
```
### 2. Obtener los nombres de los departamentos que no dependen de otros.
```sql
SELECT DEPARTAMENTO FROM EMPLEADOS GROUP BY DEPARTAMENTO HAVING COUNT(*)=1;
```
*Esto nos devuelve el único departamento que tiene un único empleado.*
### 3. Obtener, por orden alfabético, los nombres y los salarios de los empleados cuyo salario esté comprendido entre 1250 y 1300 euros.
```sql
SELECT NOMBRE, SALARIO FROM EMPLEADOS WHERE SALARIO BETWEEN 1250 AND 1300 ORDER BY NOMBRE;
```
### 4. Datos de los empleados que cumplen la condición anterior o tienen al menos un hijo.
```sql
SELECT * FROM EMPLEADOS WHERE SALARIO BETWEEN 1250 AND 1300 OR NUM_HIJOS>0 ORDER BY NOMBRE;
```
*Esta consulta devuelve todos los datos de los empleados que tienen un sueldo entre 1250 y 1300 o que tienen hijos, al cumplir una de las dos condiciones, ya los muestra, no es necesario que cumplan las dos. También los ordena alfabéticamente según el primer apellido.*
### 5. Muestre para cada empleado el número de meses que lleva el empleado en la empresa junto con su nombre.
```sql
SELECT NOMBRE, MONTHS_BETWEEN(SYSDATE, FECHA_INGRESO) AS MESES_EN_EMPRESA FROM EMPLEADOS;
```
---
*En otros entornos de SQL podría ser la consulta algo así:*
```sql
SELECT NOMBRE, MONTH(NOW())-MONTH(FECHA_INGRESO) AS MESES_EN_EMPRESA FROM EMPLEADOS;
```
*En algunos entornos de SQL la palabra reservada para los meses es "MON", en otros entornos sería "MONTH".*
### 6. Calcule aquellos empleados que llevan más de 35 años en la empresa. Muestre todos los datos de cada uno de ellos.
```sql
SELECT * FROM EMPLEADOS WHERE EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM FECHA_INGRESO)>35;
```
### 7. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 10 euros por hijo, el total de esta gratificación no supera la centésima parte del salario.
```sql
SELECT NOMBRE FROM EMPLEADOS WHERE 10*NUM_HIJOS<SALARIO*0.1;
```
### 8. Hallar, por orden de número de empleado, el nombre y el salario total (salario más comisión) de los empleados cuyo salario total supera los 1300 euros mensuales.
```sql
SELECT COD, NOMBRE, (SALARIO+COMISION) AS SALARIO_TOTAL FROM EMPLEADOS WHERE (SALARIO+COMISION)>1300 ORDER BY COD;
```
*No podemos referenciar directamente un alias para una comparación matemática, tenemos que poner la propia fórmula otra vez. Si ponemos SALARIO_TOTAL>1300 no funcionaría.*
### 9. Obtener, por orden alfabético, los nombres de los departamentos que no contengan la palabra 'Dirección' ni 'Sector'.
```sql
SELECT DEPARTAMENTO FROM EMPLEADOS WHERE INSTR(DEPARTAMENTO, 'DIRECCIÓN')=0 AND INSTR(DEPARTAMENTO, 'SECTOR')=0;
```
*Este ejercicio no tiene sentido porque en el campo DEPARTAMENTO sólo hay números, así que los mostrará todos.*
### 10. Obtener, por orden alfabético, los nombres de los departamentos que, o bien tienen directores en funciones y su presupuesto no excede los 5 mil euros, o bien no dependen de ningún otro departamento.
*Este ejercicio parece que no tiene sentido.*
### 11. Hallar el número de empleados de toda la empresa.
```sql
SELECT COUNT(COD) AS EMPLEADOS_TOTALES FROM EMPLEADOS;
```


A partir del ejercicio 11 los ejercicios parecen no tener sentido.