USE [TyGHFinal]
GO
/****** Object:  Table [dbo].[agenda]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agenda](
	[idAgenda] [int] IDENTITY(1,1) NOT NULL,
	[diaHoraInicio] [datetime] NULL,
	[diaHoraFinal] [datetime] NULL,
	[idMedico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAgenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](60) NULL,
	[numero] [varchar](60) NULL,
	[piso] [varchar](60) NULL,
	[localidad] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[legajo] [varchar](60) NULL,
	[consulta] [decimal](18, 0) NULL,
	[idPersona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](60) NULL,
	[matricula] [int] NULL,
	[idEmpleado] [int] NULL,
	[idAgenda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](60) NULL,
	[documento] [int] NULL,
	[email] [varchar](60) NULL,
	[celular] [varchar](60) NULL,
	[idDireccion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sala]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sala](
	[idSala] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NULL,
	[nombre] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turno]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turno](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[diaHoraInicio] [datetime] NULL,
	[diaHoraFinal] [datetime] NULL,
	[idPaciente] [int] NULL,
	[idAgenda] [int] NULL,
	[idSala] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [nchar](10) NULL,
	[correo] [varchar](60) NULL,
	[password] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[agenda]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[agenda]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[paciente]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[persona] ([idPersona])
GO
ALTER TABLE [dbo].[turno]  WITH CHECK ADD FOREIGN KEY([idAgenda])
REFERENCES [dbo].[agenda] ([idAgenda])
GO
ALTER TABLE [dbo].[turno]  WITH CHECK ADD FOREIGN KEY([idPaciente])
REFERENCES [dbo].[paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[turno]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[sala] ([idSala])
GO
/****** Object:  StoredProcedure [dbo].[Crear_Agenda]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Crear_Agenda]
	-- Add the parameters for the stored procedure here
	@diaHoraInicio datetime,
	@diaHoraFinal datetime,
	@idMedico int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into agenda (diaHoraInicio, diaHoraFinal, idMedico) values (@diaHoraInicio, @diaHoraFinal, @idMedico)
END
GO
/****** Object:  StoredProcedure [dbo].[Crear_Paciente_Domicilio]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Crear_Paciente_Domicilio]
	-- Add the parameters for the stored procedure here
	@calle varchar(60),
	@numero varchar(60),
	@piso varchar(60),
	@localidad varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Direccion (calle, numero, piso, localidad) values (@calle, @numero, @piso, @localidad)

END
GO
/****** Object:  StoredProcedure [dbo].[Crear_Persona]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Crear_Persona]
	-- Add the parameters for the stored procedure here
	@nombre varchar(60),
	@apellido varchar(60),
	@documento varchar(60),
	@email varchar(60),
	@celular varchar(60),
	@idDireccion int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Persona (nombre, apellido, documento, email, celular, idDireccion) values (@nombre, @apellido, @documento, @email, @celular, @idDireccion);
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Crear_Usuario]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Crear_Usuario] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(60),
	@apellido varchar(60),
	@correo varchar(60),
	@password varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO usuarios (nombre, apellido, correo, password) VALUES (@nombre,  @apellido, @correo, @password)
END
GO
/****** Object:  StoredProcedure [dbo].[Guardar_Empleado]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Guardar_Empleado]
	-- Add the parameters for the stored procedure here
	@legajo varchar(60),
	@consulta decimal,
	@idPersona int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Empleado (legajo,consulta,idPersona) VALUES (@legajo,@consulta,@idPersona); SELECT SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[Guardar_Medico]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Guardar_Medico]
	-- Add the parameters for the stored procedure here
	@especialidad varchar(60),
	@matricula int,
	@idEmpleado int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Medico (especialidad,matricula,idEmpleado) VALUES (@especialidad, @matricula, @idEmpleado)

END
GO
/****** Object:  StoredProcedure [dbo].[Guardar_Turno]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Guardar_Turno]
	-- Add the parameters for the stored procedure here
	@diaHoraInicio datetime,
	@diaHoraFinal datetime,
	@idPaciente int,
	@idAgenda int,
	@idSala int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into turno (diaHoraInicio, diaHoraFinal, idPaciente, idAgenda, idSala) VALUES (@diaHoraInicio,@diaHoraFinal,@idPaciente, @idAgenda, @idSala)

END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Agenda]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Agenda] 
	-- Add the parameters for the stored procedure here
	@idMedico int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.idAgenda,a.diaHoraInicio, p.nombre+' '+p.apellido as nombreCompleto, a.diaHoraFinal from agenda as A inner join medico as M on a.idMedico = m.idMedico inner join empleado as E on m.idEmpleado = e.idEmpleado inner join persona as P on e.idPersona = p.idPersona where a.idMedico = @idMedico


END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Medico_Id]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Medico_Id]
	-- Add the parameters for the stored procedure here
	@idMedico int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select m.especialidad, m.matricula, e.legajo, e.consulta, p.nombre, p.apellido, p.documento, p.celular, p.email, e.legajo, e.consulta, d.calle, d.numero, d.piso, d.localidad from medico as M inner join empleado as E on m.idEmpleado = e.idEmpleado inner join persona as P on e.idPersona = p.idPersona inner join direccion as D on p.idDireccion = d.idDireccion WHERE idMedico=@idMedico
	
	END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Medico_NomApId]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Medico_NomApId]
	-- Add the parameters for the stored procedure here
	@idMedico int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select p.nombre, p.apellido from medico as M inner join empleado as E on m.idEmpleado = e.idEmpleado inner join persona as P on e.idPersona = p.idPersona inner join direccion as D on p.idDireccion = d.idDireccion WHERE idMedico=@idMedico
	END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Medico_NomApIdAgenda]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Medico_NomApIdAgenda]
	-- Add the parameters for the stored procedure here
	@idAgenda int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select p.nombre, p.apellido from agenda as A inner join medico as M on a.idMedico = m.idMedico inner join empleado as E on m.idEmpleado = e.idEmpleado inner join persona as P on e.idPersona = p.idPersona inner join direccion as D on p.idDireccion = d.idDireccion WHERE a.idAgenda=@idAgenda
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Medicos]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Medicos]
	-- Add the parameters for the stored procedure here


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select m.idMedico, p.nombre + ' ' + p.apellido as nombreApellido, p.celular, p.email, e.legajo, e.consulta from medico as M inner join empleado as E on m.idEmpleado = e.idEmpleado inner join persona as P on e.idPersona = p.idPersona

END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Paciente_Id]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Paciente_Id]
	-- Add the parameters for the stored procedure here
	@idPaciente int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.nombre, p.apellido, p.documento, p.celular, p.email, d.calle, d.numero, d.piso, d.localidad from paciente
	as PA inner join persona as P on pa.idPersona = p.idPersona inner join direccion as D on p.idDireccion = d.idDireccion WHERE idPaciente=@idPaciente

END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Paciente_NomApID]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Paciente_NomApID]
	
	@idPaciente int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select p.nombre, p.apellido from paciente as PA inner join persona as P on pa.idPersona = p.idPersona WHERE idPaciente=@idPaciente;
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Pacientes]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Pacientes]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select pa.idPaciente, p.nombre + ' ' + p.apellido as nombreApellido, p.celular, p.email from paciente as PA inner join persona as p on pa.idPersona = p.idPersona

END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Pacientes_DDL]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Pacientes_DDL]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pa.idPaciente, p.nombre+' '+p.apellido as nombreApellido from paciente as PA inner join persona as P on pa.idPersona=p.idPersona
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Salas]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Salas]
	-- Add the parameters for the stored procedure here
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.idSala, s.nombre from sala as S


END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Turnos]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Turnos]
	-- Add the parameters for the stored procedure here
	@idAgenda int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.idTurno, t.diaHoraInicio, p.nombre+' '+p.apellido as nombreCompleto, t.diaHoraFinal, s.nombre from turno as T inner join paciente as PA on t.idPaciente = pa.idPaciente inner join persona as P on pa.idPersona = p.idPersona inner join sala as S on t.idSala=s.idSala where t.idAgenda = @idAgenda


END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Turnos_Paciente]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_Turnos_Paciente]
	-- Add the parameters for the stored procedure here
	@idPaciente int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.idTurno, t.diaHoraInicio, t.diaHoraFinal, s.nombre from turno as T inner join paciente as PA on t.idPaciente = pa.idPaciente inner join persona as P on pa.idPersona = p.idPersona inner join sala as S on t.idSala=s.idSala where t.idPaciente = @idPaciente

END
GO
/****** Object:  StoredProcedure [dbo].[Listar_UsuariosPass]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listar_UsuariosPass]
	-- Add the parameters for the stored procedure here
	@correo varchar(100)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Usuarios where correo=@correo

END
GO
/****** Object:  StoredProcedure [dbo].[Relacion_Persona_Paciente]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Relacion_Persona_Paciente]
	-- Add the parameters for the stored procedure here
	@idPersona int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   insert into paciente(idPersona) values (@idPersona)

END
GO
/****** Object:  StoredProcedure [dbo].[Select_Paciente_UP]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Select_Paciente_UP]
	-- Add the parameters for the stored procedure here
	@idPaciente int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT idPersona FROM paciente where idPaciente=@idPaciente;

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Direccion]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Direccion]
	-- Add the parameters for the stored procedure here
	@calle varchar(60),
	@numero varchar(60),
	@piso varchar(60),
	@localidad varchar(60),
	@idDireccion int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update direccion SET calle = @calle, numero=@numero, piso=@piso, localidad=@localidad  Where idDireccion = @idDireccion

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Empleado]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Empleado]
	-- Add the parameters for the stored procedure here
	@legajo varchar(60),
	@consulta decimal,
	@idEmpleado int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update empleado SET legajo = @legajo, consulta=@consulta Where idEmpleado = @idEmpleado;
	SELECT idPersona FROM empleado Where idEmpleado=@idEmpleado


END
GO
/****** Object:  StoredProcedure [dbo].[Update_Medico]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Medico]
	-- Add the parameters for the stored procedure here
	@especialidad varchar(60),
	@matricula int,
	@idMedico int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update medico SET especialidad = @especialidad, matricula=@matricula Where idMedico = @idMedico;
	SELECT idEmpleado FROM medico Where idMedico=@idMedico

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Persona]    Script Date: 17/10/2018 21:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_Persona] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(60),
	@apellido varchar(60),
	@documento varchar(60),
	@email varchar(60),
	@celular varchar(60),
	@idPersona int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Persona set nombre=@nombre, apellido=@apellido, documento=@documento, email= @email,celular=@celular where idPersona=@idPersona;
	SELECT idDireccion from persona where idPersona=@idPersona;
END
GO
