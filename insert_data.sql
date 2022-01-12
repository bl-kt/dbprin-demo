-- FOLLOW THE INSERT STATEMENTS IN THIS ORDER DUE TO FOREIGN KEYS!

-- STAFF
-- id (serial, so no need to put), fname, lname, dob, phone, email, house no/add1, street, county, postcode
    -- id's 0-4
--THIS WORKS!!!
INSERT INTO staff (staff_fname, staff_lname, staff_dob, staff_phone, staff_email, staff_add1, staff_add2, staff_county, staff_postcode)
VALUES
    ('Jaci', 'Kingsley', '1991-08-19', '012345678', 'jaci@hospital.com',
     '40', 'Portsmouth Road', 'Hampshire', 'Po1 1ab'),
    ('Anneka', 'Brittain', '1986-12-25', '23456789', 'anneka@hospital.com',
     '38', 'Stanhope Road', 'Hampshire', 'Po1, 0bc'),
    ('Kitra', 'Bowen', '1969-09-18', '12398765','suspendisse.non.leo@protonmail.ca',
    '551', 'Inn Rd','Hampshire','Po1 1cd'),
    ('Adrienne', 'Webster', '1988-03-18', '14340000', 'a.auctor@aol.com', '586',
     'Gravida Street', 'Surrey','GU1 1AB'),
    ('Jasmine', 'Bryant', '1980-08-07', '7763576353', 'arcu.vivamus.sit@protonmail.edu',
     '60', 'Aliquam St',  'Sussex','W12 QAB'),
    ('Aretha','Howe','1999-08-22', '0169775636','auctor.velit.aliquam@protonmail.net',
     '81','Sed Rd','Monmouthshire','C73 8SN'),
    ('Jelani','Saunders','2002-10-15', '01111641563','erat.in.consectetuer@hotmail.net',
     '12','Ac Rd','Durham','KU1Q 8UY'),
    ('Ocean','Allen','1955-03-30', '01501817426','pede.malesuada@aol.net',
     '52','Pellentesque Av','Inverness-shire','FV3B 0GR'),
    ('Risa','Mcguire','1976-06-21', '01716634704' ,'etiam.vestibulum@outlook.co.uk',
     '83','Arcu. Rd','Denbighshire','FX50 1MX'),
    ('Cade','Lloyd','1982-05-01', '01916375276','ornare.fusce.mollis@yahoo.ca',
     '19','Quisque Av','Morayshire','FR3 2LC');

-- WARD SPECIALITY
-- speciality id (serial), name, comments
-- THIS WORKS
INSERT INTO ward_speciality (speciality_name, speciality_comments) VALUES
    ('A & E', 'Accident and Emergency'), 
    ('General', 'For general/basic medical concerns'), 
    ('Pediatrics', 'Specialist childrens ward'), 
    ('COVID ward', 'Specialist Coronavirus / Covid-19 Ward'),
    ('Maternity', 'Maternity ward'),
    ('Orthopedic', 'Bones and Muscle specialist');

-- 'ward specialty' will be the foreign key from ward_specialty

-- WARD
-- Named all these after QA (local hospital) wards: https://www.porthosp.nhs.uk/wards/?rows=0
-- ward id (serial), ward name, speciality (fk), comments
-- THIS WORKS
INSERT INTO ward (ward_name, ward_speciality, ward_comments) VALUES
    ('A8', 2 , 'Operates 24/7'), -- has head nurse
    ('A6', 2 , 'A&E Overflow'), -- has head nurse
    ('B4', 5 , 'Orthopedic outpatient'), -- has head nurse
    ('B7', 5 , 'Orthopedic surgery'),
    ('D4', 1 ,'For general/basic medical concerns'),
    ('D1', 1, 'Blood Tests'),
    ('D2', 1, 'LFT/PCR Covid Tests'),
    ('Starfish', 2, 'Childrens surgery'), --these are adorable?
    ('Shipwreck', 2, 'Childrens outpatients'),
    ('C1', 3, 'ICU for Coronavirus patients that have tested positive and require special assistance'),
    ('C2', 3, 'COVID General'),
    ('E9', 4, 'Maternity Ward'),
    ('E11', 4, 'Emergency Maternity Ward/Overflow'),
    ('A2', 5,'Muscle and bone specialty ward');
-- 14 wards 0-13

-- STAFF NURSES
-- staff id, is head nurse (bool), ward
CREATE TABLE staff_nurse
(
    nurse_id     INT REFERENCES staff (staff_id) NOT NULL,
    is_head_nurse BOOLEAN                        NOT NULL,
    nurse_ward   INT REFERENCES ward (ward_id)   NOT NULL
);
INSERT INTO staff_nurse (nurse_id, is_head_nurse, nurse_ward)
VALUES
    (1, TRUE, 3),
    (4, FALSE, 4),
    (5, FALSE, 0),
    (7, TRUE, 1),
    (9, TRUE, 2);
    (10, FALSE, 5);

-- STAFF DOCTORS
-- Staff Doctor works
INSERT INTO staff_doctor (doctor_id) VALUES
-- staff id
    (1),
    (2),
    (3),
    -- char
    (6),
    (8);

-- DOCTOR-TREATMENT
INSERT INTO doctor_treatment (doctor_id, treatment_id) VALUES
--  combo key (of doctor id, then treatment id), comments
    ((2,0), 'Patient needs to take medication for 7 days'),
    -- char
    ((6,3), 'Patient vitals to be carefully observed whilst antibiotics administered'),
    ((8,4), 'Plaster cast fitted, discharge with callback in 6 mths.'),
    ((0,5), 'Cauterised wound, discharged with icepack'),
    ((2,6), 'Referal to external diagnostic services - tourettes'),
    ((0,7), 'Admit to covid ward for further treatment');

-- TREATMENT
-- Treatment table works
INSERT INTO treatment (treatment_start, treatment_end, treatment_desc, complaint_no) VALUES
    ('2021-05-24', '2021-05-24', 'paracetemol and cough syrup', 1),
    ('2021-05-25', '2021-06-01', 'Amoxicillin', 2),
    ('2021-05-26', '2021-06-10', 'Ventilator', 3),
    -- Char
    ('2022-01-05', '2022-01-12', 'Antibiotics', 4),
    ('2022-01-01', '2022-01-03', 'Plaster Cast', 5),
    ('2021-03-07', '2021-03-07', 'Cauterise', 6),
    ('2021-04-06', '2021-04-06', 'External referal', 7),
    ('2021-10-18', '2021-11-02', 'Admittance to covid ward', 8);

-- COMPLAINT
-- Complaint table working
INSERT INTO complaint (complaint_date, complaint_desc) VALUES
    ('2021-05-24', 'A dry cough and a flu'),
    ('2021-05-25', 'Chest infection'),
    ('2021-05-26', 'Couldnt breathe, unable to stay awake, non responsive.'),
    -- Char
    ('2022-01-04', 'Difficult birth - high chance of infection'),
    ('2021-12-31', 'Broken tibia'),
    ('2021-03-07', 'Unstoppable nosebleed'),
    ('2021-01-29', 'Tics, uncontrollable movements and sounds'),
    ('2021-10-18', 'Covid 19 Symptoms unable to treat at home');


-- PATIENT-COMPLAINT
INSERT INTO patient_complaint (patient_id, complaint_id) VALUES
-- combo key (of patient id, complaint id), and comments
    ((1, 1), 'Discharged'),
    ((2, 2), 'Treated'),
    ((4, 2), 'In treatment'),
    ((6, 3), 'In treatment'),
    ((5, 4), 'Discharged'),
    ((7, 5), 'Discharged'),
    ((8, 6), 'Referred externally'),
    ((9, 7), 'Discharged'),
    ((2, 8), 'preparing treatment'),
    ((3, 9), 'Discharged');

-- PATIENT
-- Patient table working
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
    ('Nowell', 'Bolton', '1989-04-05', '07001112222', 'nowell@bolton.com',
    '50', 'Tree Close', 'Hampshire', 'PO1 1QW',
    2, 11),
    ('Tawanda', 'Muyeye', '1948-03-05', '07968152882', 't.muyeye@gmail.com',
     '50', 'Hamphire Drive, Maidstone', 'Hampshire','ME15 7ES',
      1, 1),
    ('Adrian', 'Burl', '1955-07-02', '07618156822', 'a.burl99@gmail.com',
     '30', 'North Baddesley', 'Hampshire', 'SO52 9JU',
      4, 9),
    ('Tadiwanashe', 'Ditima', '1968-12-12', '07115156832', 't.ditima@gmail.com',
     '22', 'Shakespeare Road', 'Portsmouth', 'PO1 5LF',
      3, 2),
    ('Paul', 'Jackson', '2000-03-12', '07116786438', 'paulJackson@harvard.edu.us',
     '93', 'Dreighfield Drive', 'Berkshire', 'SL8 4QT',
      2, 3, 'Patient must be supervised 24/7'),
    ('Anthony', 'Pearson', '1970-05-20', '0716286851', 'A.Pearson@yahoo.co.uk',
     '33', 'Droorey Lane', 'Petersfield', 'UP2 4UJ',
      1, 2),
    CHAR 5-9
    ('Alexander','Ratliff','1967-10-22', '08008719187','enim@icloud.edu',
     '78','Faucibus St.','Bedfordshire','GL8 4DD',
     1,2),
    ('Demetria','Sutton','1986-11-21', '01513565815','dignissim@google.net',
     '45', 'Williams Road','Rutland','S8 6AE',
     2,12,
     'Nullam enim. Sed nulla ante, iaculis nec,'),
    ('Callum','Francis','2001-12-22', '05548858371','vulputate.dui.nec@icloud.co.uk',
     '45', 'Av Lane', 'Derbyshire','RF6 1AY',
     3,4);
    ('Abel','Garrison','1972-02-22', '01487027927','elementum@icloud.com',
     '82','Magnis St.','Norfolk','W49 5PU',
     4,8,
     'a felis ullamcorper viverra. Maecenas iaculis aliquet'),
    ('Bertha','Bartlett','1993-10-22', '05687602427','parturient@outlook.edu',
     '56','Fermentum Ave','Merionethshire','U5V 6YP',
     3,10,
     'Duis ac arcu. Nunc mauris. Morbi non sapien');

-- GP
-- Table working
INSERT INTO general_practitioner (gp_name, gp_add1, gp_add2, gp_county, gp_postcode) VALUES
    ('Somers Town Health Centre',
     'Somerstown Central, Tyseley Road', 'Southsea', 'Hampshire', 'PO5 4EZ'),
    ('The Village Surgery',
     'The Square', 'South Redbank', 'Hampshire', 'GU5 7EA'),
    ('Dickens Gardens Medical Centre',
     'High Avenue', 'Middlesborough Road', 'Pixon', 'PI9 5YJ'),
    ('East Route General Practice',
     '34', 'Yeet Str, Yarnsborough', 'Smidley', 'SM1 H33'),
    ('Vernsborne Surgery',
     '65', 'Narnsmouth', 'Hammingdom', 'HA4 L37');


CREATE TABLE ward
(
    ward_id         SERIAL PRIMARY KEY,
    ward_name       VARCHAR(30)                                    NOT NULL,
    ward_speciality INT REFERENCES ward_speciality (speciality_id) NOT NULL,
    ward_comments   VARCHAR(100)
);





