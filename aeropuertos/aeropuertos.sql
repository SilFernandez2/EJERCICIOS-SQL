/*ejercicio 5*/
CREATE DATABASE aeropuertos;
use aeropuertos;
/*tablas
aeropurtos(@Id_Aeropuertos, Nombre_Aeropuerto, Ubicacion, Aeropuertoscol, @usoPistasId)
aviones(@id_avion, tipo_de_avion, cantidaddeaviones, cantidaddeasientos, @Id_vuelos)
checkin(@idCheckin, AeropuertosId, id_aerolinea, mostradorId)
lineasaereas(@Id_Aerolinea, Nombre_aerolinea, AvionId)
mostradores(ID_MOSTRADOR, numero, lugar_de_ubicacion, tipo_de_mostrador)
pasajero(Nro_documento, Nombre, tipo_documento, Id_cliente)
reserva(@ID_RESERVA, Id_cliente, Nro_de_vuelo, fecha_de_vencimiento, @idTipoMostrador)
tipodepista(@id_tipodepista, tipo)
usodepista(@id_pistausopista, @id_tipodepista, fecha_hora, @id_aeropuerto, id_avion)
vuelos(@id_vuelos, Tipo_de_vuelos, Fecha_de_salida, Hora_de_salida, Duracion, ciudad_origen, ciudad_destino , @reservaId)
*/

CREATE TABLE aeropuertos (
    Id_Aeropuertos INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_aeropuerto VARCHAR(255),
    Ubicacion VARCHAR(255),
    Aeropuertoscol VARCHAR(15),
    usoPistasId int
);

CREATE TABLE aviones (
    id_avion INT AUTO_INCREMENT PRIMARY KEY,
    tipo_de_avion VARCHAR(255),
    cantidad_de_aviones int,
    Id_vuelos int
);

CREATE TABLE checkin (
    idCheckin INT AUTO_INCREMENT PRIMARY KEY,
    id_aerolinea int,
    AeropuertosId int,
    mostradorId int
);

CREATE TABLE lineasaereas (
    Id_Aerolinea INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_aerolinea VARCHAR(255),
    AvionID int
);
CREATE TABLE mostradores (
    ID_MOSTRADOR INT AUTO_INCREMENT PRIMARY KEY,
    numero int,
    lugar_de_ubicacion VARCHAR(255),
    tipo_de_mostrador int
);

CREATE TABLE tipodemostrador (
    Id_mostrador INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255)
);

CREATE TABLE pasajero (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    tipo_de_documento varchar(15),
    Nro_documento int
);
CREATE TABLE reserva (
    ID_RESERVA INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente int,
    Nro_de_vuelo int,
   Fecha_de_vencimiento int
);
alter table reserva 
add column idTipoMostrador int;

ALTER TABLE reserva
MODIFY COLUMN Fecha_de_vencimiento DATE;

CREATE TABLE tipodepista (
    id_tipodepista INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(15)
);
CREATE TABLE usodepista (
    id_pistausopista INT AUTO_INCREMENT PRIMARY KEY,
    id_tipodepista int,
    Fecha_hora int,
    id_aeropuerto int,
    id_avion int
);
CREATE TABLE vuelos (
    id_vuelos INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_de_vuelo VARCHAR(255),
    Fecha_de_salida int,
    Hora_de_salida int, 
    Duracion int,
    ciudad_origen varchar(255),
    ciudad_destino varchar(255),
    reservaId int
);
-- Cambiar el tipo de dato de Fecha_de_salida a DATE
ALTER TABLE vuelos
MODIFY COLUMN Fecha_de_salida DATE;

-- Cambiar el tipo de dato de Hora_de_salida a TIME
ALTER TABLE vuelos
MODIFY COLUMN Hora_de_salida TIME;

-- ver tablas

describe aeropueros;
describe aviones;
describe checkin;
describe lineasaereas;
describe mostradores;
describe pasajero;
describe reserva;
describe usodepista;
describe tipodepista;
describe vuelos;

/* las relaciones son:

fk_aeropuertos_checkin*/

ALTER TABLE checkin
ADD CONSTRAINT fk_aeropuertos_checkin
FOREIGN KEY (AeropuertosId) REFERENCES aeropuertos(Id_Aeropuertos)
ON DELETE CASCADE;


/*fk_checkin_lineasaereas*/
ALTER TABLE checkin
ADD CONSTRAINT fk_checkin_lineasaereas
FOREIGN KEY (id_aerolinea) REFERENCES lineasaereas(Id_Aerolinea)
ON DELETE CASCADE;

/*fk_lineasaereas_aviones*/
ALTER TABLE lineasaereas
ADD CONSTRAINT fk_lineasaereas_aviones
FOREIGN KEY (AvionID) REFERENCES aviones(id_avion)
ON DELETE CASCADE;

/*fk_aviones_vuelos*/
ALTER TABLE aviones
ADD CONSTRAINT fk_aviones_vuelos
FOREIGN KEY (Id_vuelos) REFERENCES vuelos(id_vuelos)
ON DELETE CASCADE;

/*fk_vuelos_reserva*/
alter table vuelos
add constraint fk_vuelos_reserva
foreign key (reservaId) references reserva(ID_RESERVA)
ON DELETE CASCADE;
select *from vuelos;
select *from lineasaereas;
select *from aviones;

/*fk_reserva_pasajero*/
alter table reserva
add constraint fk_reserva_pasajero
foreign key (Id_cliente) references pasajero(id_cliente)
ON DELETE CASCADE;
describe usodepista;

/*fk_reserva_tipodemostrador*/
alter table reserva 
add constraint fk_reserva_tipomostrador
foreign key (idTipoMostrador) references tipodemostrador(Id_mostrador)
ON DELETE CASCADE;

/*fk_aeropuertos_usodepista*/
alter table aeropuertos
add constraint fk_aeropuertos_usodepista
foreign key (usoPistasId) references usodepista(id_pistausopista)
ON DELETE CASCADE;
select *from vuelos;
select *from lineasaereas;

/* tengo que añadir la relacion vuelos_lineasaereas para encontrar los vuelos de AA en año 2011*/
alter table vuelos
add column lineaID int;
alter table vuelos
add constraint fk_vuelos_lineasaereas
foreign key (lineaID) references lineasaereas(id_Aerolinea)
ON DELETE CASCADE;

/*fk_usodepista_aviones*/
alter table usodepista
add constraint fk_usodeopista_aviones
foreign key (id_avion) references aviones(id_avion)
ON DELETE CASCADE;

/*fk_usodepista_tipodepista*/
alter table usodepista
add constraint fk_usodepista_tipodepista
foreign key (id_tipodepista) references tipodepista(id_tipodepista)
ON DELETE CASCADE;

/*fk_checkin_mostradores*/
alter table checkin
add constraint fk_checkin_mostradores
foreign key (mostradorId) references mostradores(ID_MOSTRADOR)
ON DELETE CASCADE;

/* los ID_MOSTRADOR empiezan desde el 4 (no se por que) por lo que hay que ingresar nuevos datos 
desde el 4 en adelante*/

/* fk_mostradores_tipodemostradores*/
alter table mostradores
add constraint fk_mostradores_tipodemostrador
foreign key (tipo_de_mostrador) references tipodemostrador(Id_mostrador)
ON DELETE CASCADE;


/*añado datos*/

INSERT INTO tipodemostrador (tipo)
VALUES ('turista'), ('primera clase'), ('business');

INSERT INTO mostradores (numero, lugar_de_ubicacion, tipo_de_mostrador) VALUES
(4, 'Ubicacion 1', 1),
(5, 'Ubicacion 1', 2),
(6, 'Ubicacion 1', 3);

INSERT INTO tipodepista (tipo)
VALUES ('despegue'), ('aterrizaje');

INSERT INTO lineasaereas (Nombre_aerolinea) VALUES
('Aerolíneas Argentinas'),
('Iberia'),
('Air France');

INSERT INTO pasajero (Nombre, tipo_de_documento, Nro_documento)
VALUES ('Juan Perez', 'DNI', 12345678),
       ('Maria Lopez', 'Pasaporte', 98765432),
       ('Hugo López', 'DNI', 12345679),
       ('Marta García', 'Pasaporte', 99765432);



INSERT INTO reserva (id_cliente, Nro_de_vuelo, Fecha_de_vencimiento, idTipoMostrador)
VALUES (1, 1, '2015-05-15',3),
       (2, 2, '2015-05-20',3),
       (3, 2, '2014-05-20',3),
       (4, 1, '2012-05-15',3);

select * from reserva;
INSERT INTO vuelos (Tipo_de_vuelo, Fecha_de_salida, Hora_de_salida, Duracion, ciudad_origen, ciudad_destino, reservaId, lineaID)
VALUES ('charter', '2011-03-01', '08:00:00', 5, 'Buenos Aires', 'Madrid', 9, 1),
       ('de linea', '2011-03-15', '10:00:00', 9, 'Madrid', 'Buenos Aires', 10, 2),
       ('charter', '2011-03-03', '08:00:00', 5, 'Buenos Aires', 'Madrid', 11, 3),
       ('despegue', '2011-03-01', '08:00:00', 5, 'Buenos Aires', 'Madrid', 12, 1)
       ;
	select * from vuelos;
INSERT INTO aviones (tipo_de_avion, cantidad_de_aviones, Id_vuelos )
VALUES ('avionetas', 5,5),
       ('aviones medianos', 10, 6),
       ('aviones boeing', 3, 7);

INSERT INTO aeropuertos (Nombre_aeropuerto, Ubicacion, Aeropuertoscol)
VALUES ('Aeropuerto Internacional Ministro Pistarini', 'Buenos Aires', 'EZE'),
       ('Aeropuerto Jorge Newbery', 'Buenos Aires', 'AEP'),
       ('Aeropuerto Internacional Jorge Chávez', 'Lima', 'LIM');
	select * from mostradores;
    
INSERT INTO checkin (AeropuertosId, id_aerolinea, mostradorId) 
VALUES 
(4, 1, 1),  -- Asociamos el aeropuerto 1 con la aerolínea 1
(4, 2, 2),  -- Asociamos el aeropuerto 1 con la aerolínea 2
(4, 3, 3);  -- Asociamos el aeropuerto 1 con la aerolínea 3
       

       


   
INSERT INTO usodepista (id_tipodepista, Fecha_hora, id_aeropuerto, id_avion)
VALUES (1, UNIX_TIMESTAMP('2011-03-01 08:00:00'), 4, 1),
       (2, UNIX_TIMESTAMP('2011-03-15 10:00:00'), 4, 2);