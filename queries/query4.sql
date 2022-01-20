-- Holly

-- Business Use

-- This returns all the patients that are being treated by a particular doctor. 
-- This would be used for example if a doctor was off sick, their patients could be reallocated 
-- to a different doctor. For this scenario, we are returning information about the patient,
-- which ward they are on, and details of their complaint and current treatment. 

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
