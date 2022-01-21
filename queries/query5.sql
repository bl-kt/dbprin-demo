-- this query
-- returns all the number of treatments and from which gp they are from. 
-- This overtime can help the hospital manage how many patients they expect to recieve over a certain period of time and how many surgeries they
-- expect. 

<<<<<<< HEAD
-- gurvirs code
SELECT DISTINCT(gp_name) AS "Name of GP Surgery",
COUNT(treatment_desc) AS "No. of Treatments Based On Referrals"
=======
SELECT DISTINCT(gp_name) AS "name of GP surgery",
COUNT(treatment_desc) AS "no of treatments based on referrals"
>>>>>>> e495b7e9956a5227d4c7a8d9f651a8112a60848e
FROM general_practitioner gp
JOIN patient p ON p.patient_gp = gp.gp_id
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN treatment t ON pc.complaint_id = t.complaint_no
WHERE gp.gp_name LIKE '%Somers Town Health Centre%' OR gp.gp_name LIKE '%Dickens Gardens Medical Centre%'
AND p.patient_id IS NOT NULL
GROUP BY gp.gp_name
ORDER BY gp.gp_name ASC;
