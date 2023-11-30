--EJ1 Vamos a crear las tablas para una tienda virtual que distribuye productos agrupados en familias en varias tiendas.
--Tabla familia.
CREATE TABLE FAMILIA (
        codfamilia NUMBER(3) PRIMARY KEY,
        denofamilia VARCHAR2(70) NOT NULL UNIQUE
);
        
--Tabla producto.
CREATE TABLE PRODUCTO (
        codproducto NUMBER(5) PRIMARY KEY,
        denoproducto VARCHAR2(40) NOT NULL,
        descripcion VARCHAR2(80),
        preciobase NUMBER(10, 2) NOT NULL,
        porcreposicion NUMBER(3),
        unidadesminimas NUMBER(4) NOT NULL,
        codfamilia NUMBER(3) NOT NULL,
        CONSTRAINT CHK_PRECIO_BASE CHECK (preciobase>0),
        CONSTRAINT CHK_PORC_REPOSICION CHECK (porcreposicion>0),
        CONSTRAINT CHK_UNIDADES_MINIMAS CHECK (unidadesminimas>0),
        CONSTRAINT FK_COD_FAMILIA FOREIGN KEY (codfamilia) REFERENCES FAMILIA(codfamilia)
        
);

--Tabla tienda.
CREATE TABLE TIENDA (
        codtienda NUMBER(3) PRIMARY KEY,
        denotienda VARCHAR2(40) NOT NULL,
        telefono VARCHAR(11),
        codigopostal VARCHAR2(5) NOT NULL,
        provincia VARCHAR(5) NOT NULL
);

--Tabla stock.
CREATE TABLE STOCK (
        codtienda NUMBER(3),
        codproducto NUMBER(5),
        unidades NUMBER(6) NOT NULL,
        PRIMARY KEY (codtienda, codproducto),
        CONSTRAINT FK_COD_TIENDA FOREIGN KEY (codtienda) REFERENCES TIENDA(codtienda),
        CONSTRAINT FK_COD_PRODUCTO FOREIGN KEY (codproducto) REFERENCES PRODUCTO(codproducto),
        CONSTRAINT CHK_UNIDADES CHECK (unidades>0)
);






