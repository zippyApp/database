--CREATE SCHEMA public;

CREATE TABLE 
  "document_type" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255)
  );

CREATE TABLE
  "vehicle_type" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255)
  );

CREATE TABLE
  "vehicle_status" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255)
  );

CREATE TABLE
  "station_status" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255)
  );

CREATE TABLE
  "role" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255)
  );

INSERT INTO "role" ("name") VALUES ('personal_information');
INSERT INTO "role" ("name") VALUES ('ADMIN');

INSERT INTO "document_type" ("name") VALUES ('CC');
INSERT INTO "document_type" ("name") VALUES ('CE');
INSERT INTO "document_type" ("name") VALUES ('TI');
INSERT INTO "document_type" ("name") VALUES ('PP');

INSERT INTO "vehicle_type" ("name") VALUES ('BIKE');
INSERT INTO "vehicle_type" ("name") VALUES ('SCOOTER');

INSERT INTO "vehicle_status" ("name") VALUES ('AVAILABLE');
INSERT INTO "vehicle_status" ("name") VALUES ('UNAVAILABLE');

INSERT INTO "station_status" ("id", "name") VALUES (1, 'OPEN');
INSERT INTO "station_status" ("id", "name") VALUES (2, 'CLOSE');
INSERT INTO "station_status" ("id", "name") VALUES (3, 'IN_MAINTENANCE');

CREATE SEQUENCE 
  "document_id_seq" START 1;

CREATE TABLE 
  "document" (
    "id" BIGSERIAL PRIMARY KEY,
    "document_type_id" INT,
    "document_number" VARCHAR(255) UNIQUE,
    "front_image" VARCHAR(255),
    "back_image" VARCHAR(255),
    FOREIGN KEY ("document_type_id") references "document_type"("id")
  );


CREATE SEQUENCE 
  "reference_id_seq" START 1;

CREATE TABLE
  "reference" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "document_id" INT,
    "phone_number" VARCHAR(255),
    "email" VARCHAR(255),
    FOREIGN KEY ("document_id") references "document"("id")
  );

CREATE SEQUENCE 
  "personal_information_id_seq" START 1;


CREATE TABLE
  "personal_information" (
    "id" BIGSERIAL PRIMARY KEY,
    "first_names" VARCHAR(255),
    "last_names" VARCHAR(255),
    "email" VARCHAR(255) UNIQUE,
    "occupation" VARCHAR(255),
    "phone_number" VARCHAR(255),
    "document_id" BIGINT,
    "birth_date" DATE,
    "reference_id" BIGINT,
    FOREIGN KEY ("reference_id") REFERENCES "reference"("id"),
    FOREIGN KEY ("document_id") REFERENCES "document"("id")
  );

CREATE SEQUENCE
  "credential_id_seq" START 1;

CREATE TABLE
  "credential" (
    "id" BIGSERIAL PRIMARY KEY,
    "personal_information_id" BIGINT,
    "username" VARCHAR(255) UNIQUE,
    "password" VARCHAR(255),
    "role_id" INT,
    FOREIGN KEY ("role_id") REFERENCES "role"("id"),
    FOREIGN KEY ("personal_information_id") REFERENCES "personal_information"("id")
  );

CREATE INDEX idx_email ON "personal_information"("email");

CREATE TABLE 
  "station" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(255),
    "address" VARCHAR(255),
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "station_status_id" INT,
    "capacity" INT,
    "last_maintenance" DATE,
    FOREIGN KEY ("station_status_id") REFERENCES "station_status"("id")
  );

CREATE TABLE
  "vehicle" (
    "id" BIGSERIAL PRIMARY KEY,
    "vehicle_type_id" INT ,
    "vehicle_status_id" INT,
    "electric" BOOLEAN,
    "battery" INT,
    "station_id" INT,
    FOREIGN KEY ("station_id") REFERENCES "station"("id"),
    FOREIGN KEY ("vehicle_type_id") REFERENCES "vehicle_type"("id"),
    FOREIGN KEY ("vehicle_status_id") REFERENCES "vehicle_status"("id")
  );

CREATE TABLE
  "trip" (
    "id" BIGSERIAL PRIMARY KEY,
    "personal_information_id" BIGINT,
    "vehicle_id" BIGINT,
    "start_date" TIMESTAMP,
    "end_date" TIMESTAMP,
    "start_station_id" BIGINT,
    "end_station_id" BIGINT,
    "price" DECIMAL(5,2),
    "points" INT,
    "comments" TEXT,
    FOREIGN KEY ("personal_information_id") REFERENCES "personal_information"("id"),
    FOREIGN KEY ("vehicle_id") REFERENCES "vehicle"("id"),
    FOREIGN KEY ("start_station_id") REFERENCES "station"("id"),
    FOREIGN KEY ("end_station_id") REFERENCES "station"("id")
  );

CREATE TABLE
  "trip_point" (
    "id" BIGSERIAL PRIMARY KEY,
    "trip_id" BIGINT,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("trip_id") REFERENCES "trip"("id")
  );

CREATE TABLE
  "geojson" (
    "id" BIGSERIAL PRIMARY KEY,
    "trip_id" BIGINT,
    "geojson" JSON,
    FOREIGN KEY ("trip_id") REFERENCES "trip"("id")
  );

--DROP SCHEMA IF EXISTS public CASCADE;
--CREATE SCHEMA public;
