CREATE TABLE patient_complaint (
    patient_id INT NOT NULL REFERENCES patient(patient_id),
    complaint_id INT NOT NULL REFERENCES complaint(complaint_id),
    PRIMARY KEY(patient_id, complaint_id),
    pat_com_comments VARCHAR(40)
);