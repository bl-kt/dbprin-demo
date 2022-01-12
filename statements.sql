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

SELECT CONCAT(patient.patient_fname, ' ' ,patient.patient_lname), patient_dob, gp_name, gp_add1, gp_add2, treatment_desc, treatment_start, treatment_end from patient
JOIN general_practitioner ON patient.patient_id = general_practitioner.gp_id
JOIN patient_complaints on patient.patient_id = patient_complaints.pat_com_id
JOIN treatment on patient_complaints.pati_com_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_no = doctor_treatment.doc_treat_no;

-- 
-- SELECT patient_id, patient_fname, patient_lname, patient_dob, gp_name, gp_add1, gp_add2, 
-- treatment_desc, treatment_start, treatment_end from patient
-- JOIN general_practitioner ON patient.patient_gp = patient.gp_id
-- JOIN ward ON ward.ward_specialty = ward_speciality.specialty_id
-- JOIN staff.staff_doctor on staff_id = staff.staff_doctor(staff_id)
-- JOIN staff_nurse on staff.staff_id = staff_nurse(nurse_id)
-- JOIN treatment on complaint_complaintid = treatment_id;

-- dont know what to do next lol


-- need to do a joint on gp name and patient.


-- which patient has left as a sql query

-- USE STUFF THAT HE THOUGHT THIS YEAR LIKE ILIKE, GROUPBY, ETC