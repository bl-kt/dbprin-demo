-- WARD CARD
-- Which nurses are currently working in which wards
-- Which of the nurses are the head nurse of the ward

SELECT DISTINCT ward_name AS "Ward Name", CONCAT(staff_fname, ' ', staff_lname) AS "Nurse", is_head_nurse AS "Head Nurse" FROM patient p
JOIN ward w ON p.patient_ward = w.ward_id
JOIN staff_nurse n ON n.nurse_ward = w.ward_id
JOIN staff s ON s.staff_id = n.nurse_id
JOIN patient_complaint pc on p.patient_id = pc.patient_id
JOIN treatment t on pc.complaint_id = t.complaint_no
WHERE p.patient_discharged IS NULL
ORDER BY ward_name;