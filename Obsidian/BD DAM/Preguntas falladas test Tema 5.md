### Falladas.
#### 1. Si al insertar un nuevo registro o al editar los datos de uno existente se intenta escribir una letra en un campo numérico, ¿qué ocurre al intentar guardar los datos?
Se obtiene un error y no se produce ningún cambio.
#### 2. la edición de datos desde la herramienta gráfica Application Express de Oracle se realiza, una vez seleccionada la tabla, desde:
Pestaña Datos > Icono Editar.
#### 3. ¿Cuáles de las siguientes afirmaciones sobre bloqueos entre usuarios lectores y escritores son correctas?
- Un registro es bloqueado sólo cuando es modificado por un escritor.
- Un escritor de un registro bloquea a otro escritor concurrente del mismo registro.
#### 4. Para insertar, modificar o suprimir datos de una tabla desde la herramienta gráfica Application Express de Oracle, se debe partir del botón:
Explorador de objetos.

#### 5. ¿Cuál es el significado de la supresión en cascada?
Al suprimir registros de la tabla de referencia, los registros de la tabla hija que hacían referencia a dichos registros, también son borrados.
#### 6. Al modificar o asignar el valor de un campo que es clave ajena, ¿qué posibles valores se pueden establecer?
Sólo valores contenidos en la clave primaria de la tabla de referencia.
#### 7. Para ejecutar una sentencia SQL desde la aplicación "Ejecutar Línea de Comandos SQL", ¿es necesario conectarse previamente a la base de datos indicando el nombre de usuario y contraseña? ¿Verdadero o falso?
Verdadero.
### Duda.
#### 1. Empareja las definiciones de tipos de bloqueo con su descripción:
- Protegen la definición del esquema de un objeto mientras una operación actúa sobre él === Bloqueos DDL.
- Protegen los datos, garantizando la integridad de los datos accedidos de forma concurrente por varios usuarios === Bloqueos DML.
- Protegen la base de datos interna y las estructuras de memoria === Bloqueos del sistema.
#### 2. Empareja cada definición con su término relacionado:
- La transacción se inicia partiendo de un estado consistente de los datos y finaliza dejándola también con los datos consistentes. === Consistencia.
- Todas las tareas de una transacción son realizadas correctamente, o si no, no se realiza ninguna de ellas. === Atomicidad.
- El efecto de una transacción no es visible por otras transacciones hasta que finaliza. === Aislamiento.
- Los cambios efectuados por las transacciones que han volcado sus modificadores, se hacen permanentes. === Durabilidad.

#### 3. La primera transacción que realiza un ___ es la única transacción que puede modificar el recurso hasta que el bloqueo es liberado.
Bloqueo exclusivo.