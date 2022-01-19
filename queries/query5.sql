-- This top one works! The where is optional, to return all GP's and GP counts :)
SELECT gp.gp_name AS "GP Name", COUNT((p.patient_gp)) AS "GP count" 
FROM patient p
JOIN general_practitioner gp ON p.patient_gp = gp_id
WHERE patient_gp = '1'
GROUP BY gp.gp_name;



-- SELECT CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name"
--        w.ward_name AS "Ward Name", ws.speciality_name AS "Ward Speciality"
-- FROM patient AS p
-- JOIN ward AS w
-- ON p.patient_ward = w.ward_id
-- JOIN ward_speciality AS ws
-- ON w.ward_speciality = ws.speciality_id
-- WHERE w.speciality_name = 'General';

-- This Query is there to show which patients are currently in a specific ward. 

SELECT CONCAT(patient.patient_fname, ' ' , patient.patient_lname) AS "patients full name", treatment_desc, COUNT(gp_name), CONCAT(gp_add1, ' ', gp_add2) AS "GP address", treatment_start, treatment_end from patient
JOIN general_practitioner ON patient_gp = gp_id
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
WHERE treatment_start BETWEEN '2021-01-01' AND '2021-12-31'
AND treatment_end BETWEEN '2021-06-01' AND '2021-12-31'
GROUP BY patient.patient_fname 
ORDER BY patient.patient_lname ASC;

-- put a count function in

-- SELECT CONCAT_WS(patient.patient_fname, patient.patient_lname) AS "patient full name", COUNT(gp_name) from patient
-- JOIN general_practitioner ON patient_gp = gp_id
-- JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
-- JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
-- ;

-- SELECT CONCAT(patient.patient_fname, ' ' , patient.patient_lname) AS "patients full name", COUNT(gp_name) from patient
-- JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
-- GROUP BY patient.patient_fname AND
-- GROUP BY patient.patient_lname
-- ;

-- SELECT distinct(COUNT(gp_name)) from gp;

-- SELECT DISTINCT(COUNT(gp_name)) AS "gp count" FROM (SELECT general_practitioner.gp_name,
-- treatment_desc FROM general_practitioner
-- JOIN patient ON patient_gp = gp_id
-- JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
-- JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
-- GROUP BY treatment.treatment_desc
-- ORDER BY gp_name ASC) AS "surgery practice";

SELECT DISTINCT(COUNT(gp_name)) AS "gp count" FROM (SELECT gp_name, treatment_desc from general_practitioner
JOIN patient ON patient.patient_gp = gp_id
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
ORDER BY gp_name ASC) as "The Gp with the surgery treatment";

