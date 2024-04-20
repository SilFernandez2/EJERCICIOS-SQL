/*Ejercicio 4 */

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
/* id_datosGrupoFamiliar INT*/
);
alter table cliente
add column id_pago int;

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
describe cliente;
/* Añadir las relaciones */

/* cliente-grupofamiliar*/
alter table grupoFamiliar
add constraint fk_grupoFamiliar_cliente
foreign key (id_cliente) references cliente(id_cliente);
/* cliente-pagos */
describe cliente;
describe pagos;
alter table pagos
add constraint fk_cliente_pagos
foreign key (id_Cliente) references cliente(id_cliente);

/* pagos_tours */
alter table pagos
add constraint fk_pagos_tours
foreign key (id_tours) references tours(id_tours);

/* tours-escalas */
describe escalas;
alter table tours
add constraint fk_tours_escalas
foreign key (id_escala) references escalas(id_escalas);
describe guia;

/*  tours-guia */
alter table tours
add constraint fk_guia_tours
foreign key (id_guia) references guia(id_guia);

/* escalas-especialista */
alter table escalas
add constraint fk_escalas_especialista
foreign key (id_especialista) references especialistas(id_especialistas);

describe especialistas;

/* especialista_sueldo y guia-sueldo */
alter table especialistas
add constraint fk_especialistas_sueldo
foreign key (idSueldo) references sueldo(id_sueldo);
alter table guia
add constraint fk_guia_sueldo
foreign key (id_sueldo) references sueldo(id_sueldo);

/* pagos-tipodepagos */
alter table pagos
add constraint fk_pagos_tipoDePagos
foreign key (id_tipo) references tipoDePago(id_tipoDePago);