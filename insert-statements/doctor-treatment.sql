INSERT INTO doctor_treatment (doctor_id, treatment_id) VALUES
(2, 1),
(6, 3),
(8, 4),
(3, 5),
(2, 6),
(3, 7);

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
