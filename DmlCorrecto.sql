use BDTonysKINAL2016532;

//Empresas

DELIMITER $$
Create Procedure sp_AgregarEmpresas(in nombreEmpresa varchar(150),in direccion varchar(150),in telefono varchar(150))
Begin
	Insert into Empresas(nombreEmpresa,direccion,telefono) 
	values(nombreEmpresa,direccion,telefono);
End$$
DELIMITER ;

Call sp_AgregarEmpresas("IKEA","Zona1015-12",42307894);
Call sp_AgregarEmpresas("COCACOLA","Zona12 15-12",42307541);
Call sp_AgregarEmpresas("PEPSI","Zona15 15-12",87209321);
Call sp_AgregarEmpresas("POLLOREY","Zona1 15-12",53827194);
Call sp_AgregarEmpresas("SONNY","Zona7 15-12",64925120);
Call sp_AgregarEmpresas("GRAND WESTERN STEAKS","Exportacion",25346586);
call sp_AgregarEmpresas("GOOGLE","USA","4759438");
call sp_AgregarEmpresas("ORACLE","Estados Unidos los angeles ","1234567891011");
call sp_AgregarEmpresas("SUBWAY","Centros comerciles ","1122");
call sp_AgregarEmpresas("POOLO BRUJO","Centros Comerciales","1177");

DELIMITER $$
Create Procedure sp_listarEmpresas()
begin
		SELECT 
        Empresas.codigoEmpresa,
        Empresas.nombreEmpresa,
		Empresas.direccion,
        Empresas.telefono
        from Empresas;
End$$
DELIMITER ;


DELIMITER $$
Create Procedure sp_ActualizarEmpresa(in codEmp int,in nombreEmpresa varchar(150),in direccion varchar(150),in telefono varchar(150))
Begin
	UPDATE Empresas SET 
	nombreEmpresa = nombreEmpresa,
	direccion = direccion,
	telefono = telefono 
	WHERE codigoEmpresa = codEmp ;
End$$
DELIMITER ;


DELIMITER $$
Create Procedure sp_EliminarEmpresa(in codEmp int)
BEGIN 
	delete 
	from Empresas
	where codigoEmpresa = codEmp;
END $$
DELIMITER ;

Delimiter $$
Create Procedure sp_BuscarEmpresa(in  codEmp  int)
BEGIN 
		SELECT
        Empresas.codigoEmpresa,
        Empresas.nombreEmpresa,
        Empresas.direccion,
        Empresas.telefono 
        from Empresas
		where codigoEmpresa = codEmp;
END $$
Delimiter ;




//Presupuesto



Delimiter $$
Create Procedure sp_AgregarPresupuesto(in _fechaSolicitud Date ,in _cantidadPresupuesto Decimal(10,2),in _codigoEmpresa Int)
Begin 
		Insert into  Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa)
			values (_fechaSolicitud,_cantidadPresupuesto,_codigoEmpresa);
End$$
Delimiter ;

Call sp_AgregarPresupuesto('2003/04/3','1234565.54',1);
Call sp_AgregarPresupuesto('2003/04/5','123445.54',2);
Call sp_AgregarPresupuesto('2003/05/5','123345.54',6);
Call sp_AgregarPresupuesto('2003/01/1','123435.54',5);
Call sp_AgregarPresupuesto('2003/04/2','123145.54',4);
Call sp_AgregarPresupuesto('2003/04/3','12345123.54',2);
call sp_AgregarPresupuesto('2000/05/15','16236478.3',2);
call sp_AgregarPresupuesto('2020/05/31','123453.3',2);
call sp_AgregarPresupuesto('2019/01/12','653245.54',4);
call sp_AgregarPresupuesto('2018/12/12','150000.10',3);

Delimiter $$
Create Procedure sp_listarPresupuesto(
)
Begin 
	Select 
	Presupuesto.codigoPresupuesto,
    Presupuesto.fechaSolicitud,
    Presupuesto.cantidadPresupuesto,
    Presupuesto.codigoEmpresa from Presupuesto;
End $$
Delimiter ;



Delimiter $$
Create Procedure sp_ActualizarPresupuesto (in codigoPresupuesto int,in _fechaSolicitud Date,in _cantidadPresupuesto Decimal(10,2))
Begin 
		update Presupuesto set 
        fechaSocitud = _fechaSocitud,
        cantidadPresupuesto = _cantidadPresupuesto
        WHERE codigoPresupuesto = codigoPresupuesto ;
End $$
Delimiter ;

 

DELIMITER $$
    Create Procedure sp_EliminarPresupuesto(in codPre int)
    BEGIN 
			delete 
				from presupuesto 
							where codigoPresupuesto = codPre;
    END $$
DELIMITER ;


Delimiter $$
Create Procedure sp_BuscarPresupuesto (in codPre int)
BEGIN 
		select 
        presupuesto.cantidadPresupuesto,
        presupuesto.fechaSolicitud,
        presupuesto.codigoEmpresa
        from presupuesto
        where codigoPresupuesto = codPre;
END$$
Delimiter ;



--Servivio--
 
 

Delimiter $$
Create Procedure sp_AgregarServicio(in	fechaServicio Date ,in tipoServicio Varchar(100),in horaServicio Time ,in	lugarServicio Varchar(100),in	telefonoContacto Varchar(100), in codigoEmpresa int )
Begin 
	Insert into  Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,codigoEmpresa)
		Values (fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,codigoEmpresa);
End$$
Delimiter ;

call sp_AgregarServicio("2003-04-3","Catering","15:30:00","Mixco","55750188"," 1");
call sp_AgregarServicio("2003-04-3","LA INGLESA","12:30:00","Antifgua Guatemala","37623456"," 2");
call sp_AgregarServicio("2013-04-4","LA FRANCESA","11:30:00","Quetzaltenago","18364721"," 3");
call sp_AgregarServicio("2023-04-3","GUERIDÓN","15:40:00","Guatemala","42307894"," 4");
call sp_AgregarServicio("2014-04-3","emplatado","08:30:00","El prograso","45750683"," 5");
call sp_AgregarServicio("2014-07-2","Americano","18:30:00","Izabsl","7281631212"," 6");
call sp_AgregarServicio("2020-04-3","Rusa","07:30:00","Peten","87645142"," 7");
call sp_AgregarServicio("2012-04-7","Inglés","04:30:00","Huehuetenago","12345678"," 1");
call sp_AgregarServicio("2000-04-9","buffet","09:30:00","zacapa","17364583"," 2");
call sp_AgregarServicio("2018-04-19","gueridón","22:30:00","Atitlan ","27364512","3");



Delimiter $$
Create Procedure sp_listarServicio()
Begin 
	select 
			servicios.codigoServicio,
            servicios.fechaServicio,
            servicios.tipoServicio,
            servicios.horaServicio,
            servicios.lugarServicio,
            servicios.telefonoContacto,
            servicios.codigoEmpresa
	from  Servicios;
            
End $$
Delimiter ;

 
Delimiter $$
Create Procedure sp_ActualizarServicio (in codigoServicio int ,
in fechaServicio Date,
in tipoServicio Varchar(100),
in horaServicio Time,	
in lugarServicio Varchar(100),
in telefonoContacto Varchar(100))
Begin 
	update Servicios
				set 
					fechaServicio = fechaServicio,
					tipoServicio = tipoServicio,
					horaServicio = horaServicio,
					lugarServicio = lugarServicio,
					telefonoContacto = telefonoContacto
					WHERE codigoServicio = codigoServicio ;
End $$
Delimiter ;


DELIMITER $$
    Create Procedure sp_EliminarServicio(in codSer int )
    BEGIN 
		delete 
			from Servicios 
						Where  codigoServicio = codSer;
    END $$
DELIMITER ;


DELIMITER $$
Create Procedure  sp_BuscarServicio (in codSer int)
Begin 
	Select  servicios.fechaServicio,
    serivicios.tipoServicio,
    servicios.horaServicio,
    servicios.lugarServicio,
    serviciostelefonocontacto from  Servicios where codigoServicio = codSer ;
End $$
Delimiter ;



//Plato



Delimiter $$
Create Procedure sp_AgregarPlato(in	cantidad varchar(150) ,in nombrePlato Varchar(150),in descripcionPlato Varchar(150),in precioPlato Decimal (10,2), in codigoTipoPlatos int)
Begin 
		Insert into Platos(cantidad,nombrePlato,descripcionPlato,precioPlato,codigoTipoPlatos)
			Values (cantidad,nombrePlato,descripcionPlato,precioPlato,codigoTipoPlatos);
End$$
Delimiter ;


call sp_AgregarPlato("123","Pallo gisado"," pollo con arros","132.5",1);


Delimiter $$
Create Procedure sp_ListarPlato( 
)
Begin
	select
		platos.codigoPlatos,
        platos.cantidad,
        platos.nombrePlato,
        platos.descripcionPlato,
        platos.precioPlato,
        platos.codigoTipoPlatos
        from platos;
End $$
Delimiter ;


Delimiter $$
Create Procedure sp_ActualizarPlato(in codPla int,in cantidad varchar(150),in nombrePlato Varchar(150),in descripcionPlato Varchar(150),in precioPlato Decimal (10,2))
Begin
		Update Platos set 
			cantidad = cantidad ,
            nombrePlato = nombrePlato,
            descripcionPlato = descripcionPlato,
            precioPlato = precioPlato 
             WHERE codigoPlatos = codPla;
End $$
Delimiter ;

Delimiter $$
Create Procedure sp_EliminarPlato(in codPla int )
Begin 
	Delete 
			from  Platos
				WHERE  codigoPlatos = codPla;
    
End$$
Delimiter ; 



Delimiter $$
Create Procedure sp_BuscarPlato(in codigoPlato  int)
Begin
	Select platos.cantidad,
    platos.nombrePlato,
    platos.descripcionPlato,
    platos.precioPlato,
    platos.codigoTipoPlatos 
	from  Platos where codigoPlato  = codigoPlato;
End$$
Delimiter ;



//TipoPlato



Delimiter $$
Create Procedure  sp_AgregarTipoPlato (in descripcionTipo Varchar (100))
Begin 
	Insert into  TipoPlato (descripcionTipo)
		Values (descripcionTipo );
End $$
Delimiter ;

call sp_AgregarTipoPlato("Blanqueado");
call sp_AgregarTipoPlato("Empanizado");
call sp_AgregarTipoPlato("Acaramelado");
call sp_AgregarTipoPlato("Asado");
call sp_AgregarTipoPlato("Colorido");
call sp_AgregarTipoPlato("Elegante");
call sp_AgregarTipoPlato("Fresco");
call sp_AgregarTipoPlato("Frito");
call sp_AgregarTipoPlato("Hojas verdes");
call sp_AgregarTipoPlato("Quemado");




Delimiter $$
create Procedure sp_ListarTipoPlato ()
Begin
	select
    tipoplato.codigoTipoPlatos,
    tipoplato.descripcionTipo
    from tipoplato;
End $$
Delimiter ;


Delimiter $$
Create Procedure sp_ActualizarTipoPlato(in codTipPla int ,in desTipPla Varchar (100))
Begin
		update TipoPlato set
				descripcionTipo = desTipPla
					where codigoTipoPlatos = codTipPla;
End$$
Delimiter ;



Delimiter $$
Create Procedure  sp_EliminarTipoPlato (in codTip Varchar (100))
Begin 
	delete
		from tipoplato
			where  codigoTipoPlatos = codTip;
End$$
Delimiter ;

drop  procedure if exists sp_BuscarTipoPlato ;
 
Delimiter $$
Create Procedure sp_BuscarTipoPlato(in codTipPla int)
Begin
		select 	tipoplato.codigoTipoPlatos,
				tipoplato.descripcionTipo
                 from tipoplato where codigoTipoPlatos = codTipPla;
End $$
Delimiter ;



//TipoEmpleado



Delimiter $$
Create Procedure sp_AgregarTipoEmpleado(in descripcion varchar(150))
Begin
	Insert Into TipoEmpleado(descripcion)
		values (descripcion);
End$$
Delimiter ;

call sp_AgregarTipoEmpleado('gerente');
call sp_AgregarTipoEmpleado('Cocinero');
call sp_AgregarTipoEmpleado('Mesero');
call sp_AgregarTipoEmpleado('Jefe');
call sp_AgregarTipoEmpleado('Resepcionista');
call sp_AgregarTipoEmpleado('Intendente');
call sp_AgregarTipoEmpleado('Contador');
call sp_AgregarTipoEmpleado('Proveedor');
call sp_AgregarTipoEmpleado('lavaplatos');
call sp_AgregarTipoEmpleado('Barmaan');
call sp_AgregarTipoEmpleado('Cheff');
call sp_AgregarTipoEmpleado(' Bodegerro');

Delimiter $$
Create Procedure sp_ListarTipoEmpleado(
)
Begin
	select
		TipoEmpleado.CodigoTipoEmpleado,
        TipoEmpleado.descripcion
        From TipoEmpleado;
End$$
Delimiter ;


delimiter $$
Create Procedure sp_ActualizarTipoEmpleado ( in codTipEmp int,_descripcion varchar(150))
Begin
	UPDATE TipoEmpleado set 
			descripcion = _descripcion
			Where  codigoTipoEmpleado  = codTipEmp;
End$$
Delimiter ;

Delimiter $$
Create Procedure sp_EliminarTipoEmpleado(in codTipEmp int )
Begin
		Delete 
				from  TipoEmpleado  
									where  codigoTipoEmpleado = codTipEmp;
     
End$$
Delimiter ;


Delimiter $$
Create Procedure sp_BuscarTipoEmpleado(in codTipEmp int)
Begin 
	Select 	tipoempleado.codigoTipoEmpleado,
			TipoEmpleado.descripcion 
		from  TipoEmpleado
			Where  codigoTipoEmpleado = codTipEmp ;
End $$
Delimiter ;


//Empleado




Delimiter $$
Create Procedure sp_AgregarEmpleado(in numeroEmpleado Varchar (150),in apellidoEmpleado Varchar (150),in nombreEmpleado Varchar(150),in direccionEmpleado Varchar(150),in telefonoContacto Varchar(150),in gradoCocinero Varchar(150),in codigoTipoEmpleado int)
Begin
	Insert into Empleado(numeroEmpleado,nombreEmpleado,apellidoEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,codigoTipoEmpleado)
		values(numeroEmpleado,apellidoEmpleado,nombreEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,codigoTipoEmpleado);
End $$
Delimiter ;

call sp_AgregarEmpleado("2020001","Diego","Canteo","zona 10  de mixco","42000075","Cocinero","1");
call sp_AgregarEmpleado("2020002","Alex","Centeno","zona 1 guatemala ","47550684","lavaPlatos","1");
call sp_AgregarEmpleado("2020003","Andrea","Calderon","zona 10  de mixco","21436578","Gerenete","1");
call sp_AgregarEmpleado("2020004","Daniela ","Canteo","zona 11 dee mixco","12374632","jefe","1");
call sp_AgregarEmpleado("2020005","jose","luna","zona  12 guatemala","423045035","Mesero","1");
call sp_AgregarEmpleado("2020006","Alejandra","Perez","Carretera al Salvador ","47550684","Resepcionista","1");
call sp_AgregarEmpleado("2020007","Claudia","Maritnez","zona 17 de guatemala ","12374857","Mesero","4");
call sp_AgregarEmpleado("2020008","Predro","Armas","zona 1 ","18453251","Tecnico","2");
call sp_AgregarEmpleado("2020009","Giezi","Mejia","zona 7 de mixco","274836594","Jefe","5");
call sp_AgregarEmpleado("20202010","Jorje","Perez","zona 10 de mixco","17465328","Contador","1");




Delimiter $$
Create Procedure sp_listarEmpleado(
)
Begin
		SELECT 
		Empleado.codigoEmpleado,
        Empleado.numeroEmpleado,
		Empleado.nombreEmpleado,
        Empleado.apellidoEmpleado,
        Empleado.direccionEmpleado,
		Empleado.telefonoContacto,
        Empleado.gradoCocinero,
        Empleado.codigoTipoEmpleado
        from Empleado;
End$$
Delimiter ;
 

Delimiter $$
Create Procedure sp_ActualizarEmpleado(in codEmpl int,in _numeroEmpleado Varchar (150),in _apellidoEmpleado Varchar (150),in _nombreEmpleado Varchar(150),in _direccionEmpleado Varchar(150),in _telefonoContacto Varchar(150),in _gradoCocinero Varchar(150))
Begin 
	update Empleados set 
    numeroEmpleado = _numeroEmpleado,
    nombreEmpleado = _nombreEmpleado,
    apellidoempleado = _apellidoempleado,
    direccioEmpleado = _direccioEmpleado,
    telefonoContacto = _telefonoContacto,
    gradoCocinero = _gradoCocinero
    where codigoEmpleado = codEmpl ;
End$$
Delimiter ;


Delimiter $$
Create Procedure sp_EliminarEmpleado( in codEmpl int)
Begin
	delete	
			from Empleado
						where codigoEmpleado =  codEmpl;
End $$
Delimiter ;


drop procedure if exists sp_BuscarEmpleado;

Delimiter $$
Create Procedure sp_BuscarEmpleado(in codEmpl int )
Begin
select
		Empleado.codigoEmpleado,	
		Empleado.numeroEmpleado,
		Empleado.nombreEmpleado,
        Empleado.apellidoEmpleado,
        Empleado.direccionEmpleado,
        Empleado.telefonoContacto,
        Empleado.gradoCocinero,
        Empleado.codigoTipoEmpleado
        from Empleado 
				where codigoEmpleado = codEmpl;
End $$
Delimiter ;



//ServiciosHasEmpleados



Delimiter $$
Create Procedure sp_AgregarServicioshasEmpleados (in fechaEvento Date,in horaEvento Time,in lugarEvento Varchar(150))
Begin
	Insert Into ServicioshasEmpleados(fechaEvento,horaEvento,lugarEvento)
		Values (fechaEvento,horaEvento,lugarEvento);
End$$
Delimiter ;

Delimiter $$
create procedure sp_listarServicioshasEmpleados()
begin
	select 
    servicioshasempleado.codigoServicioshasEmpleado,
    servicioshasempleado.fechaEvento,
    servicioshasempleado.horaEvento,
    servicioshasempleado.lugarEvento
    from  servicioshasempleado;
end$$
delimiter ;

delimiter $$
create procedure sp_ActualizarServicioshasEmpleados( in codigoServicioshasEmpleados int, in fechaEvento Date,in horaEvento time,in lugarEvento varchar(150))
begin
	update ServicioshasEmpleados set 
    fechaEvento = fechaEvento,
    horaEvento = horaEvento,
    lugarEvento = lugarEvento
    where codigoServicioshasEmpleados =codigoServicioshasEmpleados;
end$$
delimiter ;

delimiter $$
create procedure sp_EliminarServicioshasEmpleados(in codigoServicioshasEmpleados int)
begin
	delete
	from ServicioshasEmpleados
	where codigoServicioshasEmpleados = codigoServicioshasEmpleados;						
end$$ 
delimiter ;

delimiter $$
create procedure sp_BuscarServicioshasEmpleados(in codigoServicioshasEmpleados int)
begin
	select 
		ServicioshasEmpleados.fechaEvento,
		ServicioshasEmpleados.horaEvento,
		ServicioshasEmpleados.lugarEvento
	from  servicioshasempleado
    where codigoServicioshasEmpleados = codigoServicioshasEmpleados;
end$$
delimiter ;



//Productos



DELIMITER $$
create procedure sp_AgregarProductos (in nombreproducto varchar(150),in cantidad varchar (150))
begin
	insert into productos(nombreProducto,cantidad)
    values(nombreProducto,cantidad);
end$$
DELIMITER ;

call sp_AgregarProductos("Pollo","1634652");
call sp_AgregarProductos("Carne de Cerdo ",1243);
call sp_AgregarProductos("Carne de Res","12234");
call sp_AgregarProductos("Pollo Aumado","162538");
call sp_AgregarProductos("AKVAVIT","1524");
call sp_AgregarProductos("BLANKO","1626");
call sp_AgregarProductos("CAMPARI","123849");
call sp_AgregarProductos("CHAMPAGNE","6273894");
call sp_AgregarProductos("Vegetales","4567891");
call sp_AgregarProductos("Pezcado","1625345");
call sp_AgregarProductos("Bebidas gacesosas","12345");


delimiter $$
create procedure sp_listarProductos()
begin
	select 
    Productos.codigoProducto,
    Productos.nombreProducto,
    Productos.cantidad
    from Productos;
end$$
delimiter ;


drop procedure if exists sp_ActualizarProductos;
 
delimiter $$
create procedure sp_ActualizarProductos(in codigoProducto int,in nombreProducto varchar(150) , in cantidad varchar(150))
begin
	update productos set
			nombreProducto = nombreProducto,
			cantidad = cantidad
        where codigoProducto = codigoProducto;
end$$
delimiter ;

delimiter $$
create procedure sp_EliminarProductos(in codigoProducto int )
begin
	delete 
		from productos 
					where  codigoProducto = codigoProducto;
end$$
delimiter ;

delimiter $$
create procedure sp_buscarProductos(in codigoProducto int )
begin
	select 
		productos.codigoProducto,
		productos.nombreProducto,
        productos.cantidad
        from productos
					where cosdigoProducto = codigoProducto;
end$$
delimiter ;

