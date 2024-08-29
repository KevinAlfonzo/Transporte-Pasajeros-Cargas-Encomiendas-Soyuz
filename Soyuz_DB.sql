-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-08-29 14:13:07.394

-- tables
-- Table: bill
CREATE TABLE bill (
    id int  NOT NULL,
    total_amount decimal(10,2)  NOT NULL,
    dimensions decimal(8,0)  NOT NULL,
    trips_id int  NOT NULL,
    CONSTRAINT bill_pk PRIMARY KEY  (id)
);

-- Table: burden
CREATE TABLE burden (
    id int  NOT NULL,
    description varchar(30)  NOT NULL,
    weight decimal(10,2)  NOT NULL,
    dimensions decimal(8,0)  NOT NULL,
    vehicle_id int  NOT NULL,
    CONSTRAINT burden_pk PRIMARY KEY  (id)
);

-- Table: customer
CREATE TABLE customer (
    id int  NOT NULL,
    name varchar(25)  NOT NULL,
    address varchar(20)  NOT NULL,
    phone char(9)  NOT NULL,
    email varchar(30)  NOT NULL,
    client_type char(15)  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY  (id)
);

-- Table: employes
CREATE TABLE employes (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    post varchar(25)  NOT NULL,
    phone char(9)  NOT NULL,
    email varchar(30)  NOT NULL,
    hiring_date date  NOT NULL,
    CONSTRAINT employes_pk PRIMARY KEY  (id)
);

-- Table: parcels
CREATE TABLE parcels (
    id int  NOT NULL,
    description varchar(25)  NOT NULL,
    weight decimal(10,2)  NOT NULL,
    dimensions decimal(8,0)  NOT NULL,
    vehicle_id int  NOT NULL,
    CONSTRAINT parcels_pk PRIMARY KEY  (id)
);

-- Table: routes
CREATE TABLE routes (
    id int  NOT NULL,
    origin varchar(30)  NOT NULL,
    destination varchar(30)  NOT NULL,
    distance decimal(10,2)  NOT NULL,
    estimated_time varchar(15)  NOT NULL,
    vehicle_id int  NOT NULL,
    CONSTRAINT routes_pk PRIMARY KEY  (id)
);

-- Table: trips
CREATE TABLE trips (
    id int  NOT NULL,
    departure_date date  NOT NULL,
    arrival_date date  NOT NULL,
    status varchar(10)  NOT NULL,
    customer_id int  NOT NULL,
    vehicle_id int  NOT NULL,
    CONSTRAINT trips_pk PRIMARY KEY  (id)
);

-- Table: vehicle
CREATE TABLE vehicle (
    id int  NOT NULL,
    vehicle_type varchar(25)  NOT NULL,
    brand varchar(15)  NOT NULL,
    model varchar(15)  NOT NULL,
    load_capacity decimal(10,2)  NOT NULL,
    status varchar(10)  NOT NULL,
    employes_id int  NOT NULL,
    CONSTRAINT vehicle_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: bill_trips (table: bill)
ALTER TABLE bill ADD CONSTRAINT bill_trips
    FOREIGN KEY (trips_id)
    REFERENCES trips (id);

-- Reference: burden_vehicle (table: burden)
ALTER TABLE burden ADD CONSTRAINT burden_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id);

-- Reference: parcels_vehicle (table: parcels)
ALTER TABLE parcels ADD CONSTRAINT parcels_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id);

-- Reference: routes_vehicle (table: routes)
ALTER TABLE routes ADD CONSTRAINT routes_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id);

-- Reference: trips_customer (table: trips)
ALTER TABLE trips ADD CONSTRAINT trips_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (id);

-- Reference: trips_vehicle (table: trips)
ALTER TABLE trips ADD CONSTRAINT trips_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicle (id);

-- Reference: vehicle_employes (table: vehicle)
ALTER TABLE vehicle ADD CONSTRAINT vehicle_employes
    FOREIGN KEY (employes_id)
    REFERENCES employes (id);

-- End of file.

