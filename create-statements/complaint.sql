
CREATE TABLE complaint
(
    complaint_id   SERIAL PRIMARY KEY,
    complaint_date DATE NOT NULL,
    complaint_desc TEXT NOT NULL
);