INSERT INTO "document" ("id", "document_type_id", "document_number", "front_image", "back_image") VALUES (1, 1, '1091683299', '', '');

INSERT INTO "referrer" ("id", "first_name", "last_name", "document_id", "phone_number", "email") VALUES (1, 'a', 'b', 1, '', '');

INSERT INTO "user" ("id", "name", "email", "phone_number", "document_id", "birth_date", "referrer_id")
VALUES (1, 'admin', 'admin@example.com', '3716238127', 1, '2000-01-01', 1, 1);

INSERT INTO "user_credential" ("id", "username", "password", "role_id", "user_id") VALUES (1,'user','password', 1, 1);

INSERT INTO "station" ("id", "name", "address", "latitude", "longitude", "station_status_id", "capacity", "last_maintenance")
VALUES (1, 'Uis', 'NULL', 7.140709, -73.121012, 1,16, TIMESTAMP '2023-05-15 12:04:49.057');

INSERT INTO "station" ("id", "name", "address", "latitude", "longitude", "station_status_id", "capacity", "last_maintenance")
VALUES (2, 'Ceis', 'NULL', 7.141387, -73.123342, 1, 16, TIMESTAMP '2023-05-15 12:04:49.057');

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

INSERT INTO "trip" ("id", "user_id", "vehicle_id", "start_date", "end_date", "start_station_id", "end_station_id", "price", "points", "comments")
VALUES (1, 1, 1, TIMESTAMP '2023-05-15 12:04:49.057', TIMESTAMP '2023-05-15 12:07:21.428', 1, 2, 10, 5, 'NULL');