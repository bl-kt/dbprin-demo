-- WARD CARD

SELECT ward_name, ward_speciality, CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", CONCAT(staff_fname, ' ', staff_lname) AS "Nurses", is_head_nurse, gp_name, treatment_start FROM patient
JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
JOIN ward ON patient.patient_ward = ward.ward_id
JOIN ward_speciality ON ward.ward_speciality = ward_speciality.speciality_id
JOIN staff_nurse ON staff_nurse.nurse_ward = ward.ward_id
JOIN staff ON staff.staff_id = staff_nurse.nurse_id
ORDER BY treatment_start
LIMIT 10;

-- This query is based off the physical cards that the case study provided us with,
-- in order to formulate our ERD. The business use of this query would be to display a
-- ward's current patients, admittance dates, staff and specialty.