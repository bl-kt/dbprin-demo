-- char/hollys code
-- This top one works! The where is optional, to return all GP's and GP counts :)
SELECT gp.gp_name AS "GP Name", COUNT((p.patient_gp)) AS "GP count" 
FROM patient p
JOIN general_practitioner gp ON p.patient_gp = gp_id
WHERE patient_gp = '1'
GROUP BY gp.gp_name;


-- gurvirs code
SELECT DISTINCT(gp_name) AS "name of GP surgery", COUNT(treatment_desc) AS "no of treatments based on referals" from general_practitioner
JOIN patient ON patient.patient_gp = gp_id
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
WHERE general_practitioner.gp_name LIKE '%Somers Town Health Centre%' OR general_practitioner.gp_name LIKE '%Vernsborne Surgery%'
GROUP BY gp_name;

-- lol its like its a war of coding. gurvir vs char and holly
