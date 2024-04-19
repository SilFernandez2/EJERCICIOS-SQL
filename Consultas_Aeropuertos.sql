use aeropuertos2;

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

SELECT r.ID_RESERVA, p.Nombre AS Nombre_pasajero, v.Fecha_de_salida, v.ciudad_origen, v.ciudad_destino, r.Fecha_de_vencimiento
FROM reserva r
JOIN pasajero p ON r.id_cliente = p.Id_Cliente
JOIN vuelos v ON r.Nro_de_vuelo = v.id_vuelos
WHERE p.Nombre = "Hugo López" 
AND MONTH(r.Fecha_de_vencimiento) = MONTH(CURRENT_DATE()) + 1;


/* punto e:  Insertar en una tabla un registro completo. Imprimir una consulta previa (QUERY)
		en donde se evidencie que el registro no existía y luego la misma con ese registro. 
        Incluir el código.*/
        
/* punto f: f.	Eliminar de una tabla un registro completo. 
   Imprimir una consulta previa (QUERY) en donde se muestre el registro y luego 
   la misma sin ese registro. Incluir el código.*/
/* punto g: g.	Hacer una consulta que indexe en otro orgen que no sea la clave primaria.*/
/* punto h: h.	Hacer una consulta que agrupe datos e indique cantidad de registros que cumplen 
   la agrupación de datos, ordenando en orden descendente.*/
/* punto i: i.	Utilizar InnerJoin*/
/* punto j: j.	Utilizar OuterJoin */
/*punto k: k.	Aplicar los conocimientos adquiridos de optimización de consultas*/