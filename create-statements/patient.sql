CREATE TABLE patient (
    patient_id SERIAL PRIMARY KEY,
    patient_fname VARCHAR(30) NOT NULL,
    patient_lname VARCHAR(30) NOT NULL,
    patient_dob DATE NOT NULL,
    patient_phone VARCHAR(15) NOT NULL,
    patient_email VARCHAR(40) NOT NULL,
    patient_add1 VARCHAR(40) NOT NULL,
    patient_add2 VARCHAR(40),
    patient_county VARCHAR(40),
    patient_postcode VARCHAR(8) NOT NULL,
    patient_gp INT REFERENCES general_practitioner(gp_id) NOT NULL,
    patient_ward INT REFERENCES ward(ward_id) NOT NULL,
    patient_comments VARCHAR(200),
    patient_admitted DATE NOT NULL,
    patient_discharged DATE
);

-- dont use
ALTER TABLE patient
ADD patient_discharged DATE;

date_discharged DATE;