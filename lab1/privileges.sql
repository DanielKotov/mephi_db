-- Admin privileges
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA education_main TO admin_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA education_auth TO admin_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA education_refs TO admin_role;

-- Teacher privileges
GRANT SELECT ON education_main.Students TO teacher_role;
GRANT SELECT, UPDATE ON education_main.Courses TO teacher_role;
GRANT SELECT, INSERT ON education_main.CoursesTeachers TO teacher_role;

-- Student privileges
GRANT SELECT ON education_main.Courses TO student_role;
GRANT SELECT ON education_refs.Subjects TO student_role;
GRANT SELECT ON education_main.Teachers TO student_role;

-- Manager privileges
GRANT SELECT, INSERT, UPDATE ON education_main.Students TO manager_role;
GRANT SELECT, INSERT, UPDATE ON education_main.Courses TO manager_role;
GRANT SELECT, INSERT, UPDATE ON education_main.StudentCourses TO manager_role;

-- Group role assignments
GRANT education_staff TO teacher_role, manager_role;
GRANT education_users TO student_role;
