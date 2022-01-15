-- PATIENT CARD

SELECT CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", patient_dob, gp_name, gp_add1, gp_add2, complaint_desc, treatment_desc, treatment_start, treatment_end from patient
JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_id = doctor_treatment.treatment_id;

-- This query is based off the physical cards that the case study provided us with,
-- in order to fomuuate our ERD. The business use of the query would be used to display
-- a patient's treatment history - previous complaints, treatments and who treated
-- them - alongside other relevant information.