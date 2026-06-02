# Student Database

This project demonstrates how to integrate Bash scripting with PostgreSQL. The goal is to automate the creation of a relational database, populate it with data parsed from CSV files, and run advanced SQL queries to extract meaningful insights.

## Files Included

* **`structure.sql`**: Contains the SQL commands to create the `students` database and its relational schema (`students`, `majors`, `courses`, and the junction table `majors_courses`).
* **`courses.csv` & `students.csv`**: The raw data files containing course and student information.
* **`insert_data.sh`**: A Bash script that reads the CSV files line by line, handles null values and duplicates, and securely inserts the data into the PostgreSQL database.
* **`student_info.sh`**: A Bash script that executes various SQL queries (including `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, and subqueries) to retrieve and format specific data from the database.

## How to Run

If you want to run this project locally in a Linux/PostgreSQL environment, follow these steps:

1. **Build the database structure:**
   Run the SQL file to set up the tables.
   ```bash
   psql -U your_username -d postgres -f structure.sql
