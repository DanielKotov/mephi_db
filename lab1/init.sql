-- Main initialization file
\echo 'Creating schemas...'
\i schemas.sql

\echo 'Creating tables...'
\i cybergeeks_improve.sql

\echo 'Moving tables to schemas...'
\i move_tables.sql

\echo 'Creating roles...'
\i roles.sql

\echo 'Setting up privileges...'
\i privileges.sql