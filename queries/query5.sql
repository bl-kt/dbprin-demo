-- SELECT CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name"
--        w.ward_name AS "Ward Name", ws.speciality_name AS "Ward Speciality"
-- FROM patient AS p
-- JOIN ward AS w
-- ON p.patient_ward = w.ward_id
-- JOIN ward_speciality AS ws
-- ON w.ward_speciality = ws.speciality_id
-- WHERE w.speciality_name = 'General';

-- This Query is there to show which patients are currently in a specific ward. 

SELECT CONCAT_WS(patient_fname, patient_lname) AS "patients full name", treatment_desc, gp_name, CONCAT_WS(gp_add1, gp_add2) AS "GP address", treatment_start, treatment_end from patient
JOIN general_practitioner ON patient_gp = gp_id
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
WHERE treatment_start BETWEEN '2021-01-01' AND '2021-12-31'
AND treatment_end BETWEEN '2021-06-01' AND '2021-12-31';

