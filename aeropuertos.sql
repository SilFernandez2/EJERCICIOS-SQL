/*ejercicio Aeropuertos*/

CREATE DATABASE aeropuertos;

use aeropuertos;

/*tablas
aeropuertos(@Id_Aeropuertos, Nombre_Aeropuerto, Ubicacion, Aeropuertoscol, @usoPistasId)
aviones(@id_avion, tipo_de_avion, cantidad_de_aviones, cantidad_de_asientos, @Id_vuelos)
checkin(@idCheckin, AeropuertosId, @id_aerolinea, @mostradorId)
lineasaereas(@Id_Aerolinea, Nombre_aerolinea, @AvionId)
mostradores(@ID_MOSTRADOR, numero, lugar_de_ubicacion, @tipo_de_mostrador)
tipodemostrador(@Id_mostrador, tipo)
pasajero(@Id_cliente,  Nombre, tipo_de_ocumento, Nro_documento )
reserva(@ID_RESERVA, @Id_cliente, Nro_de_vuelo, fecha_de_vencimiento, @idTipoMostrador)
tipodepista(@id_tipodepista, tipo)
usodepista(@id_pistausopista, @id_tipodepista, fecha_hora, @id_aeropuerto, @id_avion)
vuelos(@id_vuelos, Tipo_de_vuelos, Fecha_de_salida, Hora_de_salida, Duracion, ciudad_origen, ciudad_destino , @reservaId, lineaID)
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
   Fecha_de_vencimiento date
);

CREATE TABLE tipodepista (
    id_tipodepista INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(15)
);

CREATE TABLE usodepista (
    id_pistausopista INT AUTO_INCREMENT PRIMARY KEY,
    id_tipodepista int,
    Fecha_hora date,
    id_aeropuerto int,
    id_avion int
);

CREATE TABLE vuelos (
    id_vuelos INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_de_vuelo VARCHAR(255),
    Fecha_de_salida date,
    Hora_de_salida time, 
    Duracion int,
    ciudad_origen varchar(255),
    ciudad_destino varchar(255),
    reservaId int
);

/*ver tablas*/
describe aeropuertos;
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
FOREIGN KEY (AeropuertosId) REFERENCES aeropuertos(Id_Aeropuertos);

/*fk_checkin_lineasaereas*/
ALTER TABLE checkin
ADD CONSTRAINT fk_checkin_lineasaereas
FOREIGN KEY (id_aerolinea) REFERENCES lineasaereas(Id_Aerolinea);

/*fk_lineasaereas_aviones*/
ALTER TABLE lineasaereas
ADD CONSTRAINT fk_lineasaereas_aviones
FOREIGN KEY (AvionID) REFERENCES aviones(id_avion);

/*fk_aviones_vuelos*/
ALTER TABLE aviones
ADD CONSTRAINT fk_aviones_vuelos
FOREIGN KEY (Id_vuelos) REFERENCES vuelos(id_vuelos);

/* fk_vuelos_lineasaereas*/
alter table vuelos
add constraint fk_vuelos_lineasaereas
foreign key (lineaID) references lineasaereas(id_Aerolinea);

/*fk_vuelos_reserva*/
alter table vuelos
add constraint fk_vuelos_reserva
foreign key (reservaId) references reserva(ID_RESERVA); 

/*fk_reserva_pasajero*/
alter table reserva
add constraint fk_reserva_pasajero
foreign key (Id_cliente) references pasajero(id_cliente);
describe usodepista;

/*fk_aeropuertos_usodepista*/
alter table aeropuertos
add constraint fk_aeropuertos_usodepista
foreign key (usoPistasId) references usodepista(id_pistausopista);

/*fk_usodepista_aviones*/
alter table usodepista
add constraint fk_usodeopista_aviones
foreign key (id_avion) references aviones(id_avion); 

/*fk_usodepista_tipodepista*/
alter table usodepista
add constraint fk_usodepista_tipodepista
foreign key (id_tipodepista) references tipodepista(id_tipodepista);

/*fk_checkin_mostradores*/
alter table checkin
add constraint fk_checkin_mostradores
foreign key (mostradorId) references mostradores(ID_MOSTRADOR);

/*relacion fk_mostradores_tipodemostrador*/
ALTER table mostradores
add constraint fk_mostradores_tipodemostrador
foreign key (tipo_de_mostrador) references tipodemostrador(Id_mostrador);


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

INSERT INTO checkin (AeropuertosId, id_aerolinea, mostradorId) 
VALUES 
(1, 1, 22),  -- Asociamos el aeropuerto 1 con la aerolínea 1
(1, 2, 23),  -- Asociamos el aeropuerto 1 con la aerolínea 2
(1, 3, 24);  -- Asociamos el aeropuerto 1 con la aerolínea 3
       
INSERT INTO aeropuertos (Nombre_aeropuerto, Ubicacion, Aeropuertoscol, usoPistasId)
VALUES ('Aeropuerto Internacional Ministro Pistarini', 'Buenos Aires', 'EZE', 1),
       ('Aeropuerto Jorge Newbery', 'Buenos Aires', 'AEP', 2),
       ('Aeropuerto Internacional Jorge Chávez', 'Lima', 'LIM', 3);
       
INSERT INTO vuelos (Tipo_de_vuelo, Fecha_de_salida, Hora_de_salida, Duracion, ciudad_origen, ciudad_destino, reservaId, lineaID)
VALUES ('charter', '2011-03-01', '08:00:00', 5, 'Buenos Aires', 'Madrid', 12, 1),
       ('de linea', '2011-03-15', '10:00:00', 9, 'Madrid', 'Buenos Aires', 13, 2),
       ('charter', '2011-03-03', '08:00:00', 5, 'Buenos Aires', 'Madrid', 14, 3),
       ('despegue', '2011-03-01', '08:00:00', 5, 'Buenos Aires', 'Madrid', 15, 1)
       ;

INSERT INTO pasajero (Nombre, tipo_de_documento, Nro_documento)
VALUES ('Juan Perez', 'DNI', 12345678),
       ('Maria Lopez', 'Pasaporte', 98765432),
       ('Hugo López', 'DNI', 12345679),
       ('Marta García', 'Pasaporte', 99765432);

INSERT INTO reserva (id_cliente, Nro_de_vuelo, Fecha_de_vencimiento, idTipoMostrador)
VALUES (1, 1, '2015-05-15',6),
       (2, 2, '2015-05-20',6),
       (4, 1, '2012-05-15',6),
       (3, 2, '2014-05-20',6);

INSERT INTO aviones (tipo_de_avion, cantidad_de_aviones, Id_vuelos )
VALUES ('avionetas', 5,1),
       ('aviones medianos', 10, 1),
       ('aviones boeing', 3, 1);
       
INSERT INTO usodepista (id_tipodepista, Fecha_hora, id_aeropuerto, id_avion)
VALUES (1, UNIX_TIMESTAMP('2011-03-01 08:00:00'), 1, 1),
       (2, UNIX_TIMESTAMP('2011-03-15 10:00:00'), 1, 2);

/*ver tablas con los datos*/
select *from aeropuertos;
select *from pasajero;
select *from vuelos;
select *from lineasaereas;
select *from reserva;
select *from vuelos;
select *from mostradores;
select *from tipodemostradores;
select *from checkin;
select *from aviones;
select *from tipodepista;
select *from usodepista;
