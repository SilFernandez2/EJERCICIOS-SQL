/*ejercicio 4 */
CREATE DATABASE agenciaDeViajes;
USE agenciaDeViajes;

/*tablas
cliente(@id_cliente, nombre, direccion, telefono, ocupacion, @id_pago*)
grupoFamiliar(@id_miembro, nombre_relacion, @id_cliente)
pagos(@id_pago, fecha_cuota, monto, nombreDelGuia, fecha_dePago, @id_tipo, @id_Cliente, @id_tours)
tipoDePago(@id_tipoDePago, tipo)
tours(@id_tours, fecha_horaLlegada, fecha_horaSalida, nombreDelGuia, cantidadDePlazas, @id_escala, @id_guia)
escalas(@id_escalas, @id_especialista, nombre_escla, hora_dia_llegada, tiempo_de_estadia)
especialistas(@id_especialistas, Nombre, @idSueldo)
guia(@id_guia,  @id_sueldo, cantidad_deTours, antiguedad)
sueldo(@id_sueldo, sueldo_basico, @id_adicional)
*/

CREATE TABLE cliente (
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(255) NOT NULL,
 direccion VARCHAR(255) NOT NULL,
 telefono VARCHAR(20),
 ocupacion VARCHAR(100)
);


CREATE TABLE grupoFamiliar (
 id_miembro INT PRIMARY KEY AUTO_INCREMENT,
 nombre VARCHAR(255) NOT NULL,
 relacion VARCHAR(100) NOT NULL,
 id_cliente INT
);


CREATE TABLE pagos (
 id_pago INT PRIMARY KEY AUTO_INCREMENT,
 fecha_cuota DATE NOT NULL,
 monto DECIMAL(10,2) NOT NULL,
 nombreDelGuia VARCHAR(255),
 fecha_dePago DATE,
 id_tipo INT,
 id_Cliente int,
 id_tours int
);


CREATE TABLE tipoDePago (
 id_tipoDePago INT PRIMARY KEY AUTO_INCREMENT,
 tipo VARCHAR(50) NOT NULL
);


CREATE TABLE tours (
 id_tours INT PRIMARY KEY AUTO_INCREMENT,
 fecha_horaLlegada DATETIME NOT NULL,
 fecha_horaSalida DATETIME NOT NULL,
 nombreDelGuia VARCHAR(255),
 cantidadDePlazas INT NOT NULL,
 id_escala int,
 id_guia int
);

CREATE TABLE guia (
 id_guia INT PRIMARY KEY AUTO_INCREMENT,
 id_sueldo INT,
 cantidad_deTours INT NOT NULL,
 antiguedad INT NOT NULL
);


CREATE TABLE sueldo (
 id_sueldo INT PRIMARY KEY AUTO_INCREMENT,
 sueldo_basico DECIMAL(10,2) NOT NULL,
 id_adicional INT
);

CREATE TABLE especialistas (
 id_especialistas INT PRIMARY KEY AUTO_INCREMENT,
 Nombre VARCHAR(255) NOT NULL,
 idSueldo int
);

CREATE TABLE escalas (
 id_escalas INT PRIMARY KEY AUTO_INCREMENT,
 id_especialista INT,
 nombre_escala VARCHAR(255) NOT NULL,
 hora_dia_llegada TIME NOT NULL,
 tiempo_de_estadia INT NOT NULL
);
/* Añadir las relaciones */

/* cliente-grupofamiliar*/
alter table grupoFamiliar
add constraint fk_grupoFamiliar_cliente
foreign key (id_cliente) references cliente(id_cliente)
ON DELETE CASCADE;
/* cliente-pagos */

alter table pagos
add constraint fk_cliente_pagos
foreign key (id_Cliente) references cliente(id_cliente)
ON DELETE CASCADE;

/* pagos_tours */
alter table pagos
add constraint fk_pagos_tours
foreign key (id_tours) references tours(id_tours)
ON DELETE CASCADE;

/* tours-escalas */
alter table tours
add constraint fk_tours_escalas
foreign key (id_escala) references escalas(id_escalas)
ON DELETE CASCADE;

/*  tours-guia */
alter table tours
add constraint fk_guia_tours
foreign key (id_guia) references guia(id_guia)
ON DELETE CASCADE;

/* escalas-especialista */
alter table escalas
add constraint fk_escalas_especialista
foreign key (id_especialista) references especialistas(id_especialistas)
ON DELETE CASCADE;

/* especialista_sueldo y guia-sueldo */
alter table especialistas
add constraint fk_especialistas_sueldo
foreign key (idSueldo) references sueldo(id_sueldo)
ON DELETE CASCADE;

alter table guia
add constraint fk_guia_sueldo
foreign key (id_sueldo) references sueldo(id_sueldo)
ON DELETE CASCADE;

/* pagos-tipodepagos */
alter table pagos
add constraint fk_pagos_tipoDePagos
foreign key (id_tipo) references tipoDePago(id_tipoDePago)
ON DELETE CASCADE;

/* Añado registros a las tablas */

INSERT INTO cliente (nombre,direccion, telefono, ocupacion) values
("Juan", "Lacroze 1234", 47123233, "Obrero"),
("Jorge", "Jujuy 1234", 47112233, "Operario"),
("Fulano", "Falucho 1234", 47134433, "Abogado"),
("Camila", "Primera Junta 1234", 47145533, "Repositora"),
("Hugo Lopez", "Roldan 1234", 47156633, "Cocinero");


INSERT INTO TipoDePago (tipo) VALUES 
("Efectivo"),
("Credito"),
("Debito");

INSERT INTO grupofamiliar (nombre, relacion,id_cliente) VALUES 
("Julian","Hermano",1),
("Omar","Hijo",1),
("Ana","Madre",2),
("Santiago","Padre",2),
("Alejandro","Hijo",1),
("Sabrina","Hija",4),
("Hugo jr", "Hijo",5);


INSERT INTO sueldo (sueldo_basico, id_adicional) VALUES 
(10000,5000),
(20000,2000),
(26000,1000),
(35000,5000);

INSERT INTO especialistas (nombre,idsueldo) VALUES 
("Sebastian", 1),
("Santiago", 3);

INSERT INTO guia (id_sueldo, cantidad_detours, antiguedad) VALUES
(2,15,3),
(2,25,3),
(3,35,1),
(4,15,7);

INSERT INTO escalas (id_especialista, nombre_escala, hora_dia_llegada, tiempo_de_estadia) VALUES 
(1,"Puerto Blest", "08:00:00",1),
(1,"Isla Victoria", "10:30:00",3),
(2,"Cerro Tronador", "09:00:00",1),
(2,"Circuito Chico", "11:00:00",4),
(1,"Cerro Catedral", "08:00:00",2),
(2,"Puerto Blest", "13:00:00",1);

INSERT INTO tours (fecha_horallegada, fecha_horasalida, nombredelguia, cantidaddeplazas, id_escala, id_guia) VALUES
("2024-04-16 07:00:00","2024-04-17 07:00:00","Sabrina",10,1,1),
("2024-04-22 09:00:00","2024-04-25 09:00:00","Luis",8,2,2),
("2024-04-25 10:00:00","2024-04-26 10:00:00","Marcelo",12,6,3),
("2024-04-28 10:00:00","2024-05-02 10:00:00","Esteban",8,4,4),
("2024-05-29 07:00:00","2024-05-31 07:00:00","Luis",6,4,2);

INSERT INTO pagos (fecha_cuota,monto,nombredelguia,fecha_depago,id_tipo,id_cliente,id_tours) VALUES
("2024-04-02",4000,"Sabrina","2024-04-02",1,1,1),
("2024-04-02",8000,"Luis","2024-04-02",3,1,2),
("2024-04-02",6000,"Marcelo","2024-04-02",3,1,3),
("2024-04-09",3000,"Sabrina","2024-04-09",3,2,1),
("2024-04-15",1000,"Luis","2024-04-15",1,3,2),
("2024-04-15",4000,"Esteban","2024-04-15",1,3,4),
("2024-04-21",3000,"Marcelo","2024-04-21",3,4,3),
("2024-04-22",10000,"Luis","2024-04-22",3,5,5);
