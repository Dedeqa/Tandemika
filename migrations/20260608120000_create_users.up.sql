CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

                       email TEXT NOT NULL,
                       password_hash TEXT NOT NULL,
                       role TEXT NOT NULL,

                       created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
                       updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),

                       CONSTRAINT users_email_not_empty_check
                           CHECK (length(trim(email)) > 0),

                       CONSTRAINT users_email_lowercase_check
                           CHECK (email = lower(email)),

                       CONSTRAINT users_password_hash_not_empty_check
                           CHECK (length(trim(password_hash)) > 0),

                       CONSTRAINT users_role_check
                           CHECK (role IN ('teacher', 'student'))
);

CREATE UNIQUE INDEX users_email_unique_idx
    ON users (email);

CREATE INDEX users_role_idx
    ON users (role);