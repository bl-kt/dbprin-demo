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