-- Move existing tables to appropriate schemas
ALTER TABLE Students SET SCHEMA education_main;
ALTER TABLE Teachers SET SCHEMA education_main;
ALTER TABLE Courses SET SCHEMA education_main;
ALTER TABLE Subjects SET SCHEMA education_refs;
ALTER TABLE Subject_Directions SET SCHEMA education_refs;
ALTER TABLE StudentCourses SET SCHEMA education_main;
ALTER TABLE Special_Courses SET SCHEMA education_refs;
ALTER TABLE Uncompatible_Courses SET SCHEMA education_refs;
ALTER TABLE CoursesTeachers SET SCHEMA education_main; 