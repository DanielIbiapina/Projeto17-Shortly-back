--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    link text,
    "linkShorten" text,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password text NOT NULL,
    name text,
    email text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.views (
    id integer NOT NULL,
    contador text,
    "linkId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.views_id_seq OWNED BY public.views.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views ALTER COLUMN id SET DEFAULT nextval('public.views_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '982fdad3-b08d-4ffa-a944-60aea2605077', 2, '2022-12-23 16:54:22.359174');
INSERT INTO public.sessions VALUES (2, 'f01048c0-04e6-461a-bde1-1be40e3fb8bd', 3, '2022-12-23 16:54:22.359174');
INSERT INTO public.sessions VALUES (3, 'c3ec38d7-8100-4a7c-90f5-0221600c8cc0', 4, '2022-12-23 16:54:22.359174');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (11, 'https://testfandodddgdsdgfd', '9iUk3COIyUU0CvMbQy1lm', 4, '2022-12-23 16:54:39.398983');
INSERT INTO public.urls VALUES (12, 'https://testfandodddDDDgdsdgfd', 'ovaCS768g6zLHJ63ycEjA', 4, '2022-12-23 16:54:39.398983');
INSERT INTO public.urls VALUES (13, 'https://testfandffddDDDgdsdgfd', '9FZSBgJnT_8KNNnBsjsvq', 4, '2022-12-23 16:54:39.398983');
INSERT INTO public.urls VALUES (14, 'https://volei', 'JbFyCcojVm-2wInr-H6DX', 2, '2022-12-23 16:54:39.398983');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (2, '$2a$10$blMHfR0S.0DCY1IvsANvaOohEYwZVCJuGyXkEqSnNrFzU3Mz/4tHO', 'João', 'joao@driven.com.br', '2022-12-23 16:54:32.307613');
INSERT INTO public.users VALUES (3, '$2a$10$iWhG3w9MITlVACYlSmJHf.4fKYMTwPO/vtcv9xfyzidOQdyrl4Shu', 'Daniel', 'daniel@driven.com.br', '2022-12-23 16:54:32.307613');
INSERT INTO public.users VALUES (4, '$2a$10$obiCOWXWcaJKWGAULNv3ve2wKktWSvXP1qrM/l6moYabTfi0OGz4e', 'Danieldd', 'danieldd@driven.com.br', '2022-12-23 16:54:32.307613');


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.views VALUES (1, '1', NULL, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (2, '1', NULL, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (3, '1', NULL, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (4, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (5, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (6, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (7, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (8, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (9, '1', 11, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (10, '1', 13, '2022-12-23 16:54:12.134282');
INSERT INTO public.views VALUES (11, '1', 13, '2022-12-23 16:54:12.134282');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.views_id_seq', 11, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

