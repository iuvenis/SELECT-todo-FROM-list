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
id INTEGER NOT NULL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
description TEXT NULL,
created_at TIMESTAMP NOT NULL DEFAULT now(),
updated_at TIMESTAMP NULL,
completed BOOL NOT NULL DEFAULT FALSE
);

ALTER TABLE task DROP COLUMN IF EXISTS completed;
ALTER TABLE task ADD COLUMN completed_at TIMESTAMP WITH TIME ZONE DEFAULT NULL;
ALTER TABLE task ALTER COLUMN updated_at SET DEFAULT now();
ALTER TABLE task ALTER COLUMN updated_at SET NOT NULL;

UPDATE task
SET id = default,
    title = 'Study SQL',
    description = 'complete this exercise',
    created_at = now(),
    updated_at = now(),
    completed_at = now();