use master 
go 

drop database if exists Digital
go

create database Digital
go

use Digital
go

CREATE TABLE AREAS (
    ID int  identity(1,1),
    NOMBRE varchar(90) check (nombre like '%[^a-AZ-z ]%'),
    ESTADO char(1)  DEFAULT 'A' check(estado in('A','I')),
    EMPLEADO_ID int  NOT NULL,
    CONSTRAINT AREAS_pk PRIMARY KEY  (ID)
);
go
-- Table: BIENES
CREATE TABLE BIENES (
	ID INT identity(1,1),
    CODIGO  as ('EQ-' + right('000' + convert (varchar, ID),(3))),
    CANTIDAD int   check (cantidad like '%[0-9]'),
    NOMBRE varchar(100) check (nombre like '%[^a-AZ-z0-9.]%') NOT NULL,
    PRECIO decimal(8,2)  check (PRECIO like '%[0-9.]') NOT NULL,
    FECHA_INGRESO  date ,
    FECHA_DEPRECIAICION date  NOT NULL,
	PROCEDIMIENTOS_ID int  NOT NULL,
	DEPRECIACION_ANUAL decimal(8,2) ,
    DEPRECIACION_MENSUAL decimal(8,2) ,
    DEPRECIACION_ACUMULADA decimal(8,2) ,
    ESTADO char(4) DEFAULT 'ALTO' check(estado in('ALTO','BAJO')) NOT NULL,
    AREAS_ID int  NOT NUll,
    CONSTRAINT BIENES_pk PRIMARY KEY  (ID)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    ID int IDENTITY(1,1),
    NOMBRE varchar(50)  check (nombre like '%[^a-AZ-z ]%'),
    APELLIDOS varchar(70)  check (APELLIDOS like '%[a-AZ-z ]%'),
    DNI char(8)  check (DNI like '%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'),
    ESTADO char(1) DEFAULT 'A' check(estado in('A','I')),
    CONSTRAINT EMPLEADO_pk PRIMARY KEY  (ID)
);

-- Table: PROCEDIMIENTOS
CREATE TABLE PROCEDIMIENTOS (
    ID int  IDENTITY(1,1),
    PORCENTAJE INT  check (PORCENTAJE like '%[0-9]'),
    DESCRIPCION varchar(200)  NOT NULL,
    ESTADO char(1) DEFAULT 'A' check(estado in('A','I')) NOT NULL,
    CONSTRAINT PROCEDIMIENTOS_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: AREAS_EMPLEADO (table: AREAS)
ALTER TABLE AREAS ADD CONSTRAINT AREAS_EMPLEADO
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO (ID);
go
-- Reference: BIENES_AREAS (table: BIENES)
ALTER TABLE BIENES ADD CONSTRAINT BIENES_AREAS
    FOREIGN KEY (AREAS_ID)
    REFERENCES AREAS (ID);
go
-- Reference: BIENES_PROCEDIMIENTOS (table: BIENES)
ALTER TABLE BIENES ADD CONSTRAINT BIENES_PROCEDIMIENTOS
    FOREIGN KEY (PROCEDIMIENTOS_ID)
    REFERENCES PROCEDIMIENTOS (ID);
go
-- End of file.

--TRIGGER PARA CALCULAR LOS PORCENTAJES
create TRIGGER tr_BIENES_AfterInsert
ON BIENES
AFTER INSERT ,UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar DEPRECIACION_MENSUAL y DEPRECIACION_ACUMULADA según PROCEDIMIENTOS_ID
    UPDATE BIENES
    SET 
        DEPRECIACION_ANUAL = 
            CASE
                WHEN P.ID IN (1, 5) THEN 0.25 * B.PRECIO
                WHEN P.ID IN (2, 3) THEN 0.20 * B.PRECIO
                WHEN P.ID IN (4, 6) THEN 0.10 * B.PRECIO
                ELSE 0
            END,
        DEPRECIACION_MENSUAL = ISNULL(B.DEPRECIACION_MENSUAL, 0) + 
            CASE
                WHEN P.ID IN (1, 5) THEN (0.25 * B.PRECIO) / 12
                WHEN P.ID IN (2, 3) THEN (0.20 * B.PRECIO) / 12
                WHEN P.ID IN (4, 6) THEN (0.10 * B.PRECIO) / 12
                ELSE 0
            END
		FROM BIENES B
    JOIN inserted I ON B.CODIGO = I.CODIGO
    JOIN PROCEDIMIENTOS P ON I.PROCEDIMIENTOS_ID = P.ID;
END;
go

--TRIGGER PARA CALCULAR LAS FEHCAS

CREATE TRIGGER tr_BIENES_Fecha
ON BIENES
AFTER INSERT 
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar DEPRECIACION_ACUMULADA según la diferencia en años
    UPDATE BIENES
    SET 
        DEPRECIACION_ACUMULADA = ISNULL(B.DEPRECIACION_ACUMULADA, 0) + 
            CASE
                WHEN DATEDIFF(YEAR, B.FECHA_INGRESO, B.FECHA_DEPRECIAICION) <= 1 THEN 1
                WHEN DATEDIFF(YEAR, B.FECHA_INGRESO, B.FECHA_DEPRECIAICION) <= 2 THEN 2
                WHEN DATEDIFF(YEAR, B.FECHA_INGRESO, B.FECHA_DEPRECIAICION) <= 3 THEN 3
                ELSE DATEDIFF(YEAR, B.FECHA_INGRESO, B.FECHA_DEPRECIAICION)
            END * B.DEPRECIACION_ANUAL
    FROM BIENES B
    JOIN inserted I ON B.CODIGO = I.CODIGO;
END;
go


INSERT INTO EMPLEADO
(NOMBRE,APELLIDOS,DNI)
VALUES
('CARLOS','POSADA CARRILLO','12345678'),
('MARIA','POSADA CARRILLO','12356478'),
('CARMEN','POSADA CARRILLO','12342678'),
('FERNANDO','POSADA CARRILLO','12305678'),
('ALICIA','POSADA CARRILLO','12345978')
GO

INSERT INTO AREAS
(NOMBRE,EMPLEADO_ID)
VALUES
('PRODUCCION',1),
('CONTABILIDAD',2),
('MARKETING',3),
('RECURSOS HUMANOS',4),
('VENTAS',5)
GO

INSERT INTO PROCEDIMIENTOS
(PORCENTAJE	,DESCRIPCION)
VALUES
(25,'Ganado de trabajo y reproducción; redes de pesca'),
(20,'Vehículo de transporte terrestre (excepto ferrocarriles; horno en general)'),
(20,'Vehículo de transporte terrestre (excepto ferrocarriles; horno en general)'),
(25,'Vehículo de transporte terrestre (excepto ferrocarriles; horno en general)'),
(10,'Maquinaria y equipo adquirido a partir del 1/1/1991'),
(10,'Maquinaria y equipo adquirido a partir del 1/1/1991')
GO

set dateformat dmy;
INSERT INTO BIENES
(CANTIDAD,NOMBRE,PRECIO,FECHA_INGRESO,FECHA_DEPRECIAICION,PROCEDIMIENTOS_ID,AREAS_ID)
VALUES
(1,'Escritorio color gris',800, '01/02/2023', '31/12/2023', 5,2),
(1,'Escritorio color marron',800, '01/02/2023', '31/12/2023', 5,2),
(1,'Silla color blanco',400, '01/02/2023', '31/12/2023', 5,2),
(1,'Silla color azul',400, '01/02/2023', '31/12/2023', 5,2),
(1,'Laptop marca asu serie-44t45544554 core i3',4500, '01/02/2023', '31/12/2023', 1,2),
(1,'Laptop marca HP serie -78787788',3850, '11/02/2023', '31/12/2023', 1,2),
(1,'Escritorio color gris',800, '01/02/2022', '31/12/2022', 5,1),
(1,'Escritorio color marrón',800, '07/06/2022', '31/12/2022', 5,1),
(1,'Silla color blanco',400, '04/05/2022', '31/12/2022', 5,1),
(1,'Silla color azul',400, '05/07/2022', '31/12/2022', 5,1)
GO
