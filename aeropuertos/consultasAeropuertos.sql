use aeropuertos;

/*punto b ejercicio 9: b.	Seleccionar los Vuelos de la Linea Aerolineas Argentina que despegaron 
en el mes de Marzo de 2011. */
SELECT *
FROM vuelos v
JOIN lineasaereas la ON v.lineaID = la.Id_Aerolinea
WHERE la.Nombre_aerolinea = 'Aerolíneas Argentinas'
AND v.Fecha_de_salida BETWEEN '2011-03-01' AND '2011-03-31';

/*punto c ejercicio 9 Seleccionar las personas que volaron en Bussiness a Madrid.*/

SELECT p.Nombre AS Nombre_Pasajero
FROM pasajero p
JOIN reserva r ON p.Id_Cliente = r.id_cliente
JOIN vuelos v ON v.reservaId = r.ID_RESERVA
JOIN tipodemostrador t ON r.IdTipoMostrador = t.Id_mostrador
WHERE t.tipo = 'business' AND v.ciudad_destino = 'Madrid';

/*punto d:	Informar la reserva de “Hugo López” para el mes que viene.*/
select * from pasajero; 
select * from reserva;
select * from vuelos;

SELECT r.ID_RESERVA, p.Nombre AS Nombre_pasajero, v.Fecha_de_salida, v.ciudad_origen, v.ciudad_destino, r.Fecha_de_vencimiento
FROM reserva r
JOIN pasajero p ON r.id_cliente = p.Id_Cliente
JOIN vuelos v ON r.ID_RESERVA = v.reservaId
WHERE p.Nombre = "Hugo López" 
AND MONTH(r.Fecha_de_vencimiento) = MONTH(CURRENT_DATE()) + 1;



/* punto e:  Insertar en una tabla un registro completo. Imprimir una consulta previa (QUERY)
		en donde se evidencie que el registro no existía y luego la misma con ese registro. 
        Incluir el código.*/
select * from pasajero;
INSERT INTO pasajero (Nombre, tipo_de_documento, Nro_documento)
VALUES ('Zara cheta', 'DNI', 42345678);
select * from pasajero;
        
/* punto f: f.	Eliminar de una tabla un registro completo. 
   Imprimir una consulta previa (QUERY) en donde se muestre el registro y luego 
   la misma sin ese registro. Incluir el código.*/
   SELECT p.Nombre AS Nombre_pasajero, p.tipo_de_documento, p.Nro_documento, r.Nro_de_vuelo, r.Fecha_de_vencimiento, r.idTipoMostrador
   FROM pasajero p
   INNER JOIN reserva r ON p.Id_Cliente = r.id_cliente;
   
   DELETE FROM pasajero WHERE Nombre = 'Marta García';
   
	SELECT p.Nombre AS Nombre_pasajero, p.tipo_de_documento, p.Nro_documento, r.Nro_de_vuelo, r.Fecha_de_vencimiento, r.idTipoMostrador
   FROM pasajero p
   INNER JOIN reserva r ON p.Id_Cliente = r.id_cliente;

/* punto g: g.	Hacer una consulta que indexe en otro orgen que no sea la clave primaria.*/
SELECT v.*, a.tipo_de_avion, a.cantidad_de_aviones
FROM vuelos v
INNER JOIN aviones a ON v.Id_vuelos = a.Id_vuelos
ORDER BY a.cantidad_de_aviones;


/* punto h: h.	Hacer una consulta que agrupe datos e indique cantidad de registros que cumplen 
   la agrupación de datos, ordenando en orden descendente.*/
   /*  consulta que agrupa los vuelos por ciudad de destino y que indique la cantidad de vuelos que
   tienen esa misma ciudad como destino, ordenando el resultado en orden descendente por cantidad de vuelos. */
   SELECT ciudad_destino, COUNT(*) AS cantidad_vuelos
	FROM vuelos
	GROUP BY ciudad_destino
	ORDER BY cantidad_vuelos DESC;

/* punto i: i.	Utilizar InnerJoin
Utilizamos Inner Join para combinar las tablas vuelos y aviones para mostrar información detallada
 sobre los vuelos y los aviones asociados.*/
SELECT v.*, a.tipo_de_avion, a.cantidad_de_aviones
FROM vuelos v
INNER JOIN aviones a ON v.Id_vuelos = a.Id_vuelos;

/* punto j: j.	Utilizar OuterJoin 
Usamos Outer Join para mostrar todos los pasajeros junto con la información de sus reservas, 
incluyendo aquellos pasajeros que no tienen reservas asociadas.*/

SELECT p.Nombre AS Nombre_pasajero, r.Nro_de_vuelo, r.Fecha_de_vencimiento
FROM pasajero p
LEFT JOIN reserva r ON p.Id_cliente = r.id_cliente;

/*punto k: k.	Aplicar los conocimientos adquiridos de optimización de consultas*/

