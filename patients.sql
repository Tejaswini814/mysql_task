USE cdg_hyd_jfs_058;
CREATE TABLE patients(
    patient_id INT NOT NULL AUTO_INCREMENT,
    patient_number VARCHAR(15) NOT NULL,
    first_name VARCHAR(50)NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    date_of_birth DATE NOT NULL,
    biological_sex VARCHAR(20) NOT NULL,
    blood_group VARCHAR(20),
    phone VARCHAR(20)NOT NULL,
    email VARCHAR(120),
    emergency_contact_name VARCHAR(100)NOT NULL,
    emergency_contact_phone VARCHAR(15)NOT NULL,
    allergies TEXT,
    patient_status VARCHAR(20)NOT NULL DEFAULT 'ACTIVE',
    registerd_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_patient_id PRIMARY KEY(patient_id),
    CONSTRAINT uq_patient_number UNIQUE(patient_number),
    CONSTRAINT chk_patient_status CHECK (patient_status IN('ACTIVE','INACTIVE','DECEASED')),
    CONSTRAINT chk_blood_group CHECK (blood_group IN('A+','A-','B+','B-','O+','O-','AB+','AB-')),
    CONSTRAINT chk_biological_sex CHECK (biological_sex IN('FEMALE','MALE','INTERSEX','NOT_DISCLOSED'))
  
);
SELECT*FROM patients;
INSERT INTO patients
(patient_number,first_name,last_name,date_of_birth,biological_sex,blood_group,phone,email,emergency_contact_name,emergency_contact_phone,allergies)
VALUES('PAT001','Ananya','Rao','2002-05-15','FEMALE','A+','9000000001','ananya@example.com','Ravi Rao','9000000002','None reported');
INSERT INTO patients
(patient_number,first_name,last_name,date_of_birth,biological_sex,blood_group,phone,emergency_contact_name,emergency_contact_phone)
VALUES('PAT002','Rahul','Verma','2000-06-18','MALE','C+','9000000009','Priya Verma','9000000010');