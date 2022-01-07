-- create statement just for reference
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

<<<<<<< HEAD
INSERT INTO staff VALUES ('Jaci', 'Kingsley', 1991-08-19, 012345678, 'jaci@hospital.com', 40, 'Portsmouth Road', 'Hampshire', 'Po1 1ab'),
        ('Anneka', 'Brittain', 1986-12-25, 23456789, 'anneka@hospital.com', 38, 'Stanhope Road', 'Hampshire', 'Po1, 0bc'),
        ();
=======
INSERT INTO staff VALUES
    ("Jaci", "Kingsley", 1991-08-19, 012345678, "jaci@hospital.com", "40", "Portsmouth Road", "Hampshire", "Po1 1ab"),
    ("Anneka", "Brittain", 1986-12-25, 23456789, "anneka@hospital.com", "38", "Stanhope Road", "Hampshire", "Po1, 0bc"),
    ("Kitra", "Bowen", 1969-09-18, 12398765,"suspendisse.non.leo@protonmail.ca","551", "Inn Rd","Hampshire","Po1 1cd"),
    ("Adrienne", "Webster", 1988-03-18, 14340000, "a.auctor@aol.com", "586", "Gravida Street", "Surrey","GU1 1AB"),
    ("Jasmine", "Bryant", 1980-08-07, 7763576353, "arcu.vivamus.sit@protonmail.edu","60", "Aliquam St",  "Sussex","W12 QAB"),

>>>>>>> 910c4d41f71a059238c1f825c17b7ff73a9db93d
