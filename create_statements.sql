CREATE DATABASE hospital;
\c hospital

CREATE TABLE staff
(
    staff_id      SERIAL PRIMARY KEY,
    staff_fname        VARCHAR(30) NOT NULL,
    staff_lname        VARCHAR(30) NOT NULL,
    staff_dob          DATE        NOT NULL,
    staff_phone VARCHAR(15) NOT NULL,
    staff_email VARCHAR(40) NOT NULL,
    staff_add1      VARCHAR(40) NOT NULL,
    staff_add2      VARCHAR(40),
    staff_county       VARCHAR(40),
    staff_postcode     VARCHAR(8)  NOT NULL
);

CREATE TABLE ward_speciality
(
    speciality_id      SERIAL PRIMARY KEY,
    speciality_name     VARCHAR(30) NOT NULL,
    speciality_comments TEXT
);

CREATE TABLE ward
(
    ward_id         SERIAL PRIMARY KEY,
    ward_name       VARCHAR(30)                                    NOT NULL,
    ward_speciality INT REFERENCES ward_speciality (speciality_id) NOT NULL,
    ward_comments   VARCHAR(100)
);

CREATE TABLE staff_nurse
(
    nurse_id     INT REFERENCES staff (staff_id) NOT NULL,
    is_head_nurse BOOLEAN                        NOT NULL,
    nurse_ward   INT REFERENCES ward (ward_id)   NOT NULL
);

CREATE TABLE staff_doctor
(
    doctor_id INT PRIMARY KEY REFERENCES staff (staff_id) NOT NULL
);

CREATE TABLE complaint
(
    complaint_id   SERIAL PRIMARY KEY,
    complaint_date DATE NOT NULL,
    complaint_desc TEXT NOT NULL
);

CREATE TABLE treatment
(
    treatment_id    SERIAL PRIMARY KEY,
    treatment_start DATE                                    NOT NULL,
    treatment_end   DATE,
    treatment_desc  VARCHAR(100),
    complaint_no    INT REFERENCES complaint (complaint_id) NOT NULL
);

CREATE TABLE general_practitioner
(
    gp_id      SERIAL PRIMARY KEY,
    gp_name     VARCHAR(60) NOT NULL UNIQUE,
    gp_add1 VARCHAR(40) NOT NULL,
    gp_add2  VARCHAR(40),
    gp_county   VARCHAR(30),
    gp_postcode VARCHAR(8)
);

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
    patient_comments VARCHAR(200)
);

CREATE TABLE doctor_treatment (
    doctor_id INT NOT NULL REFERENCES staff_doctor(doctor_id),
    treatment_id INT NOT NULL REFERENCES treatment(treatment_id),
    PRIMARY KEY (doctor_id, treatment_id)
);

CREATE TABLE patient_complaint (
    patient_id INT NOT NULL REFERENCES patient(patient_id),
    complaint_id INT NOT NULL REFERENCES complaint(complaint_id),
    PRIMARY KEY(patient_id, complaint_id),
    pat_com_comments VARCHAR(40)
);

