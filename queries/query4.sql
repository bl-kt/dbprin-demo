
-- Which patients are being treated by a particular doctor - E.g. if a doctor is off sick and patients 
-- need to be allocated to new doctors. Is this too simple? holly working on this 

SELECT p.patient_id AS "Patient ID", CONCAT(p.patient_fname, ' ', p.patient_lname) AS "Patient Full Name", p.patient_ward AS "Ward", p.patient_comments AS "Comments", c.complaint_desc AS "Complaint", t.treatment_id AS "Treatment ID", t.treatment_desc AS  "Treatment", dt.doctor_id AS "Doctor Name"
FROM patient p 
JOIN patient_complaint pc ON p.patient_id = pc.patient_id 
JOIN complaint c ON pc.complaint_id = c.complaint_id
JOIN treatment t ON  pc.complaint_id = t.complaint_no 
JOIN doctor_treatment dt ON t.treatment_id = dt.treatment_id
JOIN staff_doctor sd ON dt.doctor_id = sd.doctor_id
WHERE sd.doctor_id = '2';