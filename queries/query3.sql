-- Char

-- A query that shows the average length of stay of patients in a certain ward, or of a certain treatment, AS well AS their individual stay lengths
-- Business Usage: To determine whether patients are being treated fast enough compared to given treatment metrics, and which treatments are taking longer to treat than others

SELECT
  CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name",
  p.patient_ward AS "Ward",
  DATE_PART('day',c.complaint_date::timestamp - t.treatment_start::timestamp) AS "Complaint Registered to Treatment Start (days)",
  DATE_PART('day', t.treatment_end::timestamp - t.treatment_start::timestamp) AS "Treatment Start to End (days)",
  DATE_PART('day',p.patient_discharged::timestamp - p.patient_admitted::timestamp) AS "Patient Admitted to Patient Discharged (days)",
  ( SELECT AVG(stayLength)
    FROM (
      SELECT
        DATE_PART('day', p.patient_discharged::timestamp - p.patient_admitted::timestamp) as stayLength
      FROM
        patient p
    ) as calcAvg
  ) as "Average Patient Admitted to Patient Discharged (days)"
FROM
  patient p
JOIN
  patient_complaint pc ON p.patient_id = pc.patient_id
JOIN
  complaint c ON c.complaint_id = pc.complaint_id
JOIN
  treatment t ON pc.complaint_id = t.complaint_no
WHERE
  p.patient_discharged IS NOT NULL
ORDER BY p.patient_ward;

-- sub queries and sum