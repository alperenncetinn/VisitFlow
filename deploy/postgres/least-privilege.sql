-- For an existing / managed PostgreSQL (Azure, RDS, on-prem). Run as the database owner AFTER the first migration.
-- Replace the role name and password. The application connects as visitflow_app (ConnectionStrings__VisitFlow);
-- migrations use the owner (ConnectionStrings__VisitFlowMigrator).
CREATE ROLE visitflow_app LOGIN PASSWORD 'CHANGE-ME' NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT;
GRANT CONNECT ON DATABASE visitflow TO visitflow_app;
GRANT USAGE ON SCHEMA public TO visitflow_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO visitflow_app;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO visitflow_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO visitflow_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO visitflow_app;
-- Defence in depth on top of the triggers:
REVOKE UPDATE, DELETE, TRUNCATE ON audit_log, consent_records FROM visitflow_app;
