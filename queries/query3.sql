
-- DOCTOR RECORD
-- idea: all previous patients treated by this doctor, for a certain ailment in a certain time period

SELECT patient_fname, patient_lname, CONCAT(staff_fname, ' ' ,staff_lname) AS "Doctor", treatment_start, treatment_end, treatment_desc FROM patient
JOIN patient_complaint ON patient.patient_id = patient_complaint.patient_id
JOIN treatment ON patient_complaint.complaint_id = treatment.complaint_no
JOIN doctor_treatment on treatment.treatment_id = doctor_treatment.treatment_id
JOIN staff_doctor ON doctor_treatment.treatment_id = staff_doctor.doctor_id
JOIN staff on staff.staff_id =  staff_doctor.doctor_id;