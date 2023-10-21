USE Supermercado;
-- Procedimiento almacenado que realiza una inserción o actualización en una tabla (por ejemplo, la tabla Ventas)
-- Modifica el procedimiento almacenado para insertar en la tabla Ventas
create PROCEDURE InsertarOActualizarVenta
    @FechaVenta DATETIME,
    @MontoVenta DECIMAL(10,2)
AS
BEGIN
    -- Intenta actualizar la venta si ya existe una venta en la misma fecha
    IF EXISTS (
        SELECT 1
        FROM Ventas
        WHERE FechaVenta = @FechaVenta
    )
    BEGIN
        -- Actualiza la venta
        UPDATE Ventas
        SET MontoVenta = @MontoVenta
        WHERE FechaVenta = @FechaVenta;
    END
    ELSE
    BEGIN
        -- Inserta una nueva venta en la tabla Ventas
        INSERT INTO Ventas (FechaVenta, MontoVenta)
        VALUES (@FechaVenta, @MontoVenta);
    END

    -- Después de realizar la inserción o actualización en Ventas, el trigger se ejecutará
END;