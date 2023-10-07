-- De inserción: Debe agregar un registro nuevo a cualesquiera de las tablas de su base.

create procedure AgregarClientes

-- Variables
	@Nombres varchar (50),
	@Apellidos varchar (50),
	@DUI varchar (10),
	@FechaNac date,
	@Telefono varchar(10),
	@Email varchar (30),
	@ID_Direccion int
as
begin
	insert into Clientes values
	(
	@Nombres ,
	@Apellidos,
	@DUI,
	@FechaNac,
	@Telefono,
	@Email,
	@ID_Direccion
	);

	select * from Clientes;
end


execute AgregarClientes
	@Nombres = 'Kevin Miguel' ,
	@Apellidos = 'Aparicio Hernandez',
	@DUI= '00011122-0',
	@FechaNac= '01-05-2002',
	@Telefono= '7777-0000',
	@Email= 'kevinaparicio@gmail.com',
	@ID_Direccion= '1'



CREATE PROCEDURE ObtenerMontoTotalCliente
AS 
BEGIN
	SELECT 
	CLI.Nombres,
	CLI.Apellidos,
	CLI.DUI,
	CLI.Telefono,
	FAC.Total AS Monto_Total
	FROM Clientes AS CLI, Facturas AS FAC
	WHERE CLI.ID_Cliente = FAC.ID_Cliente;
END

EXEC ObtenerMontoTotalCliente

