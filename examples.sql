INSERT INTO "document" ("id", "document_type_id", "document_number", "front_image", "back_image") 
VALUES (nextval('document_id_seq'), 1, '1091683299', '', '');

INSERT INTO "reference" ("id", "first_names", "last_names", "document_id", "phone_number", "email") 
VALUES (nextval('reference_id_seq'), 'Juan', 'Jerez', 1, '3142032321', 'juanjerez@hotmail.com');

INSERT INTO "personal_information" ("id", "first_names","last_names","occupation" , "email", "phone_number", "document_id", "birth_date", "reference_id")
VALUES (nextval('personal_information_id_seq'), 'Juan','Perez', 'estudiante','admin@example.com', '3716238127', 1, '2000-01-01', 1);

INSERT INTO "credential" ("id", "username", "password", "role_id", "personal_information_id") 
VALUES (nextval('credential_id_seq'),'user','password', 1, 1);

INSERT INTO "station" ("id", "name", "address", "latitude", "longitude", "station_status_id", "capacity", "last_maintenance")
VALUES 
(1, 'UIS', 'Cra 27 calle 9, La Universidad', 7.140709, -73.121012, 1, 20, TIMESTAMP '2024-04-17 12:04:49.057'),
(2, 'UNAB', 'Av. 42 #48 - 11, Cabecera', 7.116833, -73.105517, 1, 20, TIMESTAMP '2024-04-17 2:04:49.057'),
(3, 'CENTRO', 'Cra 13 #42-65, Garcia Rovira', 7.114838, -73.127325, 1, 20, TIMESTAMP '2024-04-17 3:04:49.057'),
(4, 'PARQUE SAN PIO', 'Cra 33 #45, Cabecera', 7.118625, -73.110193, 1, 20, TIMESTAMP '2024-04-17 1:04:49.057'),
(5, 'PARQUE DE LOS NIÑOS', 'Cl. 30 #26-2, Antonia Santos', 7.126030, -73.119540, 1, 20, TIMESTAMP '2024-04-17 4:04:49.057'),
(6, 'PARQUE LA CONCORDIA', 'Cra. 21 #49-20, La Concordia', 7.113557,  -73.118433, 1, 20, TIMESTAMP '2024-04-17 5:04:49.057'),
(7, 'CALLE LOS ESTUDIANTES', 'Real de minas, frente a Acropolis', 7.103811, -73.123686, 1, 20, TIMESTAMP '2024-04-17 6:04:49.057'),
(8, 'MEJORAS PUBLICAS-CONCHA ACÚSTICA','Cra. 30 #35-69, Mejoras Publicas', 7.123206,  -73.114023, 1, 20, TIMESTAMP '2024-04-17 7:04:49.057');

INSERT INTO "vehicle" ("vehicle_type_id", "vehicle_status_id", "electric", "battery", "station_id")
VALUES (1, 2, true, 80, 2);
INSERT INTO "vehicle" ("vehicle_type_id", "vehicle_status_id", "electric", "battery", "station_id")
VALUES (1, 1, false, 0, 1);
INSERT INTO "vehicle" ("vehicle_type_id", "vehicle_status_id", "electric", "battery", "station_id")
VALUES (1, 1, true, 46, 2);
INSERT INTO "vehicle" ("vehicle_type_id", "vehicle_status_id", "electric", "battery", "station_id")
VALUES (2, 2, false, 0, 1);
INSERT INTO "vehicle" ("vehicle_type_id", "vehicle_status_id", "electric", "battery", "station_id")
VALUES (2, 1, true, 21, 2);

