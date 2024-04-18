CREATE DATABASE videoclub;
use videoclub;
/*creo las tablas:
cliente(@idCliente, Nombre, Email, Num_celular, @clienteId)
pelicula(@idPelicula, Genero, Año, Stock, @videoclub_id)
proveedor(@idProveedor, Stock_de_peliculas, Datos_del_Proveedor)
transaccion(@idTransaccion, Tipo, Fecha, @ClienteId)
videoclub(@idVideoclub, Contacto, @Proveedor_Id, @videoclubId)*/

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Email VARCHAR(255),
    Num_celular VARCHAR(15)
);

ALTER TABLE  transaccion
ADD clienteId int;

CREATE TABLE pelicula (
    idPelicula INT AUTO_INCREMENT PRIMARY KEY,
    Genero VARCHAR(255),
    Año int,
    Stock int
);

ALTER TABLE  pelicula
ADD videoclub_Id int;

CREATE TABLE transaccion (
    idTransaccion INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(255),
    Fecha int
);
CREATE TABLE proveedor (
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    Stock_de_peliculas int,
    Datos_del_Proveedor VARCHAR(255)
);

ALTER TABLE  videoclub
ADD Proveedor_Id int;

CREATE TABLE videoclub (
    idVideoclub INT AUTO_INCREMENT PRIMARY KEY,
    Contacto VARCHAR(255)
);

/*ver tablas*/
describe cliente;
describe pelicula;
describe proveedor;
describe transaccion;
describe videoclub;

/* Genero las relaciones entre tablas: cliente-transaccion-pelicula// 
          pelicula-videoclub-proveedor*/
          
ALTER TABLE transaccion
ADD CONSTRAINT fk_cliente_transaccion
FOREIGN KEY (clienteId) REFERENCES cliente(idCliente);

ALTER TABLE transaccion
ADD CONSTRAINT fk_transaccion_pelicula
FOREIGN KEY (clienteId) REFERENCES pelicula(idPelicula);

ALTER TABLE pelicula
ADD CONSTRAINT fk_pelicula_videoclub
FOREIGN KEY (videoclub_Id) REFERENCES videoclub(idVideoclub);

ALTER TABLE videoclub
ADD CONSTRAINT fk_videoclub_proveedor
FOREIGN KEY (Proveedor_ID) REFERENCES proveedor(idProveedor);
