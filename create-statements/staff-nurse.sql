CREATE TABLE staff_nurse
(
    nurse_id     INT REFERENCES staff (staff_id) NOT NULL,
    is_head_nurse BOOLEAN                        NOT NULL,
    nurse_ward   INT REFERENCES ward (ward_id)   NOT NULL
);