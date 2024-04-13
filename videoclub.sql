/* use + nombre entidad, para trabajar*/
use videoclub;

/* describe + nombre tabla*/
describe cliente;
describe pelicula;
describe proveedor;
describe transaccion;
describe videoclub;

/* quitar o agregar variables ALTER TABLE nombre_de_tabla
ADD nombre_de_variable tipo_de_dato;, lo uso par añadir las fk para realizar las relaciones */

ALTER TABLE  pelicula
ADD videoclub_Id int;

ALTER TABLE  transacicion
ADD clienteId int;

ALTER TABLE  videoclub
ADD Proveedor_Id int;

/* Genero las relaciones entre tablas: cliente-transaccion-pelicula// pelicula-videoclub-proveedor
ALTER TABLE pedidos
ADD CONSTRAINT fk_usuario
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
*/
ALTER TABLE transaccion
ADD CONSTRAINT fk_cliente_transaccion
FOREIGN KEY (cliente_Id) REFERENCES cliente(idCliente);

ALTER TABLE transaccion
ADD CONSTRAINT fk_transaccion_pelicula
FOREIGN KEY (clienteId) REFERENCES pelicula(idPelicula);

ALTER TABLE pelicula
ADD CONSTRAINT fk_pelicula_videoclub
FOREIGN KEY (cliente_Id) REFERENCES videoclu(idVideoclub);

ALTER TABLE videoclub
ADD CONSTRAINT fk_videoclub_proveedor
FOREIGN KEY (Proveedor_ID) REFERENCES cliente(idProveedor);

/* para borrar la relacion fk que hice:
ALTER TABLE pedidos
DROP FOREIGN KEY fk_usuario;*/

/* Ejemplo
ALTER TABLE transaccion
DROP foreign key fk_cliente_transaccion1;*/