use aeropuertos;
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
/*tengo que añadir la fk en checkin*/
Alter table checkin
add AeropuertosID int;
ALTER TABLE checkin
ADD CONSTRAINT fk_aeropuertos_checkin
FOREIGN KEY (AeropuertosID) REFERENCES aeropuertos(Id_Aeropuertos);

/*fk_checkin_lineasaereas*/
ALTER TABLE checkin
ADD CONSTRAINT fk_checkin_lineasaereas
FOREIGN KEY (AeropuertosID) REFERENCES lineasaereas(Id_Aerolinea);

/*fk_lineasaereas_aviones*/
Alter table lineasaereas
add AvionID int;
ALTER TABLE lineasaereas
ADD CONSTRAINT fk_lineasaereas_aviones
FOREIGN KEY (AvionID) REFERENCES aviones(id_avion);

/*fk_aviones_vuelos*/
ALTER TABLE aviones
ADD CONSTRAINT fk_aviones_vuelos
FOREIGN KEY (Id_Aerolineas) REFERENCES vuelos(id_vuelos);

/*fk_vuelos_reserva*/
alter table vuelos
add reservaId int;
alter table vuelos
add constraint fk_vuelos_reserva
foreign key (reservaId) references reserva(ID_RESERVA); 

/*fk_reserva_pasajero*/
alter table reserva
add constraint fk_reserva_pasajero
foreign key (Id_cliente) references pasajero(Nro_documento);

/*fk_aeropuertos_usodepista*/
alter table aeropuertos
add usoPistasId int; 
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
add mostradorId int;
alter table checkin
add constraint fk_checkin_mostradores
foreign key (mostradorId) references mostradores(ID_MOSTRADOR);
describe checkin;
alter table checkin
drop id_mostrador;
