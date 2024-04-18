SQL UNSAM 2024

Ejercicios de la guia 1

- Modelizacion de datos con DER y creacion de tablas utilizando DDL.

  
!) Video Club: Discutir a cerca de los procesos y necesidades de datos de un sistema para un VIDEOCLUB: Alquiler, Reserva, Compra de Nuevas Peliculas, Devolución.
        1.	Seleccionar una herramienta para su documentación
        2.	Realizar el Diagrama Entidad Relación
        3.	Realizar el DDD
        
2)	AgenciaDeViajes: Una agencia de viajes necesita adoptar un sistema que le permita disponer de la siguiente información :
        a.	Por cada cliente desea saber el código de cliente, nombre, dirección, teléfono, ocupación y datos del grupo familiar.
        b.	Por cada Tours organizado por la empresa debe saber código de Tours, fecha y hora de salida fecha y hora de llegada, canti¬dad de plazas, nombre de la guía de turismo y las escalas que va realizando el Tours con hora y día de llegada y tiempo de esta¬día.
        c.	La Empresa tiene contratada gente especializada en cada escala que acompaña a los Tours que pasa en su zona.
        d.	El importe de cada Tours se puede pagar de varias formas.  Se debe registrar las cuotas pagas de cada cliente que corresponda a esta modalidad de pago.
        e.	El sueldo de los guías de turismo se deduce de un sueldo básico de acuerdo al cargo, más un importe por antigüedad, más un adicional por cada Tours que atendió.

3) Aeropuertos:  Se quiere modelizar un sistema para la administración de aeropuertos. Se sabe que un aeropuerto trabaja con distintas líneas aéreas (Ej.: Aerolíneas Argentinas, Iberia, Air France, etc.) y una misma línea aérea trabaja en uno o varios aeropuertos.
 A su vez un aeropuerto tiene varios mostradores de check-in que son adjudicados a las distintas líneas aéreas (Ej.: Iberia tiene asignados los mostradores 1, 2 y 3 del aeroparque de Ezeiza). De cada mostrador se conoce el número que lo identifica, el lugar donde está ubicado y el tipo de mostrador que puede ser “turista”, “primera clase” o “business”.
 Los aeropuertos también tienen pistas que pueden ser pistas de despegue o pistas de aterrizaje y que son utilizadas por los aviones pertenecientes a las líneas aéreas en una fecha y hora dadas. Los aviones se clasifican según la cantidad de asientos en “avionetas” (de 2 a 4 asientos), “aviones medianos” (de 5 a 100 asientos) y “aviones boeing” (más de 100 asientos).
 Cada avión tiene programados distintos vuelos, de los cuales se conoce: tipo de vuelo (charter o de línea), ciudad de origen (ciudad de donde sale el vuelo), ciudad de destino (ciudad a donde llega el vuelo), fecha de salida, hora de salida y una duración estimada.
 De cada vuelo se pueden realizar reservas. Para esto la persona que realiza la reserva debe informar su nombre y el nro. de vuelo que desea, y la línea aérea le asigna un código de reserva alfanumérico y una fecha de vencimiento de la reserva. Cuando la fecha del sistema sea mayor que la fecha de vencimiento, las reservas que aún no hayan sido canceladas vencen, mientras tanto permanecen activas. 
 La persona que compra un pasaje correspondiente a un vuelo dado debe informar su nombre, el tipo y el nro. de documento y es considerada para el sistema como “pasajero”.
      Aclaraciones:
    - Un mostrador es adjudicado a una sóla línea aérea o a ninguna (puede estar sin asignar por algún período de tiempo).
    - Un avión pertenece a una única línea aérea que a su vez tiene varios aviones.
    - Una reserva es adjudicada a una única persona, que puede realizar varias reservas (siempre de distinto vuelo).
    - Una pista corresponde a un aeropuerto en particular, y es utilizada por varios aviones, que a su vez utilizan varias pistas.

