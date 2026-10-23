USE hospital_db;

DESC patients;
ALTER TABLE patients
ADD doctor_name VARCHAR(50);
UPDATE patients
SET doctor_name = 'Dr. Kumar'
WHERE patient_id = 1;

UPDATE patients
SET doctor_name = 'Dr. Ravi'
WHERE patient_id = 2;

ALTER TABLE patients
ADD blood_group VARCHAR(5);

UPDATE patients
SET doctor_name = 'Dr. Priya'
WHERE patient_id = 3;

USE hospital_db;

UPDATE patients
SET blood_group = 'O+'
WHERE patient_id = 1;

UPDATE patients
SET blood_group = 'A+'
WHERE patient_id = 2;

UPDATE patients
SET blood_group = 'B+'
WHERE patient_id = 3;

UPDATE patients
SET blood_group = 'AB+'
WHERE patient_id = 4;

SELECT * FROM patients;
