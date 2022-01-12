-- the 5 statements we are going to demo

-- admin card for the ward

-- Patient No 6 characters (unique)
-- Patient Name 30 characters
-- Date of Birth date (patient's DOB)
-- GP Name 30 characters (name of patient's GP)
-- GP Address Address of patient's GP surgery
-- Complaint 40 character description of complaint
-- Treatment 40 character description of treatment
-- Doctor Hospital doctor giving treatment for complaint
-- DTS date (Date Treatment Started)
-- DTE date (Date Treatment Ended)

SELECT patient_id, patient_fname, patient_lname, patient_dob, gp_name, gp_add1, gp_add2, 
treatment_desc, treatment_start, treatment_end from patient
WHERE patient.patient_gp = patient.gp_id,
-- dont know what to do next lol


-- need to do a joint on gp name and patient.
