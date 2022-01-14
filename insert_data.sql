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

--- PATIENT DATA ---
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Dylan','Webster','1986-9-3','7856757553','in.faucibus@hotmail.ca','68','Parkland Retreat','West Lothian','YL5 0UO',3,33),
  ('Barbara','Beard','1975-5-31','7858395371','nonummy.ultricies@icloud.ca','24','Oakley Woodlands','Stirlingshire','K9 6GF',3,31),
  ('Talon','Hardy','1995-5-25','7485688107','ultricies.sem@hotmail.ca','61','Townsend Links','Lanarkshire','X26 8NP',3,34),
  ('Daniel','Taylor','1986-9-24','7311770785','interdum.libero@aol.net','31','Greyfriars Hills','Flintshire','ZC70 4VG',2,31),
  ('Desiree','Donaldson','1987-4-10','7985457711','gravida.praesent.eu@yahoo.org','91','Old Glebe','Inverness-shire','CM1 2HE',2,31),
  ('Richard','Waters','1991-4-17','7285444172','egestas.aliquam.nec@icloud.org','47','Adam Crest','Flintshire','GB5 6TM',5,29),
  ('Audra','Chapman','1975-11-4','7230266471','mi.aliquam.gravida@outlook.edu','97','Greyfriars Hills','Argyllshire','YD3 3CH',4,31),
  ('Caryn','Meyers','1971-9-17','7115272419','non.dapibus@icloud.org','84','Ashton Paddock','Buckinghamshire','ZD7X 5SQ',2,31),
  ('Lenore','Trevino','1973-5-21','7313357778','mi.enim.condimentum@hotmail.couk','17','Mortimer Glebe','Suffolk','D5P 1HD',1,35),
  ('Renee','Lamb','1987-6-16','7273554188','maecenas.malesuada.fringilla@outlook.org','45','Greyfriars Hills','Nottinghamshire','B86 9HG',3,29);
  
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Tucker','Freeman','1984-4-27','7886475847','nibh.lacinia.orci@outlook.com','40','Tudor Hills','Carmarthenshire','D56 6IH',3,34),
  ('Kato','Molina','1989-11-14','7239052051','facilisis@google.edu','55',' Alice Row','Lancashire','XK6F 1OM',4,35),
  ('Garth','Booth','1991-12-1','7276245877','orci.lobortis@aol.ca','1','Allen Knoll','Aberdeenshire','HK63 1FI',3,31),
  ('Galena','Pugh','2001-6-14','7662415582','dolor.tempus.non@protonmail.com','44','Farriers Elms','Angus','IL4 9FY',1,31),
  ('Xaviera','Osborn','1999-7-5','7657768947','semper.cursus@google.edu','69','Greyfriars Hills','Cambridgeshire','W4 4CZ',2,30),
  ('Cain','Newman','1988-1-29','7854852236','nunc.ut.erat@icloud.ca','44','Ben Bhraggie Drive','Wiltshire','J21 9SK',4,41),
  ('Hu','Pugh','1980-1-30','7533768833','magnis.dis@outlook.org','20','Greyfriars Hills','Angus','L8 5FT',1,38),
  ('Neville','Klein','1979-1-3','7633714597','rutrum.fusce.dolor@yahoo.org','83','St Leonards Woodlands','Pembrokeshire','IJ38 6SX',2,33),
  ('Vanna','Vega','1997-7-19','7378576251','id.blandit@hotmail.edu','66','Tudor Hills','Staffordshire','Q0O 2TF',3,30),
  ('Cole','Rhodes','1984-9-26','7261563667','vestibulum.nec@google.couk','3','Ben Bhraggie Drive','Suffolk','AP4C 8EE',4,34);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Jessamine','Joseph','1998-3-28','7401358285','adipiscing@outlook.edu','94','St Leonards Woodlands','Pembrokeshire','R6 6MS',2,37),
  ('Magee','Waters','1985-8-24','7467186958','libero.donec@protonmail.ca','11',' Belvoir Leaze','Wiltshire','D47 7EL',3,37),
  ('Kevyn','Mills','1971-6-1','7935145872','urna.nunc.quis@outlook.org','9',' Belvoir Leaze','Morayshire','DJ71 4RC',4,34),
  ('Kato','Bennett','1992-6-16','7480318236','fusce@outlook.couk','81','Kingfisher Pleasant','Nairnshire','K1V 4EM',4,30),
  ('Leah','Noel','1976-10-22','7885513143','dui.nec@outlook.com','55','Mortimer Glebe','Dumfriesshire','D46 1BS',1,42),
  ('Jeremy','Mosley','1999-10-10','7025176522','quis.tristique.ac@yahoo.edu','9','St Johns Banks','Denbighshire','Q95 3HF',4,30),
  ('Tara','Newman','1993-11-24','7333133813','et@google.couk','32','Limes Hill','Clackmannanshire','DJ78 9XU',1,41),
  ('Avye','Roach','1988-10-30','7895960641','quam.quis@aol.net','26','Old Glebe','Westmorland','M78 2SW',2,33),
  ('Sade','Gibson','1985-1-12','7188022795','ipsum@icloud.net','96','Strawberry Isaf','Norfolk','O9 7FS',3,30),
  ('Garrison','Snow','1973-12-6','7377572139','nec.tempus@aol.net','62','Church Farm Retreat','Argyllshire','ID2M 6QE',4,39);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Jennifer','Deleon','1988-6-30','7326302652','augue.sed@aol.net','62','Adam Crest','Nairnshire','SN24 5EG',2,40),
  ('Gretchen','Blair','1983-4-25','7932038426','ac.libero.nec@google.edu','13','Brockley Wynd','Dorset','B9 2PE',2,35),
  ('Cassandra','Guerra','1979-2-2','7657179676','mollis.dui@aol.edu','45','Anchorage Way','Northumberland','X5P 4VE',3,31),
  ('Germane','Guy','1969-2-9','7291914016','ipsum.ac@outlook.ca','64','Tudor Hills','Kinross-shire','E14 1VE',3,32),
  ('Jordan','Malone','1998-8-13','7677266519','cursus.et.magna@outlook.couk','41','Greyfriars Hills','Dorset','QB8L 5NP',3,31),
  ('Justin','Holman','1971-6-18','7083748537','adipiscing.mauris.molestie@hotmail.net','33','Furness Paddock','Cornwall','DT1 7MZ',2,34),
  ('Axel','Bell','1989-9-17','7360768240','mus@icloud.ca','31','Carver Lane','Kincardineshire','X8P 5KS',3,32),
  ('Emma','Casey','1971-6-5','7374180616','rhoncus.nullam@protonmail.edu','44','Anchorage Way','Derbyshire','T54 4PT',3,30),
  ('Tiger','Joyner','1995-12-20','7515827179','penatibus.et@google.com','19','Carver Lane','Monmouthshire','C80 5XO',4,32),
  ('Leslie','Coleman','1991-1-25','7271272556','eu.arcu.morbi@aol.edu','81','Parkland Retreat','Lanarkshire','VU95 0UD',3,34);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Hedda','Castro','1982-2-14','7823788266','arcu.nunc@hotmail.org','17','Farriers Elms','Orkney','D7 7JR',5,30),
  ('Salvador','Wilkerson','1985-2-25','7898537848','gravida.molestie@hotmail.com','91',' Belvoir Leaze','Angus','C3M 4QO',5,29),
  ('Shad','Gordon','1996-6-12','7492482800','eleifend.egestas.sed@outlook.net','45','Brick Holt','Monmouthshire','Y95 7AQ',3,34),
  ('Lysandra','Preston','1987-4-9','7505075661','convallis.est@protonmail.com','5','Ashton Paddock','Dunbartonshire','PD5 9UQ',3,32),
  ('Paula','Lee','1971-4-26','7275617866','lorem.vitae@hotmail.com','23','Tudor Hills','Buteshire','F16 9KE',1,38),
  ('Autumn','Ashley','1984-12-11','7495457531','metus.vitae@icloud.org','11','St Johns Banks','Norfolk','Q4S 0EF',2,36),
  ('Aurelia','Barton','1996-6-18','7185405324','neque.tellus@outlook.ca','23','Limes Retreat','Bedfordshire','X1N 0FY',2,31),
  ('Shannon','Dalton','1984-9-27','7880851743','iaculis.enim@outlook.net','46','Ball Street','Kent','X9 0OB',1,39),
  ('Zelda','Witt','1984-8-17','7177657916','leo.elementum@hotmail.couk','32','Weavers Holt','Midlothian','TV8B 8XP',5,38),
  ('Alika','Brock','1990-5-30','7877663624','malesuada.fames@outlook.ca','55',' Belvoir Leaze','Pembrokeshire','Q8 8OC',1,40);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Aphrodite','Garcia','1992-7-24','7255613553','pellentesque.habitant@outlook.net','64','Parkland Retreat','East Lothian','TE6 6WJ',4,40),
  ('Wesley','Holland','1994-4-30','7340024935','donec.egestas@google.ca','26','Townsend Links','Selkirkshire','CW0W 9RQ',4,36),
  ('Orli','Norton','1982-6-19','7977153916','habitant.morbi@aol.couk','41','Adam Crest','Devon','CL4D 4EX',4,38),
  ('Byron','Foster','1975-9-20','7713265871','pede.et.risus@icloud.org','62',' Alice Row','Gloucestershire','X59 6DK',2,31),
  ('Jenna','Aguilar','1972-10-8','7553728507','sed.auctor@google.couk','19','Oakley Woodlands','Worcestershire','E7 6TE',4,40),
  ('Rashad','Stout','1993-7-28','7888859167','tellus.non@hotmail.com','32','Ben Bhraggie Drive','Orkney','LY38 2ZF',1,37),
  ('Beatrice','Trevino','1985-10-27','7465435016','iaculis.enim.sit@outlook.com','61','Carrsides Lane','Cardiganshire','Z15 8RL',3,31),
  ('Alexa','Boyle','1991-9-14','7771983383','pede.praesent@aol.com','42','Winifred Drive','Montgomeryshire','T1G 1FO',1,33),
  ('Quynn','Porter','1985-3-2','7168016159','torquent.per.conubia@hotmail.edu','17','Townsend Links','Dumfriesshire','L9 7HI',5,38),
  ('Jasper','Merritt','1992-10-1','7276726718','sit.amet.metus@protonmail.couk','13','Kingfisher Pleasant','Inverness-shire','H0T 3VK',2,39);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Chancellor','Giles','1980-3-29','7968773702','ultrices.posuere.cubilia@icloud.couk','81','Ball Street','Kincardineshire','KR5 6YG',4,31),
  ('Halla','Puckett','1988-9-2','7952143886','sapien.molestie.orci@google.edu','99','Limes Retreat','Pembrokeshire','R5 7QE',1,38),
  ('Naomi','Hansen','1975-8-28','7481919239','aliquam@outlook.com','81','Cartmel Manor','Bedfordshire','DV85 7EE',1,29),
  ('Gisela','Durham','1982-4-21','7886436215','ultricies@google.org','96','Ashton Paddock','Gloucestershire','VO3 0OV',4,39),
  ('Wallace','Donaldson','1980-12-27','7557606661','ridiculus.mus@aol.ca','13','Furness Paddock','Durham','YS8 7FJ',1,42),
  ('Kaye','Mcclain','1986-12-4','7803945631','ridiculus.mus.proin@yahoo.couk','44','Sidney Hey','Caithness','J78 6EI',2,35),
  ('Keith','Moses','1982-11-26','7615685644','congue@protonmail.net','19','Brampton Brow','Denbighshire','HN7 8TO',3,39),
  ('Bruno','Ramos','1992-11-21','7663288748','vulputate@hotmail.edu','19','Mortimer Glebe','Sussex','L1M 8WK',2,31),
  ('Elmo','Valentine','1982-5-25','7276316489','nonummy.fusce@icloud.com','35','Strawberry Isaf','Kent','SJ7Q 3YL',3,31),
  ('Caryn','Stokes','1998-7-4','7144683272','at.libero.morbi@icloud.ca','46','St Johns Banks','Nottinghamshire','E1W 3YX',3,40);

  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Kane','Guerrero','1992-6-22','7563879661','senectus.et.netus@aol.com','70','Townsend Links','Lanarkshire','Q34 6BX',3,36),
  ('Lucas','Wright','1982-3-23','7698423048','metus@icloud.edu','48','Willow Glas','Merionethshire','GD34 1MT',3,32),
  ('Mona','Anthony','1977-2-10','7686240607','elit.pede@outlook.edu','65','Allen Knoll','Aberdeenshire','E1 8CT',4,42),
  ('Allistair','Morgan','1989-11-21','7156841577','velit.justo.nec@google.couk','30','Adam Crest','Surrey','SW5 0BV',1,39),
  ('Rigel','Lindsay','1999-8-2','7231992763','nibh.dolor@aol.net','40',' Alice Row','Sutherland','PC44 6PN',1,31),
  ('Meredith','Gomez','1995-7-22','7450163178','in.faucibus@hotmail.edu','22','Perkins Square','Roxburghshire','K7D 3MK',1,34),
  ('Lara','Lyons','1998-1-31','7987131545','iaculis@icloud.net','44','Winifred Drive','Inverness-shire','G5 8SS',1,31),
  ('Zeph','Castro','1986-6-15','7265188630','ultricies@outlook.com','47','Perkins Square','Devon','I7C 1GL',3,30),
  ('Avram','Rios','1971-4-4','7761328467','sem.egestas@icloud.couk','43','St Leonards Woodlands','Buteshire','P7B 8MD',5,41),
  ('Emma','Richards','1984-10-23','7450977557','tellus.id.nunc@yahoo.couk','19','Holbrook Loke','Morayshire','VF5J 1LI',4,41);

  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Desiree','Ratliff','1993-4-11','7119118421','gravida.aliquam@aol.ca','64','Brampton Brow','Essex','VU03 5XW',2,29),
  ('Tucker','Bowman','1984-7-9','7633584345','pede.praesent@yahoo.com','23',' Alice Row','East Lothian','I43 2JB',1,30),
  ('Alexis','Lambert','1997-1-5','7843875577','litora.torquent@protonmail.couk','63','Willow Glas','Kirkcudbrightshire','OC8 5CI',3,34),
  ('Robert','Stanley','1988-4-15','7832989536','sed@protonmail.edu','82','Winifred Drive','Monmouthshire','HA6J 4MP',5,41),
  ('Colt','Duke','1969-12-6','7951865165','pellentesque.a@yahoo.com','44','Furness Paddock','Fife','PY7 9QB',1,38),
  ('Sylvia','Jacobs','1977-6-25','7441526526','vitae@yahoo.ca','26','Strawberry Isaf','Northamptonshire','R29 2ZJ',5,31),
  ('Davis','Huffman','1979-3-19','7206435472','quisque.fringilla@icloud.couk','9','Burnham Wood','Cheshire','DO7M 5XI',3,39),
  ('Anastasia','Hopkins','1997-8-20','7815134579','porta.elit@google.couk','67','Cartmel Manor','Wiltshire','U81 1PP',3,39),
  ('Thane','West','1991-3-13','7844688501','euismod.mauris@aol.org','69','Ben Bhraggie Drive','Wigtownshire','ZL15 3YV',2,41),
  ('Kasper','Obrien','1981-12-9','7286663346','nisi.cum@hotmail.edu','22','Tudor Hills','Lancashire','G44 4JJ',3,35);

  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward) VALUES
  ('Camden','Mathis','1997-11-12','7888826011','aliquet.diam@outlook.com','62','Winifred Drive','Fife','WO15 3ZY',4,33),
  ('Jacqueline','Day','1974-5-8','7305841752','felis@aol.couk','83','Sidney Hey','Banffshire','DP6G 7EJ',4,39),
  ('Judah','Maldonado','1990-1-13','7103961866','lorem.sit@protonmail.couk','48','Tudor Hills','Pembrokeshire','XR2 4VW',5,30),
  ('Quyn','Rios','1976-10-21','7387768021','iaculis.aliquet@outlook.couk','1','St Leonards Woodlands','Argyllshire','WW3X 4QB',1,31),
  ('Madison','Mccray','1997-5-2','7477521389','dolor.fusce.mi@hotmail.org','9','Old Glebe','Midlothian','X4 4XQ',2,36),
  ('Veda','Perkins','1993-12-23','7411439264','sed@aol.ca','99','Church Farm Retreat','Cornwall','GI6 8RG',2,34),
  ('Channing','Chambers','1983-6-1','7573441639','nibh@aol.net','11','Anchorage Way','Kent','X53 2RA',2,40),
  ('Olympia','Mccormick','1991-4-3','7578674018','nisi.a@aol.edu','40','St Johns Banks','Cardiganshire','R0N 4SZ',2,39),
  ('Upton','Ortiz','1969-1-17','7953570667','iaculis@outlook.net','67','Parkland Retreat','Lincolnshire','AX49 7ZT',3,30),
  ('Aimee','Maddox','1976-1-23','7816878591','tincidunt.aliquam.arcu@icloud.org','68','Heaton Copse','Wigtownshire','L2 3CO',2,42);

-- PLEASE NO MORE PATIENTS

INSERT INTO staff (staff_fname, staff_lname, staff_dob, staff_phone, staff_email, staff_add1, staff_add2, staff_county, staff_postcode) VALUES
 ("Hoyt","Steele","13-08-1950","076 7525 2458","sed.eu.nibh@yahoo.net","32"," Rock Lawns","Dumfriesshire","SI73 9WH"),
  ("Belle","Mclaughlin","16-04-1975","0845 46 41","ut@protonmail.edu","32","Ladywell Hills","Clackmannanshire","AB68 7MR"),
  ("Kaitlin","Simon","05-07-1967","0845 46 43","mauris.quis@protonmail.org","86","Saddlers Meadows","Inverness-shire","RX3 0VF"),
  ("Vielka","Haney","03-07-1963","(027) 1149 1724","montes.nascetur@aol.net","49","Ladywell Hills","Glamorgan","DT6 8PO"),
  ("Cedric","Alford","02-05-1957","07872 518810","eu.erat.semper@outlook.com","65","Sandhurst Grove","Argyllshire","I52 4ES"),

  ("Levi","Morrow","13-06-1962","0938 286 3391","ultricies.dignissim@icloud.net","37"," Peel Avenue","Merionethshire","X0 7HG"),
  ("Nathaniel","Vazquez","25-02-1984","056 0635 1957","non.nisi@google.org","45","Wheatsheaf Fairway","Lanarkshire","G4R 6TN"),
  ("Edan","Dennis","21-04-1963","07624 019640","non.justo.proin@icloud.edu","34","Melrose Cliff","Argyllshire","V6 5RK"),
  ("Tyrone","Fisher","04-11-1978","(01215) 26372","sed@protonmail.org","25","Raven Brae","Denbighshire","J2 6OR"),
  ("Garrison","Gallagher","20-09-1990","(01567) 12654","tellus.sem.mollis@outlook.couk","13","Raven Brae","Herefordshire","K33 8RJ"),

  ("Chase","Duran","01-04-1971","07553 131725","natoque@hotmail.org","74","Saddlers Meadows","Kinross-shire","RK3I 8GE"),
  ("Fleur","Jefferson","27-07-1999","(0151) 407 8704","cras.eu.tellus@hotmail.com","32","Spinney Passage","Kincardineshire","J4 6DR"),
  ("Jason","Mays","24-07-1961","(0161) 895 1135","consectetuer@google.edu","28","Waltham Courtyard","Dorset","NL03 3SV"),
  ("Kenneth","Nixon","31-01-1959","0353 873 2383","dictum@aol.couk","79"," Ringwood Mews","Dumfriesshire","VV18 9NH"),
  ("Desirae","Welch","22-02-1986","(020) 8179 6547","ac.ipsum@protonmail.couk","87","Stuart Dell","Midlothian","OT3 7FU"),
--24
  ("Alan","Ware","29-05-1962","0800 981147","non.arcu@outlook.org","24","Brackenlea","Renfrewshire","FB3M 6HY"),
  ("Melvin","Melton","20-11-1980","056 7474 2773","nullam.suscipit@aol.edu","31","Brookhouse Woods","Inverness-shire","HY78 6JW"),
  ("Yeo","Potter","20-10-1996","(016977) 5546","eu.metus@icloud.couk","27","Nicholson Rise","Lanarkshire","YC6 8IS"),
  ("Rashad","Rush","03-09-1962","056 2187 1803","cum.sociis@icloud.couk","47","Howden Lodge","Westmorland","VD1 3YP"),
  ("Jacob","Velez","01-09-1985","070 1811 6623","diam.pellentesque@hotmail.edu","27","Sandhurst Grove","Kent","BV2 4MB"),

 -  ("Thomas","Shields","15-06-1984","(01676) 146149","sed.nec.metus@outlook.ca","76","Post Office Village","Gloucestershire","A6 7UP"),
  ("Nero","Marshall","23-03-1967","0845 46 48","orci@google.edu","52","Seaview Road","Ayrshire","JL8 4YO"),
  ("Libby","Higgins","27-02-1984","056 1164 7282","arcu@outlook.net","50","Dawson Ridge","Aberdeenshire","DL9J 5OO"),
  ("Freya","Doyle","05-04-1974","0845 46 44","dictum.sapien@protonmail.ca","97","Dundee Terrace","Wiltshire","R57 3UU"),
  ("Hadassah","Miranda","29-03-1979","0397 874 6865","sed.congue@icloud.edu","39","Stone Court","Banffshire","O83 2XR"),

    ("Carlos","Manning","23-12-1996","0800 1111","cum.sociis@yahoo.couk","77","Shapwick Road","Lancashire","MG53 9UG"),
  ("Magee","Logan","05-05-1984","(01767) 422465","pede.blandit.congue@aol.edu","73","Brookhouse Woods","Banffshire","V1 3WJ"),
  ("Kelsey","Benton","05-08-1969","(016977) 1583","nulla@yahoo.couk","91","Nicholson Rise","Gloucestershire","O34 0NU"),
  ("Ann","Shepherd","23-08-1969","0800 1111","varius.nam@yahoo.net","51","Stone Court","Pembrokeshire","G7U 3SD"),
  ("Anika","Barr","01-07-1963","0500 224625","ante.dictum@hotmail.org","74","Howden Lodge","Yorkshire","G8 0VQ");

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