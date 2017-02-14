BEGIN;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recibos;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  password VARCHAR NOT NULL,
  date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE inquilinos (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE propiedades (
  id SERIAL PRIMARY KEY,
  propiedad VARCHAR NOT NULL,
  numapt VARCHAR NOT NULL,
  direccion VARCHAR,
  user_id VARCHAR NOT NULL,
  inquilino_id VARCHAR
);

CREATE TABLE recibos (
  id SERIAL PRIMARY KEY,
  propiedad VARCHAR NOT NULL,
  numapt VARCHAR,
  numrecibo INT NOT NULL,
  nombre VARCHAR,
  periodoini VARCHAR,
  periodofin VARCHAR,
  arriendo INT,
  admon INT,
  rfte INT,
  parking INT,
  externo INT,
  amoblado INT,
  comision INT,
  otroarr INT,
  observaciones VARCHAR,
  totrecibo INT,
  efect INT,
  consigna INT,
  cheque INT,
  transfer INT,
  otropago INT,
  valormes INT,
  selnuevo VARCHAR,
  totpago INT,
  comisamob INT,
  amobselect VARCHAR,
  comissegur INT,
  segselect VARCHAR,
  entrada_fecha TIMESTAMP DEFAULT current_timestamp
);

ALTER TABLE ONLY propiedades
  ADD CONSTRAINT propiedades_user_id_fkey
  FOREIGN KEY (user_id)
  REFERENCES users(id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE ONLY propiedades
  ADD CONSTRAINT propiedades_inquilino_id_fkey
  FOREIGN KEY (inquilino_id)
  REFERENCES inquilinos(id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE ONLY recibos
  ADD CONSTRAINT recibos_nombre_fkey
  FOREIGN KEY (nombre)
  REFERENCES inquilinos(id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE ONLY recibos
  ADD CONSTRAINT propiedad
  FOREIGN KEY (propiedad)
  REFERENCES propiedades(id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

COMMIT;

