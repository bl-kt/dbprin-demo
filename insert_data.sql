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
-- THIS WORKS
INSERT INTO staff_nurse (nurse_id, is_head_nurse, nurse_ward)
VALUES
    (1, TRUE, 28),
    (4, FALSE, 20),
    (5, FALSE, 21),
    (7, TRUE, 22),
    (9, TRUE, 23),
    (10, FALSE, 24);

-- STAFF DOCTORS
-- Staff Doctor 
-- this works
INSERT INTO staff_doctor (doctor_id) VALUES
    (2),
    (3),
    (6),
    (8);

-- COMPLAINT
-- Complaint table working
INSERT INTO complaint (complaint_date, complaint_desc) VALUES
    ('2021-05-24', 'A dry cough and a flu'),
    ('2021-05-25', 'Chest infection'),
    ('2021-05-26', 'Couldnt breathe, unable to stay awake, non responsive.'),
    ('2022-01-04', 'Difficult birth - high chance of infection'),
    ('2021-12-31', 'Broken tibia'),
    ('2021-03-07', 'Unstoppable nosebleed'),
    ('2021-01-29', 'Tics, uncontrollable movements and sounds'),
    ('2021-10-18', 'Covid 19 Symptoms unable to treat at home');

    -- TREATMENT
-- Treatment table works
INSERT INTO treatment (treatment_start, treatment_end, treatment_desc, complaint_no) VALUES
    ('2021-05-24', '2021-05-24', 'paracetemol and cough syrup', 1),
    ('2021-05-25', '2021-06-01', 'Amoxicillin', 2),
    ('2021-05-26', '2021-06-10', 'Ventilator', 3),
    ('2022-01-05', '2022-01-12', 'Antibiotics', 4),
    ('2022-01-01', '2022-01-03', 'Plaster Cast', 5),
    ('2021-03-07', '2021-03-07', 'Cauterise', 6),
    ('2021-04-06', '2021-04-06', 'External referal', 7),
    ('2021-10-18', '2021-11-02', 'Admittance to covid ward', 8);

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

-- PATIENT
-- Patient table working
-- These needed to be seperated into 2 insert statements due to some having comments and some not.
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
    ('Nowell', 'Bolton', '1989-04-05', '07001112222', 'nowell@bolton.com',
    '50', 'Tree Close', 'Hampshire', 'PO1 1QW',
    2, 19),
    ('Tawanda', 'Muyeye', '1948-03-05', '07968152882', 't.muyeye@gmail.com',
     '50', 'Hamphire Drive, Maidstone', 'Hampshire','ME15 7ES',
      1, 20),
    ('Adrian', 'Burl', '1955-07-02', '07618156822', 'a.burl99@gmail.com',
     '30', 'North Baddesley', 'Hampshire', 'SO52 9JU',
      4, 21),
    ('Tadiwanashe', 'Ditima', '1968-12-12', '07115156832', 't.ditima@gmail.com',
     '22', 'Shakespeare Road', 'Portsmouth', 'PO1 5LF',
      3, 22),
       ('Anthony', 'Pearson', '1970-05-20', '0716286851', 'A.Pearson@yahoo.co.uk',
     '33', 'Droorey Lane', 'Petersfield', 'UP2 4UJ',
      1, 24),
    ('Alexander','Ratliff','1967-10-22', '08008719187','enim@icloud.edu',
     '78','Faucibus St.','Bedfordshire','GL8 4DD',
     1, 25),
       ('Callum','Francis','2001-12-22', '05548858371','vulputate.dui.nec@icloud.co.uk',
     '45', 'Av Lane', 'Derbyshire','RF6 1AY',
     3, 27);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
    ('Paul', 'Jackson', '2000-03-12', '07116786438', 'paulJackson@harvard.edu.us',
     '93', 'Dreighfield Drive', 'Berkshire', 'SL8 4QT',
      2, 23, 'Patient must be supervised 24/7'),
    ('Demetria','Sutton','1986-11-21', '01513565815','dignissim@google.net',
     '45', 'Williams Road','Rutland','S8 6AE',
     2, 26,
     'Nullam enim. Sed nulla ante, iaculis nec,'),
    ('Abel','Garrison','1972-02-22', '01487027927','elementum@icloud.com',
     '82','Magnis St.','Norfolk','W49 5PU',
     4, 29,
     'a felis ullamcorper viverra. Maecenas iaculis aliquet'),
    ('Bertha','Bartlett','1993-10-22', '05687602427','parturient@outlook.edu',
     '56','Fermentum Ave','Merionethshire','U5V 6YP',
     3,20,
     'Duis ac arcu. Nunc mauris. Morbi non sapien');

-- DOCTOR-TREATMENT
--  combo key (of doctor id, then treatment id), comments
-- This works
-- Not sure about this - it works but we have no primary key and no primary column. We may need to 
-- alter the table and add a column for composite key?
INSERT INTO doctor_treatment (doctor_id, treatment_id) VALUES
    (2, 1),
    (6, 3),
    (8, 4),
    (3, 5),
    (2, 6),
    (3, 7);

-- PATIENT-COMPLAINT
-- combo key (of patient id, complaint id), and comments
-- This works but same as above, we have no official primary key
INSERT INTO patient_complaint (patient_id, complaint_id, pat_com_comments) VALUES
    (3, 1, 'Discharged'),
    (5, 2, 'Treated'),
    (4, 2, 'In treatment'),
    (6, 3, 'In treatment'),
    (1, 4, 'Discharged'),
    (2, 5, 'Discharged'),
    (7, 6, 'Referred externally');
    -- (16, 7, 'Discharged'),
    -- (21, 8, 'preparing treatment'),
    -- (23, 1, 'Discharged');





--DONT INSERT THIS - kept in case we need comments
-- Original but we don't need the comments - we have no comments column in doctor_treatment.
-- Don't insert this
INSERT INTO doctor_treatment (doctor_id, treatment_id) VALUES
    ((2,1), 'Patient needs to take medication for 7 days'),
    ((6,3), 'Patient vitals to be carefully observed whilst antibiotics administered'),
    ((8,4), 'Plaster cast fitted, discharge with callback in 6 mths.'),
    ((3,5), 'Cauterised wound, discharged with icepack'),
    ((2,6), 'Referal to external diagnostic services - tourettes'),
    ((3,7), 'Admit to covid ward for further treatment');








--- ADDITIONAL DATA ---
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES
  ('Drew','Sherman','1986-01-4','07691615152','sherman.drew2146@yahoo.org','83','Beaulieu Isaf','Fife','W8L 9OA',3,6,'2020-28-31','2021-08-24'),
  ('Herman','Mcfadden','1974-03-17','07426714887','herman_mcfadden2985@outlook.com','4','Glebe Wharf','Banffshire','KI55 1LS',2,3,'2020-24-8','2021-46-11'),
  ('Nadine','Terry','1984-09-24','07251241739','nadineterry@outlook.ca','97','Gipsy Hall','Wigtownshire','QU4U 6QV',3,12,'2020-53-4','2021-34-29'),
  ('Tamekah','Buck','1966-03-17','02432729657','b.tamekah4602@aol.com','60','Deans Garden','Cornwall','C6C 8QC',2,9,'2020-13-29','2021-52-1'),
  ('Pamela','Fuentes','1973-10-21','02424937542','fuentes-pamela8778@outlook.com','45','Thompson Strand','West Lothian','S7V 2BV',2,3,'2020-35-21','2021-27-21'),
  ('Jonah','Lloyd','1973-09-7','07747158832','l.jonah@hotmail.com','81','Fleming Newydd','Dumfriesshire','TJ6 2DW',3,1,'2020-29-18','2021-46-22'),
  ('Maggie','Simpson','1967-09-17','02953315339','maggie_simpson@outlook.ca','12','Stewart Side','Buteshire','U86 7IL',4,7,'2020-20-27','2021-49-10'),
  ('Bethany','Wolfe','1977-03-28','07946668941','b_wolfe8804@outlook.ca','2','Peveril Mews','Selkirkshire','EU2 7TH',4,2,'2020-26-7','2021-57-18'),
  ('Tate','Pitts','1979-07-9','02864568861','p-tate5332@icloud.net','3','Deer Park Garden','Kirkcudbrightshire','WO6F 2XM',3,8,'2020-37-21','2021-37-5'),
  ('Hu','Baker','1954-05-6','07313178171','h-baker581@yahoo.com','7','Hengistbury Road','Hampshire','PL3 4MX',1,10,'2020-03-19','2021-01-5');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES
  ('Autumn','Gentry','1986-06-21','02485528516','gentry_autumn@outlook.com','53','Berkeley Road','Banffshire','WH6S 3OK',5,11,'2020-12-23','2021-37-3'),
  ('Quinlan','Rice','1970-05-10','07868986739','quinlan_rice7311@hotmail.net','31','Ffordd Tresaith','West Lothian','DS6L 1XM',4,5,'2020-03-2','2021-22-19'),
  ('Solomon','Kelly','1948-02-19','07740135982','kelly.solomon5249@google.ca','37','Berkeley Road','Kirkcudbrightshire','JZ83 8LR',2,9,'2021-42-26','2021-07-30'),
  ('Leah','Miranda','1958-09-18','07481477445','leah.miranda@outlook.net','83','Lock Crest','Nairnshire','E1 6ZQ',1,9,'2020-55-14','2021-16-8'),
  ('Uriel','Kramer','1993-03-12','07758341444','krameruriel3670@google.org','12','Hengistbury Road','Brecknockshire','XS6 5ML',2,11,'2020-47-5','2021-39-12'),
  ('Shana','Flowers','1952-01-26','02161861465','f-shana@hotmail.ca','89','Gipsy Hall','Stirlingshire','OW20 3DD',4,4,'2020-02-5','2022-18-2'),
  ('Signe','Glenn','1962-04-1','07956740106','s.glenn9523@google.org','75','Old Park Banks','Norfolk','TF3 1YM',4,2,'2020-29-28','2021-41-9'),
  ('Chava','Peters','1985-04-20','02267318860','peterschava3518@protonmail.com','47','Westmorland Vale','Radnorshire','F33 1MS',3,2,'2020-39-27','2021-22-10'),
  ('Hadley','Campbell','1989-01-26','02506808874','c_hadley@protonmail.org','67','Lock Crest','Berwickshire','J5 4GP',2,1,'2020-52-15','2021-52-23'),
  ('Brody','Harper','1974-04-19','07067843842','brody-harper1920@aol.ca','53','Ffordd Tresaith','Shetland','L50 1RL',1,2,'2020-44-21','2021-48-21');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES
  ('Hamilton','Jennings','1992-11-20','07302356586','jenningshamilton@outlook.net','53','Washington Pastures','Berkshire','FX2Z 7WF',2,2,'2021-29-24','2021-09-17'),
  ('Fitzgerald','Villarreal','1958-06-12','07665131619','villarreal.fitzgerald@yahoo.couk','67','Redhill Copse','Sutherland','CO4E 0UU',4,9,'2020-35-9','2021-17-18'),
  ('Tad','Benjamin','1962-02-26','07488634069','btad8285@google.org','89','Deans Garden','Midlothian','O6 1AV',4,7,'2020-14-21','2021-05-29'),
  ('Neil','Barr','1981-07-9','07787735225','bneil@google.org','29','Woodville Brook','Merionethshire','SR9 2UE',3,3,'2021-51-12','2021-02-31'),
  ('Phoebe','Robertson','1964-04-25','07047620667','p_robertson6712@yahoo.net','61','Moorhouse Grange','Fife','LQ6 6FF',4,5,'2021-56-12','2021-24-11'),
  ('Orson','Wilcox','1948-05-27','02781181184','orsonwilcox1140@aol.couk','61','Thornfield Parade','Caithness','KT1 4UJ',4,8,'2020-12-29','2021-38-11'),
  ('Dawn','Myers','1954-09-18','02591482517','dawn_myers@icloud.net','17','Tamar Way','Renfrewshire','Y4 4AE',3,8,'2020-25-14','2021-28-2'),
  ('Stacy','Mills','1977-10-28','02755272642','stacy_mills9180@aol.couk','12','Thompson Strand','Shropshire','GA0 5XR',4,2,'2020-35-7','2021-02-9'),
  ('Emmanuel','Poole','1998-04-7','07986118615','p-emmanuel@protonmail.net','29','Beaumont Willows','Bedfordshire','J8C 0LC',4,12,'2020-48-27','2021-55-23'),
  ('Darius','Chaney','1999-10-16','07434887041','chaney-darius7195@hotmail.org','7','Deer Park Garden','Shropshire','DY4 3YO',2,9,'2020-38-16','2021-21-15');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES
  ('Cathleen','Lynn','1989-10-17','02426760826','c-lynn@icloud.com','79','Laurel Acre','Kinross-shire','L8S 4MR',4,12,'2021-41-19','2021-59-26'),
  ('Wallace','Francis','1983-07-29','07209473745','francis_wallace@hotmail.ca','89','Broughton Isaf','Oxfordshire','X27 3LJ',4,3,'2020-17-5','2021-05-15'),
  ('Dean','Hess','1961-07-24','02263564826','d_hess@aol.ca','31','Moorhouse Grange','Denbighshire','EX10 1OG',3,11,'2020-37-7','2021-56-21'),
  ('Pascale','Kline','1983-04-6','07236306189','k-pascale@google.net','14','Washington Pastures','Nairnshire','R5 8GC',4,4,'2020-19-15','2021-45-7'),
  ('Julie','Haynes','1969-03-20','02449503259','j.haynes@aol.org','43','Cheshire Parkway','Devon','DR9G 5SH',4,12,'2021-15-29','2021-38-22'),
  ('Larissa','Sims','1954-11-28','02627919688','l-sims9788@hotmail.com','45','Deer Park Garden','Derbyshire','SX9K 8OK',2,12,'2020-09-4','2021-15-3'),
  ('Magee','Cantrell','1971-03-18','07426505854','c-magee@google.com','43','Bower Hawthorns','Dunbartonshire','WD3 2IU',2,12,'2021-48-13','2021-07-11'),
  ('Lucian','Williamson','1989-02-11','07711825633','williamson.lucian4806@google.com','99','Denecroft','Westmorland','O6F 7RJ',4,11,'2020-05-25','2021-11-26'),
  ('Dante','Hudson','1987-07-2','02080133887','dante.hudson@protonmail.couk','2','Washington Pastures','Yorkshire','Z9 8BD',3,12,'2020-55-28','2022-27-2'),
  ('Jayme','Gonzales','1984-05-25','07045424833','gonzales-jayme@google.ca','73','Lock Crest','Flintshire','CD4M 4RI',2,4,'2020-14-12','2021-04-6');
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES
  ('Tatiana','Waller','1990-03-19','07716863481','waller.tatiana1884@google.org','3','Grampian Lane','Shetland','YV3C 4FP',3,10,'2020-33-6','2021-04-15'),
  ('Bradley','Mcneil','1986-08-26','02778751582','bradley-mcneil7264@aol.ca','2','Junction Ridge','Cardiganshire','I1H 3FE',2,3,'2020-47-19','2021-27-17'),
  ('Cadman','Cash','1994-04-29','07354317784','c-cash@protonmail.com','79','Ffordd Tresaith','Leicestershire','I6Z 6NH',5,2,'2020-53-21','2021-19-1'),
  ('Adrian','Torres','1950-04-8','07844336672','tadrian3914@google.ca','45','Washington Pastures','Somerset','OM42 3EH',1,4,'2020-47-15','2021-34-26'),
  ('Maggy','Gutierrez','1982-10-29','02714077796','g-maggy@hotmail.net','79','Berkeley Road','Orkney','X3T 2FI',1,10,'2020-19-10','2021-45-19'),
  ('Claudia','Paul','1999-01-11','02687877325','pclaudia@icloud.com','82','Milton Street','Inverness-shire','U1 1LN',4,3,'2021-19-31','2021-46-24'),
  ('Ramona','Steele','1996-09-19','02783367173','rsteele@yahoo.com','4','Argyll Glen','Orkney','T2 5CQ',4,4,'2020-29-4','2021-57-10'),
  ('Tatyana','Swanson','1991-03-16','02595233052','t_swanson@protonmail.couk','47','Great Glass','Huntingdonshire','FR2J 6KY',5,2,'2021-28-4','2021-42-11'),
  ('Gary','Mccall','1978-04-1','02345339275','mccallgary7104@protonmail.org','89','Ferndown Court','Midlothian','N3O 6EA',4,12,'2021-18-9','2021-54-5'),
  ('Benedict','Walsh','1983-03-24','07174628656','walshbenedict9686@hotmail.ca','1','Ffordd Tresaith','Staffordshire','B0 8OV',2,12,'2020-08-7','2021-09-25');
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES    
  ('Meghan','Frost','1949-01-26','07953395865','fmeghan135@aol.couk','5','Junction Ridge','Lancashire','A2Z 7FH',2,2,'2020-29-30','2021-39-21'),
  ('Lance','Glover','1987-11-2','02091569544','l-glover@icloud.couk','81','Derwent Wharf','Sussex','I08 4EV',4,11,'2020-43-15','2021-36-12'),
  ('Olivia','Wilkinson','1970-11-23','07461677692','owilkinson@google.ca','83','Glover Paddocks','Brecknockshire','H2Q 8EF',3,4,'2021-23-15','2021-54-6'),
  ('Cairo','Young','1964-09-30','02279234532','c.young8465@icloud.couk','13','Grampian Lane','Dorset','ES96 2ZH',2,2,'2021-14-5','2021-16-13'),
  ('Margaret','Shannon','1959-05-26','02335733122','margaretshannon5504@google.org','55','Amber Cross','Cardiganshire','RO72 9XV',3,1,'2021-16-17','2021-02-4'),
  ('Drew','Stuart','1972-02-16','02077587893','d_stuart4924@google.couk','13','Ullswater Crest','Huntingdonshire','P3 9CG',5,8,'2020-46-14','2021-07-12'),
  ('Demetrius','Burns','1969-08-23','07141653775','demetrius-burns@google.couk','23','Old Park Banks','Renfrewshire','VX68 1UW',4,6,'2020-27-2','2021-13-31'),
  ('Urielle','Simmons','1965-09-12','07085552477','usimmons@outlook.org','1','Argyll Glen','Berwickshire','C2J 6FS',1,4,'2020-21-27','2021-17-11'),
  ('Hilary','Fernandez','1961-04-7','07756037462','fernandezhilary2119@google.org','81','Junction Ridge','Anglesey','Z86 3CR',2,6,'2021-47-7','2021-56-21'),
  ('Patrick','Jefferson','1983-11-12','02542337758','p.jefferson@google.com','45','Junction Ridge','Lincolnshire','OM22 9HO',2,3,'2020-05-12','2021-43-1');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES  
  ('Wylie','Moon','1958-07-7','07856335241','m-wylie@protonmail.couk','55','Fleming Newydd','Orkney','F2C 5LP',5,11,'2020-56-22','2021-26-16'),
  ('Herman','Hartman','1996-04-3','02698223242','h.hartman@aol.net','73','Redhill Copse','Dorset','KT8B 3MT',5,7,'2020-37-7','2021-19-24'),
  ('Carson','Snider','1991-10-11','07435128942','snider_carson8283@google.net','73','Thornfield Parade','Wiltshire','C8 2WJ',4,9,'2020-40-26','2021-33-22'),
  ('Vanna','Patterson','1973-05-6','02250642026','patterson_vanna@yahoo.couk','37',' Hillside Wood','Pembrokeshire','H79 7WL',4,7,'2020-40-12','2021-35-15'),
  ('Mohammad','Ayala','1984-10-7','02684010896','mohammad-ayala4807@protonmail.couk','65','Redhill Copse','Derbyshire','YY7 6EV',1,11,'2020-38-9','2021-23-4'),
  ('Armand','Wilkins','1996-03-1','07202243317','w-armand1323@hotmail.org','3','Westbourne Cloisters','Wiltshire','TV38 3XP',1,11,'2020-32-7','2021-37-24'),
  ('Ann','Leon','1949-01-1','02814290758','lann@aol.org','11','Tamar Way','Suffolk','D1P 7LT',4,6,'2021-31-20','2021-49-26'),
  ('Mark','Guzman','1995-03-18','02377541253','guzman-mark@protonmail.com','1','Ffordd Tresaith','Lanarkshire','N43 2HB',3,11,'2020-20-16','2021-02-13'),
  ('Nicole','Herring','1973-05-25','07854399446','herring-nicole6148@protonmail.org','82',' Hillside Wood','East Lothian','E42 8IR',3,9,'2021-12-23','2021-10-26'),
  ('Whitney','England','1949-03-23','07191336474','whitneyengland@yahoo.couk','60','Moorhouse Grange','Caithness','W1R 1QO',3,9,'2020-47-14','2021-02-25');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES  
  ('Calvin','Avery','1989-06-21','02597721916','c-avery@yahoo.org','35','Junction Ridge','Worcestershire','EK8 3JG',5,5,'2020-22-26','2021-28-19'),
  ('Yen','Berg','1951-05-4','02537079179','yberg@google.net','59','Hay Place','Morayshire','OO1 0JJ',5,12,'2020-08-7','2021-35-20'),
  ('Donovan','Phelps','1964-04-5','07004914458','phelpsdonovan9957@aol.ca','59','Cheshire Parkway','Somerset','V7 5PC',2,7,'2020-00-13','2021-30-2'),
  ('Drake','Russo','1993-12-25','07435068818','russo.drake5892@aol.com','1','Woodbine Gait','Shetland','N9 1PO',4,12,'2021-57-15','2021-41-18'),
  ('Emily','Riggs','1984-08-30','07685054450','riggs_emily224@aol.com','31','Junction Ridge','Devon','ID9P 5UW',1,12,'2020-56-28','2021-36-29'),
  ('Tashya','Daniels','1991-08-24','07719158710','tashyadaniels3857@aol.com','61','Marlborough Grove','Anglesey','LB59 5NS',3,11,'2020-25-27','2021-44-18'),
  ('Guinevere','Colon','1975-03-31','02028259362','g_colon3723@aol.ca','1','Hengistbury Road','Dumfriesshire','R8 1SX',3,6,'2020-05-30','2021-01-22'),
  ('Amber','Dunlap','1957-11-21','07721566288','amber_dunlap@aol.couk','31','Glebe Wharf','Gloucestershire','I11 8VQ',4,7,'2020-13-16','2021-51-2'),
  ('Mallory','Graves','1995-01-6','02833555838','mallory.graves@outlook.ca','1','Stewart Side','Cardiganshire','FX8K 5SL',5,3,'2020-10-28','2021-24-3'),
  ('Jermaine','Conrad','1974-10-19','02627233210','conrad.jermaine@aol.org','19','Westmorland Vale','Derbyshire','R1 6LO',2,2,'2020-14-2','2021-23-27');

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_admitted,
    patient_discharged) VALUES  
  ('Rigel','Garcia','1953-12-6','02617268166','rgarcia2212@google.org','1','Moorhouse Grange','Dorset','T8U 2BW',5,9,'2021-06-8','2021-26-11'),
  ('Erica','Alford','1989-04-3','07998871186','alford.erica2939@yahoo.net','81','Rhodes Street','Leicestershire','MZ1 5IB',3,10,'2020-40-21','2021-56-20'),
  ('Paki','Charles','1996-02-14','07466327706','p_charles@yahoo.ca','75','John Day Close','Durham','JO2L 4UI',3,13,'2021-52-9','2021-04-10'),
  ('Isaac','White','1964-05-4','07143185455','iwhite3389@hotmail.net','4','Beaumont Willows','Cambridgeshire','J1K 6RF',4,9,'2020-26-1','2021-50-25'),
  ('Benedict','Griffith','1971-02-21','07750831173','b-griffith@protonmail.ca','53','Woodville Brook','Kinross-shire','D4 5ML',3,11,'2021-03-8','2021-40-2'),
  ('Brady','Santana','1996-07-25','02153145321','b_santana9800@outlook.couk','43','Old Park Banks','Kinross-shire','S8 4QJ',4,9,'2021-40-24','2021-54-26'),
  ('Zachary','Griffin','1999-06-30','02549584168','z_griffin@icloud.ca','61','Hay Place','Leicestershire','Z5H 6PT',4,7,'2020-40-6','2021-35-5'),
  ('Elvis','Rosales','1950-03-25','07234444030','r-elvis1164@hotmail.couk','82','Woodbine Gait','Durham','M6B 9DM',2,11,'2020-08-15','2021-45-28'),
  ('Wade','Farley','1956-07-23','02716996679','w.farley1994@hotmail.ca','82','Old Park Banks','Buckinghamshire','YW25 8JV',2,6,'2021-49-17','2021-40-8'),
  ('Shaine','Potter','1984-05-15','02385789504','potter_shaine5708@google.org','5','Laurel Acre','Denbighshire','G5E 1JE',2,12,'2021-52-31','2022-39-11');

--- PATIENT DATA ---
  





  INSERT INTO staff_nurse (nurse_id, is_head_nurse, nurse_ward)
VALUES
    (11, TRUE, 4),
    (22, FALSE, 4),
    (12, TRUE, 5),
    (22, FALSE, 5),
    (13, TRUE, 6),
    (23, FALSE, 6),
    (14, TRUE, 7),
    (24, FALSE, 7),
    (15, TRUE, 8),
    (25, FALSE, 8),
    (16, TRUE, 9),
    (26, FALSE, 9),
    (17, TRUE, 10),
    (27, FALSE, 10),
    (18, TRUE, 11),
    (27, FALSE, 11),
    (19, TRUE, 12),
    (28, FALSE, 12),
    (20, TRUE, 13),
    (29, FALSE, 13),
    (21, TRUE, 0),
    (30, FALSE, 0),

-- STAFF DOCTORS
-- Staff Doctor 
-- this works
INSERT INTO staff_doctor (doctor_id) VALUES
    (31),
    (32),
    (33),
    (34),
    (35),
    (36),
    (37),
    (38),
    (39);