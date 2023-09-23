use Supermercado;

--Login Administrador
create login sysadmin_login
with password = 'root';
-- Login Gerente1
create login juanperez_login
with password = 'root';
--Login Supervisor1
create login sergiogomez_login
with password = 'root';
--Login RRHH1
create login anaguzman_login
with password = 'root';

--Crear usuario Sysadmin
create user sysadmin_user
for login sysadmin_login;
--Crear usuario Gerente1
create user juanperez_user
for login juanperez_login;
--Crear usuario Supervisor1
create user sergiogomez_user
for login sergiogomez_login;
--Crear usuario RRHH1
create user anaguzman_user
for login anaguzman_login;

--Crear roles
create role Administrador;
create role Gerente;
create role Supervisor;
create role RRHH;

alter role Administrador add member sysadmin_user;
alter role Gerente add member juanperez_user;
alter role Supervisor add member sergiogomez_user;
alter role RRHH add member anaguzman_user;

--Permisos para Administrador
grant select, insert, update, delete on dbo.Empleados to Administrador;
grant select, insert, update, delete on dbo.Cargos to Administrador;
grant select, insert, update, delete on dbo.Usuarios to Administrador;
grant select, insert, update, delete on dbo.Roles to Administrador;
grant select, insert, update, delete on dbo.AsignacionRolesOpciones to Administrador;
grant select, insert, update, delete on dbo.Direcciones to Administrador;
grant select, insert, update, delete on dbo.Distritos to Administrador;
grant select, insert, update, delete on dbo.Municipios to Administrador;
grant select, insert, update, delete on dbo.Departamentos to Administrador;

--Permisos para Gerente
grant select, insert, update, delete on dbo.Empleados to Gerente;
grant select, insert, update, delete on dbo.Cargos to Gerente;
grant select, insert, update, delete on dbo.Productos to Gerente;
grant select, insert, update, delete on dbo.Ventas to Gerente;

--Permisos para supervisor
grant select, insert, update on dbo.Productos to Supervisor;
grant select, insert, update on dbo.Ventas to Supervisor;

--Permisos para RRHH
grant select, insert, update on dbo.Empleados to RRHH;

-- Crear el rol 'Contador'
CREATE ROLE Contador;

-- Crear el login y usuario asociado

CREATE LOGIN reynalopez_login WITH PASSWORD = 'root';
CREATE USER reynaropez_user FOR LOGIN reynalopez_login;

-- Asignar el rol 'Contador' al usuario

ALTER ROLE Contador ADD MEMBER reynalopez_user;

-- Asignar permisos

GRANT SELECT ON Ventas TO Contador;
GRANT SELECT ON Productos TO Contador;
GRANT SELECT ON Pedidos TO Contador;
GRANT SELECT ON Detalle_Pedidos TO Contador;



-- Crear el rol 'Bodeguero'
CREATE ROLE Bodeguero;

-- Crear el login y usuario asociado

CREATE LOGIN ignacio_login WITH PASSWORD = 'ig1243';
CREATE USER ignacio_user FOR LOGIN ignacio_login;

-- Asignar el rol 'Bodeguero' al usuario

ALTER ROLE Bodeguero ADD MEMBER ignacio_user;

-- Asignar permisos

GRANT SELECT ON Proveedores TO Bodeguero;
GRANT SELECT, INSERT, UPDATE ON Productos TO Bodeguero;
GRANT SELECT ON Pedidos TO Bodeguero;
GRANT SELECT ON Detalle_Pedidos TO Bodeguero;


-- Crear el rol 'Cajero'
CREATE ROLE Cajero;

-- Crear el login y usuario asociado
CREATE LOGIN carmen_login WITH PASSWORD = 'cadenita';
CREATE USER carmen_user FOR LOGIN carmen_login;

-- Asignar el rol 'Cajero' al usuario
ALTER ROLE Cajero ADD MEMBER carmen_user;

-- Asignar permisos
GRANT SELECT ON Productos TO Cajero;
GRANT SELECT ON Direcciones TO Cajero;
GRANT SELECT ON Distritos TO Cajero;
GRANT SELECT ON Municipios TO Cajero;
GRANT SELECT ON Departamentos TO Cajero;
GRANT SELECT ON Ventas TO Cajero;
GRANT INSERT ON Ventas TO Cajero;
GRANT UPDATE ON Ventas TO Cajero;

-- Ver los roles y miembros que contiene --
SELECT 
    r.name AS 'Nombre del Rol',
    m.name AS 'Miembro'
FROM sys.database_role_members rm
INNER JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id;

-- Ver los permisos de un rol
USE [Supermercado];
EXEC sp_msforeachtable 'PRINT ''?''; EXEC sp_helprotect ''?'', ''Administrador'';';