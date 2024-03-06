-- 2.	Create a database structure for students and its college. One student can be on one college only.

CREATE DATABASE studentCollegeDB;
USE studentCollegeDB;

CREATE TABLE student(
student_id INT NOT NULL PRIMARY KEY,
student_name TEXT NOT NULL ,
student_dob DATE NOT NULL,
college_id INT,
FOREIGN KEY(college_id) REFERENCES college(college_id)
);

CREATE TABLE college(
college_id INT NOT NULL PRIMARY KEY,
college_name TEXT NOT NULL
)
