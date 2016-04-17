-- delete a user named michael if it exists
DROP USER IF EXISTS michael;

-- create a user named michael with an encrypted password stonebreaker
CREATE USER michael ENCRYPTED PASSWORD 'stonebreaker';

-- drop a database named todo_app if it exists
DROP DATABASE IF EXISTS todo_app;

-- create a database named todo_app
CREATE DATABASE todo_app;

--login to database
\c todo_app michael;

-- query to create a table named tasks using the Initial columns detailed below
CREATE TABLE task (
id SERIAL NOT NULL PRIMARY KEY
);
ALTER TABLE task DROP COLUMN IF EXISTS completed;
ALTER TABLE task ADD COLUMN completed_at TIMESTAMP WITH TIME ZONE DEFAULT NULL;
ALTER TABLE task UPDATE COLUMN updated_at NOT NULL DEFAULT now();
