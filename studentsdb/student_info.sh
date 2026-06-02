#!/bin/bash

# Variable to query the database
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"
echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE gpa = 4.0")"

echo -e "\nAll students and their majors:"
echo "$($PSQL "SELECT first_name, last_name, major FROM students INNER JOIN majors ON students.major_id = majors.major_id")"

echo -e "\nFirst name, last name, and major of all students (including those without a major):"
echo "$($PSQL "SELECT first_name, last_name, major FROM students LEFT JOIN majors ON students.major_id = majors.major_id")"

echo -e "\nAll courses and their respective majors (3-table join):"
echo "$($PSQL "SELECT course, major FROM courses INNER JOIN majors_courses ON courses.course_id = majors_courses.course_id INNER JOIN majors ON majors_courses.major_id = majors.major_id")"

echo -e "\nFirst name, last name, and GPA of students with the highest GPA:"
echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE gpa = (SELECT MAX(gpa) FROM students)")"

echo -e "\nCourse name and the number of majors taking it, ordered by count descending:"
echo "$($PSQL "SELECT course, COUNT(major_id) AS number_of_majors FROM courses INNER JOIN majors_courses ON courses.course_id = majors_courses.course_id GROUP BY course ORDER BY number_of_majors DESC")"

echo -e "\nAverage GPA of all students rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(gpa), 2) FROM students")"

echo -e "\nMajors with only one student:"
echo "$($PSQL "SELECT major FROM majors INNER JOIN students ON majors.major_id = students.major_id GROUP BY major HAVING COUNT(student_id) = 1")"