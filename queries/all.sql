-- query 3
SELECT CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name",
p.patient_ward AS "Ward",
DATE_PART('day',c.complaint_date::timestamp - t.treatment_start::timestamp) AS "Complaint Registered to Treatment Start (days)",
DATE_PART('day', t.treatment_end::timestamp - t.treatment_start::timestamp) AS "Treatment Start to End (days)",
DATE_PART('day',p.patient_discharged::timestamp - p.patient_admitted::timestamp) AS "Patient Admitted to Patient Discharged (days)",
( SELECT ROUND(AVG(stayLength)) FROM (
    SELECT DATE_PART('day', p.patient_discharged::timestamp - p.patient_admitted::timestamp) as stayLength
    FROM patient p ) as calcAvg
) as "Average Patient Admitted to Patient Discharged (days)",
( SELECT ROUND(AVG(stayLength) - DATE_PART('day', p.patient_discharged::timestamp - p.patient_admitted::timestamp)) FROM (
    SELECT DATE_PART('day', p.patient_discharged::timestamp - p.patient_admitted::timestamp) as stayLength
    FROM patient p ) as calcAvg
) as "Difference from Average (days)"
FROM patient p
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN complaint c ON c.complaint_id = pc.complaint_id
JOIN treatment t ON pc.complaint_id = t.complaint_no
WHERE p.patient_discharged IS NOT NULL
ORDER BY p.patient_ward;

-- query 4
SELECT dt.doctor_id AS "Doctor ID",
CONCAT(s.staff_fname, ' ', s.staff_lname) AS "Doctor Name",
p.patient_id AS "Patient ID",
CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name",
p.patient_ward AS "Ward",
p.patient_comments AS "Comments",
c.complaint_desc AS "Complaint",
t.treatment_desc AS  "Treatment"
FROM patient p
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN complaint c ON pc.complaint_id = c.complaint_id
JOIN treatment t ON  pc.complaint_id = t.complaint_no
JOIN doctor_treatment dt ON t.treatment_id = dt.treatment_id
JOIN staff_doctor sd ON dt.doctor_id = sd.doctor_id
JOIN staff s ON sd.doctor_id = s.staff_id
WHERE sd.doctor_id = '2' AND p.patient_discharged IS NULL
ORDER BY p.patient_ward;

-- query 5

SELECT DISTINCT(gp_name) AS "name of GP surgery",
COUNT(treatment_desc) AS "no of treatments based on referals"
FROM general_practitioner gp
JOIN patient p ON p.patient_gp = gp.gp_id
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN treatment t ON pc.complaint_id = t.complaint_no
WHERE gp..gp_name LIKE '%Somers Town Health Centre%' OR gp.gp_name LIKE '%Dickens Gardens Medical Centre%'
AND p.patient_id IS NOT NULL
GROUP BY g.gp_name
ORDER BY g.gp_name ASC;

