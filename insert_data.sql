-- STAFF

INSERT INTO staff VALUES

-- id (serial, so no need to put), fname, lname, dob, phone, email, house no/add1, street, county, postcode
    -- id's 0-4
    ("Jaci", "Kingsley", '1991-08-19', '012345678', "jaci@hospital.com",
     "40", "Portsmouth Road", "Hampshire", "Po1 1ab"),
    ("Anneka", "Brittain", '1986-12-25', '23456789', "anneka@hospital.com",
     "38", "Stanhope Road", "Hampshire", "Po1, 0bc"),
    ("Kitra", "Bowen", '1969-09-18', '12398765',"suspendisse.non.leo@protonmail.ca",
    "551", "Inn Rd","Hampshire","Po1 1cd"),
    ("Adrienne", "Webster", '1988-03-18', '14340000', "a.auctor@aol.com", "586",
     "Gravida Street", "Surrey","GU1 1AB"),
    ("Jasmine", "Bryant", '1980-08-07', '7763576353', "arcu.vivamus.sit@protonmail.edu",
     "60", "Aliquam St",  "Sussex","W12 QAB"),
    -- Char, id's 5-9
    ("Aretha","Howe",'1999-08-22', '0169775636',"auctor.velit.aliquam@protonmail.net",
     "81","Sed Rd","Monmouthshire","C73 8SN"),
    ("Jelani","Saunders",'2002-10-15', '01111641563',"erat.in.consectetuer@hotmail.net",
     "12","Ac Rd","Durham","KU1Q 8UY"),
    ("Ocean","Allen",'1955-03-30', '01501817426',"pede.malesuada@aol.net",
     "52","Pellentesque Av","Inverness-shire","FV3B 0GR"),
    ("Risa","Mcguire",'1976-06-21', '01716634704' ,"etiam.vestibulum@outlook.co.uk",
     "83","Arcu. Rd","Denbighshire","FX50 1MX"),
    ("Cade","Lloyd",'1982-05-01', '01916375276',"ornare.fusce.mollis@yahoo.ca",
     "19","Quisque Av","Morayshire","FR3 2LC");

-- STAFF NURSES
INSERT INTO staff_nurse VALUES
-- staff id, is head nurse (bool), ward
    (1, TRUE, 0),
    (4, FALSE, 1),
    -- char
    (5, FALSE, 0),
    (7, TRUE, 1,
    (9, TRUE, 2);

-- STAFF DOCTORS
INSERT INTO staff_doctor VALUES
-- staff id
    (0),
    (2),
    (3),
    -- char
    (6),
    (8);

-- DOCTOR-TREATMENT
INSERT INTO doctor_treatment VALUES
--  combo key (of doctor id, then treatment id), comments
    ((2,0), 'Patient needs to take medication for 7 days'),
    -- char
    ((6,3), 'Patient vitals to be carefully observed whilst antibiotics administered'),
    ((8,4), 'Plaster cast fitted, discharge with callback in 6 mths.');

-- TREATMENT
INSERT INTO treatment VALUES
-- serial id, start date, end date, description, complaint no (fk)
    ('2021-05-24', '2021-05-24', 'paracetemol and cough syrup', 0),
    ('2021-05-25', '2021-06-01', 'Amoxicillin', 1),
    ('2021-05-26', '2021-06-10', 'Ventilator', 2),
    -- char
    ('2022-01-05', '2022-01-12', 'Antibiotics', 3),
    ('2022-01-01', '2022-01-03', 'Plaster Cast', 4),

-- COMPLAINT
INSERT INTO complaint VALUES
-- complaint id (serial), complaint date, description
    ('2021-05-24', 'A dry cough and a flu'),
    ('2021-05-25', 'Chest infection'),
    ('2021-05-26', 'Couldnt breathe, unable to stay awake, non responsive.'),
    --char
    ('2022-01-04', 'Difficult birth - high chance of infection'),
    ('2021-12-31', 'Broken tibia');


-- PATIENT-COMPLAINT
INSERT INTO patient_complaint VALUES
-- combo key (of patient id, complaint id), and comments
    ((0, 0), 'Discharged'),
    ((1, 1), 'Treated'),
    ((4, 2), 'In treatment'),
    ((6, 3), 'In treatment'),
    ((5, 4), 'Discharged'),

-- PATIENT
INSERT INTO patient VALUES
-- id (serial), fname, lname, dob, phone, email,
-- house no, street, county, postcode,
--  gp id (fk), ward id (fk), comments
    ('Tawanda', 'Muyeye', '1948-03-05', '07968152882', 't.muyeye@gmail.com',
     "50", 'Hamphire Drive', 'Maidstone', 'Hampshire','ME15 7ES',
      0, 1),
    ('Adrian', 'Burl', '1955-07-02', '07618156822', 'a.burl99@gmail.com',
     "30", 'North Baddesley', 'Chandlers Ford', 'Hampshire', 'SO52 9JU',
      0, 0),
    ('Tadiwanashe', 'Ditima', '1968-12-12', '07115156832', 't.ditima@gmail.com',
     "22", 'Shakespeare Road', 'Portsmouth', 'PO1 5LF',
      0, 2),
    ('Paul', 'Jackson', '2000-03-12', '07116786438', 'paulJackson@harvard.edu.us',
     "93", 'Dreighfield Drive', 'Berkshire', 'SL8 4QT',
      2, 3, 'Patient must be supervised 24/7'),
    ('Anthony', 'Pearson', '1970-05-20', '0716286851', 'A.Pearson@yahoo.co.uk',
     "33", 'Droorey Lane', 'Petersfield', 'UP2 4UJ',
      1, 2);
    -- CHAR 5-9
    ("Alexander","Ratliff",'1967-10-22', '08008719187',"enim@icloud.edu",
     "78","Faucibus St.","Bedfordshire","GL8 4DD",
     1,2),
    ("Demetria","Sutton",'1986-11-21', '01513565815',"dignissim@google.net",
     "45","Risus. Av.","Rutland","S8 6AE",
     2,12,
     "Nullam enim. Sed nulla ante, iaculis nec,"),
    ("Callum","Francis",'2001-12-22', '05548858371',"vulputate.dui.nec@icloud.co.uk",
     "45","Vel St.","Derbyshire","RF6 1AY",
     0,x,),
    ("Abel","Garrison",'1972-02-22', '01487027927',"elementum@icloud.com",
     "82","Magnis St.","Norfolk","W49 5PU",
     4,x,
     "a felis ullamcorper viverra. Maecenas iaculis aliquet"),
    ("Bertha","Bartlett",'1993-10-22', '05687602427',"parturient@outlook.edu",
     "56","Fermentum Ave","Merionethshire","U5V 6YP",
     3,x,
     "Duis ac arcu. Nunc mauris. Morbi non sapien");

-- GP
INSERT INTO general_practitioner VALUES
--  id (serial), gp name, add1/house no, street, county, postcode
    ('Somers Town Health Centre',
     'Somerstown Central Community Hub, Tyseley Road', 'Southsea', 'Hampshire', 'PO5 4EZ'),
    ('The Village Surgery',
     'The Square', 'South Redbank', 'Hampshire', 'GU5 7EA'),
    ('Dickens Gardens Medical Centre',
     'High Avenue', 'Middlesborough Road', 'Fratton', 'Pixon', 'PI9 5YJ'),
    ('East Route General Practice',
     '34', 'Yeet Str', 'Yarnsborough', 'Smidley', 'SM1 H33'),
    ('Vernsborne Surgery',
     '65', 'Ipsum Av', 'Narnsmouth', 'Hammingdom', 'HA4 L37'),

-- WARD
-- Named all these after QA (local hospital) wards: https://www.porthosp.nhs.uk/wards/?rows=0
INSERT INTO ward VALUES
-- ward id (serial), ward name, speciality (fk), comments
    ('A8', 0 , 'Operates 24/7'), -- has head nurse
    ('A6', 0 , 'A&E Overflow'), -- has head nurse
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
    ('E11', 4, 'Emergency Maternity Ward/Overflow')
    ('A2', 5,'Muscle and bone specialty ward', 'Ward that caters for muscle and bone related injuries.');
-- 14 wards 0-13

-- WARD SPECIALITY
INSERT INTO ward_speciality VALUES
-- speciality id (serial), name, comments
    ('A & E', 'Accident and Emergency'), 
    ('General', 'For general/basic medical concerns'), 
    ('Pediatrics', 'Specialist childrens ward'), 
    ('COVID ward', 'Specialist Coronavirus / Covid-19 Ward'),
    ('Maternity', 'Maternity ward'),
    ('Orthopedic', 'Bones and Muscle specialist');

-- 'ward specialty' will be the foreign key from ward_specialty


