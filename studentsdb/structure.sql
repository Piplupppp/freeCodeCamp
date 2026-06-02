DROP DATABASE IF EXISTS students;

CREATE DATABASE students;
\c students

CREATE TABLE majors(
  major_id SERIAL PRIMARY KEY,
  major VARCHAR(50) NOT NULL
);

CREATE TABLE courses(
  course_id SERIAL PRIMARY KEY,
  course VARCHAR(50) NOT NULL
);

CREATE TABLE students(
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  gpa NUMERIC(2,1),
  major_id INT REFERENCES majors(major_id)
);

CREATE TABLE majors_courses(
  major_id INT REFERENCES majors(major_id),
  course_id INT REFERENCES courses(course_id),
  PRIMARY KEY (major_id, course_id)
);