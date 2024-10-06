Esto es una continuación del punto “6. INSERT TO” donde se ve brevemente la creación de tablas y la inserción de datos.

Para crear una tabla en MySQL con los campos “id alumno”, “nombre”, “apellido”, “edad”, “fecha de nacimiento” y “carnet” y asignar los tipos de valor correctos se haría de la siguiente forma:

```sql
CREATE TABLE TABLA_1 (

       ID_ALUMNO INT AUTO_INCREMENT PRIMARY KEY,

       NOMBRE VARCHAR(20),

       APELLIDO VARCHAR(20),

       EDAD INT,

       FECHA_DE_NACIMIENTO DATE,

       CARNET BOOLEAN

       );
```

En este caso “id alumno” es un número entero que se va auto incrementando con cada registro que se incluya. A su vez, “id alumno” es clave primaria de la tabla.