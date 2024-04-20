/* cliente-grupofamiliar */
ALTER TABLE grupoFamiliar
ADD CONSTRAINT fk_grupoFamiliar_cliente
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
ON DELETE CASCADE;

/* cliente-pagos */
ALTER TABLE pagos
ADD CONSTRAINT fk_cliente_pagos
FOREIGN KEY (id_Cliente) REFERENCES cliente(id_cliente)
ON DELETE CASCADE;

/* pagos_tours */
ALTER TABLE pagos
ADD CONSTRAINT fk_pagos_tours
FOREIGN KEY (id_tours) REFERENCES tours(id_tours)
ON DELETE CASCADE;

/* tours-escalas */
ALTER TABLE tours
ADD CONSTRAINT fk_tours_escalas
FOREIGN KEY (id_escala) REFERENCES escalas(id_escalas)
ON DELETE CASCADE;

/* tours-guia */
ALTER TABLE tours
ADD CONSTRAINT fk_guia_tours
FOREIGN KEY (id_guia) REFERENCES guia(id_guia)
ON DELETE CASCADE;

/* escalas-especialista */
ALTER TABLE escalas
ADD CONSTRAINT fk_escalas_especialista
FOREIGN KEY (id_especialista) REFERENCES especialistas(id_especialistas)
ON DELETE CASCADE;

/* especialista_sueldo y guia-sueldo */
ALTER TABLE especialistas
ADD CONSTRAINT fk_especialistas_sueldo
FOREIGN KEY (idSueldo) REFERENCES sueldo(id_sueldo)
ON DELETE CASCADE;

ALTER TABLE guia
ADD CONSTRAINT fk_guia_sueldo
FOREIGN KEY (id_sueldo) REFERENCES sueldo(id_sueldo)
ON DELETE CASCADE;

/* pagos-tipodepagos */
ALTER TABLE pagos
ADD CONSTRAINT fk_pagos_tipoDePagos
FOREIGN KEY (id_tipo) REFERENCES tipoDePago(id_tipoDePago)
ON DELETE CASCADE;


