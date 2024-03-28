--CREATE SCHEMA public;

CREATE TYPE DOCUMMENT_TYPE AS ENUM ('CC', 'CE', 'TI', 'PP');
CREATE TYPE ROLE AS ENUM ('ADMIN', 'USER', 'EMPLOYEE');
CREATE TYPE VEHICLE_TYPE AS ENUM ('BIKE', 'SCOOTER');
CREATE TYPE VEHICLE_STATUS AS ENUM ('AVAILABLE', 'UNAVAILABLE');
CREATE TYPE STATION_STATUS AS ENUM ('AVAILABLE', 'UNAVAILABLE');

CREATE TABLE 
  "documment" (
    "id" BIGSERIAL PRIMARY KEY,
    "documment_type" DOCUMMENT_TYPE,
    "documment_number" VARCHAR(255),
    "front_image" VARCHAR(255),
    "back_image" VARCHAR(255)
  );

CREATE TABLE
  "referrer" (
    "id" BIGSERIAL PRIMARY KEY,
    "first_name" VARCHAR(255),
    "last_name" VARCHAR(255),
    "documment_id" INT,
    "phone_number" VARCHAR(255),
    "email" VARCHAR(255),
    FOREIGN KEY ("documment_id") references "documment"("id")
  );


CREATE TABLE
  "user_credential" (
    "id" BIGSERIAL PRIMARY KEY,
    "username" VARCHAR(255) UNIQUE,
    "password" VARCHAR(255)
  );

CREATE TABLE
  "user" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "email" VARCHAR(255) UNIQUE,
    "phone_number" VARCHAR(255),
    "documment_id" INT,
    "birth_date" DATE,
    "user_credential_id" INT UNIQUE,
    "referrer_id" INT,
    FOREIGN KEY ("referrer_id") REFERENCES "referrer"("id"),
    FOREIGN KEY ("documment_id") REFERENCES "documment"("id"),
    FOREIGN KEY ("user_credential_id") REFERENCES "user_credential"("id")
  );

CREATE INDEX idx_email ON "user"("email");

CREATE TABLE
  "user_role" (
    "id" BIGSERIAL PRIMARY KEY,
    "user_id" INT,
    "role" ROLE,
    FOREIGN KEY ("user_id") REFERENCES "user"("id")
  );

CREATE TABLE 
  "station" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "address" VARCHAR(255),
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "status" STATION_STATUS
  );

CREATE TABLE
  "vehicle" (
    "id" BIGSERIAL PRIMARY KEY,
    "type" VEHICLE_TYPE,
    "status" VEHICLE_STATUS,
    "electric" BOOLEAN,
    "battery" INT,
    "station_id" INT,
    FOREIGN KEY ("station_id") REFERENCES "station"("id")
  );

CREATE TABLE
  "trip" (
    "id" BIGSERIAL PRIMARY KEY,
    "user_id" INT,
    "vehicle_id" INT,
    "start_date" TIMESTAMP,
    "end_date" TIMESTAMP,
    "start_station_id" INT,
    "end_station_id" INT,
    "price" DECIMAL(5,2),
    "points" INT,
    "comments" TEXT,
    FOREIGN KEY ("user_id") REFERENCES "user"("id"),
    FOREIGN KEY ("vehicle_id") REFERENCES "vehicle"("id"),
    FOREIGN KEY ("start_station_id") REFERENCES "station"("id"),
    FOREIGN KEY ("end_station_id") REFERENCES "station"("id")
  );

CREATE TABLE
  "trip_point" (
    "id" BIGSERIAL PRIMARY KEY,
    "trip_id" INT,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("trip_id") REFERENCES "trip"("id")
  );

CREATE TABLE
  "geojson" (
    "id" BIGSERIAL PRIMARY KEY,
    "trip_id" INT,
    "geojson" JSON,
    FOREIGN KEY ("trip_id") REFERENCES "trip"("id")
  );


INSERT INTO "documment" ("id", "documment_type", "documment_number", "front_image", "back_image") VALUES (1, 'CC', '1091683299', '', '');

INSERT INTO "referrer" ("id", "first_name", "last_name", "documment_id", "phone_number", "email") VALUES (1, 'a', 'b', 1, '', '');

INSERT INTO "user_credential" ("id", "username", "password") VALUES (1,'user','password');

INSERT INTO "user" ("id", "name", "email", "phone_number", "documment_id", "birth_date", "user_credential_id", "referrer_id")
VALUES (1, 'admin', 'admin@example.com', '3716238127', 1, '2000-01-01', 1, 1);
INSERT INTO "station" ("id", "name", "address", "latitude", "longitude", "status")
VALUES (1, 'Uis', 'NULL', 7.140709, -73.121012, 'AVAILABLE');

INSERT INTO "station" ("id", "name", "address", "latitude", "longitude", "status")
VALUES (2, 'Ceis', 'NULL', 7.141387, -73.123342, 'AVAILABLE');

INSERT INTO "vehicle" ("id", "type", "status", "electric", "battery", "station_id")
VALUES (1, 'SCOOTER', 'UNAVAILABLE', true, 80, 1);

INSERT INTO "trip" ("id", "user_id", "vehicle_id", "start_date", "end_date", "start_station_id", "end_station_id", "price", "points", "comments")
VALUES (1, 1, 1, TIMESTAMP '2023-05-15 12:04:49.057', TIMESTAMP '2023-05-15 12:07:21.428', 1, 2, 10, 5, 'NULL');


--DROP SCHEMA IF EXISTS public CASCADE;
--CREATE SCHEMA public;