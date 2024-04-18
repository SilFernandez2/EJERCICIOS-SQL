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

/*punto d, ejercicio 9: 