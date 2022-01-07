
INSERT INTO staff VALUES
    ("Jaci", "Kingsley", 1991-08-19, 012345678, "jaci@hospital.com", "40", "Portsmouth Road", "Hampshire", "Po1 1ab"),
    ("Anneka", "Brittain", 1986-12-25, 23456789, "anneka@hospital.com", "38", "Stanhope Road", "Hampshire", "Po1, 0bc"),
    ("Kitra", "Bowen", 1969-09-18, 12398765,"suspendisse.non.leo@protonmail.ca","551", "Inn Rd","Hampshire","Po1 1cd"),
    ("Adrienne", "Webster", 1988-03-18, 14340000, "a.auctor@aol.com", "586", "Gravida Street", "Surrey","GU1 1AB"),
    ("Jasmine", "Bryant", 1980-08-07, 7763576353, "arcu.vivamus.sit@protonmail.edu","60", "Aliquam St",  "Sussex","W12 QAB");

INSERT INTO staff_nurse VALUES
    (1, TRUE, 0),
    (4, FALSE, 1);

INSERT INTO staff_doctor VALUES
    (0),
    (2),
    (3);

INSERT INTO doctor_treatment VALUES
    ((2,0), 'Patient needs to take medication for 7 days'),

INSERT INTO treatment VALUES
    ('2021-05-24', '2021-05-24', 'paracetemol and cough syrup', 0),

INSERT INTO complaint VALUES
    ('2021-05-24', 'A dry cough and a flu'),

INSERT INTO general_practitioner VALUES
    ('Somers Town Health Centre', 'Somerstown Central Community Hub, Tyseley Road', 'Southsea', 'Hampshire', 'PO5 4EZ'),
    ('The Village Surgery', 'The Square', 'South Redbank', 'Hampshire', 'GU5 7EA')

INSERT INTO patient VALUES
    ('Tawanda', 'Muyeye', '1948-03-05', 07968152882, 't.muyeye@gmail.com', '50 Hamphire Drive', 'Maidstone', 'Hampshire','ME15 7ES', 0, 1),
    ('Adrian', 'Burl', '1955-07-02', 07618156822, 'a.burl99@gmail.com', 'North Baddesley', 'Chandlers Ford', 'Hampshire', 'SO52 9JU', 0, 0),
    ('Tadiwanashe', 'Ditima', '1968-12-12', 07115156832, 't.ditima@gmail.com', '50', 'Shakespeare Road', 'Portsmouth', 'PO1 5LF', 0, 2);

CREATE TABLE ward_speciality
(
    speciality_id      SERIAL PRIMARY KEY,
    speciality_name     VARCHAR(30) NOT NULL,
    speciality_comments TEXT
);

INSERT INTO ward_speciality VALUES
    ('A & E', 'Accident and Emergency'),
    ('General', 'For general/basic medical concerns'),
    ('Pediatrics', 'Specialist childrens ward')

CREATE TABLE ward
(
    ward_id         SERIAL PRIMARY KEY,
    ward_name       VARCHAR(30)                                    NOT NULL,
    ward_speciality INT REFERENCES ward_speciality (speciality_id) NOT NULL,
    ward_comments   VARCHAR(100)
);

-- 'ward specialty' will be the foreign key from ward_specialty
INSERT INTO ward VALUES
    ('A & E', ?, 'Operates 24/7'),
    ('General Surgery', 1?, 'For general/basic medical concerns'),
    ('Pediatrics', ?)

INSERT INTO patient_complaint VALUES
    -- not sure what to put here
    ((0, 0), 'Ummmm....')

