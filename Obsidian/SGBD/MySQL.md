MySQL es un SGBD (sistema gestor de bases de datos) relacional open source y gratuito. Es uno de los SGBD más usados del mundo y se utilizan en aplicaciones pequeñas hasta aplicaciones empresariales.

En otras ventajas, MySQL tiene un buen rendimiento para la mayoría de aplicaciones, escala verticalmente añadiendo más potencia de procesamiento y almacenamiento y es fácil de aprender a usar.

Como desventajas podríamos señalar que no es tan potente y flexible como otros SGBD como [[PostgreSQL]], no implementa todas las características del estándar SQL y puede ser vulnerable a ataques, por lo que habría que tomar ciertas medidas de seguridad.

Algunas de las herramientas de administración de bases de datos que usan MySQL son:
- PHPMyAdmin.
- MySQL Workbench.
- Sequel Pro.
- Navicat for MySQL.
- HeidiSQL.

[[Comparación MySQL y PostgreSQL]].

Comandos de ayuda  para gestionar la base de datos:

- `SHOW DATABASES;`
- `SHOW TABLES;`
- `DESC [nombre_tabla];
- `SELECT USER();`

## APUNTES MySQL con Prisma en Linux

**1. Instalamos MySQL:**
Instalamos MySQL con los comandos siguientes y vemos si esta encendido o configuramos su inicio automático:
```shell
sudo apt update
sudo apt install mysql-client-core-8.0
sudo apt install mysql-server
sudo systemctl start mysql
sudo systemctl status mysql
sudo systemctl enable mysql #Para que se inicie automaticamente al encender el PC.
```

**2. Entramos en la base de datos y damos acceso al root:**

Entramos sin autentificarnos con:
```shell
sudo mysql
```

Damos acceso al root con (la contraseña será '1243'):
```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1243';
```

Salimos y esta vez sí podemos entrar con:
```shell
mysql -u root -p
```

**3. Creamos la base de datos, accedemos a ella y tabla de prueba:**

Creamos la base de datos con el comando:
```shell
CREATE DATABASE MyPrismaAppDatabase;
```

Accedemos a ella con:
```shell
USE MyPrismaAppDatabase;
```

Creamos una tabla, insertamos un par de registros y realizamos consultas:
```shell
CREATE TABLE prueba_empleados (
	nombre VARCHAR(10),
	apellidos VARCHAR(10),
	edad INT,
	dni VARCHAR(10)
	); #Crea la tabla.

DESC prueba_empleados; #Nos imprime la estructura de la tabla.

#Insertamos un par de registros:
SELECT INTO prueba_empleados (nombre, apellidos, edad, dni) VALUES ('Jesús', 'Olmos Soler', 35, '57483948H');
SELECT INTO prueba_empleados (nombre, apellidos, edad, dni) VALUES ('Carla', 'JFJ', 23, '48934738M');

#Y realizamos una consulta:
SELECT * FROM prueba_empleados;
```

**4. Por si a caso, creamos otro usuario (JESUSPRISMAAPP):

Entramos con `mysql -u root -p` y creamos el usuario con el comando:
```shell 
CREATE USER 'JESUSPRISMAAPP'@'localhost' IDENTIFIED BY '1243';
```

Damos todos los permisos con:
```shell
GRANT ALL PRIVILEGES ON *.* TO 'JESUSPRISMAAPP'@'localhost';
```

**5. Averiguamos la URL de nuestra base de datos:

El nombre de la base de datos suele ser algo tipo:
``[tipo_bd]://[usuario]:[contraseña]@[host]:[puerto]/[nombre_bd]``

Con estos comandos averiguamos los datos:
```shell
SELECT @hostname;
SHOW VARIABLES LIKE 'port';
SHOW DATABASES;
```

