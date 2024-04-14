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
reserva(@ID_RESERVA, Id_cliente, Nro_de_vuelo, fecha_de_vencimiento)
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
