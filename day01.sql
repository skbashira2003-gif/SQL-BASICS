use jfsfps;
CREATE DATABASE jfsfps;

USE jfsfps;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);
INSERT INTO students
VALUES
(1, 'Bashira', 23, 'Python', 85),
(2, 'Rahul', 22, 'Java', 78),
(3, 'Anjali', 21, 'SQL', 90);
SELECT * FROM students;
