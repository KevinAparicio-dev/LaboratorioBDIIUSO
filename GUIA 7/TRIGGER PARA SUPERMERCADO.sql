-- Trigger que se dispara después de ejecutar el procedimiento almacenado
ALTER TRIGGER Trigger_InsertarFactura
ON Ventas
AFTER INSERT
AS
BEGIN
    DECLARE @IVA DECIMAL(10, 2);
    DECLARE @Descuento DECIMAL(10, 2);
    DECLARE @SubTotal DECIMAL(10, 2);
    DECLARE @Total DECIMAL(10, 2);
    DECLARE @NIT VARCHAR(20);
    DECLARE @ID_Cliente INT;
    DECLARE @ID_Venta INT;
	DECLARE @Cliente VARCHAR(60);

    -- Obtén el valor de ID_Venta de la fila recién insertada en la tabla Ventas
    SELECT @ID_Venta = ID_Venta FROM Inserted;

    -- Obtén los demás valores de la venta
    SELECT
        @IVA = 0.13 * v.MontoVenta,		-- Ejemplo: 13% de IVA
        @Descuento = 0.00,              -- Descuento
        @SubTotal = v.MontoVenta,       -- SubTotal igual al MontoVenta
        @Total = v.MontoVenta * 1.13,	-- Total con IVA
        @NIT = '12345778978956',		-- Ejemplo de NIT
        @ID_Cliente = (SELECT TOP 1 ID_Cliente FROM Clientes) -- Obtener el ID_Cliente (consulta obtiene el primer cliente de la tabla)
    FROM Inserted i
    JOIN Ventas v ON i.ID_Venta = v.ID_Venta;

	SELECT @Cliente = (SELECT Nombres FROM Clientes WHERE ID_Cliente = @ID_Cliente)
    -- Inserta una nueva factura en la tabla Facturas
    INSERT INTO Facturas (IVA, Descuento, SubTotal, Total, NIT, ID_Cliente, ID_Venta)
    VALUES (@IVA, @Descuento, @SubTotal, @Total, @NIT, @ID_Cliente, @ID_Venta);

    -- Muestra un mensaje al finalizar la operación
    PRINT 'Nueva factura registrada para el cliente: '+ @Cliente;
END;

USE Supermercado;

-- Ejecuta el procedimiento con una fecha de venta y un monto específicos
EXEC InsertarOActualizarVenta
@FechaVenta = '2023-11-22',
@MontoVenta = 800.00;

select * from Facturas;