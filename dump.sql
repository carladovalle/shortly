--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
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
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
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
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "confirmPassword" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
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
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '345ee68c-0fef-4bc1-a9fa-4d4eb47836d5', 1, '2022-10-15 09:05:40.581572');
INSERT INTO public.sessions VALUES (2, 'ea278264-661c-4c14-9a46-b1023ff1ae7c', 1, '2022-10-15 09:13:19.120089');
INSERT INTO public.sessions VALUES (3, '5716c7c6-e6aa-413d-b28b-37d56b902934', 1, '2022-10-15 09:14:20.528963');
INSERT INTO public.sessions VALUES (4, '3b4a1e88-333e-4602-b6e0-fbe59fddd118', 1, '2022-10-15 09:15:00.132583');
INSERT INTO public.sessions VALUES (5, '87c05958-d66c-442d-87ba-f6ff5f5758c1', 1, '2022-10-15 09:15:27.234649');
INSERT INTO public.sessions VALUES (6, '3f0eb0c2-487a-49ba-ad87-851e11eb5a33', 1, '2022-10-15 09:16:47.144188');
INSERT INTO public.sessions VALUES (7, '6f6a90af-d575-421b-896b-2ccd3a661fff', 1, '2022-10-15 09:17:05.530465');
INSERT INTO public.sessions VALUES (8, '66222098-bb33-45fe-8d25-79c794da544e', 1, '2022-10-15 09:18:10.38166');
INSERT INTO public.sessions VALUES (9, '4a8b5414-9704-4140-84db-9d6486b57777', 1, '2022-10-15 09:18:50.094404');
INSERT INTO public.sessions VALUES (10, '37e87b84-ba75-4d0d-8e33-c92bad8da592', 1, '2022-10-15 09:19:17.149271');
INSERT INTO public.sessions VALUES (11, '611be1cf-65ae-4efb-a1c5-bd14ab996e98', 1, '2022-10-15 14:07:27.132739');
INSERT INTO public.sessions VALUES (12, 'db277013-e991-4b0b-8f9d-97bd1e32b568', 1, '2022-10-15 15:29:50.100181');
INSERT INTO public.sessions VALUES (13, 'a7f57f20-f879-4a26-a41e-0341523dbbe1', 1, '2022-10-15 15:31:33.226901');
INSERT INTO public.sessions VALUES (14, '37b6d116-6476-4288-a859-72e1915452a7', 1, '2022-10-15 16:02:17.086781');
INSERT INTO public.sessions VALUES (15, '1f0c0d8e-bf59-4bbd-bfa2-536b01ed00f0', 1, '2022-10-15 16:03:38.041808');
INSERT INTO public.sessions VALUES (16, '81ab3241-c09b-4f73-b8d4-0115fd669dfa', 1, '2022-10-15 16:04:10.546691');
INSERT INTO public.sessions VALUES (17, '35f8c409-552c-4e97-8722-fd1138195929', 1, '2022-10-15 17:44:33.109979');
INSERT INTO public.sessions VALUES (18, '8855a3f3-c1b7-469a-b9f8-ebcbc0cc2c5e', 1, '2022-10-15 17:44:56.68006');
INSERT INTO public.sessions VALUES (19, '0421bdc9-0939-4d54-939b-ab561ec91701', 1, '2022-10-16 11:40:17.23263');
INSERT INTO public.sessions VALUES (20, '9b0ad4d3-a254-4828-bbf7-ed788c01825b', 1, '2022-10-16 11:43:57.370175');
INSERT INTO public.sessions VALUES (21, '31739e1b-32ea-4fb3-bec7-3cd9901df6f9', 2, '2022-10-16 12:01:39.742617');
INSERT INTO public.sessions VALUES (22, '3f138a96-3468-4f52-94bc-fdbfb147da0f', 2, '2022-10-16 12:02:04.362885');
INSERT INTO public.sessions VALUES (23, '3462b593-e3e0-4702-aefa-4d32891da6e2', 1, '2022-10-16 12:02:49.469536');
INSERT INTO public.sessions VALUES (24, '1ca51a4a-3c0e-45f7-a525-98b1ea7c5da8', 2, '2022-10-16 12:03:23.028119');
INSERT INTO public.sessions VALUES (25, 'fde8ca78-dd6f-4a9e-bce0-c53ea419d2ad', 2, '2022-10-17 13:45:52.203959');
INSERT INTO public.sessions VALUES (26, '27c899fd-19cd-4d97-be9e-eae3e8a7bef4', 1, '2022-10-17 13:48:04.825908');
INSERT INTO public.sessions VALUES (27, '0fbe34eb-a891-4cbc-b933-a52f098a1d2c', 1, '2022-10-17 13:49:25.102923');
INSERT INTO public.sessions VALUES (28, '217e6680-7c04-495a-b1e7-637aee178788', 2, '2022-10-17 13:50:07.952627');
INSERT INTO public.sessions VALUES (29, '3fbeae98-11a5-4125-af92-e0500857df24', 1, '2022-10-17 13:53:29.346689');
INSERT INTO public.sessions VALUES (30, '6eae81a1-2336-4434-8472-3ffb9ef7b1c7', 1, '2022-10-17 13:53:31.106343');
INSERT INTO public.sessions VALUES (31, '5a642845-15e0-4bd9-8602-917d5bc3db69', 2, '2022-10-17 14:33:40.523021');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (15, 1, '{"url":"https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm"}', '5GI8D63C', 0, '2022-10-15 17:39:34.224235');
INSERT INTO public.urls VALUES (16, 1, '{"url":"https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm"}', 'ikt3PeHN', 0, '2022-10-15 17:41:17.312796');
INSERT INTO public.urls VALUES (17, 1, '{"url":"https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm"}', 'BNyrkbMc', 0, '2022-10-15 17:43:58.031734');
INSERT INTO public.urls VALUES (21, 1, '{"url":"https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm"}', 'LMxfyodj', 0, '2022-10-15 17:46:54.22624');
INSERT INTO public.urls VALUES (22, 1, 'https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm', 'ubkOAQSE', 0, '2022-10-15 17:47:26.395597');
INSERT INTO public.urls VALUES (23, 1, 'https://g1.globo.com/', '1dcCjFzU', 0, '2022-10-15 17:49:17.54652');
INSERT INTO public.urls VALUES (25, 1, 'https://g1.globo.com/', 'd8d6kX3b', 0, '2022-10-15 18:05:32.955737');
INSERT INTO public.urls VALUES (26, 1, 'https ://g1.globo.com/', 'e8mIkUvm', 0, '2022-10-15 18:05:36.71625');
INSERT INTO public.urls VALUES (28, 1, 'https://gccssas1.globo.com/', 'eIg0PesF', 0, '2022-10-15 18:13:04.023419');
INSERT INTO public.urls VALUES (14, 1, '{"url":"https://www.amazon.com.br/?tag=admarketbr-20&ref=pd_sl_224ad76ee6b0879cd2b7f84543e6f104480dcc6adec6614e31c10a9f&mfadid=adm"}', 'kFf_3qaH', 5, '2022-10-15 17:37:14.483976');
INSERT INTO public.urls VALUES (27, 1, 'https ://g ccssas1.globo.com/', 'reiWnhHB', 9, '2022-10-15 18:05:44.451991');
INSERT INTO public.urls VALUES (24, 1, 'https://g1.globo.com/', 'V_rBo0di', 13, '2022-10-15 17:50:49.277162');
INSERT INTO public.urls VALUES (29, 2, 'https://github.com/', 'i6ARrW_T', 0, '2022-10-17 14:35:11.856002');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'carla', 'carla.valle@gmail.com', '$2b$10$d5ayE8vJqSThrrieHbAvK.06h/lHy61fs84eOrC23S0mnxkfcpC5y', '$2b$10$d5ayE8vJqSThrrieHbAvK.06h/lHy61fs84eOrC23S0mnxkfcpC5y', '2022-10-15 08:24:22.197254');
INSERT INTO public.users VALUES (2, 'ana', 'ana.valle@gmail.com', '$2b$10$teUmVaV.qyDMMvI.I9fzTuYpYNvMUtJDetl9HBSUCXm.YPTYSZbnm', '$2b$10$teUmVaV.qyDMMvI.I9fzTuYpYNvMUtJDetl9HBSUCXm.YPTYSZbnm', '2022-10-16 12:01:31.003145');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 31, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 29, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

