CREATE TABLE treatment
(
    treatment_id    SERIAL PRIMARY KEY,
    treatment_start DATE                                    NOT NULL,
    treatment_end   DATE,
    treatment_desc  VARCHAR(100),
    complaint_no    INT REFERENCES complaint (complaint_id) NOT NULL
);