Este palabra reservada se usa para obtener una descripción del funcionamiento y estructura de la tabla:

```sql
DESC PRODUCTOS;
```

Por ejemplo, creamos la tabla USUARIOS:

```sql
CREATE TABLE USUARIOS (
         login         VARCHAR2(15) PRIMARY KEY NOT NULL,  
         password      VARCHAR2(9) NOT NULL, 
         nombre        VARCHAR2(25) NOT NULL,
         apellidos     VARCHAR2(30) NOT NULL,
         direccion     VARCHAR2(30) NOT NULL,
         cp            VARCHAR2(5) NOT NULL, 
         localidad     VARCHAR2(25) NOT NULL,
         provincia     VARCHAR2(25) NOT NULL,
         pais          VARCHAR2(15) NOT NULL, 
         f_nac      DATE,
         f_ing      DATE DEFAULT (sysdate),
         correo     VARCHAR2(25) NOT NULL,
         credito    NUMBER,
         sexo       VARCHAR2(1));
```

Entonces si después usamos la palabra reservada DESC con la tabla USUARIOS:

```sql
DESC USUARIOS;
```

Nos mostraría lo siguiente:
![[SQLDESC.PNG|600]]