
CREATE DATABASE IF NOT EXISTS normalization;

USE normalization;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO departments
VALUES
(10, 'Computer Science'),
(20, 'Electronics');

INSERT INTO students
VALUES
(1, 'Ali', 10),
(2, 'Sara', 20),
(3, 'Ahmed', 10);

SELECT * FROM departments;

SELECT * FROM students;

SELECT
    s.student_id,
    s.student_name,
    d.department_name
FROM students s
JOIN departments d
    ON s.department_id = d.department_id;
