-- First part: Check setup (existing checks)
\echo '\nChecking schemas:'
SELECT nspname AS schema_name, 
       pg_catalog.pg_get_userbyid(nspowner) AS schema_owner 
FROM pg_catalog.pg_namespace
WHERE nspname LIKE 'education%';

\echo '\nChecking roles:'
SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolcanlogin 
FROM pg_roles 
WHERE rolname IN (
    'admin_role', 
    'teacher_role', 
    'student_role', 
    'manager_role', 
    'education_staff', 
    'education_users'
);

\echo '\nChecking privileges:'
SELECT grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema LIKE 'education%'
ORDER BY grantee, table_schema, table_name;

-- New part: Test each role's access
\echo '\nTesting admin_role access:'
\c cybergeeks_db admin_role
SELECT 'Can select from Students' AS test WHERE EXISTS (
    SELECT 1 FROM education_main.Students LIMIT 1
);
SELECT 'Can insert into Courses' AS test WHERE (
    SELECT has_table_privilege('admin_role', 'education_main.Courses', 'INSERT')
);

\echo '\nTesting teacher_role access:'
\c cybergeeks_db teacher_role
SELECT 'Can select from Students' AS test WHERE EXISTS (
    SELECT 1 FROM education_main.Students LIMIT 1
);
SELECT 'Cannot insert into Students' AS test WHERE NOT (
    SELECT has_table_privilege('teacher_role', 'education_main.Students', 'INSERT')
);

\echo '\nTesting student_role access:'
\c cybergeeks_db student_role
SELECT 'Can select from Courses' AS test WHERE EXISTS (
    SELECT 1 FROM education_main.Courses LIMIT 1
);
SELECT 'Cannot insert into Courses' AS test WHERE NOT (
    SELECT has_table_privilege('student_role', 'education_main.Courses', 'INSERT')
);

\echo '\nTesting manager_role access:'
\c cybergeeks_db manager_role
SELECT 'Can select and insert into Students' AS test WHERE (
    SELECT has_table_privilege('manager_role', 'education_main.Students', 'INSERT')
);
SELECT 'Cannot delete from Courses' AS test WHERE NOT (
    SELECT has_table_privilege('manager_role', 'education_main.Courses', 'DELETE')
);
