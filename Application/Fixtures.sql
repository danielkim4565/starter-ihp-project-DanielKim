

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id) VALUES ('7a2e3cbb-86d6-4caf-a9a7-3899c20b4d6b');


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, user_id, title, body, created_at, updated_at) VALUES ('2c27b02e-ce1c-4fa4-8be5-89d5024dc757', '7a2e3cbb-86d6-4caf-a9a7-3899c20b4d6b', 'post1', 'body', '2024-11-17 05:00:38.994318+00', '2024-11-17 05:30:54.571239+00');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1731669734);
INSERT INTO public.schema_migrations (revision) VALUES (1731819480);
INSERT INTO public.schema_migrations (revision) VALUES (1731821455);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


