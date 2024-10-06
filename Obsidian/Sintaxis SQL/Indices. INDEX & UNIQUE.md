**INDICES DE CLAVE PRIMARIA:**

Al crear una clave primaria estamos creando un índice, las claves primarias no pueden ser iguales entre un registro y otro y no pueden ser NULL, podemos nombrar una clave primaria de dos formas, al crear el campo en cuestión:

```sql
CREATE TABLE TABLA_1 (DNI VARCHAR(9) PRIMARY KEY);
```

O modificando con la clausula ALTER un campo ya creado:

```sql
ALTER TABLE TABLA_1 ADD PRIMARY KEY (DNI);
```

También podemos nombrar dos campos como PK:

```sql
ALTER TABLE TABLA_1 ADD PRIMARY KEY (NOMBRE, APELLIDO);
```

**INDICES ORDINARIOS:**

Esta forma de índice si permite duplicados y ser NULL. Para crear índices sobre campos que no son PK usamos la palabra reservada INDEX:

```sql
CREATE INDEX MI_INDICE ON TABLA_1 (APELLIDO);
```

**INDICES UNICOS:**

Los índices únicos son exactamente iguales a los ordinarios con al excepción de que no permiten duplicados, es decir, un campo no puede tener dos registros iguales al ser índice único. Se usaría la cláusula UNIQUE:

```sql
CREATE UNIQUE INDEX MI_INDICE ON TABLA_1 (APELLIDO);
```

**INDICES COMPUESTOS:**

Este índice permite estar formado por dos o más campos, pero no permite que todos sus campos estén duplicados a la vez en otro registro, es decir, si usamos NOMBRE y APELLIDO, dos registros podrán tener mismo nombre o mismo apellido, pero no ambos iguales. Se declararía igual que el índice anterior, pero añadiendo los campos en cuestión:

```sql
CREATE UNIQUE INDEX MI_INDICE ON TABLA_1 (NOMBRE, APELLIDO);
```

**ELIMINACIÓN DE INDICES:**

Para eliminar los índices que no usan PK usamos la cláusula DROP y un código casi idéntico al de su creación, pero sin nombrar los campos que usa el índice:

```sql
DROP INDEX MI_INDICE ON TABLA_1;
```

Para eliminar un índice con clave primaria se debe saber el nombre que se le ha dado a dicho índice, en nuestro caso si usamos DNI como PK en la tabla TABLA_1 Access nombra nuestro índice así: “Index_D0F75744_461F_472E”. Entonces, para eliminarlo escribiríamos lo siguiente, usando la palabra reservada CONSTRAINT (no válida para MySQL):

```sql
ALTER TABLE TABLA_1 DROP CONSTRAINT Index_D0F75744_461F_472E;
```

En MySQL sería mucho más sencillo:

```sql
ALTER TABLE TABLA_1 DROP PRIMARY KEY;
```