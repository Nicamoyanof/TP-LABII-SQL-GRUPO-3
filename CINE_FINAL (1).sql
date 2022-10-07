create database CINE

USE CINE

create table Paises (
id_pais int identity,
nombre_pais varchar(50)
constraint pk_id_pais primary key (id_pais)
)

create table Provincias(
id_provincia int identity,
nombre_provincia varchar(50),
id_pais int
constraint pk_id_provincia primary key (id_provincia)
constraint fk_id_pais foreign key (id_pais)
references Paises (id_pais)
)

create table Ciudades(
id_ciudad int identity,
nombre_ciudad varchar(50),
id_provincia int
constraint pk_id_ciudad primary key (id_ciudad)
constraint fk_id_provincia foreign key (id_provincia)
references Provincias (id_provincia)
)

create table Clientes (
id_cliente int identity,
nombre varchar(50),
id_ciudad int,
apellido varchar(50),
email varchar(50),
fecha_nac datetime,
socio bit
constraint pk_id_cliente primary key (id_cliente)
constraint fk_id_ciudad foreign key (id_ciudad)
references Ciudades (id_ciudad)
)

create table Tipos_cargos(
id_tipo_cargo int identity,
nombre_cargo varchar(50),
descripcion_cargo varchar(250)
constraint pk_id_tipo_cargo primary key (id_tipo_cargo)
)

create table Empleados(
id_empleado int identity,
nombre_empleado varchar(50),
id_ciudad int,
id_tipo_cargo int,
apellido_empleado varchar(50),
fecha_ingreso datetime,
telefono varchar(50),
cuil varchar(50),
fecha_nac datetime
constraint pk_id_empleado primary key(id_empleado)
constraint fk_id_ciudad_empleado foreign key (id_ciudad)
references ciudades (id_ciudad),
constraint fk_id_tipo_cargo foreign key (id_tipo_cargo)
references Tipos_cargos (id_tipo_cargo)
)

create table Generos_peliculas(
id_genero_pelicula int identity,
nombre_genero varchar(50),
descripcion_genero varchar(500)
constraint pk_id_genero_pelicula primary key (id_genero_pelicula)
)
create table Edades_permitidas(
id_edad_permitida int,
nombre_edad varchar(50),
minimo_edad int
constraint pk_id_edad_permitida primary key (id_edad_permitida)
)



create table Asientos(
id_asiento int identity,
numero_asiento int ,
disponible bit
constraint pk_id_asiento primary key (id_asiento)
)

create table Tipos_Salas(
id_tipo_sala int identity,
nombre_tipo_sala varchar(50),
descripcion_tipo_sala varchar(50),
precio_sala float
constraint pk_id_tipo_sala primary key(id_tipo_sala)
)

create table Salas(
id_sala int identity,
numero_sala int,
id_tipo_sala int
constraint pk_id_sala primary key (id_sala)
constraint fk_id_tipo_sala foreign key(id_tipo_sala)
references Tipos_Salas(id_tipo_sala)
)

create table Asientos_Por_Salas(
id_asiento_sala int identity,
id_sala int,
id_asiento int
constraint pk_id_asiento_sala primary key (id_asiento_sala)
constraint fk_id_sala_asiento foreign key (id_sala)
references Salas(id_sala),
constraint fk_id_asiento_sala foreign key(id_asiento)
references Asientos(id_asiento)
)


create table Tipos_Pagos(
id_tipo_pago int identity,
nombre_tipo_pago varchar(50),
constraint fk_id_tipo_pago primary key (id_tipo_pago)
)

create table Peliculas(
id_pelicula int identity,
nombre_pelicula varchar(50),
id_edad_permitida int,
id_genero_pelicula int,
descripcion_pelicula varchar(500)
constraint pk_id_pelicula primary key (id_pelicula)
constraint fk_id_gender_pelicula foreign key (id_genero_pelicula)
references Generos_peliculas (id_genero_pelicula),
constraint fk_id_edad_permitida foreign key (id_edad_permitida)
references Edades_permitidas (id_edad_permitida)
)

create table Funciones(
id_funcion int identity,
id_pelicula int,
id_sala int,
horario datetime
constraint pk_id_funcion primary key(id_funcion)
constraint fk_id_pelicula foreign key(id_pelicula)
references Peliculas(id_pelicula),
constraint fk_id_salas_funcion foreign key(id_sala)
references Salas(id_sala)
)

create table Descuentos(
id_descuento int identity, 
descripcion_descuento varchar(250),
valor_descuento float
constraint pk_id_descuento primary key(id_descuento)
)


create table Reservas(
id_reserva int identity,
id_funcion int,
id_cliente int,
fecha_reserva datetime,
hora_confirmacion datetime
constraint pk_id_reserva primary key(id_reserva)
constraint fk_id_funcion_reserva foreign key(id_funcion)
references Funciones (id_funcion),
constraint fk_id_cliente_reserva foreign key(id_cliente)
references Clientes (id_cliente)
)


create table Detalles_Reservas(
id_detalle_reserva int identity,
id_reserva int,
precio_venta float,
id_descuento int,
id_asiento_sala int 
constraint pk_id_detalle_reserva primary key(id_detalle_reserva)
constraint fk_id_reserva foreign key(id_reserva)
references Reservas(id_reserva),
constraint fk_asiento_sala_reserva foreign key(id_asiento_sala)
references Asientos_Por_Salas(id_asiento_sala),
constraint fk_id_descuento_reserva foreign key(id_descuento)
references Descuentos(id_descuento)
)


create table Tickets(
id_ticket int identity,
id_reserva int,
id_funcion int,
id_empleado int,
id_cliente int,
fecha_ticket datetime
constraint pk_id_ticket primary key(id_ticket)
constraint fk_id_reservaT foreign key(id_reserva)
references Reservas(id_reserva),
constraint fk_id_funcion foreign key(id_funcion)
references Funciones (id_funcion),
constraint fk_id_empleado_funcion foreign key(id_empleado)
references Empleados (id_empleado),
constraint fk_id_cliente foreign key(id_cliente)
references Clientes (id_cliente)
)


create table Detalles_Tickets(
id_detalle_ticket int IDENTITY,
id_ticket int,
id_tipo_pago int,
precio_venta float,
id_descuento int,
id_asiento_sala int 
constraint pk_id_detalle_ticket primary key (id_detalle_ticket)
constraint fk_id_ticket foreign key(id_ticket)
references Tickets(id_ticket),
constraint fk_id_tipo_pago_ticket foreign key(id_tipo_pago)
references Tipos_Pagos(id_tipo_pago),
constraint fk_asiento_sala_ticket foreign key(id_asiento_sala)
references Asientos_Por_Salas(id_asiento_sala),
constraint fk_id_descuento_ticket foreign key(id_descuento)
references Descuentos(id_descuento)
)



INSERT INTO Asientos (numero_asiento)
			VALUES 
			(1),
			(2),	
			(3),
			(4),
			(5),
			(6),
			(7),
			(8),
			(9),
			(10),
			(11),
			(12),
			(13),
			(14),
			(15),
			(16),
			(17),
			(18),
			(19),
			(20)


INSERT INTO Tipos_Salas (nombre_tipo_sala, descripcion_tipo_sala, precio_sala)
		VALUES ('2D', 'Dos dimensiones', 940),
		('3D', 'Tres dimensiones', 1060)
		


INSERT INTO Salas (numero_sala, id_tipo_sala)
		VALUES (1,1),
		(2,1),
		(3,1),
		(4,2),
		(5,2)
		
INSERT INTO Asientos_Por_Salas (id_sala, id_asiento)
		VALUES (1,1),
		(1,2),
		(1,3),
		(1,4),
		(1,5),
		(1,6),
		(1,7),
		(1,8),
		(1,9),
		(1,10),
		(1,11),
		(1,12),
		(1,13),
		(1,14),
		(1,15),
		(1,16),
		(1,17),
		(1,18),
		(1,19),
		(1,20),
		(2,1),
		(2,2),
		(2,3),
		(2,4),
		(2,5),
		(2,6),
		(2,7),
		(2,8),
		(2,9),
		(2,10),
		(2,11),
		(2,12),
		(2,13),
		(2,14),
		(2,15),
		(2,16),
		(2,17),
		(2,18),
		(2,19),
		(2,20),
		(3,1),
		(3,2),
		(3,3),
		(3,4),
		(3,5),
		(3,6),
		(3,7),
		(3,8),
		(3,9),
		(3,10),
		(3,11),
		(3,12),
		(3,13),
		(3,14),
		(3,15),
		(3,16),
		(3,17),
		(3,18),
		(3,19),
		(3,20),
		(4,1),
		(4,2),
		(4,3),
		(4,4),
		(4,5),
		(4,6),
		(4,7),
		(4,8),
		(4,9),
		(4,10),
		(4,11),
		(4,12),
		(4,13),
		(4,14),
		(4,15),
		(4,16),
		(4,17),
		(4,18),
		(4,19),
		(4,20),
		(5,1),
		(5,2),
		(5,3),
		(5,4),
		(5,5),
		(5,6),
		(5,7),
		(5,8),
		(5,9),
		(5,10),
		(5,11),
		(5,12),
		(5,13),
		(5,14),
		(5,15),
		(5,16),
		(5,17),
		(5,18),
		(5,19),
		(5,20)




--Insertar países, provincias, ciudades, tipos de cargos, empleados, clientes
set dateformat dmy

--1) Insert países
insert into paises(nombre_pais) values ('Argentina')
insert into paises(nombre_pais) values ('Brasil')
insert into paises(nombre_pais) values ('Chile')
insert into paises(nombre_pais) values ('Paraguay')
insert into paises(nombre_pais) values ('Bolivia')
insert into paises(nombre_pais) values ('Peru')
insert into paises(nombre_pais) values ('Venezuela')
insert into paises(nombre_pais) values ('Ecuador')
insert into paises(nombre_pais) values ('Colombia')
insert into paises(nombre_pais) values ('Uruguay')
insert into paises(nombre_pais) values ('El salvador')
insert into paises(nombre_pais) values ('Mexico')
insert into paises(nombre_pais) values ('Estados Unidos')
insert into paises(nombre_pais) values ('Costa Rica')

--2) Insert provincias
--Argentina
insert into Provincias(id_pais, nombre_provincia) values(1, 'Buenos Aires')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Ciudad Autónoma de Buenos Aires')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Catamarca')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Chaco')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Chubut')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Córdoba')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Corrientes')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Entre Ríos')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Formosa')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Jujuy')
insert into Provincias(id_pais, nombre_provincia) values(1, 'La Pampa')
insert into Provincias(id_pais, nombre_provincia) values(1, 'La Rioja')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Mendoza')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Misiones')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Neuquén')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Río Negro')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Salta')
insert into Provincias(id_pais, nombre_provincia) values(1, 'San Juan')
insert into Provincias(id_pais, nombre_provincia) values(1, 'San Luis')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Santa Cruz')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Santa Fe')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Santiago del Estero')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Tierra del Fuego')
insert into Provincias(id_pais, nombre_provincia) values(1, 'Tucumán')
--Brasil
insert into Provincias(id_pais, nombre_provincia) values(2, 'Río de Janeiro')
insert into Provincias(id_pais, nombre_provincia) values(2, 'Río Grande del Norte')
insert into Provincias(id_pais, nombre_provincia) values(2, 'Río Grande del Sur')
insert into Provincias(id_pais, nombre_provincia) values(2, 'São Paulo')
insert into Provincias(id_pais, nombre_provincia) values(2, 'Ceará')
--Chile
insert into Provincias(id_pais, nombre_provincia) values(3, 'Santiago')
insert into Provincias(id_pais, nombre_provincia) values(3, 'La Serena')
insert into Provincias(id_pais, nombre_provincia) values(3, 'Valdivia')
--Paraguay
insert into Provincias(id_pais, nombre_provincia) values(4, 'Alto Paraguay')
insert into Provincias(id_pais, nombre_provincia) values(4, ' Alto Paraná')
insert into Provincias(id_pais, nombre_provincia) values(4, 'Concepción')
--Bolivia
insert into Provincias(id_pais, nombre_provincia) values(5, 'La Paz')
insert into Provincias(id_pais, nombre_provincia) values(5, 'Oruro')
insert into Provincias(id_pais, nombre_provincia) values(5, 'Potosí')
--Peru
insert into Provincias(id_pais, nombre_provincia) values(6, 'Lima')
insert into Provincias(id_pais, nombre_provincia) values(6, 'Amazonas')
insert into Provincias(id_pais, nombre_provincia) values(6, 'Tacna')
--Venezuela
insert into Provincias(id_pais, nombre_provincia) values(7, 'Caracas')
insert into Provincias(id_pais, nombre_provincia) values(7, 'Aragua')
insert into Provincias(id_pais, nombre_provincia) values(7, 'Barquisimeto')
--Ecuador
insert into Provincias(id_pais, nombre_provincia) values(8, 'Bolivar')
insert into Provincias(id_pais, nombre_provincia) values(8, 'Cañar')
insert into Provincias(id_pais, nombre_provincia) values(8, 'Chimborazo')
--Colombia
insert into Provincias(id_pais, nombre_provincia) values(9, 'Antioquia')
insert into Provincias(id_pais, nombre_provincia) values(9, 'Atlántico')
insert into Provincias(id_pais, nombre_provincia) values(9, 'Bolívar')
--Uruguay
insert into Provincias(id_pais, nombre_provincia) values(10, 'Cerro Largo')
insert into Provincias(id_pais, nombre_provincia) values(10, 'Colonia')
insert into Provincias(id_pais, nombre_provincia) values(10, 'Durazno')
--El salvador
insert into Provincias(id_pais, nombre_provincia) values(11, 'La Libertad')
insert into Provincias(id_pais, nombre_provincia) values(11, 'Cuscatlán')
insert into Provincias(id_pais, nombre_provincia) values(11, 'La Unión')
--Mexico
insert into Provincias(id_pais, nombre_provincia) values(12, 'Las Californias')
insert into Provincias(id_pais, nombre_provincia) values(12, 'México')
insert into Provincias(id_pais, nombre_provincia) values(12, 'Nuevo México')
--Estados Unidos
insert into Provincias(id_pais, nombre_provincia) values(13, 'California')
insert into Provincias(id_pais, nombre_provincia) values(13, 'Florida')
insert into Provincias(id_pais, nombre_provincia) values(13, 'Washington')
--Costa Rica
insert into Provincias(id_pais, nombre_provincia) values(14, 'San José')
insert into Provincias(id_pais, nombre_provincia) values(14, 'Alajuela')
insert into Provincias(id_pais, nombre_provincia) values(14, 'Heredia')

--3) Insert ciudades
--Argentina
--Buenos Aires
insert into ciudades(nombre_ciudad, id_provincia) values ('Capital', 1)
insert into ciudades(nombre_ciudad, id_provincia) values ('Carlos Casares', 1)
insert into ciudades(nombre_ciudad, id_provincia) values ('Caseros', 1)
--Ciudad Autonoma De Buenos Aires
insert into ciudades(nombre_ciudad, id_provincia) values ('Almagro', 2)
insert into ciudades(nombre_ciudad, id_provincia) values ('Balvanera', 2)
insert into ciudades(nombre_ciudad, id_provincia) values ('Belgrano', 2)
--Catamarca
insert into ciudades(nombre_ciudad, id_provincia) values ('San Fernando del Valle de Catamarca', 3)
insert into ciudades(nombre_ciudad, id_provincia) values ('Santa María', 3)
insert into ciudades(nombre_ciudad, id_provincia) values ('Antofagasta de la Sierra', 3)
--Chaco
insert into ciudades(nombre_ciudad, id_provincia) values ('Resistencia', 4)
insert into ciudades(nombre_ciudad, id_provincia) values ('General José de San Martín', 4)
insert into ciudades(nombre_ciudad, id_provincia) values ('Juan José Castelli', 4)
--Chubut
insert into ciudades(nombre_ciudad, id_provincia) values ('Rawson', 5)
insert into ciudades(nombre_ciudad, id_provincia) values ('Puerto Madryn', 5)
insert into ciudades(nombre_ciudad, id_provincia) values ('Trelew', 5)
--Cordoba 
insert into ciudades(nombre_ciudad, id_provincia) values ('Capital', 6)
insert into ciudades(nombre_ciudad, id_provincia) values ('Carlos Paz', 6)
insert into ciudades(nombre_ciudad, id_provincia) values ('Alta Gracia', 6)
--Corrientes 
insert into ciudades(nombre_ciudad, id_provincia) values ('Bella Vista', 7)
insert into ciudades(nombre_ciudad, id_provincia) values ('Berón de Astrada', 7)
insert into ciudades(nombre_ciudad, id_provincia) values ('Bonpland', 7)
--Entre Rios
insert into ciudades(nombre_ciudad, id_provincia) values ('Parana', 8)
insert into ciudades(nombre_ciudad, id_provincia) values ('Colón', 8)
insert into ciudades(nombre_ciudad, id_provincia) values ('Gualeguaychu', 8)
--Formosa
insert into ciudades(nombre_ciudad, id_provincia) values ('El colorado', 9)
insert into ciudades(nombre_ciudad, id_provincia) values ('El espinillo', 9)
insert into ciudades(nombre_ciudad, id_provincia) values ('Formosa', 9)
--Jujuy
insert into ciudades(nombre_ciudad, id_provincia) values ('San Salvador de Jujuy', 10)
insert into ciudades(nombre_ciudad, id_provincia) values ('Humahuaca', 10)
insert into ciudades(nombre_ciudad, id_provincia) values ('Tilcara', 10)
--La pampa
insert into ciudades(nombre_ciudad, id_provincia) values ('Ciudad de Santa Rosa', 11)
insert into ciudades(nombre_ciudad, id_provincia) values ('Toay', 11)
insert into ciudades(nombre_ciudad, id_provincia) values ('General Pico', 11)
--La rioja
insert into ciudades(nombre_ciudad, id_provincia) values ('La Rioja', 12)
insert into ciudades(nombre_ciudad, id_provincia) values ('Chilecito', 12)
insert into ciudades(nombre_ciudad, id_provincia) values ('Famatina', 12)
--Mendoza
insert into ciudades(nombre_ciudad, id_provincia) values ('General Alvear', 13)
insert into ciudades(nombre_ciudad, id_provincia) values ('Godoy Cruz', 13)
insert into ciudades(nombre_ciudad, id_provincia) values ('Junín', 13)
--Misiones
insert into ciudades(nombre_ciudad, id_provincia) values ('Posadas', 14)
insert into ciudades(nombre_ciudad, id_provincia) values ('Puerto Iguazú', 14)
insert into ciudades(nombre_ciudad, id_provincia) values ('Oberá', 14)
--Neuquen
insert into ciudades(nombre_ciudad, id_provincia) values ('Centenario', 15)
insert into ciudades(nombre_ciudad, id_provincia) values ('Plottier', 15)
insert into ciudades(nombre_ciudad, id_provincia) values ('Neuquén', 15)
--Rio negro
insert into ciudades(nombre_ciudad, id_provincia) values ('San Carlos de Bariloche', 16)
insert into ciudades(nombre_ciudad, id_provincia) values ('Viedma', 16)
insert into ciudades(nombre_ciudad, id_provincia) values ('Cipolletti', 16)
--Salta
insert into ciudades(nombre_ciudad, id_provincia) values ('La Viña', 17)
insert into ciudades(nombre_ciudad, id_provincia) values ('Salta', 17)
insert into ciudades(nombre_ciudad, id_provincia) values ('Chaco', 17)
--San Juan
insert into ciudades(nombre_ciudad, id_provincia) values ('Chimbas', 18)
insert into ciudades(nombre_ciudad, id_provincia) values ('Rawson', 18)
insert into ciudades(nombre_ciudad, id_provincia) values ('Rivadavia', 18)
--San Luis
insert into ciudades(nombre_ciudad, id_provincia) values ('San Luis', 19)
insert into ciudades(nombre_ciudad, id_provincia) values ('Villa Mercedes', 19)
insert into ciudades(nombre_ciudad, id_provincia) values ('Merlo', 19)
--Santa cruz
insert into ciudades(nombre_ciudad, id_provincia) values ('Rio Gallegos', 20)
insert into ciudades(nombre_ciudad, id_provincia) values ('El calafate', 20)
insert into ciudades(nombre_ciudad, id_provincia) values ('Perito Moreno', 20)
--Santa fe
insert into ciudades(nombre_ciudad, id_provincia) values ('Frontera', 21)
insert into ciudades(nombre_ciudad, id_provincia) values ('Funez', 21)
insert into ciudades(nombre_ciudad, id_provincia) values ('Galvez', 21)
--Santiago del estero
insert into ciudades(nombre_ciudad, id_provincia) values ('La Banda', 22)
insert into ciudades(nombre_ciudad, id_provincia) values ('Frías', 22)
insert into ciudades(nombre_ciudad, id_provincia) values ('Añatuya', 22)
--Tucuman
insert into ciudades(nombre_ciudad, id_provincia) values ('San Miguel de Tucumán', 24)
insert into ciudades(nombre_ciudad, id_provincia) values ('Yerba Buena', 24)
insert into ciudades(nombre_ciudad, id_provincia) values ('Famaillá', 24)
--Tierra del fuego
insert into ciudades(nombre_ciudad, id_provincia) values ('Ushuaia', 26)
insert into ciudades(nombre_ciudad, id_provincia) values ('Rio Grande', 26)
insert into ciudades(nombre_ciudad, id_provincia) values ('Porvenir', 26)
--Otras provincias
insert into ciudades(nombre_ciudad, id_provincia) values ('Rio de janeiro', 27)
insert into ciudades(nombre_ciudad, id_provincia) values ('Río Grande del Norte', 28)
insert into ciudades(nombre_ciudad, id_provincia) values ('Río Grande del Sur', 29)
insert into ciudades(nombre_ciudad, id_provincia) values ('São Paulo', 30)
insert into ciudades(nombre_ciudad, id_provincia) values ('Ceará', 31)
insert into ciudades(nombre_ciudad, id_provincia) values ('Santiago', 32)
insert into ciudades(nombre_ciudad, id_provincia) values ('La Serena', 33)
insert into ciudades(nombre_ciudad, id_provincia) values ('Valdivia', 34)
insert into ciudades(nombre_ciudad, id_provincia) values ('Alto Paraguay', 35)
insert into ciudades(nombre_ciudad, id_provincia) values (' Alto Paraná', 36)
insert into ciudades(nombre_ciudad, id_provincia) values ('Concepción', 37)
insert into ciudades(nombre_ciudad, id_provincia) values ('La Paz', 38)
insert into ciudades(nombre_ciudad, id_provincia) values ('Oruro', 39)
insert into ciudades(nombre_ciudad, id_provincia) values ('Potosí', 40)
insert into ciudades(nombre_ciudad, id_provincia) values ('Lima', 41)
insert into ciudades(nombre_ciudad, id_provincia) values ('Amazonas', 42)
insert into ciudades(nombre_ciudad, id_provincia) values ('Tacna', 43)
insert into ciudades(nombre_ciudad, id_provincia) values ('Caracas', 44)
insert into ciudades(nombre_ciudad, id_provincia) values ('Aragua', 45)
insert into ciudades(nombre_ciudad, id_provincia) values ('Barquisimeto', 46)
insert into ciudades(nombre_ciudad, id_provincia) values ('Bolivar', 47)
insert into ciudades(nombre_ciudad, id_provincia) values ('Cañar', 48)
insert into ciudades(nombre_ciudad, id_provincia) values ('Chimborazo', 49)
insert into ciudades(nombre_ciudad, id_provincia) values ('Antioquia', 50)
insert into ciudades(nombre_ciudad, id_provincia) values ('Atlántico', 51)
insert into ciudades(nombre_ciudad, id_provincia) values ('Bolívar', 52)
insert into ciudades(nombre_ciudad, id_provincia) values ('Cerro Largo', 53)
insert into ciudades(nombre_ciudad, id_provincia) values ('Colonia', 54)
insert into ciudades(nombre_ciudad, id_provincia) values ('Durazno', 55)
insert into ciudades(nombre_ciudad, id_provincia) values ('La Libertad', 56)
insert into ciudades(nombre_ciudad, id_provincia) values ('Cuscatlán', 57)
insert into ciudades(nombre_ciudad, id_provincia) values ('La Unión', 58)
insert into ciudades(nombre_ciudad, id_provincia) values ('Las Californias', 59)
insert into ciudades(nombre_ciudad, id_provincia) values ('México', 60)
insert into ciudades(nombre_ciudad, id_provincia) values ('Nuevo México', 61)
insert into ciudades(nombre_ciudad, id_provincia) values ('California', 62)
insert into ciudades(nombre_ciudad, id_provincia) values ('Florida', 63)
insert into ciudades(nombre_ciudad, id_provincia) values ('Washington', 64)
insert into ciudades(nombre_ciudad, id_provincia) values ('San José', 65)


--4) Insert tipos de cargos
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Cajero','Recepcionar, entregar y custodiar dinero')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Limpieza','Barrer, aspirar, lavar y pulir pisos')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Community Manager','construir, ampliar y administrar comunidades online')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Encargado de sala',' planifica y organiza el servicio')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Proyectista','revelado de películas')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Administrador','tareas administrativas y de oficina')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Seguridad','Vigilar y proteger bienes muebles e inmuebles, personas')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Sonidista','responsable de la calidad técnica y artística del sonido')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Iluminador','orquestar todos los recursos luminosos')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Técnico en Visuales','Conocer, interpretar, crear y producir tecnicas')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Atención al cliente','soporte al consumidor')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Buffet','Venta de snacks y bebidas')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Encargado','se responsabiliza de que los trabajadores estén coordinados')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Call Center', 'gestionar las llamadas telefónicas')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Publicista', 'Gestionar y crear pautas publicitarias')
insert into Tipos_cargos(nombre_cargo, descripcion_cargo) values('Gerente', 'Autoridad maxima')

--5)Insert Empleados
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Sebastian',4,3,'Sanchez','03/05/2005', 3514448994, 27118444568,'17/08/1964')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Miguel',6,7,'Perez','07/06/2017', 3514556954, 2144566879,'22/12/1988')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Matias',18,3,'Rodriguez','25/06/2009', 488645298, 27114487759,'14/02/1972')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Miguel',25,3,'Sanchez','28/03/2014', 156447889, 28441555698,'15/01/1987')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Santiago',4,1,'Rolan','19/03/2015', 157448998, 9911544478,'17/08/1982')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Rocio',6,1,'Menendez','20/04/2011', 3514789556, 2711455638,'24/08/1996')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Silvana',6,1,'Rojas','25/07/2005', 348556889, 2277895686,'27/11/1986')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Belen',35,2,'Migueles','28/11/2004', 5668789, 27268874561,'14/12/1999')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Claudia',7,2,'Lopez','05/05/2005', 3516284759, 27114852,'13/05/2007')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Javier',14,2,'Barbero','06/07/1986', 351244788, 2045561188,'25/05/1972')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Adrian',2,4,'Lopez','06/06/1992', 351622488, 272555441,'17/03/1976')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Irene',5,4,'Sanchez','15/08/1978', 3514789333, 274448982,'25/06/1988')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Franco',56,4,'Suarez','20/07/1986', 4885462, 2145556689,'01/03/1996')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Facundo',1,5,'Cavalli','06/12/2004', 3512441897, 274587569,'17/12/1985')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Kevin',7,5,'Romero','15/05/2020', 351628345, 27224448982,'25/07/2000')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Nicolas',12,5,'Lopez','27/03/2012', 45688972, 22275546638,'01/04/1996')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Sandra',75,6,'Gomez','25/04/2018', 3564448995, 2711166938,'15/06/1975')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Miguel',32,6,'Lascano','27/04/2007', 358779825, 22456897418,'17/08/1972')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Micaela',9,6,'Dominguez','13/06/1998', 45568972, 255554187459,'22/08/1978')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Jorge',17,7,'Zorzal','27/03/2005', 3516668953, 274555688898,'22/05/1965')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Lucia',24,7,'Menendez','05/06/2011', 3514789633, 24411145598,'14/08/1990')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Lucas',55,8,'Juarez','26/04/2017', 35147896332, 2744456892,'27/04/1991')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Marta',101,8,'Dominguez','25/07/2020', 3514448953, 274788968898,'13/05/1980')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Matias',1,8,'Suarez','25/06/2019', 3514748877, 2455331598,'17/09/2000')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Alejandro',30,9,'Morales','15/02/2011', 35466296332, 2568956892,'13/04/1975')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,cuil,fecha_nac)
values('Carlos',25,9,'Carrera García','28/02/2020', 25444788896,'13/05/1973')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,cuil,fecha_nac)
values('Fermina',47,9,'Chajón Soto','13/06/2022', 26889744412,'25/05/1998')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Hugo Leonel',5,10,'Alarcón','17/02/2011', 35466277758, 2568956892,'27/04/1998')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,fecha_nac)
values('Marco Tulio',6,10,'Soto Juárez','24/02/2020',3541164489,'27/01/1976')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,fecha_nac)
values('María',104,10,'Vásquez','05/06/2022',35147779882,'27/11/1973')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Octaviano',25,11,'Morales','24/07/2008', 35758996332, 256354892,'13/05/1988')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Osman',98,11,'López','17/07/2011', 3525696332, 3453956892,'27/01/1975')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('David',26,11,'Sanchez','22/02/2018', 35544696332, 24538956892,'08/08/1999')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Vicente',24,12,'Alvarez','24/03/2009', 32574456332, 2566754892,'14/07/1976')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Isaias',17,12,'Pereira','17/07/2012', 15664696332, 333956892,'25/02/1978')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Alejandro',75,12,'Sanchez','15/07/2022', 8855696332, 2758956892,'27/06/1999')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,fecha_nac)
values('Ana',55,13,'García','15/09/2021','28/12/1999')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Claudia',65,13,'Soto','18/09/2015', 456696332, 274444892,'28/07/1975')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Patricia',27,13,'Rodriguez','27/06/2014',3578920122, 27642268977,'28/06/1984')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,cuil,fecha_nac)
values('Antonio',17,14,'Gómez','25/11/2008',27356879977,'27/05/1975')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Augusto',102,14,'Caballeros','14/08/2007',3578256872, 23546868977,'13/05/1974')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Vaneza',3,14,'Mendoza','25/08/2011',351478922, 24747868977,'28/05/1984')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Cristian',5,15,'Guevara','02/08/2007',3578952122, 278928933,'11/09/1976')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Danilo',97,15,'Alvarez','02/09/2021',45879222, 257896632,'27/02/1976')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Dante',22,15,'Garcia','15/07/2021',356489922, 2147896363,'13/05/1988')
insert into Empleados(nombre_empleado,id_ciudad,id_tipo_cargo,apellido_empleado,fecha_ingreso,telefono,cuil,fecha_nac)
values('Miguel',4,16,'Villalta','20/07/2000',3512367854, 20555688978,'17/01/1974')

--6) Insert clientes
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Matias',17,'Barbero','matiasbarbero@gmail.com','17/04/2001',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Emiliano',57,'Lopez','emilopez@yahoo.com','25/01/1987',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Abarca',1,'Ingrid','iabarcae@yahoo.es','13/01/1986',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Julia',7,'Illanes','maeillanes@hotmail.com','26/04/1977',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Miguel',23,'Abarca','osabarca@hotmail.com','27/01/1987',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Emiliano',45,'Mendia','cabrigo@garmendia.cl','05/06/1995',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Sebastian',5,'Lopez','Sb.nashxo.sk8@hotmail.com','04/03/1986',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Francisco',80,'Fuller','fran.afull@live.cl','07/12/1986',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Carlos',26,'Aguilera','carlosaguileram@hotmail.com','23/05/1968',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Daniela',33,'Aguilera','daniela_aguilera_m500@hotmail.com','14/02/1978',0)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Juan Fernando',23,'Uribe','juribe@idiomas.udea.edu.co',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Herlaynne',2,'Segura','hersy@epm.net.co','13/06/1979',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('José',4,'Ferdusi','jferdusi@terra.com','25/04/1999',1)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Maria',6,'Victoria','17/05/1999',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Miguel',18,'Lopez','mlopez@hotmail.com','01/01/1963',1)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Matias',75,'Zorzal','zorzalmat@garmendia.cl',1)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Sebastian',33,'Aguirre','04/03/1986',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Javier',99,'Dominguez','jdom@live.cl','25/04/1994',1)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Adrian',25,'Barbero','23/05/1968',0)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Daniela',2,'Lopez','ldaniela@hotmail.com',0)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Jose',4,'Lopez','jlopez@gmail.com',1)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Facundo',9,'Lopez','faculopez@gmail.com',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Javier',56,'Del carro','delcarro@live.cl','17/04/2000',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Juliana',17,'Paris','jpariso@live.cl','13/06/2000',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Miguel',17,'Juarez','mjuarez@live.cl','27/01/2003',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Jose',25,'Barbero','jose44@live.cl','27/07/2000',0)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Adrian',64,'Castro','27/05/1975',1)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Lucia',18,'Aguirre','13/03/1955',0)
insert into clientes(nombre,id_ciudad,apellido,socio)values('Valeria',16,'Azarre',1)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Martin',88,'Hierro','mhierro@gmail.com',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Facundo',24,'Migueles','facundomigueles@gmail.com','25/04/2001',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Claudia',101,'Martinez','c.martinez@yahoo.com','25/06/1987',0)
insert into clientes(nombre,id_ciudad,apellido,fecha_nac,socio)values('Oscar',2,'Dominguez','15/07/2000',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Andres',33,'Illanes','aillanes@hotmail.com','15/09/1986',1)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Milagros',27,'Alcaraz','malcaraz@hotmail.com',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Adriana',24,'Guevara','aguevara@idiomas.udea.edu.co','18/03/2001',1)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Juan',25,'Hutado','jhutado@ idomas.udea.edu.co','27/06/1987',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('Miguel',56,'Domini','domini26@latinmail.com','15/01/1999',0)
insert into clientes(nombre,id_ciudad,apellido,email,fecha_nac,socio)values('David',33,'Lopez','juandavidlopez@ubicar.com','17/08/1977',1)
insert into clientes(nombre,id_ciudad,apellido,email,socio)values('Viviana',45,'Alcaraz','vivian_981@yahoo.com',1)

insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Paolo', 13, 'Munby', 'pmunby0@gmail.com', '29/11/2006', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Kimmy', 6, 'Shoubridge', 'kshoubridge1@gmail.com', '28/08/1949', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Mohandas', 11, 'Dawdary', 'mdawdary2@gmail.com', '12/09/1980', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Rachelle', 12, 'Ecles', 'recles3@gmail.com', '26/08/1960', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Maurice', 6, 'Drennan', 'mdrennan4@gmail.com', '27/12/1982', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Ellery', 5, 'Pabst', 'epabst5@gmail.com', '01/11/1994', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Regan', 11, 'Cordes', 'rcordes6@gmail.com', '15/02/1956', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Adaline', 7, 'Foukx', 'afoukx7@gmail.com', '21/09/1964', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Holt', 3, 'Klampk', 'hklampk8@gmail.com', '28/01/2021', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Blanca', 7, 'Kauscher', 'bkauscher9@gmail.com', '29/12/1965', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Walliw', 7, 'Vales', 'wvalesa@gmail.com', '16/02/1947', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Neile', 9, 'Tremaine', 'ntremaineb@gmail.com', '14/06/1927', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Dianne', 10, 'Covert', 'dcovertc@gmail.com', '29/01/2013', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Sosanna', 12, 'Jardine', 'sjardined@gmail.com', '13/12/1997', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Hulda', 7, 'Glasscoe', 'hglasscoee@gmail.com', '19/09/1949', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Phebe', 3, 'Silverson', 'psilversonf@gmail.com', '23/09/1992', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Bart', 1, 'Rarity', 'brarityg@gmail.com', '15/07/1938', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ('Aloin', 4, 'Duell', 'aduellh@gmail.com', '15/04/1969', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Goldarina', 6, 'Pierri', 'gpierrii@gmail.com', '26/06/2013', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Edna', 7, 'Hegg', 'eheggj@gmail.com', '13/08/1943', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Julio', 7, 'Magnay', 'jmagnayk@gmail.com', '10/01/1948', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Hank', 7, 'Galilee', 'hgalileel@gmail.com', '24/01/1929', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Crissy', 5, 'Inkles', 'cinklesm@gmail.com', '22/02/1937', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Nicolas', 10, 'Blundell', 'nblundelln@gmail.com', '15/08/1929', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ('Christel', 7, 'Scottesmoor', 'cscottesmooro@gmail.com', '07/02/1939', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Joanie', 8, 'Rottgers', 'jrottgersp@gmail.com', '11/02/1968', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Mandel', 13, 'Espadas', 'mespadasq@gmail.com', '03/03/1927', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ('Shawn', 12, 'Sandels', 'ssandelsr@gmail.com', '24/11/2018', 0);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Algernon', 8, 'Mattys', 'amattyss@gmail.com', '05/06/1991', 1);
insert into Clientes ( nombre, id_ciudad, apellido, email, fecha_nac, socio) values ( 'Warren', 9, 'Osgar', 'wosgart@gmail.com', '27/04/1992', 0);




INSERT INTO Edades_permitidas (id_edad_permitida ,nombre_edad	,minimo_edad) VALUES (1,'Todo publico', 0);
INSERT INTO Edades_permitidas (id_edad_permitida ,nombre_edad	,minimo_edad) VALUES (2,'SAM 13', 13);
INSERT INTO Edades_permitidas (id_edad_permitida ,nombre_edad	,minimo_edad) VALUES (3,'SAM 15',15);
INSERT INTO Edades_permitidas (id_edad_permitida ,nombre_edad	,minimo_edad) VALUES (4,'SAM 18', 18);

INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES (' Acción','En este género prevalecen altas dosis de adrenalina con una buena carga de movimiento, fugas, acrobacias, peleas, guerras, persecuciones y una lucha contra el mal.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Aventuras','Similares a las de acción, predominan las nuevas experiencias y situaciones.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Ciencia Ficción', 'Basados en fenómenos imaginarios, en la ciencia ficción son usuales los extraterrestres, sociedades inventadas, otros planetas…');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Comedia', 'Diseñadas específicamente para provocar la risa o la alegría entre los espectadores.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES (' No- Ficción / documental', 'Este género analiza un hecho o situación real sin ficcionarlo.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Drama', 'Los dramas se centran en desarrollar el problema o problemas entre los diferentes protagonistas. Este es quizás uno de los géneros cinematográficos más amplios de la lista. No predominan las aventuras o la acción, aunque pueden aparecer puntualmente Generalmente se basan en desarrollar la interacción y caracteres humanos.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Fantasía', 'En ellas se incluyen personajes irreales o totalmente inventados, inexistentes en nuestra realidad. También podemos conocer este género de cine como “fantástico”. No se basa en ideas que puedan llegar a materializarse.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Musical' ,'Las películas que cortan su desarrollo natural con fragmentos musicales son protagonistas de este género.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Suspense.' ,'Conocido también como intriga, estas películas se desarrollan rápidamente, y todos sus elementos giran entorno un mismo elemento intrigante.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Terror' ,'su principal objetivo es causar miedo, horror, incomodidad o preocupación.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Western', 'Famosas por centrarse en el territorio occidental de los Estados Unidos de América.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Deportivas', 'Deportes famosos en los cuales se reecrean escenas para que queden guardado en la memoria de los espectadores');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Históricas', 'Se ambientan en épocas determinadas, con recreaciones de personas, hechos, lugares o argumentos.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Bélicas', 'También conocidas por centrarse en conflictos bélicos o guerras.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Crimen', 'Su foco se posa sobre la vida de los delincuentes o criminales.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Policíacas', 'Suelen tener lugar en una escena del crimen y se centran en resolverlo.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Futuristas', 'Tienen lugar en épocas futuras, y sus personajes pueden ser realistas o ficticios.');
INSERT INTO Generos_peliculas (nombre_genero,descripcion_genero) VALUES ('Religiosas', 'Su temática está enfocada a una religión.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('American History X ',3 , 15,'Un exmilitante de los skinheads neonazis intenta disuadir a su hermano pequeño de tomar las mismas malas decisiones que él tomó.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Infiltrados',3, 16,'Un policía de incógnito y un topo en el departamento de policía intentan identificarse el uno al otro mientras se infiltran en una banda irlandesa en el sur de Boston.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Sospechosos habituales',3, 15,'El único superviviente de un terrible tiroteo en un barco relata los eventos que condujeron a esta masacre, empezando con cinco criminales que se encuentran aparentemente al azar');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('El truco final ',2,9,'Tras un trágico accidente, dos magos en el Londres de 1890 se enfrentan para crear la ilusión definitiva, mientras sacrifican todo lo que tienen para superar al otro.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Casablanca',1,6,'Un cínico expatriado norteamericano, dueño de un café, se debate entre ayudar o no a su antigua amante y a su marido fugitivo a escapar de los nazis en el Marruecos francés.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Whiplash', 2, 6,'Un joven y prometedor batería se inscribe en un competitivo conservatorio donde sus sueños de grandeza son guiados por un instructor que no se detiene ante nada para realizar el potencial de el');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Intocable',1, 6,'Un accidente de parapente deja a un aristócrata cuadripléjico, quien contrata a un joven de un barrio pobre para que sea su cuidador.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('La tumba de las luciérnagas', 1, 13,'Un chico y su hermana pequeña intentan sobrevivir en Japón durante la Segunda Guerra Mundial.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Hasta que llegó su hora',3 ,11 ,'Un misterioso extraño con una armónica se alía con un famoso forajido para proteger a una bella viuda de un despiadado asesino que trabaja para el ferrocarril.');


INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('La ventana indiscreta',2 ,9 ,'Un fotógrafo en silla de ruedas espía a sus vecinos desde la ventana de su apartamento en Greenwich Village, y se convence de que uno de ellos ha cometido un asesinato');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Alien', 2,10 ,'La tripulación de una nave espacial comercial se encuentra con una forma de vida mortal tras investigar una transmisión desconocida.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Luces de la ciudad', 1, 4,'Con la ayuda de un hombre adinerado, borracho e imprevisible, un ingenuo vagabundo que se ha enamorado de una florista ciega intenta conseguir dinero para poder proporcionarle ayuda médica.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Cinema Paradiso',1 , 6,'Un director de cine recuerda cómo en su infancia se enamoró del cine de su pueblo y entabló una profunda amistad con el proyeccionista.');
--------
INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Apocalypse Now', 3, 6,'Un oficial del ejército estadounidense que sirve en Vietnam recibe el encargo de asesinar a un coronel renegado de las fuerzas especiales que se ve a sí mismo como un dios.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Memento',2 , 9,'Un hombre con pérdida de memoria a corto plazo intenta encontrar al asesino de su esposa.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('En busca del arca perdida', 1,13 ,'En 1936, el arqueólogo y aventurero Indiana Jones es contratado por el Gobierno de Estados Unidos para encontrar el Arca de la Alianza');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Django desencadenado',3,11,'Con la ayuda de un cazarrecompensas alemán, un esclavo liberado se propone rescatar a su esposa de un brutal propietario de una plantación en Mississippi.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('La vida de los otros', 2, 6,'En el este de Berlín en 1984 un agente de la policía secreta vigilando a un escritor y su amante se encuentra cada vez más absorto en sus vidas.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('WALL·E', 1,7 ,'En un futuro lejano, un pequeño robot recolector de residuos se embarca inadvertidamente en un viaje espacial que decidirá en última instancia el destino de la humanidad.');

INSERT INTO Peliculas (nombre_pelicula,id_edad_permitida ,id_genero_pelicula ,descripcion_pelicula)
VALUES ('Senderos de gloria', 2, 6,'Tras negarse a atacar una posición enemiga, un general acusa a los soldados de cobardía y su oficial al mando debe defenderlos.');





insert into Funciones (id_pelicula, id_sala, horario) values (1,1,'01/10/2022 09:30:00'),
							(2,1,'01/10/2022 12:00:00'),
							(3,1,'01/10/2022 15:00:00'),
							(4,1,'01/10/2022 17:30:00'),
							(5,1,'01/10/2022 20:00:00'),
							(6,1,'01/10/2022 23:30:00'),
							(7,2,'01/10/2022 09:30:00'),
							(8,2,'01/10/2022 12:00:00'),
							(9,2,'01/10/2022 15:00:00'),
							(10,2,'01/10/2022 17:30:00'),
							(11,2,'01/10/2022 20:00:00'),
							(12,2,'01/10/2022 23:30:00'),
							(13,3,'01/10/2022 09:30:00'),
							(14,3,'01/10/2022 12:00:00'),
							(15,3,'01/10/2022 15:00:00'),
							(1,3,'01/10/2022 17:30:00'),
							(2,3,'01/10/2022 20:00:00'),
							(3,3,'01/10/2022 23:30:00'),
							(4,4,'01/10/2022 09:30:00'),
							(5,4,'01/10/2022 12:00:00'),
							(6,4,'01/10/2022 15:00:00'),
							(7,4,'01/10/2022 17:30:00'),
							(8,4,'01/10/2022 20:00:00'),
							(9,4,'01/10/2022 23:30:00'),
							(10,5,'01/10/2022 09:30:00'),
							(11,5,'01/10/2022 12:00:00'),
							(12,5,'01/10/2022 15:00:00'),
							(13,5,'01/10/2022 17:30:00'),
							(14,5,'01/10/2022 20:00:00'),
							(15,5,'01/10/2022 23:30:00'),
							--- 2/10
							(1,1,'02/10/2022 09:30:00'),
							(2,1,'02/10/2022 12:00:00'),
							(3,1,'02/10/2022 15:00:00'),
							(4,1,'02/10/2022 17:30:00'),
							(5,1,'02/10/2022 20:00:00'),
							(6,1,'02/10/2022 23:30:00'),
							(7,2,'02/10/2022 09:30:00'),
							(8,2,'02/10/2022 12:00:00'),
							(9,2,'02/10/2022 15:00:00'),
							(10,2,'02/10/2022 17:30:00'),
							(11,2,'02/10/2022 20:00:00'),
							(12,2,'02/10/2022 23:30:00'),
							(13,3,'02/10/2022 09:30:00'),
							(14,3,'02/10/2022 12:00:00'),
							(15,3,'02/10/2022 15:00:00'),
							(1,3,'02/10/2022 17:30:00'),
							(2,3,'02/10/2022 20:00:00'),
							(3,3,'02/10/2022 23:30:00'),
							(4,4,'02/10/2022 09:30:00'),
							(5,4,'02/10/2022 12:00:00'),
							(6,4,'02/10/2022 15:00:00'),
							(7,4,'02/10/2022 17:30:00'),
							(8,4,'02/10/2022 20:00:00'),
							(9,4,'02/10/2022 23:30:00'),
							(10,5,'02/10/2022 09:30:00'),
							(11,5,'02/10/2022 12:00:00'),
							(12,5,'02/10/2022 15:00:00'),
							(13,5,'02/10/2022 17:30:00'),
							(14,5,'02/10/2022 20:00:00'),
							(15,5,'02/10/2022 23:30:00'),
							--03/10
							(1,1,'03/10/2022 09:30:00'),
							(2,1,'03/10/2022 12:00:00'),
							(3,1,'03/10/2022 15:00:00'),
							(4,1,'03/10/2022 17:30:00'),
							(5,1,'03/10/2022 20:00:00'),
							(6,1,'03/10/2022 23:30:00'),
							(7,2,'03/10/2022 09:30:00'),
							(8,2,'03/10/2022 12:00:00'),
							(9,2,'03/10/2022 15:00:00'),
							(10,2,'03/10/2022 17:30:00'),
							(11,2,'03/10/2022 20:00:00'),
							(12,2,'03/10/2022 23:30:00'),
							(13,3,'03/10/2022 09:30:00'),
							(14,3,'03/10/2022 12:00:00'),
							(15,3,'03/10/2022 15:00:00'),
							(1,3,'03/10/2022 17:30:00'),
							(2,3,'03/10/2022 20:00:00'),
							(3,3,'03/10/2022 23:30:00'),
							(4,4,'03/10/2022 09:30:00'),
							(5,4,'03/10/2022 12:00:00'),
							(6,4,'03/10/2022 15:00:00'),
							(7,4,'03/10/2022 17:30:00'),
							(8,4,'03/10/2022 20:00:00'),
							(9,4,'03/10/2022 23:30:00'),
							(10,5,'03/10/2022 09:30:00'),
							(11,5,'03/10/2022 12:00:00'),
							(12,5,'03/10/2022 15:00:00'),
							(13,5,'03/10/2022 17:30:00'),
							(14,5,'03/10/2022 20:00:00'),
							(15,5,'03/10/2022 23:30:00'),
							--04/10
							(1,1,'04/10/2022 09:30:00'),
							(2,1,'04/10/2022 12:00:00'),
							(3,1,'04/10/2022 15:00:00'),
							(4,1,'04/10/2022 17:30:00'),
							(5,1,'04/10/2022 20:00:00'),
							(6,1,'04/10/2022 23:30:00'),
							(7,2,'04/10/2022 09:30:00'),
							(8,2,'04/10/2022 12:00:00'),
							(9,2,'04/10/2022 15:00:00'),
							(10,2,'04/10/2022 17:30:00'),
							(11,2,'04/10/2022 20:00:00'),
							(12,2,'04/10/2022 23:30:00'),
							(13,3,'04/10/2022 09:30:00'),
							(14,3,'04/10/2022 12:00:00'),
							(15,3,'04/10/2022 15:00:00'),
							(1,3,'04/10/2022 17:30:00'),
							(2,3,'04/10/2022 20:00:00'),
							(3,3,'04/10/2022 23:30:00'),
							(4,4,'04/10/2022 09:30:00'),
							(5,4,'04/10/2022 12:00:00'),
							(6,4,'04/10/2022 15:00:00'),
							(7,4,'04/10/2022 17:30:00'),
							(8,4,'04/10/2022 20:00:00'),
							(9,4,'04/10/2022 23:30:00'),
							(10,5,'04/10/2022 09:30:00'),
							(11,5,'04/10/2022 12:00:00'),
							(12,5,'04/10/2022 15:00:00'),
							(13,5,'04/10/2022 17:30:00'),
							(14,5,'04/10/2022 20:00:00'),
							(15,5,'04/10/2022 23:30:00'),
							--05/10
							(1,1,'05/10/2022 09:30:00'),
							(2,1,'05/10/2022 12:00:00'),
							(3,1,'05/10/2022 15:00:00'),
							(4,1,'05/10/2022 17:30:00'),
							(5,1,'05/10/2022 20:00:00'),
							(6,1,'05/10/2022 23:30:00'),
							(7,2,'05/10/2022 09:30:00'),
							(8,2,'05/10/2022 12:00:00'),
							(9,2,'05/10/2022 15:00:00'),
							(10,2,'05/10/2022 17:30:00'),
							(11,2,'05/10/2022 20:00:00'),
							(12,2,'05/10/2022 23:30:00'),
							(13,3,'05/10/2022 09:30:00'),
							(14,3,'05/10/2022 12:00:00'),
							(15,3,'05/10/2022 15:00:00'),
							(1,3,'05/10/2022 17:30:00'),
							(2,3,'05/10/2022 20:00:00'),
							(3,3,'05/10/2022 23:30:00'),
							(4,4,'05/10/2022 09:30:00'),
							(5,4,'05/10/2022 12:00:00'),
							(6,4,'05/10/2022 15:00:00'),
							(7,4,'05/10/2022 17:30:00'),
							(8,4,'05/10/2022 20:00:00'),
							(9,4,'05/10/2022 23:30:00'),
							(10,5,'05/10/2022 09:30:00'),
							(11,5,'05/10/2022 12:00:00'),
							(12,5,'05/10/2022 15:00:00'),
							(13,5,'05/10/2022 17:30:00'),
							(14,5,'05/10/2022 20:00:00'),
							(15,5,'05/10/2022 23:30:00'),
							--06/10
							(1,1,'06/10/2022 09:30:00'),
							(2,1,'06/10/2022 12:00:00'),
							(3,1,'06/10/2022 15:00:00'),
							(4,1,'06/10/2022 17:30:00'),
							(5,1,'06/10/2022 20:00:00'),
							(6,1,'06/10/2022 23:30:00'),
							(7,2,'06/10/2022 09:30:00'),
							(8,2,'06/10/2022 12:00:00'),
							(9,2,'06/10/2022 15:00:00'),
							(10,2,'06/10/2022 17:30:00'),
							(11,2,'06/10/2022 20:00:00'),
							(12,2,'06/10/2022 23:30:00'),
							(13,3,'06/10/2022 09:30:00'),
							(14,3,'06/10/2022 12:00:00'),
							(15,3,'06/10/2022 15:00:00'),
							(1,3,'06/10/2022 17:30:00'),
							(2,3,'06/10/2022 20:00:00'),
							(3,3,'06/10/2022 23:30:00'),
							(4,4,'06/10/2022 09:30:00'),
							(5,4,'06/10/2022 12:00:00'),
							(6,4,'06/10/2022 15:00:00'),
							(7,4,'06/10/2022 17:30:00'),
							(8,4,'06/10/2022 20:00:00'),
							(9,4,'06/10/2022 23:30:00'),
							(10,5,'06/10/2022 09:30:00'),
							(11,5,'06/10/2022 12:00:00'),
							(12,5,'06/10/2022 15:00:00'),
							(13,5,'06/10/2022 17:30:00'),
							(14,5,'06/10/2022 20:00:00'),
							(15,5,'06/10/2022 23:30:00'),
							--07/10
							(1,1,'07/10/2022 09:30:00'),
							(2,1,'07/10/2022 12:00:00'),
							(3,1,'07/10/2022 15:00:00'),
							(4,1,'07/10/2022 17:30:00'),
							(5,1,'07/10/2022 20:00:00'),
							(6,1,'07/10/2022 23:30:00'),
							(7,2,'07/10/2022 09:30:00'),
							(8,2,'07/10/2022 12:00:00'),
							(9,2,'07/10/2022 15:00:00'),
							(10,2,'07/10/2022 17:30:00'),
							(11,2,'07/10/2022 20:00:00'),
							(12,2,'07/10/2022 23:30:00'),
							(13,3,'07/10/2022 09:30:00'),
							(14,3,'07/10/2022 12:00:00'),
							(15,3,'07/10/2022 15:00:00'),
							(1,3,'07/10/2022 17:30:00'),
							(2,3,'07/10/2022 20:00:00'),
							(3,3,'07/10/2022 23:30:00'),
							(4,4,'07/10/2022 09:30:00'),
							(5,4,'07/10/2022 12:00:00'),
							(6,4,'07/10/2022 15:00:00'),
							(7,4,'07/10/2022 17:30:00'),
							(8,4,'07/10/2022 20:00:00'),
							(9,4,'07/10/2022 23:30:00'),
							(10,5,'07/10/2022 09:30:00'),
							(11,5,'07/10/2022 12:00:00'),
							(12,5,'07/10/2022 15:00:00'),
							(13,5,'07/10/2022 17:30:00'),
							(14,5,'07/10/2022 20:00:00'),
							(15,5,'07/10/2022 23:30:00'),
							--08/10
							(1,1,'08/10/2022 09:30:00'),
							(2,1,'08/10/2022 12:00:00'),
							(3,1,'08/10/2022 15:00:00'),
							(4,1,'08/10/2022 17:30:00'),
							(5,1,'08/10/2022 20:00:00'),
							(6,1,'08/10/2022 23:30:00'),
							(7,2,'08/10/2022 09:30:00'),
							(8,2,'08/10/2022 12:00:00'),
							(9,2,'08/10/2022 15:00:00'),
							(10,2,'08/10/2022 17:30:00'),
							(11,2,'08/10/2022 20:00:00'),
							(12,2,'08/10/2022 23:30:00'),
							(13,3,'08/10/2022 09:30:00'),
							(14,3,'08/10/2022 12:00:00'),
							(15,3,'08/10/2022 15:00:00'),
							(1,3,'08/10/2022 17:30:00'),
							(2,3,'08/10/2022 20:00:00'),
							(3,3,'08/10/2022 23:30:00'),
							(4,4,'08/10/2022 09:30:00'),
							(5,4,'08/10/2022 12:00:00'),
							(6,4,'08/10/2022 15:00:00'),
							(7,4,'08/10/2022 17:30:00'),
							(8,4,'08/10/2022 20:00:00'),
							(9,4,'08/10/2022 23:30:00'),
							(10,5,'08/10/2022 09:30:00'),
							(11,5,'08/10/2022 12:00:00'),
							(12,5,'08/10/2022 15:00:00'),
							(13,5,'08/10/2022 17:30:00'),
							(14,5,'08/10/2022 20:00:00'),
							(15,5,'08/10/2022 23:30:00'),
							--09/10
							(1,1,'09/10/2022 09:30:00'),
							(2,1,'09/10/2022 12:00:00'),
							(3,1,'09/10/2022 15:00:00'),
							(4,1,'09/10/2022 17:30:00'),
							(5,1,'09/10/2022 20:00:00'),
							(6,1,'09/10/2022 23:30:00'),
							(7,2,'09/10/2022 09:30:00'),
							(8,2,'09/10/2022 12:00:00'),
							(9,2,'09/10/2022 15:00:00'),
							(10,2,'09/10/2022 17:30:00'),
							(11,2,'09/10/2022 20:00:00'),
							(12,2,'09/10/2022 23:30:00'),
							(13,3,'09/10/2022 09:30:00'),
							(14,3,'09/10/2022 12:00:00'),
							(15,3,'09/10/2022 15:00:00'),
							(1,3,'09/10/2022 17:30:00'),
							(2,3,'09/10/2022 20:00:00'),
							(3,3,'09/10/2022 23:30:00'),
							(4,4,'09/10/2022 09:30:00'),
							(5,4,'09/10/2022 12:00:00'),
							(6,4,'09/10/2022 15:00:00'),
							(7,4,'09/10/2022 17:30:00'),
							(8,4,'09/10/2022 20:00:00'),
							(9,4,'09/10/2022 23:30:00'),
							(10,5,'09/10/2022 09:30:00'),
							(11,5,'09/10/2022 12:00:00'),
							(12,5,'09/10/2022 15:00:00'),
							(13,5,'09/10/2022 17:30:00'),
							(14,5,'09/10/2022 20:00:00'),
							(15,5,'09/10/2022 23:30:00'),
							--10/10
							(1,1,'10/10/2022 09:30:00'),
							(2,1,'10/10/2022 12:00:00'),
							(3,1,'10/10/2022 15:00:00'),
							(4,1,'10/10/2022 17:30:00'),
							(5,1,'10/10/2022 20:00:00'),
							(6,1,'10/10/2022 23:30:00'),
							(7,2,'10/10/2022 09:30:00'),
							(8,2,'10/10/2022 12:00:00'),
							(9,2,'10/10/2022 15:00:00'),
							(10,2,'10/10/2022 17:30:00'),
							(11,2,'10/10/2022 20:00:00'),
							(12,2,'10/10/2022 23:30:00'),
							(13,3,'10/10/2022 09:30:00'),
							(14,3,'10/10/2022 12:00:00'),
							(15,3,'10/10/2022 15:00:00'),
							(1,3,'10/10/2022 17:30:00'),
							(2,3,'10/10/2022 20:00:00'),
							(3,3,'10/10/2022 23:30:00'),
							(4,4,'10/10/2022 09:30:00'),
							(5,4,'10/10/2022 12:00:00'),
							(6,4,'10/10/2022 15:00:00'),
							(7,4,'10/10/2022 17:30:00'),
							(8,4,'10/10/2022 20:00:00'),
							(9,4,'10/10/2022 23:30:00'),
							(10,5,'10/10/2022 09:30:00'),
							(11,5,'10/10/2022 12:00:00'),
							(12,5,'10/10/2022 15:00:00'),
							(13,5,'10/10/2022 17:30:00'),
							(14,5,'10/10/2022 20:00:00'),
							(15,5,'10/10/2022 23:30:00'),
							--11/10
							(1,1,'11/10/2022 09:30:00'),
							(2,1,'11/10/2022 12:00:00'),
							(3,1,'11/10/2022 15:00:00'),
							(4,1,'11/10/2022 17:30:00'),
							(5,1,'11/10/2022 20:00:00'),
							(6,1,'11/10/2022 23:30:00'),
							(7,2,'11/10/2022 09:30:00'),
							(8,2,'11/10/2022 12:00:00'),
							(9,2,'11/10/2022 15:00:00'),
							(10,2,'11/10/2022 17:30:00'),
							(11,2,'11/10/2022 20:00:00'),
							(12,2,'11/10/2022 23:30:00'),
							(13,3,'11/10/2022 09:30:00'),
							(14,3,'11/10/2022 12:00:00'),
							(15,3,'11/10/2022 15:00:00'),
							(1,3,'11/10/2022 17:30:00'),
							(2,3,'11/10/2022 20:00:00'),
							(3,3,'11/10/2022 23:30:00'),
							(4,4,'11/10/2022 09:30:00'),
							(5,4,'11/10/2022 12:00:00'),
							(6,4,'11/10/2022 15:00:00'),
							(7,4,'11/10/2022 17:30:00'),
							(8,4,'11/10/2022 20:00:00'),
							(9,4,'11/10/2022 23:30:00'),
							(10,5,'11/10/2022 09:30:00'),
							(11,5,'11/10/2022 12:00:00'),
							(12,5,'11/10/2022 15:00:00'),
							(13,5,'11/10/2022 17:30:00'),
							(14,5,'11/10/2022 20:00:00'),
							(15,5,'11/10/2022 23:30:00')




insert into Reservas values ( 1,  1, '06/09/2022', '01/10/2022 09:00:00' ),
							( 1,  2, '26/09/2022', '01/10/2022 09:00:00' ),
							( 1,  3, '01/09/2022', '01/10/2022 09:00:00' ),
							( 1,  4, '30/09/2022', '01/10/2022 09:00:00' ),
							( 1,  5, '20/09/2022', '01/10/2022 09:00:00' ),
							--funcion 2 
							( 2,  4, '01/10/2022', '01/10/2022 11:30:00' ),
							( 2,  5, '28/09/2022', '01/10/2022 11:30:00' ),
							( 2,  6, '05/09/2022', '01/10/2022 11:30:00' ),
							( 2,  7, '18/09/2022', '01/10/2022 11:30:00' ),
							--funcion 3

							( 3,  8, '18/09/2022', '01/10/2022 14:30:00' ),
							( 3,  9, '25/09/2022', '01/10/2022 14:30:00' ),
							( 3,  10, '16/09/2022', '01/10/2022 14:30:00' ),
							( 3,  11, '03/09/2022', '01/10/2022 14:30:00' ),

							--4
							( 4,  12, '08/09/2022', '01/10/2022 17:00:00' ),
							( 4,  13, '09/09/2022', '01/10/2022 17:00:00' ),
							( 4,  14, '26/09/2022', '01/10/2022 17:00:00' ),
							( 2,  15, '16/09/2022', '01/10/2022 17:00:00' ),

							--5
							( 5,  16, '15/09/2022', '01/10/2022 19:00:00' ),
							( 5,  17, '16/09/2022', '01/10/2022 19:00:00' ),
							( 5, 18, '08/09/2022', '01/10/2022 19:00:00' ),
							( 5,  19, '03/09/2022', '01/10/2022 19:00:00' ),
							( 5,  20, '01/09/2022', '01/10/2022 19:00:00' ),

							--6
							( 6,  21, '17/09/2022', '01/10/2022 23:00:00' ),
							( 6,  22, '14/09/2022', '01/10/2022 23:00:00' ),
							( 6,  23, '12/09/2022', '01/10/2022 23:00:00' ),
							( 6,  24, '18/09/2022', '01/10/2022 23:00:00' ),

							--7
							( 7,  25, '30/09/2022', '01/10/2022 09:00:00' ),
							( 7,  26, '29/09/2022', '01/10/2022 09:00:00' ),
							( 7,  27, '30/09/2022', '01/10/2022 09:00:00' ),

							--8
							( 8,  28, '30/09/2022', '01/10/2022 12:00:00' ),
							( 8,  29, '28/09/2022', '01/10/2022 12:00:00' ),
							( 8,  30, '26/09/2022', '01/10/2022 12:00:00' ),
							( 8,  31, '30/09/2022', '01/10/2022 12:00:00' ),
							--9
							( 9,  32, '30/09/2022', '01/10/2022 14:00:00' ),
							( 9,  33, '30/09/2022', '01/10/2022 14:00:00' ),
							( 9,  34, '30/09/2022', '01/10/2022 14:00:00' ),
							( 9,  35, '30/09/2022', '01/10/2022 14:00:00' ),
							( 9,  36, '30/09/2022', '01/10/2022 14:00:00' ),
								
							--10
							( 10,  37, '05/09/2022', '01/10/2022 09:00:00' ),
							( 10,  38, '08/09/2022', '01/10/2022 09:00:00' ),

							--11
							( 11,  39, '08/09/2022', '01/10/2022 09:00:00' ),
							( 11,  40, '17/09/2022', '01/10/2022 09:00:00' ),
							( 11,  41, '10/09/2022', '01/10/2022 09:00:00' ),

							--12
							( 12,  42, '18/09/2022', '01/10/2022 09:00:00' ),
							( 12,  43, '13/09/2022', '01/10/2022 09:00:00' ),
							( 12,  44, '16/09/2022', '01/10/2022 09:00:00' ),

							--13
							( 13,  45, '18/09/2022', '01/10/2022 09:00:00' ),
							( 13,  46, '18/09/2022', '01/10/2022 09:00:00' ),
							( 13,  47, '13/09/2022', '01/10/2022 09:00:00' ),
							( 13,  48, '17/09/2022', '01/10/2022 09:00:00' ),

							--14
							( 14,  49, '10/09/2022', '01/10/2022 09:00:00' ),
							( 14,  50, '27/09/2022', '01/10/2022 09:00:00' ),
							( 14,  51, '20/09/2022', '01/10/2022 09:00:00' ),
							( 14,  52, '12/09/2022', '01/10/2022 09:00:00' ),

							--15
							( 15,  53, '24/09/2022', '01/10/2022 09:00:00' ),
							(15,  54, '23/09/2022', '01/10/2022 09:00:00' ),
							( 15,  55, '28/09/2022', '01/10/2022 09:00:00' ),
							( 15,  56, '17/09/2022', '01/10/2022 09:00:00' ),
							( 15,  57, '13/09/2022', '01/10/2022 09:00:00' ),
							( 15,  58, '16/09/2022', '01/10/2022 09:00:00' ),

							--16
							( 16,  59, '26/09/2022', '01/10/2022 09:00:00' ),
							( 16,  60, '16/09/2022', '01/10/2022 09:00:00' ),
							( 16,  61, '16/09/2022', '01/10/2022 09:00:00' ),
							( 16,  62, '08/09/2022', '01/10/2022 09:00:00' ),

							--17
							( 17,  63, '16/09/2022', '01/10/2022 09:00:00' ),
							( 17,  64, '03/09/2022', '01/10/2022 09:00:00' ),
							( 17,  65, '05/09/2022', '01/10/2022 09:00:00' ),
							( 17,  66, '04/09/2022', '01/10/2022 09:00:00' ),
							( 17,  67, '15/09/2022', '01/10/2022 09:00:00' ),

							--18
							( 18,  68, '13/09/2022', '01/10/2022 09:00:00' ),
							( 18,  69, '10/09/2022', '01/10/2022 09:00:00' ),
							( 18,  70, '12/09/2022', '01/10/2022 09:00:00' ),
							( 18,  1, '18/09/2022', '01/10/2022 09:00:00' ),

							--19
							( 19,  2, '18/09/2022', '01/10/2022 09:00:00' ),
							( 19,  3, '19/09/2022', '01/10/2022 09:00:00' ),
							( 19,  4, '26/09/2022', '01/10/2022 09:00:00' ),
							( 19,  5, '06/09/2022', '01/10/2022 09:00:00' ),

							--20
							( 20,  6, '10/09/2022', '01/10/2022 09:00:00' ),
							( 20,  7, '13/09/2022', '01/10/2022 09:00:00' ),
							( 20,  8, '06/09/2022', '01/10/2022 09:00:00' ),
							( 20,  9, '26/09/2022', '01/10/2022 09:00:00' ),
							( 20,  10, '06/09/2022', '01/10/2022 09:00:00' ),

							--21
							( 21,  11, '17/09/2022', '01/10/2022 09:00:00' ),
							( 21,  13, '06/09/2022', '01/10/2022 09:00:00' ),
							( 21,  14,'26/09/2022', '01/10/2022 09:00:00' ),
							( 21,  15, '26/09/2022', '01/10/2022 09:00:00' ),

							--22
							( 22,  16, '30/09/2022', '01/10/2022 09:00:00' ),
							( 22,  17, '26/09/2022', '01/10/2022 09:00:00' ),
							( 22,  18, '12/09/2022', '01/10/2022 09:00:00' ),

							--23
							( 23, 25,'15/09/2022', '01/10/2022 09:00:00' ),
							( 23,  26, '24/09/2022', '01/10/2022 09:00:00' ),
							( 23,  27, '28/09/2022', '01/10/2022 09:00:00' ),
							( 23,  28, '21/09/2022', '01/10/2022 09:00:00' ),
							( 23,  29, '26/09/2022', '01/10/2022 09:00:00' ),

							--24
							( 24,  19, '16/09/2022', '01/10/2022 09:00:00' ),
							( 24,  20, '13/09/2022', '01/10/2022 09:00:00' ),
							( 24,  21, '26/09/2022', '01/10/2022 09:00:00' ),
							( 24,  22, '16/09/2022', '01/10/2022 09:00:00' ),

							--25
							( 25,  23, '26/09/2022', '01/10/2022 09:00:00' ),
							( 25,  24, '18/09/2022', '01/10/2022 09:00:00' ),
							( 25,  31, '16/09/2022', '01/10/2022 09:00:00' ),
							( 25,  32, '26/09/2022', '01/10/2022 09:00:00' ),

							--26
							( 26,  33, '12/09/2022', '01/10/2022 09:00:00' ),
							( 26,  34, '26/09/2022', '01/10/2022 09:00:00' ),
							( 26,  35, '26/09/2022', '01/10/2022 09:00:00' ),

							--27
							( 27,  36, '23/09/2022', '01/10/2022 09:00:00' ),
							( 27,  37, '26/09/2022', '01/10/2022 09:00:00' ),
							( 27,  38, '08/09/2022', '01/10/2022 09:00:00' ),
							( 27,  39, '28/09/2022', '01/10/2022 09:00:00' ),
							( 27,  40, '02/09/2022', '01/10/2022 09:00:00' ),

							--28
							( 28,  41, '02/09/2022', '01/10/2022 09:00:00' ),
							( 28,  42, '03/09/2022', '01/10/2022 09:00:00' ),
							( 28,  43, '08/09/2022', '01/10/2022 09:00:00' ),
							( 28,  44, '26/09/2022', '01/10/2022 09:00:00' ),

							--29
							( 29,  45, '08/09/2022', '01/10/2022 09:00:00' ),
							( 29,  46, '09/09/2022', '01/10/2022 09:00:00' ),
							( 29,  47, '07/09/2022', '01/10/2022 09:00:00' ),

							--30
							( 30,  48, '05/09/2022', '01/10/2022 09:00:00' ),
							( 30,  49, '26/09/2022', '01/10/2022 09:00:00' ),
							( 30,  50, '02/09/2022', '01/10/2022 09:00:00' ),
							( 30,  51, '27/09/2022', '01/10/2022 09:00:00' )





insert into  Tickets       (id_reserva,id_funcion,id_empleado,id_cliente,fecha_ticket)
			values		   (1,1,4,1,'01/10/2022'),
						   (2,1,19,2,'01/10/2022'),
						   (3,1,1,3,'01/10/2022'),
						   (4,1,7,4,'01/10/2022'),
						   (5,1,34,5,'01/10/2022'),
						   (6,2,39,4,'01/10/2022'),
						   (7,2,27,5,'01/10/2022'),
						   (8,2,22,6,'01/10/2022'),
						   (9,2,31,7,'01/10/2022'),
						   (10,3,12,8,'01/10/2022'),
						   (11,3,13,9,'01/10/2022'),
						   (12,3,21,10,'01/10/2022'),
						   (13,3,23,11,'01/10/2022'),
						   (14,4,16,12,'01/10/2022'),
						   (15,4,32,13,'01/10/2022'),
						   (16,4,15,14,'01/10/2022'),
						   (17,2,11,15,'01/10/2022'),
						   (18,5,30,16,'01/10/2022'),
						   (19,5,3,17,'01/10/2022'),
						   (20,5,26,18,'01/10/2022'),
						   (21,5,45,19,'01/10/2022'),
						   (22,5,14,20,'01/10/2022'),
						   (23,6,46,21,'01/10/2022'),
						   (24,6,17,22,'01/10/2022'),
						   (25,6,28,23,'01/10/2022'),
						   (26,6,2,24,'01/10/2022'),
						   (27,7,5,25,'01/10/2022'),
						   (28,7,24,26,'01/10/2022'),
						   (29,7,29,27,'01/10/2022'),
						   (30,8,41,28,'01/10/2022'),
						   (31,8,18,29,'01/10/2022'),
						   (32,8,10,30,'01/10/2022'),
						   (33,8,20,31,'01/10/2022'),
						   (34,9,6,32,'01/10/2022'),
						   (35,9,36,33,'01/10/2022'),
						   (36,9,33,34,'01/10/2022'),
						   (37,9,8,35,'01/10/2022'),
						   (38,9,44,36,'01/10/2022'),
						   (39,10,35,37,'01/10/2022'),
						   (40,10,9,38,'01/10/2022'),
						   --11
							(41, 11, 9, 39 , '01/10/2022'),
							(42, 11,4,  40 , '01/10/2022 ' ),
							(43, 11, 19 ,41,'01/10/2022 ' ),

							--12
							(44, 12,15, 42, '01/10/2022 ' ),
							(45, 12,  30,43 , '01/10/2022 ' ),
							(46, 12,  31,44 , '01/10/2022 ' ),

							--13
							(47, 13,24,  45 , '01/10/2022 ' ),
							( 48,13,32,  46 , '01/10/2022 ' ),
							(49, 13,16,  47 , '01/10/2022 ' ),
							(50, 13, 41, 48,  '01/10/2022 ' ),

							--14
							(51, 14,44 , 49,  '01/10/2022 ' ),
							(52, 14, 17 ,50,  '01/10/2022 ' ),
							(53, 14,20  ,51,  '01/10/2022 ' ),
							( 54,14, 20 ,52,  '01/10/2022 ' ),

							--15
							(55, 15, 18, 53,  '01/10/2022 ' ),
							(56,15, 12 ,54,  '01/10/2022 ' ),
							(57, 15, 16 ,55, '01/10/2022 ' ),
							(58, 15, 27 ,56,  '01/10/2022 ' ),
							(59, 15, 43 ,57,  '01/10/2022 ' ),
							(60, 15, 21, 58,  '01/10/2022 ' ),

							--16
							(61, 16, 6 ,59,  '01/10/2022 ' ),
							(62, 16, 39 ,60,  '01/10/2022 ' ),
							(63, 16, 28 ,61, '01/10/2022 ' ),
							(64, 16, 10, 62,  '01/10/2022 ' ),

							--17
							(65, 17,44,  63,  '01/10/2022 ' ),
							(66, 17,30,  64,  '01/10/2022 ' ),
							(67, 17,28,  65,  '01/10/2022 ' ),
							(68, 17,10,  66,  '01/10/2022 ' ),
							(69, 17, 15, 67,  '01/10/2022 ' ),

							--18
							(70, 18,  33,68,  '01/10/2022 ' ),
							(71, 18, 22 ,69, '01/10/2022 ' ),
							(72, 18,  45,70,  '01/10/2022 ' ),
							(73, 18,  23,1,  '01/10/2022 ' ),

							--19
							(74, 19,  26,2, '01/10/2022 ' ),
							(75, 19, 25 ,3,  '01/10/2022 ' ),
							(76, 19, 29 ,4,  '01/10/2022 ' ),
							( 77,19, 5, 5,  '01/10/2022 ' ),

							--20
							(78, 20, 42 ,6,  '01/10/2022 ' ),
							(79, 20,  34,7,  '01/10/2022 ' ),
							(80, 20,  46,8,  '01/10/2022 ' ),
							(81, 20,  35,9, '01/10/2022 ' ),
							(82, 20, 37 ,10,  '01/10/2022 ' ),

							--21
							(83, 21,8 , 11,  '01/10/2022 ' ),
							(84, 21,1 , 13,  '01/10/2022 ' ),
							(85,21, 38, 14, '01/10/2022 ' ),
							(86,21, 40, 15, '01/10/2022 ' ),

							--22
							(87, 22,2,  16,  '01/10/2022 ' ),
							(88, 22,3,  17,  '01/10/2022 ' ),
							(89, 22,7,  18,  '01/10/2022 ' ),

							--23
							(90, 23,11, 25, '01/10/2022 ' ),
							(91, 23,13,  26,  '01/10/2022 ' ),
							(92, 23,14,  27,  '01/10/2022 ' ),
							(93, 23, 37, 28, '01/10/2022 ' ),
							(94, 23, 43, 29,  '01/10/2022 ' ),

							--24
							(95, 24,29,  19,  '01/10/2022 ' ),
							(96, 24,33,  20,  '01/10/2022 ' ),
							(97, 24,40,  21, '01/10/2022 ' ),
							(98, 24, 38, 22,  '01/10/2022 ' ),

							--25
							(99, 25,4,  23,  '01/10/2022 ' ),
							(100, 25,8,  24,  '01/10/2022 ' ),
							(101, 25,39,  31, '01/10/2022 ' ),
							(102, 25,7,  32,  '01/10/2022 ' ),

							--26
							(103, 26,7,  33,  '01/10/2022 ' ),
							(104, 26,12,  34,  '01/10/2022 ' ),
							(105, 26,6,  35,  '01/10/2022 ' ),

							--27
							(106, 27,13,  36,  '01/10/2022 ' ),
							(107, 27,5,  37,  '01/10/2022 ' ),
							(108, 27, 26, 38,  '01/10/2022 ' ),
							(109, 27,20,  39,  '01/10/2022 ' ),
							(110, 27,11,  40,  '01/10/2022 ' ),

							--28
							( 111,28,9,  41,  '01/10/2022 ' ),
							(112, 28, 27, 42, '01/10/2022 ' ),
							(113 ,28, 35, 43,  '01/10/2022 ' ),
							(114, 28,3,  44,  '01/10/2022 ' ),

							--29
							(115, 29,10,  45,  '01/10/2022 ' ),
							(116, 29,15,  46,  '01/10/2022 ' ),
							(117, 29,16,  47,  '01/10/2022 ' ),

							--30
							(118, 30,21,  48,  '01/10/2022 ' ),
							(119, 30,18,  49,  '01/10/2022 ' ),
							(120, 30,41,  50,  '01/10/2022 ' ),
							(121, 30, 25, 51,  '01/10/2022 ' )


insert into Descuentos values ('Sin descuento', 0),
							  ('Descuento del 25% para socios del cine', 0.25),
							  ('Descuentos del 15% para clientes mayores de 50 años', 0.15)



INSERT INTO Detalles_Reservas Values(1,940,2,1),
								   (1,940,2,2),
								   (2,940,1,3),
								   (2,940,1,4),
								   (3,940,2,5),
								   (3,940,2,6),
								   (4,940,2,7),
								   (4,940,2,8),
								   (4,940,2,9),
								   (5,940,2,10),
								   (5,940,2,11),
								   (5,940,2,12),
								   (5,940,2,13),
								   --2
								   (6,940,2,7),
								   (6,940,2,8),
								   (6,940,2,9),
								   (7,940,2,10),
								   (7,940,2,11),
								   (7,940,2,12),
								   (7,940,2,13),
								   (8,940,1,1),
								   (8,940,1,2),
								   (8,940,1,3),
								   (8,940,1,4),
								   (8,940,1,2),
								   (8,940,1,3),
								   (8,940,1,4),
								   (9,940,1,5),
								   (17,940,2,14),

								   --3
								   (10,940,2,6),
								   (10,940,2,7),
								   (10,940,2,8),
								   (10,940,1,9),
								   (11,940,2,10),
								   (11,940,2,11),
								   (11,940,2,12),
								   (11,940,2,13),
								   (11,940,2,14),
								   (11,940,2,15),
								   (11,940,3,16),
								   (12,940,1,1),
								   (12,940,1,2),
								   (12,940,1,3),
								   (13,940,1,4),
								   (13,940,1,5),
								   (13,940,1,17),
								   (13,940,1,18),
								   (13,940,1,19),

								   --4
								   (14,940,1,1),
								   (14,940,1,2),
								   (14,940,1,3),
								   (14,940,1,4),
								   (15,940,2,5),
								   (15,940,2,6),
								   (15,940,2,7),
								   (15,940,2,8),
								   (16,940,2,9),
								   (16,940,2,10),
								   (16,940,2,11),
								   (16,940,2,12),
								   (16,940,2,13),
								   (14,940,1,14),
								   (16,940,2,15),
								   (16,940,2,16),

								   --5
								   (18,940,2,1),
								   (18,940,2,2),
								   (19,940,2,3),
								   (19,940,2,4),
								   (19,940,2,5),
								   (20,940,2,6),
								   (20,940,2,7),
								   (21,940,1,8),
								   (21,940,3,9),
								   (21,940,3,10),
								   (21,940,3,11),
								   (22,940,1,12),
								   (22,940,1,13),
								   (22,940,1,14),

								   --6
								   (23,940,2,1),
								   (23,940,2,2),
								   (23,940,2,3),
								   (24,940,1,4),
								   (24,940,1,5),
								   (25,940,2,6),
								   (25,940,2,7),
								   (25,940,2,8),
								   (25,940,2,9),
								   (25,940,2,10),
								   (25,940,2,11),
								   (26,940,2,12),
								   (26,940,2,13),
								   (26,940,2,14),
								   (26,940,2,15),
								   (26,940,2,16),
								   (26,940,2,17),

								   --7
								   (27,940,1,21),
								   (27,940,1,22),
								   (27,940,1,23),
								   (28,940,1,24),
								   (28,940,1,25),
								   (28,940,1,26),
								   (28,940,1,27),
								   (29,940,2,28),
								   (29,940,2,29),
								   (29,940,2,30),
								   (29,940,2,31),

								   --8
								   (30,940,3,21),
								   (30,940,3,22),
								   (30,940,3,23),
								   (30,940,3,24),
								   (30,940,3,25),
								   (30,940,3,26),
								   (30,940,3,27),
								   (31,940,2,28),
								   (31,940,2,29),
								   (31,940,2,30),
								   (31,940,2,31),
								   (32,940,1,32),
								   (32,940,1,33),
								   (32,940,1,34),
								   (32,940,1,35),
								   (32,940,1,36),
								   (33,940,2,37),
								   (33,940,2,38),
								   (33,940,2,39),
								   (33,940,2,40),

								   --9
								   (34,940,1,21),
								   (34,940,1,22),
								   (35,940,1,23),
								   (35,940,1,24),
								   (35,940,1,25),
								   (36,940,2,26),
								   (36,940,2,27),
								   (36,940,2,28),
								   (37,940,2,29),
								   (37,940,2,30),
								   (37,940,2,31),
								   (37,940,2,32),
								   (38,940,2,33),
								   (38,940,2,34),
								   (38,940,2,35),
								   (38,940,2,36),

								   --10
								   (39,940,1,21),
								   (39,940,1,22),
								   (39,940,1,23),
								   (39,940,1,24),
								   (39,940,1,25),
								   (39,940,1,26),
								   (40,941,1,27),
								   (40,940,1,28),
								   (40,940,1,29),
								   (40,940,1,30),
								   (40,940,1,31),


								   --11
								   (41,940,2,21),
								   (41,940,2,22),
								   (41,940,2,23),
								   (41,940,2,24),
								   (42,940,2,25),
								   (42,940,2,26),
								   (42,940,2,27),
								   (43,940,2,28),
								   (43,940,2,29),
								   (43,940,2,30),

								   --12
								   (44,940,3,21),
								   (44,940,3,22),
								   (44,940,3,23),
								   (44,940,3,24),
								   (44,940,3,25),
								   (44,940,3,26),
								   (44,940,3,27),
								   (45,940,2,28),
								   (45,940,2,29),
								   (45,940,2,30),
								   (45,940,2,31),
								   (45,940,2,32),
								   (45,940,2,33),
								   (46,940,3,34),
								   (46,940,3,35),

								   --13
								   (47,940,2,41),
								   (47,940,2,42),
								   (48,940,2,43),
								   (48,940,2,44),
								   (48,940,2,45),
								   (49,940,3,46),
								   (49,940,3,47),
								   (50,940,3,48),


								   --14
								   (51,940,2,41),
								   (51,940,2,42),
								   (51,940,2,43),
								   (51,940,2,44),
								   (52,940,3,45),
								   (52,940,3,46),
								   (52,940,3,47),
								   (53,940,2,48),
								   (53,940,2,49),
								   (54,940,2,50),
								   (54,940,2,51),

								   --15
								   (55,940,1,41),
								   (55,940,1,42),
								   (56,940,1,43),
								   (56,940,1,44),
								   (57,940,2,45),
								   (57,940,2,46),
								   (58,940,2,47),
								   (59,940,2,48),
								   (60,940,3,49),

								   --16
								   (61,940,2,41),
								   (61,940,2,42),
								   (61,940,2,43),
								   (61,940,2,44),
								   (62,940,3,45),
								   (62,940,3,46),
								   (62,940,3,47),
								   (62,940,3,48),
								   (63,940,2,49),
								   (64,940,2,50),
								   (64,940,2,51),

								   --17
								   (65,940,3,41),
								   (65,940,3,42),
								   (65,940,3,43),
								   (65,940,3,44),
								   (66,940,3,45),
								   (66,940,3,46),
								   (66,940,3,47),
								   (66,940,3,48),
								   (67,940,3,49),
								   (67,940,3,50),
								   (67,940,3,51),
								   (68,940,3,52),
								   (68,940,3,53),
								   (68,940,3,54),
								   (69,940,3,55),
								   (69,940,3,56),

								   --18
								   (70,940,1,41),
								   (70,940,1,42),
								   (70,940,1,43),
								   (70,940,1,44),
								   (71,940,2,45),
								   (71,940,2,46),
								   (71,940,2,47),
								   (71,940,2,48),
								   (71,940,2,49),
								   (71,940,2,50),
								   (72,940,1,51),
								   (72,940,1,52),
								   (72,940,1,53),
								   (73,940,2,54),
								   (73,940,2,55),

								   --19 sala 4
								   (74,1060,1,61),
								   (74,1060,1,62),
								   (74,1060,1,63),
								   (74,1060,1,64),
								   (75,1060,2,65),
								   (75,1060,2,66),
								   (75,1060,2,67),
								   (75,1060,2,68),
								   (76,1060,2,69),
								   (76,1060,2,70),
								   (76,1060,2,71),
								   (77,1060,2,72),
								   (77,1060,2,73),
								   (77,1060,2,74),
								   (77,1060,2,75),
								   (77,1060,2,76),
								   (77,1060,2,78),

								   --20
								   (78,1060,1,61),
								   (79,1060,1,62),
								   (79,1060,1,63),
								   (80,1060,2,64),
								   (80,1060,2,65),
								   (81,1060,2,66),
								   (81,1060,2,67),
								   (82,1060,1,68),
								   (82,1060,1,69),
								   (82,1060,1,70),

								   --21
								   (83,1060,1,61),
								   (83,1060,1,62),
								   (83,1060,1,63),
								   (84,1060,2,64),
								   (84,1060,2,65),
								   (84,1060,2,66),
								   (85,1060,2,67),
								   (85,1060,2,68),
								   (86,1060,2,68),
								   (86,1060,2,69),
								   (86,1060,2,70),

								   --22
								   (87,1060,2,61),
								   (87,1060,2,62),
								   (87,1060,2,63),
								   (87,1060,2,64),
								   (88,1060,2,65),
								   (88,1060,2,66),
								   (88,1060,2,67),
								   (88,1060,2,68),
								   (88,1060,2,69),
								   (89,1060,2,70),
								   (89,1060,2,71),
								   (89,1060,2,72),
								   (89,1060,2,73),
								   (89,1060,2,74),

								   --23
								   (90,1060,1,61),
								   (90,1060,1,62),
								   (90,1060,1,63),
								   (91,1060,1,64),
								   (91,1060,1,65),
								   (91,1060,1,66),
								   (92,1060,2,67),
								   (92,1060,2,68),
								   (92,1060,2,69),
								   (93,1060,3,70),
								   (93,1060,3,71),
								   (94,1060,2,72),
								   (94,1060,2,73),
								   (94,1060,2,74),

								   --24
								   (95,1060,3,61),
								   (95,1060,3,62),
								   (95,1060,3,63),
								   (95,1060,3,64),
								   (95,1060,3,65),
								   (95,1060,3,66),
								   (96,1060,1,67),
								   (96,1060,1,68),
								   (96,1060,1,69),
								   (97,1060,2,70),
								   (97,1060,2,71),
								   (97,1060,2,72),
								   (97,1060,2,73),
								   (98,1060,1,74),
								   (98,1060,1,75),
								   (98,1060,1,76),
								   (98,1060,1,77),


								   --25
								   (99,1060,2,81),
								   (100,1060,1,82),
								   (100,1060,2,83),
								   (101,1060,2,84),
								   (102,1060,1,85),
								   (102,1060,1,86),
								   (102,1060,1,87),


								   --26
								   (103,1060,1,81),
								   (103,1060,1,82),
								   (103,1060,1,83),
								   (103,1060,1,84),
								   (104,1060,2,85),
								   (104,1060,2,86),
								   (104,1060,2,87),
								   (105,1060,2,88),
								   (105,1060,2,89),
								   (105,1060,2,90),
								   (105,1060,2,91),


								   --27
								   (106,1060,2,81),
								   (107,1060,1,82),
								   (108,1060,1,83),
								   (109,1060,2,84),
								   (109,1060,2,85),
								   (110,1060,2,86),


								   --28
								   (111,1060,2,81),
								   (111,1060,2,82),
								   (112,1060,3,83),
								   (112,1060,3,84),
								   (112,1060,3,85),
								   (112,1060,3,86),
								   (113,1060,2,87),
								   (113,1060,2,88),
								   (114,1060,3,89),
								   (114,1060,3,90),
								   (114,1060,3,91),


								   --29
								   (115,1060,2,81),
								   (115,1060,2,82),
								   (115,1060,2,83),
								   (116,1060,2,84),
								   (116,1060,2,85),
								   (116,1060,2,86),
								   (116,1060,2,87),
								   (117,1060,3,88),
								   (117,1060,3,89),
								   (117,1060,3,90),
								   (117,1060,3,91),

								   --30
								   (118,1060,3,81),
								   (118,1060,3,82),
								   (118,1060,3,83),
								   (119,1060,2,84),
								   (119,1060,2,85),
								   (119,1060,2,86),
								   (120,1060,3,87),
								   (120,1060,3,88),
								   (120,1060,3,89),
								   (120,1060,3,90),
								   (121,1060,2,91),
								   (121,1060,2,92),
								   (121,1060,2,93),
								   (121,1060,2,94),
								   (121,1060,2,95)





INSERT INTO Tipos_Pagos VALUES ('Tarjeta de Credito'),
							   ('Tarjeta de Debito'),
							   ('Efectivo'),
							   ('Transferencia')

INSERT INTO Detalles_Tickets (id_ticket,id_tipo_pago,precio_venta,id_descuento,id_asiento_sala)
					Values		   (1,3,940,2,1),
								   (1,3,940,2,2),
								   (2,2,940,1,3),
								   (2,4,940,1,4),
								   (3,2,940,2,5),
								   (3,4,940,2,6),
								   (4,1,940,2,7),
								   (4,2,940,2,8),
								   (4,1,940,2,9),
								   (5,4,940,2,10),
								   (5,2,940,2,11),
								   (5,3,940,2,12),
								   (5,1,940,2,13),
								   --2
								   (6,1,940,2,7),
								   (6,1,940,2,8),
								   (6,4,940,2,9),
								   (7,2,940,2,10),
								   (7,3,940,2,11),
								   (7,3,940,2,12),
								   (7,4,940,2,13),
								   (8,2,940,1,1),
								   (8,4,940,1,2),
								   (8,4,940,1,3),
								   (8,4,940,1,4),
								   (8,4,940,1,2),
								   (8,3,940,1,3),
								   (8,2,940,1,4),
								   (9,1,940,1,5),
								   (17,2,940,2,14),

								   --3
								   (10,1,940,2,6),
								   (10,2,940,2,7),
								   (10,1,940,2,8),
								   (10,1,940,1,9),
								   (11,2,940,2,10),
								   (11,3,940,2,11),
								   (11,3,940,2,12),
								   (11,2,940,2,13),
								   (11,4,940,2,14),
								   (11,1,940,2,15),
								   (11,3,940,3,16),
								   (12,4,940,1,1),
								   (12,1,940,1,2),
								   (12,4,940,1,3),
								   (13,4,940,1,4),
								   (13,4,940,1,5),
								   (13,2,940,1,17),
								   (13,2,940,1,18),
								   (13,1,940,1,19),

								   --4
								   (14,3,940,1,1),
								   (14,2,940,1,2),
								   (14,1,940,1,3),
								   (14,4,940,1,4),
								   (15,3,940,2,5),
								   (15,3,940,2,6),
								   (15,1,940,2,7),
								   (15,2,940,2,8),
								   (16,2,940,2,9),
								   (16,2,940,2,10),
								   (16,4,940,2,11),
								   (16,4,940,2,12),
								   (16,2,940,2,13),
								   (14,4,940,1,14),
								   (16,4,940,2,15),
								   (16,2,940,2,16),

								   --5
								   (18,4,940,2,1),
								   (18,4,940,2,2),
								   (19,2,940,2,3),
								   (19,4,940,2,4),
								   (19,4,940,2,5),
								   (20,2,940,2,6),
								   (20,1,940,2,7),
								   (21,3,940,1,8),
								   (21,3,940,3,9),
								   (21,3,940,3,10),
								   (21,3,940,3,11),
								   (22,4,940,1,12),
								   (22,1,940,1,13),
								   (22,3,940,1,14),

								   --6
								   (23,2,940,2,1),
								   (23,3,940,2,2),
								   (23,1,940,2,3),
								   (24,2,940,1,4),
								   (24,4,940,1,5),
								   (25,4,940,2,6),
								   (25,3,940,2,7),
								   (25,1,940,2,8),
								   (25,1,940,2,9),
								   (25,2,940,2,10),
								   (25,3,940,2,11),
								   (26,1,940,2,12),
								   (26,3,940,2,13),
								   (26,2,940,2,14),
								   (26,4,940,2,15),
								   (26,4,940,2,16),
								   (26,3,940,2,17),

								   --7
								   (27,3,940,1,21),
								   (27,3,940,1,22),
								   (27,1,940,1,23),
								   (28,2,940,1,24),
								   (28,2,940,1,25),
								   (28,1,940,1,26),
								   (28,1,940,1,27),
								   (29,2,940,2,28),
								   (29,4,940,2,29),
								   (29,2,940,2,30),
								   (29,2,940,2,31),

								   --8
								   (30,2,940,3,21),
								   (30,3,940,3,22),
								   (30,1,940,3,23),
								   (30,4,940,3,24),
								   (30,3,940,3,25),
								   (30,2,940,3,26),
								   (30,3,940,3,27),
								   (31,3,940,2,28),
								   (31,2,940,2,29),
								   (31,2,940,2,30),
								   (31,4,940,2,31),
								   (32,2,940,1,32),
								   (32,2,940,1,33),
								   (32,4,940,1,34),
								   (32,1,940,1,35),
								   (32,3,940,1,36),
								   (33,1,940,2,37),
								   (33,2,940,2,38),
								   (33,4,940,2,39),
								   (33,1,940,2,40),

								   --9
								   (34,3,940,1,21),
								   (34,1,940,1,22),
								   (35,2,940,1,23),
								   (35,4,940,1,24),
								   (35,1,940,1,25),
								   (36,3,940,2,26),
								   (36,1,940,2,27),
								   (36,1,940,2,28),
								   (37,2,940,2,29),
								   (37,3,940,2,30),
								   (37,1,940,2,31),
								   (37,3,940,2,32),
								   (38,4,940,2,33),
								   (38,4,940,2,34),
								   (38,3,940,2,35),
								   (38,3,940,2,36),

								   --10
								   (39,4,940,1,21),
								   (39,1,940,1,22),
								   (39,3,940,1,23),
								   (39,2,940,1,24),
								   (39,2,940,1,25),
								   (39,3,940,1,26),
								   (40,3,941,1,27),
								   (40,1,940,1,28),
								   (40,4,940,1,29),
								   (40,2,940,1,30),
								   (40,4,940,1,31),


								   --11
								   (41,4,940,2,21),
								   (41,3,940,2,22),
								   (41,2,940,2,23),
								   (41,4,940,2,24),
								   (42,4,940,2,25),
								   (42,2,940,2,26),
								   (42,4,940,2,27),
								   (43,4,940,2,28),
								   (43,4,940,2,29),
								   (43,4,940,2,30),

								   --12
								   (44,4,940,3,21),
								   (44,2,940,3,22),
								   (44,3,940,3,23),
								   (44,1,940,3,24),
								   (44,3,940,3,25),
								   (44,2,940,3,26),
								   (44,4,940,3,27),
								   (45,3,940,2,28),
								   (45,4,940,2,29),
								   (45,1,940,2,30),
								   (45,1,940,2,31),
								   (45,1,940,2,32),
								   (45,4,940,2,33),
								   (46,3,940,3,34),
								   (46,4,940,3,35),

								   --13
								   (47,4,940,2,41),
								   (47,2,940,2,42),
								   (48,3,940,2,43),
								   (48,2,940,2,44),
								   (48,3,940,2,45),
								   (49,2,940,3,46),
								   (49,4,940,3,47),
								   (50,1,940,3,48),


								   --14
								   (51,4,940,2,41),
								   (51,1,940,2,42),
								   (51,1,940,2,43),
								   (51,1,940,2,44),
								   (52,3,940,3,45),
								   (52,4,940,3,46),
								   (52,3,940,3,47),
								   (53,2,940,2,48),
								   (53,2,940,2,49),
								   (54,1,940,2,50),
								   (54,2,940,2,51),

								   --15
								   (55,1,940,1,41),
								   (55,2,940,1,42),
								   (56,1,940,1,43),
								   (56,1,940,1,44),
								   (57,3,940,2,45),
								   (57,3,940,2,46),
								   (58,4,940,2,47),
								   (59,1,940,2,48),
								   (60,4,940,3,49),

								   --16
								   (61,1,940,2,41),
								   (61,1,940,2,42),
								   (61,4,940,2,43),
								   (61,1,940,2,44),
								   (62,3,940,3,45),
								   (62,2,940,3,46),
								   (62,1,940,3,47),
								   (62,1,940,3,48),
								   (63,4,940,2,49),
								   (64,3,940,2,50),
								   (64,4,940,2,51),

								   --17
								   (65,4,940,3,41),
								   (65,4,940,3,42),
								   (65,3,940,3,43),
								   (65,1,940,3,44),
								   (66,1,940,3,45),
								   (66,1,940,3,46),
								   (66,2,940,3,47),
								   (66,4,940,3,48),
								   (67,1,940,3,49),
								   (67,2,940,3,50),
								   (67,4,940,3,51),
								   (68,1,940,3,52),
								   (68,4,940,3,53),
								   (68,4,940,3,54),
								   (69,3,940,3,55),
								   (69,2,940,3,56),

								   --18
								   (70,2,940,1,41),
								   (70,4,940,1,42),
								   (70,3,940,1,43),
								   (70,2,940,1,44),
								   (71,1,940,2,45),
								   (71,2,940,2,46),
								   (71,3,940,2,47),
								   (71,1,940,2,48),
								   (71,4,940,2,49),
								   (71,2,940,2,50),
								   (72,1,940,1,51),
								   (72,1,940,1,52),
								   (72,1,940,1,53),
								   (73,4,940,2,54),
								   (73,3,940,2,55),

								   --19 sala 4
								   (74,4,1060,1,61),
								   (74,4,1060,1,62),
								   (74,4,1060,1,63),
								   (74,2,1060,1,64),
								   (75,3,1060,2,65),
								   (75,4,1060,2,66),
								   (75,2,1060,2,67),
								   (75,4,1060,2,68),
								   (76,4,1060,2,69),
								   (76,4,1060,2,70),
								   (76,2,1060,2,71),
								   (77,3,1060,2,72),
								   (77,4,1060,2,73),
								   (77,2,1060,2,74),
								   (77,3,1060,2,75),
								   (77,1,1060,2,76),
								   (77,1,1060,2,78),

								   --20
								   (78,4,1060,1,61),
								   (79,4,1060,1,62),
								   (79,2,1060,1,63),
								   (80,3,1060,2,64),
								   (80,4,1060,2,65),
								   (81,2,1060,2,66),
								   (81,3,1060,2,67),
								   (82,1,1060,1,68),
								   (82,1,1060,1,69),
								   (82,4,1060,1,70),

								   --21
								   (83,3,1060,1,61),
								   (83,1,1060,1,62),
								   (83,4,1060,1,63),
								   (84,3,1060,2,64),
								   (84,1,1060,2,65),
								   (84,2,1060,2,66),
								   (85,3,1060,2,67),
								   (85,3,1060,2,68),
								   (86,2,1060,2,68),
								   (86,4,1060,2,69),
								   (86,2,1060,2,70),

								   --22
								   (87,3,1060,2,61),
								   (87,3,1060,2,62),
								   (87,3,1060,2,63),
								   (87,3,1060,2,64),
								   (88,1,1060,2,65),
								   (88,3,1060,2,66),
								   (88,2,1060,2,67),
								   (88,2,1060,2,68),
								   (88,2,1060,2,69),
								   (89,2,1060,2,70),
								   (89,1,1060,2,71),
								   (89,3,1060,2,72),
								   (89,2,1060,2,73),
								   (89,2,1060,2,74),

								   --23
								   (90,3,1060,1,61),
								   (90,2,1060,1,62),
								   (90,1,1060,1,63),
								   (91,3,1060,1,64),
								   (91,4,1060,1,65),
								   (91,3,1060,1,66),
								   (92,1,1060,2,67),
								   (92,3,1060,2,68),
								   (92,1,1060,2,69),
								   (93,1,1060,3,70),
								   (93,1,1060,3,71),
								   (94,2,1060,2,72),
								   (94,1,1060,2,73),
								   (94,1,1060,2,74),

								   --24
								   (95,2,1060,3,61),
								   (95,4,1060,3,62),
								   (95,2,1060,3,63),
								   (95,1,1060,3,64),
								   (95,2,1060,3,65),
								   (95,2,1060,3,66),
								   (96,4,1060,1,67),
								   (96,2,1060,1,68),
								   (96,2,1060,1,69),
								   (97,2,1060,2,70),
								   (97,1,1060,2,71),
								   (97,3,1060,2,72),
								   (97,2,1060,2,73),
								   (98,2,1060,1,74),
								   (98,4,1060,1,75),
								   (98,1,1060,1,76),
								   (98,1,1060,1,77),


								   --25
								   (99,3,1060,2,81),
								   (100,4,1060,1,82),
								   (100,1,1060,2,83),
								   (101,4,1060,2,84),
								   (102,1,1060,1,85),
								   (102,1,1060,1,86),
								   (102,1,1060,1,87),


								   --26
								   (103,4,1060,1,81),
								   (103,3,1060,1,82),
								   (103,4,1060,1,83),
								   (103,3,1060,1,84),
								   (104,3,1060,2,85),
								   (104,4,1060,2,86),
								   (104,4,1060,2,87),
								   (105,4,1060,2,88),
								   (105,1,1060,2,89),
								   (105,2,1060,2,90),
								   (105,3,1060,2,91),


								   --27
								   (106,1,1060,2,81),
								   (107,2,1060,1,82),
								   (108,1,1060,1,83),
								   (109,1,1060,2,84),
								   (109,1,1060,2,85),
								   (110,2,1060,2,86),


								   --28
								   (111,2,1060,2,81),
								   (111,1,1060,2,82),
								   (112,4,1060,3,83),
								   (112,3,1060,3,84),
								   (112,3,1060,3,85),
								   (112,4,1060,3,86),
								   (113,1,1060,2,87),
								   (113,2,1060,2,88),
								   (114,3,1060,3,89),
								   (114,4,1060,3,90),
								   (114,4,1060,3,91),


								   --29
								   (115,1,1060,2,81),
								   (115,2,1060,2,82),
								   (115,4,1060,2,83),
								   (116,2,1060,2,84),
								   (116,1,1060,2,85),
								   (116,2,1060,2,86),
								   (116,1,1060,2,87),
								   (117,1,1060,3,88),
								   (117,3,1060,3,89),
								   (117,3,1060,3,90),
								   (117,4,1060,3,91),

								   --30
								   (118,1,1060,3,81),
								   (118,3,1060,3,82),
								   (118,3,1060,3,83),
								   (119,4,1060,2,84),
								   (119,4,1060,2,85),
								   (119,3,1060,2,86),
								   (120,3,1060,3,87),
								   (120,4,1060,3,88),
								   (120,4,1060,3,89),
								   (120,2,1060,3,90),
								   (121,3,1060,2,91),
								   (121,3,1060,2,92),
								   (121,2,1060,2,93),
								   (121,4,1060,2,94),
								   (121,2,1060,2,95)

--Se necesita obtener el total recaudado por pelicula.
select nombre_pelicula 'Pelicula' , gp.nombre_genero 'Genero',(select
sum(dt.precio_venta)
from
Tickets t
join
Funciones f on f.id_funcion = t.id_funcion
join
Detalles_Tickets dt on dt.id_ticket = t.id_ticket
where
f.id_pelicula = p.id_pelicula) 'Dinero recaudado'
from Peliculas p
join Generos_peliculas gp on gp.id_genero_pelicula = p.id_genero_pelicula
order by 3 desc
--Se necesita obtener al socio que mas entradas compro por funcion.
select c.apellido + ', ' + c.nombre 'Nombre cliente' , p.nombre_pelicula ' pelicula',
COUNT(dt.id_detalle_ticket) 'Cantidad de entradas compradas', FORMAT(f.horario,
'HH:mm') 'Horario funcion'
from Tickets t
join Detalles_Tickets dt on dt.id_ticket = t.id_ticket
join Funciones f on f.id_funcion = t.id_funcion
join Peliculas p on p.id_pelicula = f.id_pelicula
join Clientes c on c.id_cliente = t.id_cliente
where t.id_cliente = (
select top 1 tt.id_cliente
from Tickets tt
join Detalles_Tickets dtf on dtf.id_ticket = tt.id_ticket
join Clientes cc on cc.id_cliente = t.id_cliente
where cc.socio = 1
and dtf.id_ticket = tt.id_ticket
and t.id_funcion= tt.id_funcion
group by tt.id_cliente
order by count (dtf.id_ticket) desc
)
group by c.apellido + ', ' + c.nombre , p.nombre_pelicula , f.horario
order by 3 desc, 2 desc, 4 asc


--Gasto promedio por cliente en el dia 01/10/2022
set dateformat dmy
select c.nombre+','+c.apellido 'Cliente',t.fecha_ticket
'Fecha',AVG(dt.precio_venta)'Gasto Promedio',c.socio '¿Es socio?'
from Clientes c
join Tickets t on t.id_cliente=c.id_cliente
join Detalles_Tickets dt on dt.id_ticket=t.id_ticket
where c.id_cliente in (select id_cliente
from Tickets
where fecha_ticket='01/10/2022')
group by c.nombre+','+c.apellido, t.fecha_ticket ,c.socio
order by 3 desc




--Quienes fueron los que gastaron mas? gente mayor a 35 años o menores a 35 años, que hayan comprado
--al menos 4 tickets
select c.nombre+','+c.apellido 'Cliente',c.fecha_nac 'Fecha
Nacimiento',count(t.id_ticket)'Tickets', Sum(dt.precio_venta)'Gasto Total',c.socio
'¿Es socio?','Mayor a 35' Tipo
from Clientes c
join Tickets t on t.id_cliente=c.id_cliente
join Detalles_Tickets dt on dt.id_ticket=t.id_ticket
where year(c.fecha_nac) <= 1987
group by c.nombre+','+c.apellido,c.fecha_nac,c.socio
having count(t.id_ticket)>=4
union
select
c.nombre+','+c.apellido,c.fecha_nac,count(t.id_ticket),Sum(dt.precio_venta),c.socio,'Menor a 35'
from Clientes c
join Tickets t on t.id_cliente=c.id_cliente
join Detalles_Tickets dt on dt.id_ticket=t.id_ticket
where year(c.fecha_nac) > 1987
group by c.nombre+','+c.apellido,c.fecha_nac,c.socio
having count(t.id_ticket)>=4
order by 4 desc





--Cantidad de socios por provincia
select nombre_provincia, count(*) 'Cantidad de socios'
from clientes c join ciudades ci on c.id_ciudad = ci.id_ciudad join provincias pr on
pr.id_provincia = ci.id_provincia join paises p on p.id_pais = pr.id_pais
where p.id_pais = 1 and socio = 1
group by nombre_provincia
order by 2 desc




--Empleados y su antiguedad. Si su antiguedad es mayor a 10 anos indicar que le
--corresponden 21 dias de vacaciones. Si
--la antiguedad oscila entre 5 y 10 anios indicar que le corresponden 15 dias. Y si
--es entre 1 y 5 anios le corresponde
--una semana.
select e.id_empleado ,upper(apellido_empleado) + ',' + SPACE(1) + nombre_empleado
'Empleado', telefono 'Contacto' ,nombre_cargo 'Cargo', cuil,
case
when (datediff(year,fecha_ingreso,getdate()) > 10) then 'Le corresponden 21 días'
when (datediff(year,fecha_ingreso,getdate()) <= 10 and
(datediff(year,fecha_ingreso,getdate()) > 5)) then 'Le corresponden 15 días'
when (datediff(year,fecha_ingreso,getdate()) <= 5) then 'Le corresponden 7 días'
end[Vacaciones]
from Empleados e join Tipos_cargos tc on e.id_tipo_cargo = tc.id_tipo_cargo
join Tickets t on e.id_empleado = t.id_empleado join Detalles_Tickets dt on
t.id_ticket = dt.id_ticket
group by e.id_empleado ,apellido_empleado, nombre_empleado, telefono, nombre_cargo,
cuil, fecha_ingreso
order by id_empleado



-- Se necesita obtener aquellos clientes mayores a 21 años que hicieron reservas para
--peliculas de terror.
SELECT r.fecha_reserva 'Fecha de reserva' ,c.apellido+SPACE(1)+c.nombre Cliente,
(YEAR(GETDATE())-YEAR(c.fecha_nac)) 'Edad', p.nombre_pelicula Pelicula,
g.nombre_genero
from Clientes c
JOIN Reservas r ON r.id_cliente = c.id_cliente
JOIN Funciones f on f.id_funcion = r.id_funcion
JOIN Peliculas p ON p.id_pelicula = f.id_pelicula
JOIN Generos_peliculas g on g.id_genero_pelicula = p.id_genero_pelicula
WHERE c.fecha_nac in(SELECT c.fecha_nac
 FROM Clientes c
 WHERE (YEAR(GETDATE())-YEAR(c.fecha_nac)) > 21)
AND g.nombre_genero = 'Terror'



--Se necesita listar aquellos clientes del extranjero que vieron mas de una pelicula
--en el mes de Octubre.
select MONTH(t.fecha_ticket) 'Mes', c.apellido+SPACE(1)+c.nombre 'Cliente',
pa.nombre_pais, COUNT(t.id_ticket) 'Cantidad de peliculas'
from Clientes c
join Tickets t on t.id_cliente=c.id_cliente
JOIN Reservas r ON r.id_cliente = c.id_cliente
JOIN Ciudades ciu on ciu.id_ciudad = c.id_ciudad
JOIN Provincias pro on pro.id_provincia = ciu.id_provincia
JOIN Paises pa ON pa.id_pais = pro.id_pais
where pa.nombre_pais != 'Argentina'
AND c.id_cliente in (select id_cliente
from Tickets
where MONTH(fecha_ticket) = 10)
group by c.apellido+SPACE(1)+c.nombre ,t.fecha_ticket, pa.nombre_pais
HAVING COUNT(t.id_ticket) > 1
order by 2 desc