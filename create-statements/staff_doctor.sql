CREATE TABLE staff_doctor
(
    doctor_id INT PRIMARY KEY REFERENCES staff (staff_id) NOT NULL
);
