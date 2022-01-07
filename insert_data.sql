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


INSERT INTO staff VALUES ('Jaci', 'Kingsley', 1991-08-19, 012345678, 'jaci@hospital.com', 40, 'Portsmouth Road', 'Hampshire', 'Po1 1ab'),
        ('Anneka', 'Brittain', 1986-12-25, 23456789, 'anneka@hospital.com', 38, 'Stanhope Road', 'Hampshire', 'Po1, 0bc'),
        ();

INSERT INTO staff VALUES
    ("Jaci", "Kingsley", 1991-08-19, 012345678, "jaci@hospital.com", "40", "Portsmouth Road", "Hampshire", "Po1 1ab"),
    ("Anneka", "Brittain", 1986-12-25, 23456789, "anneka@hospital.com", "38", "Stanhope Road", "Hampshire", "Po1, 0bc"),
    ("Kitra", "Bowen", 1969-09-18, 12398765,"suspendisse.non.leo@protonmail.ca","551", "Inn Rd","Hampshire","Po1 1cd"),
    ("Adrienne", "Webster", 1988-03-18, 14340000, "a.auctor@aol.com", "586", "Gravida Street", "Surrey","GU1 1AB"),
    ("Jasmine", "Bryant", 1980-08-07, 7763576353, "arcu.vivamus.sit@protonmail.edu","60", "Aliquam St",  "Sussex","W12 QAB");

CREATE TABLE ward
(
    ward_id         SERIAL PRIMARY KEY,
    ward_name       VARCHAR(30)                                    NOT NULL,
    ward_speciality INT REFERENCES ward_speciality (speciality_id) NOT NULL,
    ward_comments   VARCHAR(100)
);

INSERT INTO ward VALUES
    (1, 'A & E', 'Accident and emergency', 'Operates 24/7'),
    ('General Surgery', 2, 'For general/basic medical concerns'),


INSERT INTO patient VALUES
    ('Tawanda', 'Muyeye', '1948-03-05', 07968152882, 't.muyeye@gmail.com', '50 Hamphire Drive', 'Maidstone', 'Hampshire','ME15 7ES'),
    ('Adrian', 'Burl', '1955-07-02', 07618156822, 'a.burl99@gmail.com', 'North Baddesley', 'Chandlers Ford', 'Hampshire', 'SO52 9JU'),
    ('Tadiwanashe', 'Ditima', '1968-12-12', 07115156832, 't.ditima@gmail.com', '50', 'Shakespeare Road', 'Portsmouth', 'PO1 5LF'),
