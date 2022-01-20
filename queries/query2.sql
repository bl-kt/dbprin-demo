-- WARD CARD
-- Which nurses are currently working in which wards
-- Which of the nurses are the head nurse of the ward

SELECT DISTINCT ward_name, CONCAT(staff_fname, ' ', staff_lname) AS "Nurse", is_head_nurse FROM patient
JOIN ward ON patient.patient_ward = ward.ward_id
JOIN staff_nurse ON staff_nurse.nurse_ward = ward.ward_id
JOIN staff ON staff.staff_id = staff_nurse.nurse_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
WHERE patient.patient_discharged IS NULL;