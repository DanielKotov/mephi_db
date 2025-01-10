-- Main initialization file
\echo 'Creating schemas...'
\i schemas.sql

\echo 'Creating roles...'
\i roles.sql

\echo 'Setting up privileges...'
\i privileges.sql

\echo 'Verifying setup...'
\i verify_setup.sql
