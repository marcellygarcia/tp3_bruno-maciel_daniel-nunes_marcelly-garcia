--SELECT 'CREATE USER tpch' WHERE NOT EXISTS (SELECT FROM pg_user WHERE username = 'tpch')\gexec; 
--SELECT 'CREATE DATABASE exp_db' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'exp_db')\gexec;
ALTER USER postgres WITH PASSWORD 'postgres'
ALTER USER tpch WITH ENCRYPTED PASSWORD '********';
GRANT ALL PRIVILEGES ON DATABASE tpchdb TO tpch;

