
CREATE TABLE doctor_treatment (
    doctor_id INT NOT NULL REFERENCES staff_doctor(doctor_id),
    treatment_id INT NOT NULL REFERENCES treatment(treatment_id),
    PRIMARY KEY (doctor_id, treatment_id)
);