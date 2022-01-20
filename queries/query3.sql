-- Char

-- Business Use

-- The inspiration behind this query comes from my time as a drive-thru worker.
-- We had targets as to how quickly we should serve people - So I think it is feasible to suggest hospitals will have quotas on how quickly to treat people.
-- As such, the business use of this query is to view information related to tracking how quickly each patient is treated.
-- The query displays the time between a complaint being registered, and treatment starting, the length of time between treatment start and end, as well as total hospital time.
-- It then displays the average total hospital stay time, and how far from the average each patient's individual hospital stay is.
-- To summarise, this query can be used to ensure that the hospital staff are treating patients quickly enough - and if there are any problem points, they can be inferred from this query.
-- The inclusion of patient name and ward are to help infer problem areas, or to excuse outlier cases.

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
