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

INSERT INTO staff VALUES ('Jaci', 'Kingsley', 1991-08-19, 012345678, 'jaci@hospital.com', 40, 'Portsmouth Road', 'Hampshire', 'Po1 1ab'),
        ('Anneka', 'Brittain', 1986-12-25, 23456789, 'anneka@hospital.com', 38, 'Stanhope Road', 'Hampshire', 'Po1, 0bc'),
        (),

