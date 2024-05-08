use aeropuertos;
-- <----------SP------------> --
DELIMITER //

CREATE PROCEDURE BuscarAeropuertoPorID (
    IN aeropuerto_id INT
)
BEGIN
    SELECT Nombre_aeropuerto, Ubicacion, Aeropuertoscol
    FROM aeropuertos
    WHERE Id_Aeropuertos = aeropuerto_id;
END //

DELIMITER ;

CALL BuscarAeropuertoPorID(1);

-- <----------FUNCTION------------> --

DELIMITER //

CREATE FUNCTION ContarAeropuertosPorUbicacion (
    ubicacion_parametro VARCHAR(255)
)
RETURNS INT
-- Si no agrego las dos lineas de abajo me da error
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE cantidad_aeropuertos INT;
    
    -- Cuenta la cantidad de aeropuertos en la ubicación
    SELECT COUNT(*) INTO cantidad_aeropuertos FROM aeropuertos WHERE Ubicacion = ubicacion_parametro;
    
    RETURN cantidad_aeropuertos;
END //

DELIMITER ;

SELECT ContarAeropuertosPorUbicacion('Buenos Aires');

-- <----------TRIGGER-1------------> --

DELIMITER //

CREATE TRIGGER ProhibirNombre
BEFORE INSERT ON pasajero
FOR EACH ROW
BEGIN
    DECLARE message_text varchar(255);
    IF NEW.Nombre = 'Julian Assange' THEN
        SIGNAL SQLSTATE '45000' --Excepción no controlada definida por el usuario.
        SET message_text = 'Julian Assange no debería estar acá.'; --Esto sale por consola
    END IF;
END //

DELIMITER ;

-- Pruebo que funcione todo ok 
INSERT INTO pasajero(Nombre, tipo_de_documento, Nro_documento) VALUES ("Julian Assange", "DNI", "12346745");

-- <----------TRIGGER-2------------> --
DELIMITER //

CREATE TRIGGER ActualizarUbicacionAeropuerto
BEFORE UPDATE ON aeropuertos
FOR EACH ROW
BEGIN
    IF OLD.Ubicacion != NEW.Ubicacion THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite cambiar la ubicación de un aeropuerto.';
    END IF;
END //

DELIMITER ;

-- Chequeo que anda todo ok --
UPDATE aeropuertos
SET Ubicacion = 'Los Angeles'
WHERE Nombre_Aeropuerto = 'Aeropuerto Jorge Newbery';

SELECT *
FROM aeropuertos;
