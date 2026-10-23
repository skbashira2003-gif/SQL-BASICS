CREATE DATABASE IF NOT EXISTS jfsfps;
USE jfsfps;

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses (course_id, course_name)
VALUES
(101, 'Python'),
(102, 'Java'),
(103, 'SQL');

SELECT * FROM courses;CREATE DATABASE IF NOT EXISTS jfsfps;
USE jfsfps;

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses (course_id, course_name)
VALUES
(101, 'Python'),
(102, 'Java'),
(103, 'SQL');

SELECT * FROM courses;
