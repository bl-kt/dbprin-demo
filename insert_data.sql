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
    (1, TRUE, 29),
    (4, FALSE, 30),
    (5, FALSE, 31),
    (7, TRUE, 32),
    (9, TRUE, 33),
    (10, FALSE, 34);

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
    2, 29),
    ('Tawanda', 'Muyeye', '1948-03-05', '07968152882', 't.muyeye@gmail.com',
     '50', 'Hamphire Drive, Maidstone', 'Hampshire','ME15 7ES',
      1, 30),
    ('Adrian', 'Burl', '1955-07-02', '07618156822', 'a.burl99@gmail.com',
     '30', 'North Baddesley', 'Hampshire', 'SO52 9JU',
      4, 31),
    ('Tadiwanashe', 'Ditima', '1968-12-12', '07115156832', 't.ditima@gmail.com',
     '22', 'Shakespeare Road', 'Portsmouth', 'PO1 5LF',
      3, 32),
       ('Anthony', 'Pearson', '1970-05-20', '0716286851', 'A.Pearson@yahoo.co.uk',
     '33', 'Droorey Lane', 'Petersfield', 'UP2 4UJ',
      1, 34),
    ('Alexander','Ratliff','1967-10-22', '08008719187','enim@icloud.edu',
     '78','Faucibus St.','Bedfordshire','GL8 4DD',
     1, 35),
       ('Callum','Francis','2001-12-22', '05548858371','vulputate.dui.nec@icloud.co.uk',
     '45', 'Av Lane', 'Derbyshire','RF6 1AY',
     3,37);

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
    ('Paul', 'Jackson', '2000-03-12', '07116786438', 'paulJackson@harvard.edu.us',
     '93', 'Dreighfield Drive', 'Berkshire', 'SL8 4QT',
      2, 33, 'Patient must be supervised 24/7'),
    ('Demetria','Sutton','1986-11-21', '01513565815','dignissim@google.net',
     '45', 'Williams Road','Rutland','S8 6AE',
     2,36,
     'Nullam enim. Sed nulla ante, iaculis nec,'),
    ('Abel','Garrison','1972-02-22', '01487027927','elementum@icloud.com',
     '82','Magnis St.','Norfolk','W49 5PU',
     4,39,
     'a felis ullamcorper viverra. Maecenas iaculis aliquet'),
    ('Bertha','Bartlett','1993-10-22', '05687602427','parturient@outlook.edu',
     '56','Fermentum Ave','Merionethshire','U5V 6YP',
     3,40,
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
    (1, 1, 'Discharged'),
    (2, 2, 'Treated'),
    (4, 2, 'In treatment'),
    (6, 3, 'In treatment'),
    (5, 4, 'Discharged'),
    (7, 5, 'Discharged'),
    (8, 6, 'Referred externally'),
    (9, 7, 'Discharged'),
    (2, 8, 'preparing treatment'),
    (3, 1, 'Discharged');





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
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Amena","Swanson","1991-12-17","7153860182","morbi.accumsan.laoreet@hotmail.edu","55","Allen Knoll","Carmarthenshire","P7 1LR","3","29-42"),
  ("Brittany","Stokes","1972-1-3","7848083975","elit@google.ca","23","Old Glebe","Orkney","Y6W 6FX","3","29-42"),
  ("Isaac","Dean","1990-9-11","7889839650","justo@google.couk","26","Willow Glas","Inverness-shire","YS8J 8JR","4","29-42"),
  ("Nayda","Norris","1980-3-28","7183133512","molestie.pharetra@hotmail.edu","66","Roffey Street","Inverness-shire","R2 6MR","5","29-42"),
  ("Sonia","Mason","1984-8-17","7668965673","ipsum@google.org","19","Cartmel Manor","Worcestershire","ES9 0QU","4","29-42"),
  ("Timothy","Martin","1986-8-23","7465458526","ligula.elit@icloud.org","30","Perkins Square","Wigtownshire","V2 7QA","5","29-42"),
  ("Malik","Hernandez","1981-5-15","7431580162","nulla.aliquet@yahoo.edu","25","Limes Retreat","Angus","D5 3YR","5","29-42"),
  ("MacKenzie","Flores","1981-9-18","7105408622","vitae.mauris.sit@hotmail.com","99","Brampton Brow","Sussex","A50 4BI","5","29-42"),
  ("Dylan","Rasmussen","1973-7-27","7871657676","vulputate.nisi.sem@google.org","62","Ashton Paddock","Hertfordshire","I5 0VR","3","29-42"),
  ("Joan","Browning","1997-6-18","7212832905","aenean.eget@yahoo.ca","87","Anchorage Way","Argyllshire","RS84 6HY","4","29-42");
  
INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Brielle","Clarke","1997-9-18","7987177271","cum.sociis@outlook.edu","32","Farriers Elms","Lancashire","VL7W 8BV","4","29-42"),
  ("Brynne","Mcgowan","1973-4-19","7424113365","egestas.lacinia.sed@outlook.com","69","Perkins Square","Lincolnshire","JZ68 5RT","2","29-42"),
  ("Clayton","Fischer","1973-9-20","7066133143","a.neque@icloud.edu","85","Moorfield End","Ross-shire","G2P 4YG","5","29-42"),
  ("Jolene","Key","1978-7-25","7124825302","suspendisse@yahoo.org","11","Tudor Hills","Oxfordshire","B96 9KX","1","29-42"),
  ("Prescott","Moreno","1983-1-6","7890233389","commodo.tincidunt@aol.edu","45","Ball Street","Dunbartonshire","O5K 1VX","4","29-42"),
  ("Alexander","Mosley","1998-7-2","7440960282","et.netus@yahoo.com","7","Winifred Drive","Kirkcudbrightshire","X33 7IM","2","29-42"),
  ("Amir","Howe","1977-3-28","7557163131","praesent.eu@yahoo.couk","41","Carrsides Lane","Dorset","X7 4VQ","5","29-42"),
  ("Nash","Gallagher","1976-1-15","7514521864","aliquet.libero@hotmail.com","40","Holbrook Loke","Rutland","J9Q 2YX","2","29-42"),
  ("Sade","Maddox","1979-3-23","7938651049","nec@google.com","42","Church Farm Retreat","Carmarthenshire","HO3 2VA","3","29-42"),
  ("Noel","Morrison","1974-9-18","7168425283","integer.eu@aol.org","32","Farriers Elms","Berkshire","Q54 5CA","1","29-42");

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Iris","Woodward","1971-1-11","7538871511","nonummy.ac@yahoo.org","47","Moorfield End","Roxburghshire","P88 7PV","4","29-42"),
  ("Caesar","Frederick","1988-7-11","7017106683","non.vestibulum@yahoo.com","60","Cartmel Manor","East Lothian","PG95 7GC","1","29-42"),
  ("Shannon","Mcdonald","1985-3-14","7589117275","accumsan.convallis.ante@hotmail.edu","87","Bowden Circus","Staffordshire","KL6 6OA","1","29-42"),
  ("Chelsea","Dickson","1969-7-8","7736372213","enim@protonmail.couk","83","Carver Lane","Montgomeryshire","O36 0SL","2","29-42"),
  ("Lael","Stanton","1976-8-5","7653558612","suspendisse.ac.metus@hotmail.com","94","Cartmel Manor","Somerset","AM38 1TV","5","29-42"),
  ("Sierra","Morton","1976-6-30","7880182573","nunc.sed@google.org","35","Greyfriars Hills","Leicestershire","P41 8RY","1","29-42"),
  ("Brady","Gilmore","1969-4-10","7604111310","vestibulum.massa@hotmail.edu","66","Bowden Circus","Norfolk","D2O 9ES","3","29-42"),
  ("Slade","Morgan","1988-6-22","7294311645","placerat.eget.venenatis@icloud.couk","45","Old Glebe","Merionethshire","HV5 5DZ","3","29-42"),
  ("Meredith","Mcleod","1988-8-30","7539513017","risus@protonmail.org","41","Tudor Hills","Derbyshire","S66 5DW","3","29-42"),
  ("Maile","Hart","1985-11-5","7521231852","lacus.etiam.bibendum@protonmail.org","19","Old Glebe","Carmarthenshire","K1 6XK","5","29-42");

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Wang","Rowe","1986-10-29","7785348121","imperdiet.dictum@protonmail.com","42","St Johns Banks","West Lothian","L41 8GD","5","29-42"),
  ("Ariel","Shelton","1994-7-26","7517426448","fermentum.arcu.vestibulum@google.couk","67","Moorfield End","Lincolnshire","E9 7GW","3","29-42"),
  ("Josephine","Moody","1977-2-4","7758121721","proin.vel@google.couk","83","Carrsides Lane","Berkshire","RN9H 4ZU","2","29-42"),
  ("Yuri","Weeks","1988-7-5","7256471407","non.sollicitudin@yahoo.couk","67","Bowden Circus","Banffshire","S53 6QY","2","29-42"),
  ("Nolan","Collier","1999-7-17","7435174417","sapien.molestie@outlook.com","67"," Belvoir Leaze","Somerset","JB5G 4BL","3","29-42"),
  ("Coby","Roman","1997-3-29","7433467741","fusce@icloud.net","55","Townsend Links","Nottinghamshire","UQ15 3GH","4","29-42"),
  ("Velma","Massey","1981-12-9","7549185211","nisi.a.odio@google.edu","22","Old Hall Mount","Gloucestershire","D82 7OD","4","29-42"),
  ("Gareth","Sharpe","1981-4-1","7482418783","auctor.nunc.nulla@outlook.com","40","Winifred Drive","Norfolk","F4W 8OG","1","29-42"),
  ("Xandra","Becker","1970-12-4","7757451444","nulla.semper@outlook.edu","11","Mortimer Glebe","Orkney","M8L 4XR","5","29-42"),
  ("Elizabeth","Compton","1994-1-11","7618608654","quam.a@icloud.net","60","Weavers Holt","Derbyshire","BF3 3WM","1","29-42");

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Evelyn","Gamble","1970-1-8","7786596848","ipsum.suspendisse.non@hotmail.edu","66","Winifred Drive","Selkirkshire","PQ7S 9CZ","3","29-42"),
  ("Norman","Glenn","1990-6-7","7857883142","placerat@yahoo.edu","17","Adam Crest","Roxburghshire","I77 2GL","4","29-42"),
  ("Kane","Chambers","1984-1-27","7895341326","amet.orci.ut@hotmail.couk","67","Carrsides Lane","Orkney","YL6V 7ID","4","29-42"),
  ("Phillip","Bryan","1996-1-28","7418401822","sodales.purus.in@hotmail.ca","45","Bowden Circus","Midlothian","H51 9GD","2","29-42"),
  ("Remedios","Ortiz","1984-7-15","7967622884","nam.porttitor.scelerisque@protonmail.edu","30","Farriers Elms","Brecknockshire","X4N 1JP","4","29-42"),
  ("Zelda","Yang","1969-8-4","7686963185","et.magna@google.couk","35","Weavers Holt","Argyllshire","F8G 2AU","2","29-42"),
  ("Duncan","Jones","1988-11-27","7711423632","non.dui@hotmail.ca","91","Strawberry Isaf","Montgomeryshire","GC42 6BK","1","29-42"),
  ("Akeem","Norman","1991-8-13","7287798323","aliquet.nec.imperdiet@yahoo.ca","61"," Alice Row","Montgomeryshire","N2E 6EX","5","29-42"),
  ("Kim","Morse","1995-11-3","7737572176","tellus.faucibus@protonmail.org","31","Ben Bhraggie Drive","Devon","W32 6ST","1","29-42"),
  ("Chastity","Serrano","1996-3-22","7774774895","semper.et@protonmail.edu","65","Willow Glas","East Lothian","J4 6FT","1","29-42");

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Nerea","Boyle","1981-1-23","7429831276","orci@aol.edu","82","Townsend Links","Carmarthenshire","G8 0FF","1","29-42"),
  ("Nichole","Lara","2001-2-1","7746199635","dictum@aol.edu","40","Moorfield End","Orkney","EO8 8MK","2","29-42"),
  ("Virginia","Downs","1994-9-28","7653613827","eget.massa.suspendisse@protonmail.ca","22","Brampton Brow","West Lothian","EK2T 7JG","2","29-42"),
  ("Warren","Potter","1992-3-16","7789919556","faucibus@google.ca","94","Allen Knoll","Devon","J8 7NW","2","29-42"),
  ("Dominic","Fleming","1976-5-26","7671991122","nunc.quisque@icloud.ca","86","Winifred Drive","Ayrshire","BJ1G 7QU","3","29-42"),
  ("Lillith","Ayers","1975-6-5","7232110461","adipiscing@aol.net","68","Carver Lane","Ayrshire","J8 1RT","4","29-42"),
  ("Tamara","Navarro","1971-11-7","7350234937","metus.eu@hotmail.ca","64","Church Farm Retreat","Nottinghamshire","OC7G 3GM","1","29-42"),
  ("Irma","Wilder","1985-11-1","7352238195","orci.consectetuer@aol.com","48","Adam Crest","Herefordshire","RC3W 7NF","1","29-42"),
  ("Rhonda","Chavez","1997-8-7","7847603306","vestibulum.ut@aol.edu","68","Fir Town","Essex","X3 2GL","3","29-42"),
  ("Kuame","Mckee","1986-4-27","7275129021","magna@icloud.com","47","Parkland Retreat","Essex","P6 5TH","2","29-42");

INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Dean","Fletcher","1977-10-22","7535151307","orci.lobortis.augue@hotmail.edu","83"," Alice Row","Durham","MK36 7QQ","5","29-42"),
  ("Mari","Trujillo","1979-7-11","7624063918","nisi.aenean@google.net","94","Brockley Wynd","Rutland","G0 8FF","3","29-42"),
  ("Tasha","Bentley","1974-9-3","7534768656","eget.massa@hotmail.com","55","Carver Lane","Renfrewshire","Q17 9JH","3","29-42"),
  ("Felicia","Gallagher","1972-4-24","7221622168","aliquet.lobortis.nisi@outlook.com","23","Old Glebe","Wiltshire","RC8 6TK","2","29-42"),
  ("Brenden","Stuart","1996-9-13","7725008526","velit.dui@google.ca","22","Parkland Retreat","Berkshire","L0 3HQ","4","29-42"),
  ("Bernard","Stafford","1997-10-31","7532711847","ac.feugiat@outlook.edu","68","Ashton Paddock","Oxfordshire","F4 8IE","1","29-42"),
  ("Stone","Brooks","1970-7-13","7558597129","et@icloud.net","55","Moorfield End","Ross-shire","TV8L 0NX","2","29-42"),
  ("Kathleen","Hyde","1989-12-14","7304327883","eleifend.nunc@outlook.ca","67","Fir Town","Kent","OX26 2YG","4","29-42"),
  ("Kadeem","Mosley","1989-10-18","7331463800","urna@google.edu","40","Limes Retreat","Glamorgan","V13 5BO","3","29-42"),
  ("Lareina","Watson","1970-3-6","7846013854","ligula.aliquam@icloud.edu","66","Limes Hill","Sussex","WG37 8ED","1","29-42");

  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES
  ("Kiayada","Berry","1971-12-29","7036189682","metus.facilisis.lorem@protonmail.edu","32","Church Farm Retreat","Essex","E5 8LB","4","29-42"),
  ("Abraham","Bishop","1984-3-14","7776474302","felis.donec.tempor@outlook.edu","60","Brampton Brow","Yorkshire","WW78 2FK","3","29-42"),
  ("Tanisha","Vang","1980-3-12","7341241275","elementum.at@protonmail.com","49","Old Glebe","Shetland","WG26 7NI","3","29-42"),
  ("Shay","Mcpherson","1977-10-1","7742551067","nec.ante.maecenas@protonmail.ca","26"," Belvoir Leaze","Glamorgan","G0R 1FU","1","29-42"),
  ("Gregory","Alvarez","1993-9-22","7378555118","diam.luctus@outlook.couk","47","Anchorage Way","Dumfriesshire","BR07 4GJ","5","29-42"),
  ("Joel","Calhoun","1970-3-9","7644326771","convallis.erat.eget@google.couk","24","Cartmel Manor","Ross-shire","XH9 5IJ","2","29-42"),
  ("Hamilton","Brewer","1997-4-19","7927676477","diam.lorem.auctor@aol.com","62","St Johns Banks","Selkirkshire","KR3Y 3RV","5","29-42"),
  ("Brenden","Becker","1993-12-1","7477175757","dolor@hotmail.org","20","Greyfriars Hills","Morayshire","OI63 4WE","2","29-42"),
  ("Inez","Mcclain","1983-12-26","7285239149","erat@icloud.org","87","Anchorage Way","Kirkcudbrightshire","K66 6BM","5","29-42"),
  ("Jesse","Warner","1981-9-9","7434152442","id.ante@icloud.com","40","Cartmel Manor","Midlothian","T4J 3OQ","3","29-42");

  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES

  ("Jena","Wilkins","1981-2-25","7525645038","massa.rutrum@aol.com","22","Ashton Paddock","Pembrokeshire","JD94 0WR","2","29-42"),
  ("Upton","Townsend","1978-11-10","7366275975","eleifend@yahoo.com","82","Parkland Retreat","Norfolk","QB3 3DG","1","29-42"),
  ("Alexa","Ballard","2000-10-31","7176517056","vestibulum@icloud.org","17","Perkins Square","Sutherland","R0 8SB","5","29-42"),
  ("McKenzie","Morin","1973-4-23","7981427417","fermentum.vel@hotmail.net","67","Farriers Elms","Kirkcudbrightshire","Y8P 6GQ","1","29-42"),
  ("Xantha","Dickerson","1980-11-1","7807432270","morbi.sit@aol.ca","60","Bowden Circus","Berwickshire","Y5G 9KL","5","29-42"),
  ("Igor","Moreno","1969-3-6","7545527834","erat.vivamus@yahoo.com","41","Allen Knoll","Caithness","L1 4TO","4","29-42"),
  ("Alfonso","Hall","1996-12-28","7387232105","dis@protonmail.com","87","Old Glebe","Kincardineshire","I4 2RN","2","29-42"),
  ("Walker","Cannon","1972-3-4","7919347376","ullamcorper.magna@google.ca","55","Townsend Links","Suffolk","H46 2SR","2","29-42"),
  ("Hedy","Mccall","1989-3-16","7772928333","fermentum.convallis@icloud.net","40","Winifred Drive","Yorkshire","S7 1AY","4","29-42"),
  ("Russell","Bond","1982-10-4","7409336140","duis@hotmail.org","41","Brampton Brow","Dunbartonshire","B2 2JI","3","29-42");
  INSERT INTO patient (patient_fname, patient_lname, patient_dob, patient_phone, patient_email, patient_add1, patient_add2, patient_county, patient_postcode, patient_gp, patient_ward, patient_comments) VALUES

