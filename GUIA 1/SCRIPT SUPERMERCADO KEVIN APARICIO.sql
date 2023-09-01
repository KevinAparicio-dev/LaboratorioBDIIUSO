Create database Supermercado;

Use Supermercado;

create table Direcciones(
	ID_Direcciones int primary key identity(1, 1),
    Linea1 varchar(50),
    Linea2 varchar(50),
    CodidoPostal varchar(10),
    Pais varchar(50),
	ID_Distritos int
);

create table Distritos(
	ID_Distritos int primary key identity(1, 1),
	Distrito varchar (50),
	ID_Municipios int
);

create table Municipios(
	ID_Municipios int primary key identity(1, 1),
	Municipio varchar (50),
	ID_Departamento int
);

create table Departamentos(
	ID_Departamento int primary key identity(1, 1),
	Departamento varchar (50)
);

create table Empleados(
	ID_Empleado int primary key identity(1, 1),
	NombreEmpleados varchar (30),
	ApellidoEmpleados varchar (30),
	DUI varchar (10),
	ISSS varchar (30),
	FechaNac Date,
	Telefono varchar (10),
	email varchar (30),
	ID_Cargo int,
	ID_Direcciones int
);

create table Cargos(
	ID_Cargos int primary key identity (1,1),
	Cargo varchar (50)
);

create table Clientes(
	ID_Clientes int primary key identity (1,1),
	Nombres varchar (50),
	Apellidos varchar (50),
	DUI varchar (10),
	FechaNac date,
	Telefono varchar(10),
	Email varchar (30),
	ID_Direccion int
);

create table Productos(
	ID_Productos int primary key identity (1,1),
	NombreProducto varchar (50),
	Descripcion varchar(100),
	PrecioUnitario decimal(10,2),
	Existencia int
);

create table Proveedores (
	ID_Proveedor int primary key identity(1,1),
	Nombre_Proveedor varchar(50),
	Telefono_Proveedor varchar(50),
	ID_Direcion int
);

Create table Pedidos(
	ID_Pedidos int primary key identity (1,1),
	FechaPedido date,
	Monto decimal(10,2),
	ID_Proveedor int	   
);

Create table Detalle_Pedidos(
	ID_Detalle_Pedidos int primary key identity (1,1),
	Cantidad int,
	ID_Pedidos int,
	ID_Productos int
);

Create table Ventas(
	ID_Venta int primary key identity(1,1),
	FechaVenta date,
	MontoVenta decimal(10,2),
);

Create table Detalle_Ventas(
	ID_Detalle_Venta int primary key identity(1,1),
	Cantidad_Producto int,
	ID_Pedido int,
	ID_Venta int
);

Create table Facturas(
	ID_Factura int primary key identity(1,1),
	IVA decimal(10,2),
	Descuento decimal(10,2),
	SubTotal decimal(10,2),
	Total decimal(10,2),
	NIT varchar(20),
	ID_Cliente int,
	ID_Venta int
);


alter table Direcciones add foreign key (ID_Distritos) references Distritos(ID_Distritos);
alter table Distritos add foreign key (ID_Municipios) references Municipios(ID_Municipios);
alter table Municipios add foreign key (ID_Departamento) references Departamentos(ID_Departamento);
alter table Empleados add foreign key (ID_Cargo) references Cargos(ID_Cargos);
alter table Empleados add foreign key (ID_Direcciones) references Direcciones(ID_Direcciones);
alter table Clientes add foreign key (ID_Direccion) references Direcciones(ID_Direcciones);
alter table Proveedores add foreign key (ID_Direcion) references Direcciones(ID_Direcciones);
alter table Pedidos add foreign key (ID_Proveedor) references Proveedores(ID_Proveedor);
alter table Detalle_Pedidos add foreign key (ID_Pedidos) references Pedidos(ID_Pedidos);
alter table Detalle_Pedidos add foreign key (ID_Productos) references Productos(ID_Productos);
alter table Detalle_Ventas add foreign key (ID_Pedido) references Pedidos(ID_Pedidos);
alter table Detalle_Ventas add foreign key (ID_Venta) references Ventas(ID_Venta);
alter table Facturas add foreign key (ID_Cliente) references Clientes(ID_Clientes);
alter table Facturas add foreign key (ID_Venta) references Ventas(ID_Venta);

