-- PATIENT CARD
-- Who?

SELECT p.patient_id AS "Patient ID",
CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Name",
patient_dob AS "Patient DoB",
gp_name AS "GP Name",
complaint_desc AS "Complaint Description",
treatment_desc AS "Treatment Description",
treatment_start AS "Treatment Start Date",
treatment_end AS "Treatment End Date"
FROM patient AS p
JOIN general_practitioner AS gp ON p.patient_gp = gp.gp_id
JOIN patient_complaint AS pc ON p.patient_id = pc.patient_id
JOIN complaint AS c ON c.complaint_id = pc.complaint_id
JOIN treatment AS t ON pc.complaint_id = t.complaint_no
JOIN doctor_treatment AS dt ON t.treatment_id = dt.treatment_id
WHERE p.patient_dob < '2000-01-01'
ORDER BY t.treatment_start ASC;

-- This query is based off the physical cards that the case study provided us with,
-- in order to fomuuate our ERD. The business use of the query would be used to display
-- a patient's treatment history - previous complaints, treatments and who treated
-- them - alongside other relevant information.

-- Suggestion: Maybe COPY into a file on the end, to 'produce' the card?
-- where patient id = ?
-- tidy data
-- orderby
-- remove gp address