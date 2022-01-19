-- Char

-- A query that shows the average length of stay of patients in a certain ward, or of a certain treatment, AS well AS their individual stay lengths
-- Business Usage: To determine whether patients are being treated fast enough compared to given treatment metrics, and which treatments are taking longer to treat than others

SELECT
CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name",
p.patient_ward AS Ward,
-- c.complaint_date as "Complaint Registered",
DATE_PART('day',c.complaint_date::timestamp - t.treatment_start::timestamp) AS "Complaint Registered to Treatment Start (days)",
-- t.treatment_start as "Treatment Started",
DATE_PART('day', t.treatment_end::timestamp - t.treatment_start::timestamp) AS "Treatment Length (days)",
-- t.treatment_end as "Treatment Ended",
p.patient_admitted AS "Admitted Date",
p.patient_discharged AS "Discharged Date",
DATE_PART('day',p.patient_discharged::timestamp - p.patient_admitted::timestamp) AS "Total Hospital Stay (days)",
-- NOT WORKING      AVG(DATE_PART('day',p.patient_discharged::timestamp - p.patient_admitted::timestamp)) AS "Average Patient Stay Length"
-- NOT WORKING      AVG(DATE_PART('days',p.patient_admitted::timestamp - p.patient_discharged::timestamp) - DATE_PART('day',p.patient_admitted::timestamp - p.patient_discharged::timestamp)) AS "Divergence from Average Stay Length"
FROM patient p
JOIN patient_complaint pc ON p.patient_id = pc.patient_id
JOIN complaint c ON c.complaint_id = pc.complaint_id
JOIN treatment t ON pc.complaint_id = t.complaint_no
WHERE p.patient_discharged IS NOT NULL
GROUP BY p.patient_fname, p.patient_lname, p.patient_ward, c.complaint_date, t.treatment_start, t.treatment_end, p.patient_discharged, p.patient_admitted;
