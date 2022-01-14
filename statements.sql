-- the 5 statements we are going to demo

-- admin card for the ward

-- Patient No 6 characters (unique) /
-- Patient Name 30 characters / 
-- Date of Birth date (patient's DOB) /
-- GP Name 30 characters (name of patient's GP) /
-- GP Address Address of patient's GP surgery /
-- Complaint 40 character description of complaint /
-- Treatment 40 character description of treatment /
-- Doctor Hospital doctor giving treatment for complaint 
-- DTS date (Date Treatment Started)
-- DTE date (Date Treatment Ended)

SELECT CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", patient_dob, gp_name, gp_add1, gp_add2, complaint_desc, CONCAT_WS(' ', staff_fname, staff_lname) AS "Hospital Doctor", treatment_desc, treatment_start, treatment_end from patient
JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
-- JOIN staff ON 
-- we need to have the hospital doctor treating the patient
JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_id = doctor_treatment.treatment_id;

-- dont know what to do next lol


-- need to do a joint on gp name and patient.


-- which patient has left as a sql query

-- USE STUFF THAT HE THOUGHT THIS YEAR LIKE ILIKE, GROUPBY, ETC