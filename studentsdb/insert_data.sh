#!/bin/bash

# To execute SQL commands directly from the script
# To execute locally: PSQL="psql --no-align --tuples-only -c"
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo "Starting data insertion..."
echo "Inserting courses..."
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then

    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    if [[ -z $MAJOR_ID ]]
    then
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")

      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    if [[ -z $COURSE_ID ]]
    then
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")

      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
  fi
done


echo "Inserting students..."

cat students.csv | while IFS="," read FIRST_NAME LAST_NAME MAJOR GPA
do
  if [[ $FIRST_NAME != "first_name" ]]
  then

    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    if [[ -z $MAJOR_ID ]]
    then
      MAJOR_ID=null
    fi

    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST_NAME', '$LAST_NAME', $MAJOR_ID, $GPA)")
  fi
done


echo "All data inserted successfully!"


# To run the program in the terminal: ./insert_data.sh
# To check the correct data insertion from the terminal: psql -X --username=freecodecamp --dbname=students -c "SELECT * FROM students;"