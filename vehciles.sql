USE cdg_hyd_jfs_058;

CREATE TABLE vehicles (
    vehicle_id INT NOT NULL AUTO_INCREMENT,
    registration_number VARCHAR(20) NOT NULL,
    owner_name VARCHAR(120) NOT NULL,
    manufacturer VARCHAR(80) NOT NULL,
    model VARCHAR(80) NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,
    fuel_type VARCHAR(20) NOT NULL,
    manufacture_year YEAR NOT NULL,
    purchase_date DATE,
    color VARCHAR(40) NOT NULL,
    odometer_km INT NOT NULL DEFAULT 0,
    insurance_expiry DATE,
    vehicle_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_vehicle_id PRIMARY KEY (vehicle_id),
    CONSTRAINT uk_registration_number UNIQUE (registration_number),
    CONSTRAINT chk_odometer_non_negative CHECK (odometer_km >= 0),
    CONSTRAINT chk_vehicle_type CHECK (vehicle_type IN ('CAR','MOTORCYCLE','TRUCK','VAN','BUS')),
    CONSTRAINT chk_fuel_type CHECK (fuel_type IN ('PETROL','DIESEL','ELECTRIC','HYBRID','CNG')),
    CONSTRAINT chk_vehicle_status CHECK (vehicle_status IN ('ACTIVE','IN_SERVICE','SOLD','SCRAPPED'))
);

INSERT INTO vehicles
(registration_number,owner_name,manufacturer,model,vehicle_type,fuel_type,manufacture_year,purchase_date,color,odometer_km,insurance_expiry)
VALUES
('TS09AB1234','Rahul Kumar','Toyota','Camry','CAR','PETROL',2022,'2022-06-15','White',25000,'2027-06-14');
SELECT * FROM vehicles;
