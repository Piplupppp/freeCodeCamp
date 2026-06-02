# freeCodeCamp - Relational Database & Bash Scripting

Welcome to my **freeCodeCamp** projects repository! This space gathers the solutions, databases, and scripts I developed while working through the Relational Database and Linux/Bash scripting certification path.

To keep the code clean and modular, the repository is organized into subfolders, each with its own specific documentation.


## Repository Structure

The project is divided into the following main sections:

### 1. [Universe Database](./universe-database/)
A folder dedicated to the design and management of a PostgreSQL relational database focused on the Universe.
* **What's inside:** The structured database dump (`universe.sql`), complete with tables for galaxies, stars, planets, and moons, including foreign key relationships, unique constraints, and appropriate data types.
* **Skills:** SQL, PostgreSQL, Database Design.

### 2. [Bash Five Programs](./bash-five-programs/)
A suite of five small interactive programs written entirely in Bash Scripting (Linux), designed to work together synergistically.
* **What's inside:** Four independent scripts (`questionnaire.sh`, `countdown.sh`, `bingo.sh`, `fortune.sh`) coordinated and executed in sequence by a single central master script (`five.sh`).
* **Skills:** Bash scripting, Linux terminal automation, file permissions, control flow, and environment variables.

### 3. [Student Database] (./studentsdb/)
A project demonstrating the integration between Bash scripting and PostgreSQL to automate database creation, data insertion from CSV files, and advanced data extraction.
* **What's inside:** * `structure.sql`: Script to create the database schema and table relationships.
  * `courses.csv` & `students.csv`: The raw datasets.
  * `insert_data.sh`: A Bash script that reads the CSVs, handles duplicates and null values, and populates the tables.
  * `student_info.sh`: A Bash script executing advanced SQL queries (JOINs, aggregations, subqueries) to extract insights from the database.
* **Skills:** SQL (JOINs, Grouping, Aggregations), Bash scripting (file reading, while loops, conditionals), PostgreSQL, Data Migration.


## Technologies Used

* **OS/Terminal:** Linux Bash, VS Code Codespaces
* **Database:** PostgreSQL / SQL
* **Version Control:** Git & GitHub


## How to Explore the Projects

You can navigate through the individual folders by clicking on the links above or directly from the GitHub file list. Inside each subfolder, you will find a dedicated `README.md` file explaining in detail how to run the scripts or how to import the database.
