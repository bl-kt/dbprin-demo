-- SELECT CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name"
--        w.ward_name AS "Ward Name", ws.speciality_name AS "Ward Speciality"
-- FROM patient AS p
-- JOIN ward AS w
-- ON p.patient_ward = w.ward_id
-- JOIN ward_speciality AS ws
-- ON w.ward_speciality = ws.speciality_id
-- WHERE w.speciality_name = 'General';

-- This Query is there to show which patients are currently in a specific ward. 

SELECT CONCAT_WS(patient_fname, patient_lname), treatment_desc, gp_name from patient
JOIN general_practitioner ON patient_gp = gp_id
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no;

