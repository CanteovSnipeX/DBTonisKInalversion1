/*Programador 
	Diego andres Canteo Matinez
	2016532
Creacion 
	23/03/2020ss
	23/03/2020
	Creacion  de base de datos
	Creacion  de  entidad  Empresas
    Presupuesto
    Servicios
    TipoPlato
    Platos
    ServicioPlatos
    ProductoshasPlatos
    TipoEmpleado
    ServicioshasEmpleado
Modicacion*/


Drop DataBase if Exists BDTonysKINAL2016532;
Create DataBase BDTonysKINAL2016532;
use BDTonysKINAL2016532;


CREATE TABLE Empresas(
codigoEmpresa INT AUTO_INCREMENT NOT NULL ,
	nombreEmpresa varchar(150) not null,
    direccion varchar(150)not null,
    telefono varchar(150) not null, 
PRIMARY KEY  PK_codigoEmpresa(codigoEmpresa)
);

CREATE TABLE Presupuesto(
codigoPresupuesto INT AUTO_INCREMENT NOT NULL ,
	fechaSolicitud Date ,
    cantidadPresupuesto Decimal(10,2),
    codigoEmpresa Int,
PRIMARY KEY PK_codigoPresupuesto (codigoPresupuesto),
CONSTRAINT FK_Presupuesto_Empresas
		FOREIGN KEY (codigoEmpresa)
			REFERENCES Empresas(codigoEmpresa)
);


CREATE TABLE Servicios (
codigoServicio INT AUTO_INCREMENT NOT NULL  ,
	fechaServicio Date,
    tipoServicio Varchar(100),
    horaServicio Time,
    lugarServicio Varchar(100),
    telefonoContacto Varchar(100),
    codigoEmpresa Int,
PRIMARY KEY  PK_codigoServicio(codigoServicio),
CONSTRAINT FK_Servicios_Empresas
		FOREIGN KEY (codigoEmpresa)
			REFERENCES Empresas(codigoEmpresa)
);



CREATE TABLE TipoPlato(
codigoTipoPlatos INT  AUTO_INCREMENT  ,
	descripcionTipo Varchar (100),
PRIMARY KEY PK_codigoTipoPlatos(codigoTipoPlatos)
);


CREATE  TABLE Platos(
codigoPlatos INt AUTO_INCREMENT NOT NULL ,
	cantidad varchar(150) ,
    nombrePlato Varchar(150),
    descripcionPlato Varchar(150),
    precioPlato Decimal (10,2),
	codigoTipoPlatos Int,	
PRIMARY KEY PK_codigoPlatos(codigoPlatos) ,
CONSTRAINT FK_Platos_TipoPlato
		FOREIGN KEY (codigoTipoPlatos)
			REFERENCES TipoPlato(codigoTipoPlatos)
);

CREATE TABLE  ServicioPlatos(
codigoServicioPlatos INT  NOT NULL,
	codigoServicio Int,
    CodigoPLatos int,
PRIMARY KEY PK_codigoServicioPlatos(codigoServicioPlatos),
CONSTRAINT FK_ServicioPlatos_Servicios
		FOREIGN KEY (codigoServicio)
			REFERENCES Servicios(codigoServicio),
CONSTRAINT FK_ServicioPlatos_Platos
		FOREIGN KEY (codigoPlatos)
			REFERENCES Platos(codigoPlatos)
);


CREATE TABLE Productos(
codigoProducto int AUTO_INCREMENT  ,
nombreProducto VARCHAR(150),
cantidad varchar(150),
PRIMARY KEY  PK_codigoProducto(codigoProducto)
);


CREATE TABLE ProductoshasPlatos (
codigoProductos_has_Platos INT AUTO_INCREMENT NOT NULL ,
	codigoPlatos Int,
PRIMARY KEY  PK_codigoProductos_has_Platos(codigoProductos_has_Platos),
CONSTRAINT FK_ProductoshasPlatos_Platos
		FOREIGN KEY (codigoPlatos)
			REFERENCES Platos(codigoPlatos)
);


CREATE TABLE TipoEmpleado (
	codigoTipoEmpleado integer AUTO_INCREMENT NOT NULL,
	descripcion varchar (150),
PRIMARY KEY  PK_codigoTipoEmpleado(codigoTipoEmpleado)
);

CREATE TABLE Empleado(
codigoEmpleado INT AUTO_INCREMENT NOT NULL ,
	numeroEmpleado Varchar (150),
    nombreEmpleado Varchar(150),
	apellidoEmpleado Varchar (150),
    direccionEmpleado Varchar(150),
    telefonoContacto Varchar(150),
    gradoCocinero Varchar(150) ,
    codigoTipoEmpleado Int,
PRIMARY KEY PK_codigoEmpleado(codigoEmpleado),
CONSTRAINT FK_Empleado_TipoEmpleado
		FOREIGN KEY (codigoTipoEmpleado)
			REFERENCES TipoEmpleado(codigoTipoEmpleado)  
);

CREATE TABLE ServicioshasEmpleado (
codigoServicioshasEmpleado INT AUTO_INCREMENT NOT NULL ,
		fechaEvento Date,
        horaEvento Time,
        lugarEvento Varchar(150),
        codigoServicio Int ,
        codigoEmpleado int,
PRIMARY KEY  PK_codigoServicioshasEmpleado(codigoServicioshasEmpleado),
CONSTRAINT FK_ServicioshasEmpleado_Servicios 
		FOREIGN KEY (codigoServicio)
			REFERENCES Servicios(codigoServicio),
CONSTRAINT FK_ServicioshasEmpleado_Empleado
             FOREIGN KEY (codigoEmpleado)
			REFERENCES Empleado(codigoEmpleado)
);
 
 
 
ALTER USER 'root'@'localhost' identified WITH mysql_native_password BY 'admin';
