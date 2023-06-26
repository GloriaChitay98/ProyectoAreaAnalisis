
************************* sql server ****************************
create database webapp_skynet_desa;

create table sn_cliente(
    cdusuario numeric(10,0) not null primary key, 
    primernombre varchar(30),
    segundonombre varchar(30),
    primerapellido varchar(30),
    segundoapellido varchar(30),
    documento varchar(30),
    nombre varchar(100),
    apellidocasada varchar(30),
    fechanacimiento varchar(30),
    telefono varchar(8),
    email varchar(100),
    direccion varchar(100)
);

create table sn_ticket(
    cdticket numeric(20) primary key not null, 
    cdcliente varchar(10) not null, 
    cdarea varchar(5) not null, 
    fechaingreso varchar(30),
    estado varchar(2) not null, 
    fechaestado varchar(30),
    ubicacion varchar(200)
);

create table sn_detalleticket(
    cdticket numeric(20,0) not null, 
    etapa varchar(50) not null, 
    fechaetapa varchar(30),
    comentario varchar(100)
);

create table sn_area(
    cdarea numeric(5,0) not null primary key, 
    descripcion varchar(80) not null, 
    fechacreacion varchar(50) not null, 
    estado varchar(2),
    fechaestado varchar(50)
);

create table sn_tiposervicio(
    cdservicio numeric(5,0) not null primary key, 
    descripcion varchar(80) not null, 
    fechacreacion varchar(50) not null, 
    estado varchar(2),
    fechaestado varchar(50)
);

create table sn_persona_genero(
    ´cdgenero numeric(5,0) not null primary key, 
    descripcion varchar(80) not null, 
    fechacreacion varchar(50) not null, 
    estado varchar(2),
    fechaestado varchar(50)
);

create table sn_usuario(
    cdusuario numeric(10,0)primary key not null, 
    cdperfil varchar(5)not null, 
    nombre varchar(100) not null, 
    email varchar(100) not null,
    password varchar(500),
    fechacreacion varchar(30),
    fechaestado varchar(30),
    estado varchar(2)not null
);

create table sn_perfil(
    cdperfil numeric(5,0) primary key not null,
    descripcion varchar(50) not null, 
    fechacreacion varchar(30),
    fechaestado varchar(30),
    estdo varchar(2) not null
);



insert into sn_perfil values ('5001', 'ADMINISTRADOR', '17/05/2023', '17/05/2023', 'A');
insert into sn_perfil values ('5002', 'SUPERVISOR', '17/05/2023', '17/05/2023', 'A');
insert into sn_perfil values ('5003', 'TECNICO', '17/05/2023', '17/05/2023', 'A');

insert into sn_area values ('10', 'INFRAESTRUCTURA', '17/05/2023', '17/05/2023', 'A');
insert into sn_area values ('20', 'SOPORTE Y MANTENIMIENTO', '17/05/2023', '17/05/2023', 'A');

insert into sn_tiposervicio values ('100', 'SERVICIOS TECNICOS', '17/05/2023', '17/05/2023', 'A');
insert into sn_tiposervicio values ('200', 'SERVICIOS DE CONSULTORIA', '17/05/2023', '17/05/2023', 'A');
insert into sn_tiposervicio values ('200', 'SERVICIOS TECNICOS Y PROFESIONALES EN CONSULTORIA', '17/05/2023', '17/05/2023', 'A');

insert into sn_persona_genero values ('F', 'FEMENINO', '17/05/2023', '17/05/2023', 'A');
insert into sn_persona_genero values ('M', 'MASCULINO', '17/05/2023', '17/05/2023', 'A');
insert into sn_persona_genero values ('20N0', 'NO APLICA', '17/05/2023', '17/05/2023', 'A');



USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[CatalogoArea]    Script Date: 18/06/2023 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoArea]

AS
BEGIN
	
	begin
		select cdarea, descripcion
		from sn_area
		where estado = 'A';
	end

END


USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[CatalogoGenero]    Script Date: 18/06/2023 15:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoGenero]

AS
BEGIN
	
	begin
		select cdgenero, descripcion
		from sn_persona_genero
		where estado = 'A';
	end

END


USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[CatalogoPerfil]    Script Date: 18/06/2023 15:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoPerfil]

AS
BEGIN
	
	begin
		select cdperfil, descripcion
		from sn_perfil
		where estado = 'A';
	end

END

USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[CatalogoServicio]    Script Date: 18/06/2023 15:57:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogoServicio]

AS
BEGIN
	
	begin
		select cdservicio, descripcion
		from sn_tiposervicio
		where estado = 'A';
	end

END


USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[p_crea_cliente]    Script Date: 18/06/2023 15:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[p_crea_cliente]
    @primernombre varchar(30), 
	@segundonombre varchar(30), 
	@primerapellido varchar(30), 
	@segundoapellido varchar(30), 
	@apellidocasada varchar(30), 
	@nombre varchar(100),  
	@documento varchar(20),  
	@fechanacimiento varchar(20),  
	@telefono varchar(8),
	@email varchar(100),
	@direccion varchar(100),
	@resp varchar(200) OUTPUT
AS    
BEGIN TRY  
     insert into sn_cliente (cdusuario, documento, primernombre, segundonombre, primerapellido, segundoapellido
	 , nombre, apellidocasada, fechanacimiento, telefono, email, direccion) 
	 values(
   next value for seq_nuevo_cliente,
   @documento,
   @primernombre,
   @segundonombre,
   @primerapellido,
   @segundoapellido,
   @nombre,
   @apellidocasada,
   @fechanacimiento,
   @telefono,
   @email,
   @direccion
   );	

   set @resp = 'Cliente creado correctamente.';
END TRY  
BEGIN CATCH   
	set @resp = Concat('Error, no se logró crear al cliente. ', @@ERROR);
END CATCH;  

USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[p_crea_usuario]    Script Date: 18/06/2023 16:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[p_crea_usuario]
    @cdperfil numeric(5,0),
	@nombre varchar(100),
	@email varchar(100),
	@fechacreacion varchar(20),
	@fechaestado varchar(20),
	@estado varchar(2),
	@resp varchar(100) output
AS    
  
    SET NOCOUNT ON;

BEGIN TRY  
     insert into sn_usuario values(
   next value for seq_creausuario,
   @cdperfil,
   @nombre,
   @email,
   @fechacreacion,
   @fechaestado,
   @estado
   );

   select @resp = 'Usuario creado correctamente.';

END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() AS ErrorMessage;  
	select @resp = 'No se pudo crear al cliente. ';
	
END CATCH;  


USE [webapp_skynet_desa]
GO

USE [webapp_skynet_desa]
GO

/****** Object:  Sequence [dbo].[seq_creaticket]    Script Date: 26/06/2023 15:16:01 ******/
CREATE SEQUENCE [dbo].[seq_creaticket] 
 AS [bigint]
 START WITH 100120
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO



USE [webapp_skynet_desa]
GO

USE [webapp_skynet_desa]
GO

/****** Object:  Sequence [dbo].[seq_nuevo_cliente]    Script Date: 26/06/2023 15:16:16 ******/
CREATE SEQUENCE [dbo].[seq_nuevo_cliente] 
 AS [int]
 START WITH 10050
 INCREMENT BY 1
 MINVALUE -USE [webapp_skynet_desa]
GO
/****** Object:  StoredProcedure [dbo].[ReporteGestionesIngresadas]    Script Date: 26/06/2023 15:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReporteGestionesIngresadas]

AS
BEGIN
	
	begin
		select a.cdticket, a.fechaingreso, a.fechaestado, b.descripcion estado_gestion, c.nombre, d.descripcion
		from sn_ticket a, sn_estado_gestion b, sn_cliente c, sn_area d
		where a.estado = b.codigo
		and c.cdusuario = a.cdcliente 
		and d.cdarea = a.cdarea
		;
	end

END
147483647
 CACHE 
GO



