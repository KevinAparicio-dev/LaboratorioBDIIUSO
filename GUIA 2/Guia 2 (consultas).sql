--		consultas supermercado

use Supermercado;
--Obtener la información de un pedido específico y sus productos

SELECT Pedidos.FechaPedido, Pedidos.Monto, Productos.NombreProducto, Detalle_Pedidos.Cantidad, Productos.PrecioUnitario
FROM Pedidos
JOIN Detalle_Pedidos ON Pedidos.ID_Pedidos = Detalle_Pedidos.ID_Pedidos
JOIN Productos ON Detalle_Pedidos.ID_Productos = Productos.ID_Productos
WHERE Pedidos.ID_Pedidos = 4;

select * from Productos;

--Calcular el monto total de pedidos por proveedo

SELECT Proveedores.Nombre_Proveedor AS NombreProveedor, 
       SUM(Productos.PrecioUnitario * Detalle_Pedidos.Cantidad) AS MontoTotalPedidos
FROM Proveedores
JOIN Productos ON Proveedores.ID_Proveedor = Productos.ID_Productos
JOIN Detalle_Pedidos ON Productos.ID_Productos = Detalle_Pedidos.ID_Productos
GROUP BY Proveedores.Nombre_Proveedor;

-- ver los proveedores y sus productos más caros
SELECT Proveedores.Nombre_Proveedor AS NombreProveedor, 
       Productos.NombreProducto AS NombreProducto, 
       Productos.PrecioUnitario AS Precio
FROM Proveedores
JOIN Productos ON Proveedores.ID_Proveedor = Productos.ID_Productos
WHERE Productos.PrecioUnitario = (
    SELECT MAX(PrecioUnitario) FROM Productos WHERE ID_Proveedor = Proveedores.ID_Proveedor
);

-- conocer a los empleados y sus cargos
SELECT Empleados.NombreEmpleados AS NombreEmpleado, Empleados.ApellidoEmpleados, Cargos.Cargo AS Cargo
FROM Empleados
JOIN Cargos ON Empleados.ID_Cargo = Cargos.ID_Cargos;



--Consulta para conocer los productos con un precio unitario mayor a $3.00
SELECT *
FROM Productos
WHERE PrecioUnitario > 3;

--Consulta para obtener la cantidad total de productos en existencia en el supermercado
SELECT SUM(Existencia) AS Cantidad_Total
FROM Productos;

SELECT * FROM Productos;

--Consulta para calcular el precio total de una compra específica (ID_Venta) incluyendo el IVA (13%)
SELECT ID_Venta,MontoVenta, MontoVenta + (MontoVenta * 0.13) AS Precio_Total_Con_IVA
FROM Ventas
WHERE ID_Venta = 5; -- Reemplaza con el ID de la venta deseada

SELECT * FROM Ventas;

--Consulta para calcular la edad promedio de los empleados 
SELECT AVG(DATEDIFF(YEAR, FechaNac, GETDATE())) AS Edad_Promedio
FROM Empleados;

SELECT * FROM Empleados;

--Consulta para obtener los clientes cuyo número de teléfono contiene el dígito '1' 
--Y que nacieron antes o en el año 1990
SELECT Nombres, Apellidos, FechaNac, Telefono
FROM Clientes
WHERE Telefono LIKE '%1%' AND YEAR(FechaNac) <= 1990;

SELECT * FROM Clientes;