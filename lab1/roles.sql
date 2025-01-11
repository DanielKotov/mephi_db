-- Drop roles if they exist (optional, for clean setup)
DROP ROLE IF EXISTS admin_role;
DROP ROLE IF EXISTS teacher_role;
DROP ROLE IF EXISTS student_role;
DROP ROLE IF EXISTS manager_role;

-- Create roles
CREATE ROLE admin_role LOGIN PASSWORD 'admin123';
CREATE ROLE teacher_role LOGIN PASSWORD 'teacher123';
CREATE ROLE student_role LOGIN PASSWORD 'student123';
CREATE ROLE manager_role LOGIN PASSWORD 'manager123';

-- Create group roles
CREATE ROLE education_staff;
CREATE ROLE education_users;
