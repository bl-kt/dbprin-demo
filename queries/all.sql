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

SELECT CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", patient_dob, gp_name, gp_add1, gp_add2, complaint_desc, treatment_desc, treatment_start, treatment_end from patient
JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
-- JOIN staff ON 
-- we need to have the hospital doctor treating the patient
JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_id = doctor_treatment.treatment_id;

-- second function
SELECT ward_name, ward_speciality, CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", CONCAT(staff_fname, ' ', staff_lname) AS "Nurses", is_head_nurse, gp_name, treatment_start FROM patient
JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
JOIN ward ON patient.patient_ward = ward.ward_id
JOIN ward_speciality ON ward.ward_speciality = ward_speciality.speciality_id
JOIN staff_nurse ON staff_nurse.nurse_ward = ward.ward_id
JOIN staff ON staff.staff_id = staff_nurse.nurse_id
WHERE patient_fname LIKE 'T%'
ORDER BY treatment_start
LIMIT 10;
-- need to do a joint on gp name and patient.

SELECT COUNT (*) FROM (
    SELECT CONCAT_WS(' ', patient_fname, patient_lname) FROM patient
    WHERE patient_comments IS NOT NULL) AS "Number of Patients With Comments";
)

-- which patient has left as a sql query



-- USE STUFF THAT HE THOUGHT THIS YEAR LIKE ILIKE, GROUPBY, ETC




-- further ideas:

-- WARD RECORD https://prnt.sc/26dko9d

-- Ward name
-- Ward head nurse
-- Ward Speciality
-- Ward Nurses
-- Patients in ward:
-- Patient id
-- patient name
-- gp name
-- date admitted (need to add to create statement?)




-- DOCTOR RECORD
-- idea: all previous patients treated by this doctor, for a certain ailment in a certain time period

SELECT patient_fname, patient_lname, CONCAT(staff_fname, ' ' ,staff_lname) AS "Doctor", treatment_start, treatment_end, treatment_desc FROM patient
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_id = doctor_treatment.treatment_id
JOIN staff_doctor ON doctor_treatment.treatment_id = staff_doctor.doctor_id
JOIN staff on staff.staff_id =  staff_doctor.doctor_id;

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

-- AND t.treatment_end > '2022-01-05';
-- I couldn't make this last bit work, we might need the admitted / discharged column.
-- add order by / group by.

