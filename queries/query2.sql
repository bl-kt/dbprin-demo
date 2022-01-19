-- WARD CARD
-- Who?

-- can't figure out how to get Distinct working
SELECT  DISTINCT ward_name, ward_speciality,
CONCAT(staff_fname, ' ', staff_lname) AS "Nurse",
is_head_nurse,
CONCAT(patient.patient_fname, ' ', patient.patient_lname) AS "Patient Full Name", gp_name, treatment_start
-- FROM (SELECT DISTINCT patient.patient_id FROM patient) AS "testing"
FROM patient
INNER JOIN ward ON patient.patient_ward = ward.ward_id
INNER JOIN ward_speciality ON ward.ward_speciality = ward_speciality.speciality_id
INNER JOIN staff_nurse ON staff_nurse.nurse_ward = ward.ward_id
INNER JOIN staff ON staff.staff_id = staff_nurse.nurse_id
INNER JOIN general_practitioner ON patient.patient_gp = general_practitioner.gp_id
INNER JOIN patient_complaint on patient.patient_id = patient_complaint.patient_id
INNER JOIN complaint ON complaint.complaint_id = patient_complaint.complaint_id
INNER JOIN treatment on patient_complaint.complaint_id = treatment.complaint_no
WHERE patient_discharged IS NULL
ORDER BY treatment_start;

-- This query is based off the physical cards that the case study provided us with,
-- in order to formulate our ERD. The business use of this query would be to display a
-- ward's current patients, admittance dates, staff and specialty.

-- which staff are in which ward, treating which patients

-- distinct
-- either change business need or order of columns

-- Suggestion: Maybe COPY into a file on the end, to 'produce' the card?