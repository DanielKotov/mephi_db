-- Drop existing tables
DROP TABLE IF EXISTS CoursesTeachers CASCADE;
DROP TABLE IF EXISTS Uncompatible_Courses CASCADE;
DROP TABLE IF EXISTS Special_Courses CASCADE;
DROP TABLE IF EXISTS StudentCourses CASCADE;
DROP TABLE IF EXISTS Subject_Directions CASCADE;
DROP TABLE IF EXISTS Students CASCADE;
DROP TABLE IF EXISTS Teachers CASCADE;
DROP TABLE IF EXISTS Courses CASCADE;
DROP TABLE IF EXISTS Subjects CASCADE;

CREATE TABLE Subjects (
    Subject_id SERIAL PRIMARY KEY,
    Subject_name VARCHAR(50) UNIQUE
);

CREATE TABLE Courses (
    Course_id SERIAL PRIMARY KEY,
    Course_name VARCHAR(100) UNIQUE,
    Description TEXT UNIQUE,
    Price REAL UNIQUE
);

CREATE TABLE Teachers (
    Teacher_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50),
    Second_Name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    Salary REAL
);

CREATE TABLE Students (
    Student_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Surname VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Subject_Directions (
    Direction_ID INTEGER,
    Subject INTEGER,
    Course_ID INTEGER,
    FOREIGN KEY (Subject) REFERENCES Subjects(Subject_id),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_id)
);

CREATE TABLE StudentCourses (
    Student_ID INTEGER,
    Course_ID INTEGER,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_id)
);

CREATE TABLE Special_Courses (
    Scourse_id INTEGER,
    Bcourse_id INTEGER,
    FOREIGN KEY (Scourse_id) REFERENCES Courses(Course_id),
    FOREIGN KEY (Bcourse_id) REFERENCES Courses(Course_id)
);

CREATE TABLE Uncompatible_Courses (
    Course_ID1 INTEGER,
    Course_ID2 INTEGER,
    FOREIGN KEY (Course_ID1) REFERENCES Courses(Course_id),
    FOREIGN KEY (Course_ID2) REFERENCES Courses(Course_id)
);

CREATE TABLE CoursesTeachers (
    Course_ID INTEGER,
    Teacher_ID INTEGER,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_id),
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID)
);

