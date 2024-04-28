USE agenciaDeViajes;
/* B) Seleccionar los Guias que mas trabajaron. */
SELECT  id_guia, cantidad_deTours
FROM guia
ORDER BY cantidad_deTours DESC
LIMIT 1;

/* C) Seleccionar las personas que mas viajaron. */

SELECT id_Cliente, COUNT(id_pago) AS cantidad_viajes
FROM pagos
GROUP BY id_Cliente
ORDER BY cantidad_viajes DESC
Limit 1;

/* D) Informar el viaje de “Hugo López” para el mes que viene. */

SELECT p.id_pago, t.fecha_horaSalida, t.fecha_horaLlegada, t.nombreDelGuia, t.cantidadDePlazas
FROM pagos p
JOIN cliente c ON p.id_Cliente = c.id_cliente
JOIN tours t ON p.id_tours = t.id_tours
WHERE c.nombre = 'Hugo López' 
	AND MONTH(t.fecha_horaSalida) = MONTH(CURRENT_DATE + INTERVAL 1 MONTH)
	AND YEAR(t.fecha_horaSalida) = YEAR(CURRENT_DATE + INTERVAL 1 MONTH)
ORDER BY t.fecha_horaSalida ASC;


/* E) Insertar en una tabla un registro completo. 
Imprimir una consulta previa (QUERY) en donde se evidencie que el registro no existía
 y luego la misma con ese registro. Incluir el código. */
SELECT * FROM cliente WHERE nombre = 'Juan Pérez';

INSERT INTO cliente (nombre, direccion, telefono, ocupacion)
VALUES ('Juan Pérez', 'Calle Principal 123', '4711-0123', 'Arquitecto');

SELECT * FROM cliente WHERE nombre = 'Juan Pérez';

/* F) Eliminar de una tabla un registro completo. 
Imprimir una consulta previa (QUERY) en donde se muestre el registro 
y luego la misma sin ese registro. Incluir el código. */

SELECT * FROM cliente WHERE nombre = 'Juan Pérez';

DELETE FROM cliente WHERE nombre = 'Juan Pérez';

SELECT * FROM cliente WHERE nombre = 'Juan Pérez';

/* G) Hacer una consulta que indexe en otro orden que no sea la clave primaria. */

SELECT nombredelguia AS Nombre_de_guia ,id_tours, id_escala, fecha_horallegada, fecha_horasalida
FROM tours
ORDER BY Nombre_de_guia;

/* H) Hacer una consulta que agrupe datos e indique cantidad de registros
 que cumplen la agrupación de datos, ordenando en orden descendente.*/

SELECT id_guia, COUNT(id_tours) AS cantidad_tours
FROM tours
GROUP BY id_guia
ORDER BY cantidad_tours DESC;

/* I) Utilizar InnerJoin. */

SELECT DISTINCT (g.id_guia), t.nombredelguia
FROM guia AS g
INNER JOIN tours AS t ON g.id_guia = t.id_guia;

/* J) Utilizar OuterJoin. */

SELECT g.id_guia, t.nombredelguia, t.id_tours,  t.fecha_horaSalida, t.fecha_horaLlegada
FROM guia AS g
LEFT JOIN tours AS t ON g.id_guia = t.id_guia
ORDER BY t.nombredelguia;
    