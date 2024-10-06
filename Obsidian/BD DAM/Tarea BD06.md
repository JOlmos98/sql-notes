
## Actividad 1 enunciado:
- Crear un procedimiento que permita cambiar a todos los agentes de una familia determinada (familia origen) a otra familia (familia destino).
    
    El procedimiento tendrá la siguiente cabecera **`MoverAgentesFamilia( id_FamiliaOrigen, id_FamiliaDestino, agentes_movidos)`,**  donde cada uno de los dos primeros argumentos corresponde a un identificador de Familia, y el tercer argumento será para devolver el número de agentes movidos entre las dos familias. Cambiará la columna  Identificador de Familia de todos los agentes, de la tabla `AGENTES`, que pertenecen a la Familia con código **`id_FamiliaOrigen`** por el código **`id_FamiliaDestino`**
    
    Previamente comprobará que ambas familias existen y que no son iguales.
    
    Para la comprobación de la existencia de las familias se puede utilizar un cursor variable, o contar el número de filas y en caso de que no exista, se visualizará el mensaje correspondiente mediante una excepción del tipo RAISE_APPLICATION_ERROR. También se mostrará un mensaje en caso de que ambos argumentos tengan el mismo valor.         
    

El procedimiento visualizará  el mensaje "Se han trasladado XXX agentes de la familia  XXXXXX a la familia ZZZZZZ" donde XXX es el número de agentes que se han cambiado de familia, XXXXXX es el nombre de la familia origen y ZZZZZZ es el nombre de la familia destino, además devolverá en el argumento  **`agentes_movidos`** el número de agentes movidos .

## Solución 1:

Procedimiento para cambiar de familia:
```sql
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE MoverAgentesFamilia(
    ID_FAMILIAORIGEN IN NUMBER, 
    ID_FAMILIADESTINO IN NUMBER, 
    AGENTES_MOVIDOS OUT NUMBER)
AS
	V_F_ORIGEN NUMBER;
	V_F_DESTINO NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_F_ORIGEN FROM FAMILIAS WHERE IDENTIFICADOR=ID_FAMILIAORIGEN;
    IF V_F_ORIGEN=0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'FAMILIA DE ORIGEN NO ENCONTRADA');
    END IF;
    SELECT COUNT(*) INTO V_F_DESTINO FROM FAMILIAS WHERE IDENTIFICADOR=ID_FAMILIADESTINO;
    IF V_F_DESTINO=0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'FAMILIA DE DESTINO NO ENCONTRADA');
    END IF;
    IF ID_FAMILIAORIGEN=ID_FAMILIADESTINO THEN
        RAISE_APPLICATION_ERROR(-20003,'LA FAMILIA DE ORIGEN Y DESTINO SON LA MISMA');
    END IF;
    SELECT COUNT(*) INTO AGENTES_MOVIDOS FROM AGENTES WHERE FAMILIA=ID_FAMILIAORIGEN;
    UPDATE AGENTES SET FAMILIA=ID_FAMILIADESTINO WHERE FAMILIA=ID_FAMILIAORIGEN;
    DBMS_OUTPUT.PUT_LINE('Se han trasladado '||AGENTES_MOVIDOS||' agentes de la familia '||ID_FAMILIAORIGEN||' a la familia '||ID_FAMILIADESTINO||'.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'ERROR AL MOVER AGENTES: '||SQLERRM);
END MoverAgentesFamilia;
```

Código de ejecución de dicho procedimiento:
```sql
set serveroutput on;
DECLARE
    agentesmovidos NUMBER(2);
BEGIN
    MoverAgentesFamilia(112, 11, agentesmovidos);
END;
```



## Actividad 2 enunciado:
Queremos controlar algunas restricciones a la hora de trabajar con agentes:

- La longitud de la clave de un agente no puede ser inferior a 5.
- La habilidad de un agente debe estar comprendida entre 1 y 9 (ambos inclusive).
- La categoría de un agente sólo puede ser igual a 0, 1 o 2.
- Si un agente tiene categoría 2 no puede pertenecer a ninguna familia y debe pertenecer a una oficina.  
- Si un agente tiene categoría 1 no puede pertenecer a ninguna oficina y debe pertenecer  a una familia.  
- Todos los agentes deben pertenecer  a una oficina o a una familia pero nunca a ambas a la vez.

Se pide crear un disparador para asegurar estas restricciones. El disparador deberá lanzar todos los errores que se puedan producir en su ejecución mediante errores que identifiquen con un mensaje adecuado por qué se ha producido dicho error.

Algunas de las restricciones implementadas con el disparador se pueden incorporar a la definición del esquema de la tabla utilizando el Lenguaje de Definición de Datos (Check,Unique,..). Identifica cuáles son y con qué tipo de restricciones las implementarías.




## Solución 2:
a




Disparador para restricciones:
```sql
CREATE OR REPLACE TRIGGER TR_AGENTES
BEFORE INSERT OR UPDATE ON AGENTES FOR EACH ROW
DECLARE
    COUNT_FAM NUMBER(1):=0;
BEGIN
    SELECT COUNT(*) INTO COUNT_FAM FROM FAMILIAS WHERE IDENTIFICADOR=:NEW.FAMILIA;
    IF INSERTING OR UPDATING THEN
        IF LENGTH(:NEW.CLAVE)<5 THEN
            RAISE_APPLICATION_ERROR(-20001,'==LA CLAVE ES DEMASIADO CORTA==');
        END IF;
        
        IF :NEW.HABILIDAD<1 OR :NEW.HABILIDAD>9 THEN
            RAISE_APPLICATION_ERROR(-20002,'==LA HABILIDAD DEBE ESTAR COMPRENDIDA ENTRE 1 Y 9==');
        END IF;
        
        IF :NEW.CATEGORIA!=0 AND :NEW.CATEGORIA!=1 AND :NEW.CATEGORIA!=2 THEN
            RAISE_APPLICATION_ERROR(-20003,'==LA CATEGORÍA DEBE SER 0, 1 Ó 2==');
        END IF;
        
        IF :NEW.CATEGORIA=2 THEN
            IF :NEW.FAMILIA IS NOT NULL THEN
                RAISE_APPLICATION_ERROR(-20004,'==LOS AGENTES DE CATEGORIA 2 NO PUEDEN PERTENECER A UNA FAMILIA==');
            END IF;
            IF :NEW.OFICINA!=1 AND :NEW.OFICINA!=2 AND :NEW.OFICINA!=3 THEN
                RAISE_APPLICATION_ERROR(-20005,'==LOS AGENTES DE CATEGORIA 2 DEBEN PERTENECER A UNA DE LAS OFICINAS 1, 2 Ó 3==');
            END IF;
        END IF;
        
        IF :NEW.CATEGORIA=1 THEN
            IF :NEW.OFICINA IS NOT NULL THEN
                RAISE_APPLICATION_ERROR(-20006,'==LOS AGENTES DE CATEGORIA 1 NO PUEDEN PERTENECER A UNA OFICINA==');
            END IF;
            IF COUNT_FAM=0 THEN
                RAISE_APPLICATION_ERROR(-20007,'==LA FAMILIA SELECCIONADA NO EXISTE O HAY QUE SELECCIONAR UNA FAMILIA ANTES DE HACER A UN AGENTE CATEGORIA 1==');
            END IF;
        END IF;
        
    END IF;
END TR_AGENTES;
```

Restricciones que pueden aplicarse con lenguaje de definición de datos:
```sql
ALTER TABLE AGENTES ADD CONSTRAINT CLAVE_CHECK CHECK (LENGHT(CLAVE)>=5);
ALTER TABLE AGENTES ADD CONSTRAINT HABILIDAD_CHECK CHECK (HABILIDAD BETWEEN 1 AND 9);
ALTER TABLE AGENTES ADD CONSTRAINT CATEGORIA_CHECK CHECK (CATEGORIA IN (0, 1, 2));
ALTER TABLE AGENTES ADD CONSTRAINT FAM_OFI_CHECK CHECK ((FAMILIA IS NOT NULL AND OFICINA IS NULL) OR (FAMILIA IS NULL AND OFICINA IS NOT NULL));
ALTER TABLE AGENTES ADD CONSTRAINT CATEGORIA1_CHECK CHECK ((CATEGORIA!=1) OR (CATEGORIA=1 AND FAMILIA IS NOT NULL AND OFICINA IN (1, 2, 3)));
```