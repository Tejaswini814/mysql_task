USE cdg_hyd_jfs_058;
CREATE TABLE hotel_rooms (
    room_id INT NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(20) NOT NULL,
    floor_number SMALLINT NOT NULL,
    bed_count TINYINT NOT NULL,
    max_occupancy TINYINT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20) NOT NULL DEFAULT 'AVAILABLE',
    has_air_conditioning BOOLEAN NOT NULL DEFAULT TRUE,
    smoking_allowed BOOLEAN NOT NULL DEFAULT FALSE,
    notes VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_room_id PRIMARY KEY (room_id),
    CONSTRAINT uk_room_number UNIQUE (room_number),
    CONSTRAINT chk_room_type CHECK (room_type IN ('SINGLE','DOUBLE','DELUXE','SUITE')),
    CONSTRAINT chk_bed_coun CHECK (bed_count >= 1),
    CONSTRAINT chk_max_occupancy CHECK (max_occupancy >= 1),
    CONSTRAINT chk_price_per_night CHECK (price_per_night > 0),
    CONSTRAINT chk_availability_status CHECK (availability_status IN ('AVAILABLE','RESERVED','OCCUPIED','MAINTENANCE'))
);

INSERT INTO hotel_rooms
(room_number,room_type,floor_number,bed_count,max_occupancy,
price_per_night,availability_status,has_air_conditioning,smoking_allowed,notes)
VALUES
('101','SINGLE',1,1,1,1500.00,'AVAILABLE',TRUE,FALSE,'Single room');
SELECT * FROM hotel_rooms;
