-- char/hollys code
-- This top one works! The where is optional, to return all GP's and GP counts :)
/* SELECT gp.gp_name AS "GP Name", COUNT((p.patient_gp)) AS "GP count" 
FROM patient p
JOIN general_practitioner gp ON p.patient_gp = gp_id
WHERE patient_gp = '1'
GROUP BY gp.gp_name;
 */

-- gurvirs code
SELECT DISTINCT(gp_name) AS "name of GP surgery",
COUNT(treatment_desc) AS "no of treatments based on referrals"
FROM general_practitioner gp
JOIN patient p ON p.patient_gp = gp.gp_id
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN treatment t ON pc.complaint_id = t.complaint_no
WHERE gp.gp_name LIKE '%Somers Town Health Centre%' OR gp.gp_name LIKE '%Dickens Gardens Medical Centre%'
AND p.patient_id IS NOT NULL
GROUP BY gp.gp_name
ORDER BY gp.gp_name ASC;

-- lol its like its a war of coding. gurvir vs char and holly