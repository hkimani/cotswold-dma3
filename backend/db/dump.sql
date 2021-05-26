--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE digitalmat;
DROP DATABASE dmatat;
DROP DATABASE gtfs;
DROP DATABASE ma3tycoon;
DROP DATABASE matatu_rate;
DROP DATABASE matatud;




--
-- Drop roles
--

DROP ROLE digitalm;
DROP ROLE dmatat;
DROP ROLE gtfs;
DROP ROLE ma3tycoon;
DROP ROLE matatu_rate;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE digitalm;
ALTER ROLE digitalm WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5ed8456149da58b83a0d1910ba1f0dc09';
CREATE ROLE dmatat;
ALTER ROLE dmatat WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE gtfs;
ALTER ROLE gtfs WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md576a1055c2b53e6520ada12c440de6b62';
CREATE ROLE ma3tycoon;
ALTER ROLE ma3tycoon WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md50260656c45cae51cc6429d2558973854';
CREATE ROLE matatu_rate;
ALTER ROLE matatu_rate WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5e0038d3a153fe31d86699bd2e3a48f4e';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE digitalmat WITH TEMPLATE = template0 OWNER = dmatat;
CREATE DATABASE dmatat WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE dmatat FROM PUBLIC;
REVOKE ALL ON DATABASE dmatat FROM postgres;
GRANT ALL ON DATABASE dmatat TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE dmatat TO PUBLIC;
CREATE DATABASE gtfs WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE gtfs FROM PUBLIC;
REVOKE ALL ON DATABASE gtfs FROM postgres;
GRANT ALL ON DATABASE gtfs TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE gtfs TO PUBLIC;
GRANT ALL ON DATABASE gtfs TO gtfs;
CREATE DATABASE ma3tycoon WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE ma3tycoon FROM PUBLIC;
REVOKE ALL ON DATABASE ma3tycoon FROM postgres;
GRANT ALL ON DATABASE ma3tycoon TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE ma3tycoon TO PUBLIC;
GRANT ALL ON DATABASE ma3tycoon TO ma3tycoon;
CREATE DATABASE matatu_rate WITH TEMPLATE = template0 OWNER = dmatat;
REVOKE ALL ON DATABASE matatu_rate FROM PUBLIC;
REVOKE ALL ON DATABASE matatu_rate FROM dmatat;
GRANT ALL ON DATABASE matatu_rate TO dmatat;
GRANT CONNECT,TEMPORARY ON DATABASE matatu_rate TO PUBLIC;
GRANT ALL ON DATABASE matatu_rate TO matatu_rate;
CREATE DATABASE matatud WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE matatud FROM PUBLIC;
REVOKE ALL ON DATABASE matatud FROM postgres;
GRANT ALL ON DATABASE matatud TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE matatud TO PUBLIC;
GRANT ALL ON DATABASE matatud TO digitalm;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect digitalmat

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: application_alldata; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.application_alldata (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    question_text character varying(200) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.application_alldata OWNER TO dmatat;

--
-- Name: application_areaquestiondata; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.application_areaquestiondata (
    id integer NOT NULL,
    "Question_text" character varying(200) NOT NULL,
    "Choice_text" character varying(200) NOT NULL
);


ALTER TABLE public.application_areaquestiondata OWNER TO dmatat;

--
-- Name: application_choices; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.application_choices (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    points integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.application_choices OWNER TO dmatat;

--
-- Name: application_datatable; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.application_datatable (
    id integer NOT NULL,
    choice_id integer NOT NULL,
    question_id character varying(200) NOT NULL,
    choice_text character varying(50) NOT NULL,
    question_text character varying(200) NOT NULL,
    total_count integer NOT NULL
);


ALTER TABLE public.application_datatable OWNER TO dmatat;

--
-- Name: application_timelines; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.application_timelines (
    id integer NOT NULL,
    date_added date NOT NULL,
    choice_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.application_timelines OWNER TO dmatat;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO dmatat;

--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO dmatat;

--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO dmatat;

--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO dmatat;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO dmatat;

--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO dmatat;

--
-- Name: datatable; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.datatable (
    choice_id integer NOT NULL,
    question_id integer,
    choice_text character varying(50),
    question_text character varying(200),
    total_count integer
);


ALTER TABLE public.datatable OWNER TO dmatat;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO dmatat;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO dmatat;

--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO dmatat;

--
-- Name: django_session; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO dmatat;

--
-- Name: dummy; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.dummy (
    question_text character varying(200),
    choice_text character varying(200)
);


ALTER TABLE public.dummy OWNER TO dmatat;

--
-- Data for Name: application_alldata; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.application_alldata (id, choice_text, question_text, question_id) FROM stdin;
1	 Yes            	 Does transport care for women?                 	1
2	 Yes            	 Do you think transport cares for the disabled? 	4
3	 Yes            	 Does transport care for students?              	5
4	 Yes            	 Does transport care for women?                 	1
5	 Yes            	 Do you think transport cares for the disabled? 	4
6	 Skip           	 Have you faced any form of abuse?              	2
7	 No             	 What mode of transport do you use daily?       	3
8	 No             	 If you walk how long do you walk daily?       	7
9	 Yes            	 What form of transport do students use?        	6
10	 Yes            	 Does transport care for students?              	5
11	 Yes            	 Does transport care for women?                 	1
12	 Yes            	 Do you think transport cares for the disabled? 	4
13	 Skip           	 What mode of transport do you use daily?       	3
14	 No             	 If you walk how long do you walk daily?       	7
15	 No             	 What form of transport do students use?        	6
16	 Yes            	 Have you faced any form of abuse?              	2
17	 Yes            	 Does transport care for students?              	5
18	 Yes            	 Do you think transport cares for the disabled? 	4
19	 Yes            	 Does transport care for women?                 	1
20	 Matatu         	 What form of transport do students use?        	6
21	 Yes            	 Does transport care for students?              	5
22	 Yes            	 Do you think transport cares for the disabled? 	4
23	 Yes            	 Have you faced any form of abuse?              	2
24	 Yes            	 Does transport care for students?              	5
25	 No             	 Does transport care for women?                 	1
26	 Skip           	 Do you think transport cares for the disabled? 	4
27	 Yes            	 Does transport care for students?              	5
28	 No             	 Does transport care for women?                 	1
29	 No             	 Do you think transport cares for the disabled? 	4
30	 Yes            	 What mode of transport do you use daily?       	3
31	 Yes            	 If you walk how long do you walk daily?       	7
32	 No             	 Does transport care for students?              	5
33	 19-24          	 What was the age group of the respondent?      	9
34	 No             	 Does transport care for women?                 	1
35	 Yes            	 Do you think transport cares for the disabled? 	4
36	 Yes            	 Have you faced any form of abuse?              	2
37	 Kawangware     	 Which area was the respondent from?            	8
38	 No             	 Have you faced any form of abuse?              	2
39	 Matatu         	 What mode of transport do you use daily?       	3
40	 1 Km           	 If you walk how long do you walk daily?       	7
41	 3 Km           	 What was the gender of the respondent?         	10
42	 Female         	 What form of transport do students use?        	6
43	 Matatu         	 Surveyor name                                  	11
44	 Yes            	 Does transport care for students?              	5
45	 Above 45       	 What was the age group of the respondent?      	9
46	 Yes            	 Does transport care for women?                 	1
47	 Yes            	 Do you think transport cares for the disabled? 	4
48	 Kawangware     	 Which area was the respondent from?            	8
49	 Matatu         	 What mode of transport do you use daily?       	3
50	 2 Km           	 If you walk how long do you walk daily?       	7
51	 Female         	 What was the gender of the respondent?         	10
\.


--
-- Data for Name: application_areaquestiondata; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.application_areaquestiondata (id, "Question_text", "Choice_text") FROM stdin;
1	Does transport care for women?                 	 Other
2	Have you faced any form of abuse?              	 Other
3	What mode of transport do you use daily?       	 Other
4	Do you think transport cares for the disabled? 	 Other
5	Does transport care for students?              	 Other
6	What form of transport do students use?        	 Other
7	If you walk how long do you walk daily?       	 Other
8	Which area was the respondent from?            	 Other
9	What was the age group of the respondent?      	 Other
10	What was the gender of the respondent?         	 Other
11	Surveyor name                                  	 Other
12	Does transport care for women?                 	 Mathare
13	Have you faced any form of abuse?              	 Mathare
14	What mode of transport do you use daily?       	 Mathare
15	Do you think transport cares for the disabled? 	 Mathare
16	Does transport care for students?              	 Mathare
17	What form of transport do students use?        	 Mathare
18	If you walk how long do you walk daily?       	 Mathare
19	Which area was the respondent from?            	 Mathare
20	What was the age group of the respondent?      	 Mathare
21	What was the gender of the respondent?         	 Mathare
22	Surveyor name                                  	 Mathare
23	Does transport care for women?                 	 Kawangware
24	Have you faced any form of abuse?              	 Kawangware
25	What mode of transport do you use daily?       	 Kawangware
26	Do you think transport cares for the disabled? 	 Kawangware
27	Does transport care for students?              	 Kawangware
28	What form of transport do students use?        	 Kawangware
29	If you walk how long do you walk daily?       	 Kawangware
30	Which area was the respondent from?            	 Kawangware
31	What was the age group of the respondent?      	 Kawangware
32	What was the gender of the respondent?         	 Kawangware
33	Surveyor name                                  	 Kawangware
34	Does transport care for women?                 	 Babadogo
35	Have you faced any form of abuse?              	 Babadogo
36	What mode of transport do you use daily?       	 Babadogo
37	Do you think transport cares for the disabled? 	 Babadogo
38	Does transport care for students?              	 Babadogo
39	What form of transport do students use?        	 Babadogo
40	If you walk how long do you walk daily?       	 Babadogo
41	Which area was the respondent from?            	 Babadogo
42	What was the age group of the respondent?      	 Babadogo
43	What was the gender of the respondent?         	 Babadogo
44	Surveyor name                                  	 Babadogo
45	Does transport care for women?                 	 Kibera
46	Have you faced any form of abuse?              	 Kibera
47	What mode of transport do you use daily?       	 Kibera
48	Do you think transport cares for the disabled? 	 Kibera
49	Does transport care for students?              	 Kibera
50	What form of transport do students use?        	 Kibera
\.


--
-- Data for Name: application_choices; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.application_choices (id, choice_text, points, question_id) FROM stdin;
1	 Yes            	1	1
2	 No             	1	1
3	 Skip           	0	1
4	 Yes            	1	2
5	 No             	1	2
6	 Skip           	0	2
7	 Matatu         	1	3
8	 Taxi           	1	3
9	 Private car    	1	3
10	 Yes            	1	4
11	 No             	1	4
12	 Skip           	0	4
13	 Yes            	1	5
14	 No             	1	5
15	 Skip           	0	5
16	 Matatu         	1	6
17	 Taxi           	1	6
18	 Private car    	1	6
19	 Less than 1 Km 	1	7
20	 1 Km           	1	7
21	 2 Km           	1	7
22	 3 Km           	1	7
23	 4 Km           	1	7
24	 5 Km           	1	7
25	 More than 5 Km 	1	7
26	 Kibera         	1	8
27	 Babadogo       	1	8
28	 Kawangware     	1	8
29	 Mathare        	1	8
30	 Other          	1	8
31	 14-18          	1	9
32	 19-24          	1	9
33	 25-30          	1	9
34	 31-35          	1	9
35	 36-45          	1	9
36	 Above 45       	1	9
37	 Male           	1	10
38	 Female         	1	10
39	 Michelle       	1	11
40	 Salma          	1	11
\.


--
-- Data for Name: application_datatable; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.application_datatable (id, choice_id, question_id, choice_text, question_text, total_count) FROM stdin;
1	1	3	 Yes            	 What mode of transport do you use daily?       	1
2	26	3	 Kibera         	 What mode of transport do you use daily?       	11
3	15	3	 Skip           	 What mode of transport do you use daily?       	1
4	13	3	 Yes            	 What mode of transport do you use daily?       	1
5	34	9	 31-35          	 What was the age group of the respondent?      	23
6	7	11	 Matatu         	 Surveyor name                                  	1
7	37	6	 Male           	 What form of transport do students use?        	9
8	36	9	 Above 45       	 What was the age group of the respondent?      	18
9	31	9	 14-18          	 What was the age group of the respondent?      	8
10	37	10	 Male           	 What was the gender of the respondent?         	16
11	18	6	 Private car    	 What form of transport do students use?        	2
12	38	7	 Female         	 If you walk  how long do you walk daily?       	1
13	10	1	 Yes            	 Does transport care for women?                 	1
14	38	6	 Female         	 What form of transport do students use?        	28
15	13	5	 Yes            	 Does transport care for students?              	60
16	15	5	 Skip           	 Does transport care for students?              	7
17	4	3	 Yes            	 What mode of transport do you use daily?       	6
18	3	7	 Skip           	 If you walk  how long do you walk daily?       	1
19	32	1	 19-24          	 Does transport care for women?                 	1
20	38	10	 Female         	 What was the gender of the respondent?         	53
21	1	5	 Yes            	 Does transport care for students?              	1
22	3	4	 Skip           	 Do you think transport cares for the disabled? 	1
23	13	6	 Yes            	 What form of transport do students use?        	1
24	26	10	 Kibera         	 What was the gender of the respondent?         	1
25	2	8	 No             	 Which area was the respondent from?            	1
26	35	9	 36-45          	 What was the age group of the respondent?      	15
27	4	8	 Yes            	 Which area was the respondent from?            	8
28	39	6	 Michelle       	 What form of transport do students use?        	1
29	32	2	 19-24          	 Have you faced any form of abuse?              	1
30	35	4	 36-45          	 Do you think transport cares for the disabled? 	1
31	10	2	 Yes            	 Have you faced any form of abuse?              	19
32	21	7	 2 Km           	 If you walk  how long do you walk daily?       	9
33	2	4	 No             	 Do you think transport cares for the disabled? 	13
34	20	10	 1 Km           	 What was the gender of the respondent?         	5
35	28	2	 Kawangware     	 Have you faced any form of abuse?              	2
36	19	6	 Less than 1 Km 	 What form of transport do students use?        	5
37	19	10	 Less than 1 Km 	 What was the gender of the respondent?         	22
38	20	6	 1 Km           	 What form of transport do students use?        	4
39	11	7	 No             	 If you walk  how long do you walk daily?       	1
40	40	9	 Salma          	 What was the age group of the respondent?      	1
41	13	4	 Yes            	 Do you think transport cares for the disabled? 	3
42	26	7	 Kibera         	 If you walk  how long do you walk daily?       	4
\.


--
-- Data for Name: application_timelines; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.application_timelines (id, date_added, choice_id, question_id) FROM stdin;
1	2018-10-03	1	1
2	2018-10-03	10	4
3	2018-10-03	13	5
4	2018-10-03	13	1
5	2018-10-03	13	4
6	2018-10-03	15	2
7	2018-10-03	14	3
8	2018-10-03	14	7
9	2018-10-03	13	6
10	2018-10-03	13	5
11	2018-10-03	13	1
12	2018-10-03	13	4
13	2018-10-03	15	3
14	2018-10-03	14	7
15	2018-10-03	14	6
16	2018-10-03	13	2
17	2018-10-03	13	5
18	2018-10-03	10	4
19	2018-10-03	1	1
20	2018-10-03	16	6
21	2018-10-03	13	5
22	2018-10-03	10	4
23	2018-10-03	4	2
24	2018-10-03	13	5
25	2018-10-03	2	1
26	2018-10-03	12	4
27	2018-10-03	13	5
28	2018-10-03	14	1
29	2018-10-03	14	4
30	2018-10-03	13	3
31	2018-10-03	13	7
32	2018-10-05	14	5
33	2018-10-05	32	9
34	2018-10-05	2	1
35	2018-10-05	10	4
36	2018-10-05	4	2
37	2018-10-05	28	8
38	2018-10-05	5	2
39	2018-10-05	7	3
40	2018-10-05	20	7
41	2018-10-05	22	10
42	2018-10-05	38	6
43	2018-10-05	16	11
44	2018-10-05	13	5
45	2018-10-05	36	9
46	2018-10-05	1	1
47	2018-10-05	10	4
48	2018-10-05	28	8
49	2018-10-05	7	3
50	2018-10-05	21	7
51	2018-10-05	38	10
52	2018-10-05	16	6
53	2018-10-05	39	11
54	2018-10-05	13	5
55	2018-10-05	36	9
56	2018-10-05	1	1
57	2018-10-05	10	4
58	2018-10-05	5	2
59	2018-10-05	28	8
60	2018-10-05	7	3
61	2018-10-05	19	7
62	2018-10-05	38	10
63	2018-10-05	16	6
64	2018-10-05	39	11
65	2018-10-05	14	5
66	2018-10-05	32	9
67	2018-10-05	1	1
68	2018-10-05	10	4
69	2018-10-05	5	2
70	2018-10-05	28	8
71	2018-10-05	7	3
72	2018-10-05	22	7
73	2018-10-05	37	10
74	2018-10-05	16	6
75	2018-10-05	39	11
76	2018-10-05	13	5
77	2018-10-05	34	9
78	2018-10-05	1	1
79	2018-10-05	10	4
80	2018-10-05	5	2
81	2018-10-05	28	8
82	2018-10-05	7	3
83	2018-10-05	19	7
84	2018-10-05	37	10
85	2018-10-05	16	6
86	2018-10-05	39	11
87	2018-10-05	13	5
88	2018-10-05	33	9
89	2018-10-05	1	1
90	2018-10-05	2	4
91	2018-10-05	10	2
92	2018-10-05	5	8
93	2018-10-05	28	3
94	2018-10-05	7	7
95	2018-10-05	19	10
96	2018-10-05	38	6
97	2018-10-05	16	11
98	2018-10-05	14	5
99	2018-10-05	34	9
100	2018-10-05	1	1
101	2018-10-05	11	4
102	2018-10-05	10	2
103	2018-10-05	5	8
104	2018-10-05	28	3
105	2018-10-05	7	7
106	2018-10-05	19	10
107	2018-10-05	38	6
108	2018-10-05	16	11
109	2018-10-05	32	5
110	2018-10-05	34	9
111	2018-10-05	14	1
112	2018-10-05	32	4
113	2018-10-05	2	2
114	2018-10-05	1	8
115	2018-10-05	10	3
116	2018-10-05	5	7
117	2018-10-05	28	10
118	2018-10-05	7	6
119	2018-10-05	19	11
120	2018-10-05	14	5
121	2018-10-05	33	9
122	2018-10-05	1	1
123	2018-10-05	10	4
124	2018-10-05	5	2
125	2018-10-05	28	8
126	2018-10-05	7	3
127	2018-10-05	19	7
128	2018-10-05	38	10
129	2018-10-05	16	6
130	2018-10-05	39	11
131	2018-10-05	14	5
132	2018-10-05	35	9
133	2018-10-05	1	1
134	2018-10-05	10	4
135	2018-10-05	5	2
136	2018-10-05	28	8
137	2018-10-05	7	3
138	2018-10-05	19	7
139	2018-10-05	37	10
140	2018-10-05	16	6
141	2018-10-05	39	11
142	2018-10-05	14	5
143	2018-10-05	35	9
144	2018-10-05	1	1
145	2018-10-05	10	4
146	2018-10-05	5	2
147	2018-10-05	28	8
148	2018-10-05	7	3
149	2018-10-05	19	7
150	2018-10-05	37	10
151	2018-10-05	16	6
152	2018-10-05	39	11
153	2018-10-05	14	5
154	2018-10-05	36	9
155	2018-10-05	1	1
156	2018-10-05	10	4
157	2018-10-05	5	2
158	2018-10-05	28	8
159	2018-10-05	7	3
160	2018-10-05	21	7
161	2018-10-05	37	10
162	2018-10-05	16	6
163	2018-10-05	39	11
164	2018-10-05	13	5
165	2018-10-05	36	9
166	2018-10-05	1	1
167	2018-10-05	10	4
168	2018-10-05	5	2
169	2018-10-05	28	8
170	2018-10-05	7	3
171	2018-10-05	19	7
172	2018-10-05	37	10
173	2018-10-05	16	6
174	2018-10-05	39	11
175	2018-10-05	14	5
176	2018-10-05	33	9
177	2018-10-05	1	1
178	2018-10-05	10	4
179	2018-10-05	5	2
180	2018-10-05	28	8
181	2018-10-05	7	3
182	2018-10-05	19	7
183	2018-10-05	38	10
184	2018-10-05	16	6
185	2018-10-05	39	11
186	2018-10-05	14	5
187	2018-10-05	35	9
188	2018-10-05	1	1
189	2018-10-05	10	4
190	2018-10-05	5	2
191	2018-10-05	28	8
192	2018-10-05	7	3
193	2018-10-05	20	7
194	2018-10-05	38	10
195	2018-10-05	16	6
196	2018-10-05	39	11
197	2018-10-05	14	5
198	2018-10-05	36	9
199	2018-10-05	1	4
200	2018-10-05	10	1
201	2018-10-05	2	2
202	2018-10-05	4	8
203	2018-10-05	28	3
204	2018-10-05	7	7
205	2018-10-05	19	10
206	2018-10-05	38	6
207	2018-10-05	16	11
208	2018-10-05	14	5
209	2018-10-05	33	9
210	2018-10-05	2	1
211	2018-10-05	10	4
212	2018-10-05	5	2
213	2018-10-05	28	8
214	2018-10-05	7	3
215	2018-10-05	19	7
216	2018-10-05	38	10
217	2018-10-05	16	6
218	2018-10-05	39	11
219	2018-10-05	14	5
220	2018-10-05	32	9
221	2018-10-05	2	1
222	2018-10-05	10	4
223	2018-10-05	5	2
224	2018-10-05	28	8
225	2018-10-05	7	3
226	2018-10-05	19	7
227	2018-10-05	38	10
228	2018-10-05	16	6
229	2018-10-05	39	11
230	2018-10-05	15	5
231	2018-10-05	34	9
232	2018-10-05	14	1
233	2018-10-05	32	4
234	2018-10-05	2	2
235	2018-10-05	10	8
236	2018-10-05	5	3
237	2018-10-05	28	7
238	2018-10-05	7	10
239	2018-10-05	19	6
240	2018-10-05	37	11
241	2018-10-05	14	5
242	2018-10-05	32	9
243	2018-10-05	2	1
244	2018-10-05	11	4
245	2018-10-05	5	2
246	2018-10-05	28	8
247	2018-10-05	7	3
248	2018-10-05	19	7
249	2018-10-05	37	10
250	2018-10-05	16	6
251	2018-10-05	39	11
252	2018-10-05	14	5
253	2018-10-05	34	9
254	2018-10-05	2	1
255	2018-10-05	10	4
256	2018-10-05	4	2
257	2018-10-05	28	8
258	2018-10-05	7	3
259	2018-10-05	21	7
260	2018-10-05	38	10
261	2018-10-05	16	6
262	2018-10-05	39	11
263	2018-10-05	14	5
264	2018-10-05	34	9
265	2018-10-05	33	1
266	2018-10-05	2	4
267	2018-10-05	10	2
268	2018-10-05	4	8
269	2018-10-05	28	3
270	2018-10-05	7	7
271	2018-10-05	21	10
272	2018-10-05	37	6
273	2018-10-05	16	11
274	2018-10-05	14	5
275	2018-10-05	32	9
276	2018-10-05	2	1
277	2018-10-05	10	4
278	2018-10-05	5	2
279	2018-10-05	28	8
280	2018-10-05	7	3
281	2018-10-05	20	7
282	2018-10-05	37	10
283	2018-10-05	16	6
284	2018-10-05	39	11
285	2018-10-05	13	5
286	2018-10-05	33	9
287	2018-10-05	1	1
288	2018-10-05	10	4
289	2018-10-05	5	2
290	2018-10-05	28	8
291	2018-10-05	7	3
292	2018-10-05	21	7
293	2018-10-05	38	10
294	2018-10-05	16	6
295	2018-10-05	39	11
296	2018-10-05	14	5
297	2018-10-05	32	9
298	2018-10-05	2	1
299	2018-10-05	10	4
300	2018-10-05	5	2
301	2018-10-05	28	8
302	2018-10-05	7	3
303	2018-10-05	19	7
304	2018-10-05	38	10
305	2018-10-05	16	6
306	2018-10-05	39	11
307	2018-10-05	14	5
308	2018-10-05	31	9
309	2018-10-05	2	1
310	2018-10-05	10	4
311	2018-10-05	5	8
312	2018-10-05	28	2
313	2018-10-05	4	3
314	2018-10-05	7	7
315	2018-10-05	19	10
316	2018-10-05	38	6
317	2018-10-05	16	11
318	2018-10-05	14	5
319	2018-10-05	31	9
320	2018-10-05	36	1
321	2018-10-05	2	4
322	2018-10-05	10	2
323	2018-10-05	4	8
324	2018-10-05	5	3
325	2018-10-05	28	7
326	2018-10-05	7	10
327	2018-10-05	19	6
328	2018-10-05	38	11
329	2018-10-05	14	5
330	2018-10-05	33	9
331	2018-10-05	1	1
332	2018-10-05	10	4
333	2018-10-05	5	2
334	2018-10-05	28	8
335	2018-10-05	7	3
336	2018-10-05	21	7
337	2018-10-05	37	10
338	2018-10-05	16	6
339	2018-10-05	39	11
340	2018-10-05	14	5
341	2018-10-05	33	9
342	2018-10-05	1	1
343	2018-10-05	10	4
344	2018-10-05	5	2
345	2018-10-05	28	8
346	2018-10-05	7	3
347	2018-10-05	19	7
348	2018-10-05	38	10
349	2018-10-05	16	6
350	2018-10-05	39	11
351	2018-10-06	13	5
352	2018-10-06	1	1
353	2018-10-06	4	2
354	2018-10-06	26	8
355	2018-10-06	7	7
356	2018-10-06	19	10
357	2018-10-06	38	6
358	2018-10-06	16	11
359	2018-10-06	40	9
360	2018-10-06	35	4
361	2018-10-06	14	9
362	2018-10-06	36	1
363	2018-10-06	1	4
364	2018-10-06	10	2
365	2018-10-06	5	8
366	2018-10-06	26	3
367	2018-10-06	7	10
368	2018-10-06	38	11
369	2018-10-06	16	5
370	2018-10-06	13	5
371	2018-10-06	32	9
372	2018-10-06	1	1
373	2018-10-06	11	4
374	2018-10-06	5	2
375	2018-10-06	26	8
376	2018-10-06	7	3
377	2018-10-06	38	10
378	2018-10-06	40	11
379	2018-10-06	13	5
380	2018-10-06	34	9
381	2018-10-06	1	1
382	2018-10-06	12	4
383	2018-10-06	5	2
384	2018-10-06	26	8
385	2018-10-06	7	3
386	2018-10-06	38	10
387	2018-10-06	16	6
388	2018-10-06	40	11
389	2018-10-06	13	5
390	2018-10-06	32	9
391	2018-10-06	1	1
392	2018-10-06	10	4
393	2018-10-06	5	2
394	2018-10-06	26	8
395	2018-10-06	20	7
396	2018-10-06	21	10
397	2018-10-06	20	6
398	2018-10-06	38	11
399	2018-10-06	13	5
400	2018-10-06	33	9
401	2018-10-06	2	1
402	2018-10-06	10	4
403	2018-10-06	4	2
404	2018-10-06	26	8
405	2018-10-06	7	3
406	2018-10-06	19	7
407	2018-10-06	38	10
408	2018-10-06	16	6
409	2018-10-06	40	11
410	2018-10-06	13	5
411	2018-10-06	35	9
412	2018-10-06	1	1
413	2018-10-06	11	4
414	2018-10-06	4	2
415	2018-10-06	26	8
416	2018-10-06	7	3
417	2018-10-06	20	7
418	2018-10-06	38	10
419	2018-10-06	16	6
420	2018-10-06	40	11
421	2018-10-06	14	5
422	2018-10-06	32	9
423	2018-10-06	1	1
424	2018-10-06	11	4
425	2018-10-06	4	2
426	2018-10-06	26	8
427	2018-10-06	7	3
428	2018-10-06	19	7
429	2018-10-06	38	10
430	2018-10-06	16	6
431	2018-10-06	40	11
432	2018-10-06	13	5
433	2018-10-06	32	9
434	2018-10-06	2	1
435	2018-10-06	10	4
436	2018-10-06	5	2
437	2018-10-06	26	8
438	2018-10-06	7	3
439	2018-10-06	19	7
440	2018-10-06	38	10
441	2018-10-06	16	6
442	2018-10-06	40	11
443	2018-10-06	13	5
444	2018-10-06	14	9
445	2018-10-06	33	1
446	2018-10-06	1	4
447	2018-10-06	12	2
448	2018-10-06	4	8
449	2018-10-06	26	3
450	2018-10-06	7	10
451	2018-10-06	38	11
452	2018-10-06	15	9
453	2018-10-06	35	1
454	2018-10-06	1	5
455	2018-10-06	13	4
456	2018-10-06	12	2
457	2018-10-06	11	8
458	2018-10-06	5	7
459	2018-10-06	26	10
460	2018-10-06	20	6
461	2018-10-06	38	11
462	2018-10-06	14	5
463	2018-10-06	33	9
464	2018-10-06	1	1
465	2018-10-06	12	4
466	2018-10-06	4	2
467	2018-10-06	26	8
468	2018-10-06	7	3
469	2018-10-06	38	10
470	2018-10-06	16	6
471	2018-10-06	40	11
472	2018-10-06	13	5
473	2018-10-06	32	9
474	2018-10-06	1	1
475	2018-10-06	12	4
476	2018-10-06	11	2
477	2018-10-06	5	8
478	2018-10-06	26	3
479	2018-10-06	7	10
480	2018-10-06	38	6
481	2018-10-06	16	11
482	2018-10-06	14	5
483	2018-10-06	32	9
484	2018-10-06	1	1
485	2018-10-06	10	4
486	2018-10-06	5	2
487	2018-10-06	26	8
488	2018-10-06	21	7
489	2018-10-06	38	10
490	2018-10-06	40	11
491	2018-10-06	15	5
492	2018-10-06	35	9
493	2018-10-06	1	1
494	2018-10-06	12	4
495	2018-10-06	5	2
496	2018-10-06	26	8
497	2018-10-06	9	3
498	2018-10-06	19	7
499	2018-10-06	38	10
500	2018-10-06	18	6
501	2018-10-06	40	11
502	2018-10-06	13	5
503	2018-10-06	36	9
504	2018-10-06	1	1
505	2018-10-06	10	4
506	2018-10-06	5	2
507	2018-10-06	26	8
508	2018-10-06	7	3
509	2018-10-06	20	7
510	2018-10-06	19	10
511	2018-10-06	38	6
512	2018-10-06	16	11
513	2018-10-06	14	5
514	2018-10-06	33	9
515	2018-10-06	1	1
516	2018-10-06	11	4
517	2018-10-06	12	2
518	2018-10-06	5	8
519	2018-10-06	26	7
520	2018-10-06	7	10
521	2018-10-06	20	11
522	2018-10-06	13	5
523	2018-10-06	36	9
524	2018-10-06	1	1
525	2018-10-06	11	4
526	2018-10-06	10	8
527	2018-10-06	5	2
528	2018-10-06	4	3
529	2018-10-06	26	7
530	2018-10-06	5	10
531	2018-10-06	7	6
532	2018-10-06	19	11
533	2018-10-06	13	5
534	2018-10-06	35	9
535	2018-10-06	1	1
536	2018-10-06	10	4
537	2018-10-06	11	2
538	2018-10-06	5	8
539	2018-10-06	26	3
540	2018-10-06	7	7
541	2018-10-06	19	10
542	2018-10-06	38	11
543	2018-10-06	39	6
544	2018-10-06	14	5
545	2018-10-06	34	9
546	2018-10-06	1	1
547	2018-10-06	10	4
548	2018-10-06	12	2
549	2018-10-06	5	8
550	2018-10-06	26	7
551	2018-10-06	20	10
552	2018-10-06	38	11
553	2018-10-06	15	5
554	2018-10-06	13	9
555	2018-10-06	14	1
556	2018-10-06	32	2
557	2018-10-06	1	8
558	2018-10-06	1	3
559	2018-10-06	3	7
560	2018-10-06	5	10
561	2018-10-06	26	11
562	2018-10-06	15	5
563	2018-10-06	35	9
564	2018-10-06	3	1
565	2018-10-06	12	4
566	2018-10-06	1	2
567	2018-10-06	2	8
568	2018-10-06	11	7
569	2018-10-06	6	10
570	2018-10-06	26	11
571	2018-10-06	13	5
572	2018-10-06	36	9
573	2018-10-06	1	1
574	2018-10-06	11	4
575	2018-10-06	10	2
576	2018-10-06	5	8
577	2018-10-06	26	3
578	2018-10-06	7	10
579	2018-10-06	38	11
580	2018-10-06	13	5
581	2018-10-06	36	9
582	2018-10-06	1	1
583	2018-10-06	10	4
584	2018-10-06	5	2
585	2018-10-06	26	8
586	2018-10-06	7	3
587	2018-10-06	38	10
588	2018-10-06	16	6
589	2018-10-06	40	11
590	2018-10-06	15	5
591	2018-10-06	33	9
592	2018-10-06	2	1
593	2018-10-06	10	4
594	2018-10-06	4	2
595	2018-10-06	26	8
596	2018-10-06	7	3
597	2018-10-06	19	7
598	2018-10-06	38	10
599	2018-10-06	16	6
600	2018-10-06	40	11
601	2018-10-06	13	5
602	2018-10-06	34	9
603	2018-10-06	1	1
604	2018-10-06	10	4
605	2018-10-06	5	2
606	2018-10-06	26	8
607	2018-10-06	7	3
608	2018-10-06	38	10
609	2018-10-06	16	6
610	2018-10-06	40	11
611	2018-10-06	13	5
612	2018-10-06	33	9
613	2018-10-06	2	1
614	2018-10-06	3	4
615	2018-10-06	10	2
616	2018-10-06	5	8
617	2018-10-06	26	3
618	2018-10-06	7	10
619	2018-10-06	38	7
620	2018-10-06	19	6
621	2018-10-06	16	11
622	2018-10-06	13	5
623	2018-10-06	15	9
624	2018-10-06	35	1
625	2018-10-06	2	4
626	2018-10-06	12	2
627	2018-10-06	5	8
628	2018-10-06	26	3
629	2018-10-06	8	10
630	2018-10-06	9	6
631	2018-10-06	38	11
632	2018-10-06	13	5
633	2018-10-06	32	9
634	2018-10-06	1	1
635	2018-10-06	10	4
636	2018-10-06	4	2
637	2018-10-06	26	8
638	2018-10-06	7	3
639	2018-10-06	19	7
640	2018-10-06	20	10
641	2018-10-06	38	6
642	2018-10-06	16	11
643	2018-10-06	13	5
644	2018-10-06	34	9
645	2018-10-06	1	1
646	2018-10-06	10	4
647	2018-10-06	5	2
648	2018-10-06	4	8
649	2018-10-06	5	3
650	2018-10-06	6	7
651	2018-10-06	5	10
652	2018-10-06	4	6
653	2018-10-06	26	11
654	2018-10-06	13	5
655	2018-10-06	33	9
656	2018-10-06	1	1
657	2018-10-06	10	4
658	2018-10-06	6	2
659	2018-10-06	26	8
660	2018-10-06	7	3
661	2018-10-06	20	7
662	2018-10-06	21	10
663	2018-10-06	38	6
664	2018-10-06	16	11
665	2018-10-06	15	5
666	2018-10-06	35	9
667	2018-10-06	2	1
668	2018-10-06	10	4
669	2018-10-06	5	2
670	2018-10-06	26	8
671	2018-10-06	9	3
672	2018-10-06	20	7
673	2018-10-06	38	10
674	2018-10-06	18	6
675	2018-10-06	40	11
676	2018-10-06	13	5
677	2018-10-06	33	9
678	2018-10-06	1	1
679	2018-10-06	10	4
680	2018-10-06	5	2
681	2018-10-06	26	8
682	2018-10-06	7	3
683	2018-10-06	19	7
684	2018-10-06	38	10
685	2018-10-06	16	6
686	2018-10-06	40	11
687	2018-10-06	13	5
688	2018-10-06	34	9
689	2018-10-06	1	1
690	2018-10-06	10	4
691	2018-10-06	5	2
692	2018-10-06	26	8
693	2018-10-06	7	3
694	2018-10-06	20	7
695	2018-10-06	38	10
696	2018-10-06	16	6
697	2018-10-06	40	11
698	2018-10-06	14	5
699	2018-10-06	34	9
700	2018-10-06	2	1
701	2018-10-06	10	4
702	2018-10-06	4	2
703	2018-10-06	26	8
704	2018-10-06	7	3
705	2018-10-06	20	7
706	2018-10-06	38	10
707	2018-10-06	16	6
708	2018-10-06	40	11
709	2018-10-06	13	5
710	2018-10-06	33	9
711	2018-10-06	36	1
712	2018-10-06	1	4
713	2018-10-06	10	2
714	2018-10-06	5	8
715	2018-10-06	26	3
716	2018-10-06	7	10
717	2018-10-06	38	6
718	2018-10-06	16	11
719	2018-10-06	13	5
720	2018-10-06	33	9
721	2018-10-06	1	1
722	2018-10-06	10	4
723	2018-10-06	5	2
724	2018-10-06	26	8
725	2018-10-06	7	3
726	2018-10-06	19	7
727	2018-10-06	38	10
728	2018-10-06	40	11
729	2018-10-06	13	5
730	2018-10-06	32	9
731	2018-10-06	1	1
732	2018-10-06	12	4
733	2018-10-06	11	2
734	2018-10-06	10	8
735	2018-10-06	5	3
736	2018-10-06	26	7
737	2018-10-06	7	10
738	2018-10-06	19	6
739	2018-10-06	38	11
740	2018-10-06	13	5
741	2018-10-06	14	9
742	2018-10-06	35	1
743	2018-10-06	1	4
744	2018-10-06	10	8
745	2018-10-06	5	2
746	2018-10-06	26	3
747	2018-10-06	6	10
748	2018-10-06	7	11
749	2018-10-06	13	5
750	2018-10-06	32	9
751	2018-10-06	1	1
752	2018-10-06	10	4
753	2018-10-06	5	2
754	2018-10-06	4	8
755	2018-10-06	26	3
756	2018-10-06	7	7
757	2018-10-06	19	10
758	2018-10-06	38	6
759	2018-10-06	16	11
760	2018-10-06	14	5
761	2018-10-06	33	9
762	2018-10-06	34	1
763	2018-10-06	1	4
764	2018-10-06	11	8
765	2018-10-06	4	3
766	2018-10-06	5	10
767	2018-10-06	4	11
768	2018-10-06	26	2
769	2018-10-07	13	5
770	2018-10-07	31	9
771	2018-10-07	1	1
772	2018-10-07	16	6
773	2018-10-07	39	11
774	2018-10-07	13	5
775	2018-10-07	36	9
776	2018-10-07	1	1
777	2018-10-07	10	4
778	2018-10-07	4	2
779	2018-10-07	26	8
780	2018-10-07	7	3
781	2018-10-07	19	7
782	2018-10-07	37	10
783	2018-10-07	16	6
784	2018-10-07	39	11
785	2018-10-07	14	5
786	2018-10-07	32	9
787	2018-10-07	1	1
788	2018-10-07	11	4
789	2018-10-07	4	2
790	2018-10-07	27	8
791	2018-10-07	26	3
792	2018-10-07	7	7
793	2018-10-07	19	10
794	2018-10-07	37	6
795	2018-10-07	16	11
796	2018-10-07	13	11
797	2018-10-07	40	11
798	2018-10-09	13	5
799	2018-10-09	33	9
800	2018-10-09	1	1
801	2018-10-09	11	4
802	2018-10-09	5	2
803	2018-10-09	26	8
804	2018-10-09	7	3
805	2018-10-09	23	7
806	2018-10-09	37	10
807	2018-10-09	16	6
808	2018-10-09	40	11
809	2018-10-10	14	5
810	2018-10-10	32	9
811	2018-10-10	1	1
812	2018-10-10	12	4
813	2018-10-10	5	2
814	2018-10-10	26	8
815	2018-10-10	7	3
816	2018-10-10	19	7
817	2018-10-10	38	10
818	2018-10-10	16	6
819	2018-10-10	40	11
820	2018-10-10	14	5
821	2018-10-10	32	9
822	2018-10-10	1	1
823	2018-10-10	10	4
824	2018-10-10	4	2
825	2018-10-10	26	8
826	2018-10-10	7	3
827	2018-10-10	38	10
828	2018-10-10	40	11
829	2018-10-10	14	5
830	2018-10-10	32	9
831	2018-10-10	1	1
832	2018-10-10	10	4
833	2018-10-10	5	2
834	2018-10-10	26	8
835	2018-10-10	7	3
836	2018-10-10	19	7
837	2018-10-10	38	10
838	2018-10-10	40	11
839	2018-10-10	13	5
840	2018-10-10	33	9
841	2018-10-10	1	1
842	2018-10-10	11	4
843	2018-10-10	5	2
844	2018-10-10	26	8
845	2018-10-10	7	3
846	2018-10-10	38	10
847	2018-10-10	16	6
848	2018-10-10	40	11
849	2018-10-10	13	5
850	2018-10-10	34	9
851	2018-10-10	1	1
852	2018-10-10	12	4
853	2018-10-10	5	2
854	2018-10-10	26	8
855	2018-10-10	9	3
856	2018-10-10	38	10
857	2018-10-10	40	11
858	2018-10-10	14	5
859	2018-10-10	33	9
860	2018-10-10	1	1
861	2018-10-10	12	4
862	2018-10-10	5	2
863	2018-10-10	26	8
864	2018-10-10	7	3
865	2018-10-10	19	7
866	2018-10-10	38	10
867	2018-10-10	40	11
868	2018-10-10	13	5
869	2018-10-10	34	9
870	2018-10-10	1	1
871	2018-10-10	12	4
872	2018-10-10	5	2
873	2018-10-10	26	8
874	2018-10-10	7	3
875	2018-10-10	19	7
876	2018-10-10	38	10
877	2018-10-10	16	6
878	2018-10-10	40	11
879	2018-10-10	14	5
880	2018-10-10	35	9
881	2018-10-10	1	1
882	2018-10-10	11	4
883	2018-10-10	4	2
884	2018-10-10	26	8
885	2018-10-10	7	3
886	2018-10-10	40	11
887	2018-10-10	14	5
888	2018-10-10	32	9
889	2018-10-10	1	1
890	2018-10-10	10	4
891	2018-10-10	5	2
892	2018-10-10	26	8
893	2018-10-10	7	3
894	2018-10-10	20	7
895	2018-10-10	38	10
896	2018-10-10	16	6
897	2018-10-10	40	11
898	2018-10-10	13	5
899	2018-10-10	36	9
900	2018-10-10	1	1
901	2018-10-10	11	4
902	2018-10-10	5	2
903	2018-10-10	26	8
904	2018-10-10	7	3
905	2018-10-10	20	7
906	2018-10-10	38	10
907	2018-10-10	40	11
908	2018-10-10	16	6
909	2018-10-10	14	5
910	2018-10-10	33	9
911	2018-10-10	1	1
912	2018-10-10	10	4
913	2018-10-10	4	2
914	2018-10-10	26	8
915	2018-10-10	19	7
916	2018-10-10	38	10
917	2018-10-10	40	11
918	2018-10-10	14	5
919	2018-10-10	34	9
920	2018-10-10	1	1
921	2018-10-10	12	4
922	2018-10-10	5	2
923	2018-10-10	26	8
924	2018-10-10	20	7
925	2018-10-10	38	10
926	2018-10-10	16	6
927	2018-10-10	40	11
928	2018-10-10	13	5
929	2018-10-10	14	9
930	2018-10-10	33	1
931	2018-10-10	1	4
932	2018-10-10	10	2
933	2018-10-10	5	8
934	2018-10-10	28	3
935	2018-10-10	7	7
936	2018-10-10	19	10
937	2018-10-10	38	6
938	2018-10-10	16	11
939	2018-10-10	14	5
940	2018-10-10	33	9
941	2018-10-10	1	1
942	2018-10-10	2	4
943	2018-10-10	10	2
944	2018-10-10	5	8
945	2018-10-10	28	3
946	2018-10-10	7	7
947	2018-10-10	19	10
948	2018-10-10	38	6
949	2018-10-10	16	11
950	2018-10-10	14	5
951	2018-10-10	33	9
952	2018-10-10	2	1
953	2018-10-10	10	4
954	2018-10-10	4	2
955	2018-10-10	28	8
956	2018-10-10	7	3
957	2018-10-10	19	7
958	2018-10-10	38	10
959	2018-10-10	16	6
960	2018-10-10	39	11
961	2018-10-10	13	5
962	2018-10-10	33	9
963	2018-10-10	1	1
964	2018-10-10	12	4
965	2018-10-10	5	2
966	2018-10-10	26	8
967	2018-10-10	21	7
968	2018-10-10	38	10
969	2018-10-10	40	11
970	2018-10-10	13	5
971	2018-10-10	32	9
972	2018-10-10	1	1
973	2018-10-10	11	4
974	2018-10-10	5	2
975	2018-10-10	26	8
976	2018-10-10	7	3
977	2018-10-10	38	10
978	2018-10-10	16	6
979	2018-10-10	40	11
980	2018-10-10	14	5
981	2018-10-10	33	9
982	2018-10-10	2	1
983	2018-10-10	10	4
984	2018-10-10	5	2
985	2018-10-10	27	8
986	2018-10-10	28	3
987	2018-10-10	7	7
988	2018-10-10	19	10
989	2018-10-10	20	6
990	2018-10-10	38	11
991	2018-10-10	13	5
992	2018-10-10	36	9
993	2018-10-10	1	1
994	2018-10-10	10	4
995	2018-10-10	5	2
996	2018-10-10	26	8
997	2018-10-10	7	3
998	2018-10-10	38	10
999	2018-10-10	16	6
1000	2018-10-10	40	11
1001	2018-10-10	14	5
1002	2018-10-10	34	9
1003	2018-10-10	1	1
1004	2018-10-10	2	4
1005	2018-10-10	10	2
1006	2018-10-10	5	8
1007	2018-10-10	28	3
1008	2018-10-10	7	7
1009	2018-10-10	21	10
1010	2018-10-10	38	6
1011	2018-10-10	16	11
1012	2018-10-10	14	5
1013	2018-10-10	35	9
1014	2018-10-10	1	1
1015	2018-10-10	2	4
1016	2018-10-10	10	2
1017	2018-10-10	4	8
1018	2018-10-10	28	3
1019	2018-10-10	7	7
1020	2018-10-10	20	10
1021	2018-10-10	38	6
1022	2018-10-10	16	11
1023	2018-10-10	15	5
1024	2018-10-10	35	9
1025	2018-10-10	3	1
1026	2018-10-10	12	4
1027	2018-10-10	6	2
1028	2018-10-10	26	8
1029	2018-10-10	40	11
1030	2018-10-10	14	5
1031	2018-10-10	36	9
1032	2018-10-10	2	1
1033	2018-10-10	10	4
1034	2018-10-10	5	2
1035	2018-10-10	28	8
1036	2018-10-10	7	3
1037	2018-10-10	20	7
1038	2018-10-10	38	10
1039	2018-10-10	16	6
1040	2018-10-10	39	11
1041	2018-10-10	14	5
1042	2018-10-10	34	9
1043	2018-10-10	1	1
1044	2018-10-10	11	4
1045	2018-10-10	4	2
1046	2018-10-10	26	8
1047	2018-10-10	7	3
1048	2018-10-10	19	7
1049	2018-10-10	38	10
1050	2018-10-10	40	11
1051	2018-10-10	14	5
1052	2018-10-10	32	9
1053	2018-10-10	1	1
1054	2018-10-10	12	4
1055	2018-10-10	4	2
1056	2018-10-10	26	8
1057	2018-10-10	20	7
1058	2018-10-10	38	10
1059	2018-10-10	40	11
1060	2018-10-10	14	5
1061	2018-10-10	36	9
1062	2018-10-10	2	1
1063	2018-10-10	10	4
1064	2018-10-10	5	2
1065	2018-10-10	28	8
1066	2018-10-10	7	3
1067	2018-10-10	21	7
1068	2018-10-10	38	10
1069	2018-10-10	16	6
1070	2018-10-10	39	11
1071	2018-10-10	14	5
1072	2018-10-10	34	9
1073	2018-10-10	1	1
1074	2018-10-10	2	4
1075	2018-10-10	10	2
1076	2018-10-10	5	8
1077	2018-10-10	28	3
1078	2018-10-10	7	7
1079	2018-10-10	20	10
1080	2018-10-10	38	6
1081	2018-10-10	16	11
1082	2018-10-10	14	5
1083	2018-10-10	34	9
1084	2018-10-10	2	1
1085	2018-10-10	10	4
1086	2018-10-10	5	2
1087	2018-10-10	28	8
1088	2018-10-10	7	3
1089	2018-10-10	22	7
1090	2018-10-10	37	10
1091	2018-10-10	16	6
1092	2018-10-10	39	11
1093	2018-10-10	13	5
1094	2018-10-10	36	9
1095	2018-10-10	2	1
1096	2018-10-10	11	4
1097	2018-10-10	4	2
1098	2018-10-10	26	8
1099	2018-10-10	20	7
1100	2018-10-10	38	10
1101	2018-10-10	16	6
1102	2018-10-10	40	11
1103	2018-10-10	13	5
1104	2018-10-10	34	9
1105	2018-10-10	1	1
1106	2018-10-10	10	4
1107	2018-10-10	5	2
1108	2018-10-10	26	8
1109	2018-10-10	7	3
1110	2018-10-10	19	7
1111	2018-10-10	38	10
1112	2018-10-10	16	6
1113	2018-10-10	40	11
1114	2018-10-10	13	5
1115	2018-10-10	34	9
1116	2018-10-10	1	1
1117	2018-10-10	12	4
1118	2018-10-10	5	2
1119	2018-10-10	26	8
1120	2018-10-10	7	3
1121	2018-10-10	38	10
1122	2018-10-10	16	6
1123	2018-10-10	40	11
1124	2018-10-10	14	5
1125	2018-10-10	35	9
1126	2018-10-10	1	1
1127	2018-10-10	10	4
1128	2018-10-10	5	2
1129	2018-10-10	28	8
1130	2018-10-10	7	3
1131	2018-10-10	20	7
1132	2018-10-10	23	10
1133	2018-10-10	37	6
1134	2018-10-10	16	11
1135	2018-10-10	14	5
1136	2018-10-10	35	9
1137	2018-10-10	1	1
1138	2018-10-10	10	4
1139	2018-10-10	11	2
1140	2018-10-10	5	8
1141	2018-10-10	4	3
1142	2018-10-10	28	7
1143	2018-10-10	7	10
1144	2018-10-10	22	6
1145	2018-10-10	37	11
1146	2018-10-10	14	5
1147	2018-10-10	35	9
1148	2018-10-10	1	1
1149	2018-10-10	10	4
1150	2018-10-10	4	2
1151	2018-10-10	27	8
1152	2018-10-10	28	3
1153	2018-10-10	7	7
1154	2018-10-10	22	10
1155	2018-10-10	37	6
1156	2018-10-10	16	11
1157	2018-10-10	14	5
1158	2018-10-10	36	9
1159	2018-10-10	1	1
1160	2018-10-10	10	4
1161	2018-10-10	4	2
1162	2018-10-10	5	8
1163	2018-10-10	28	3
1164	2018-10-10	7	7
1165	2018-10-10	21	10
1166	2018-10-10	37	6
1167	2018-10-10	16	11
1168	2018-10-10	14	5
1169	2018-10-10	13	9
1170	2018-10-10	34	1
1171	2018-10-10	1	4
1172	2018-10-10	10	2
1173	2018-10-10	5	8
1174	2018-10-10	28	3
1175	2018-10-10	7	7
1176	2018-10-10	19	10
1177	2018-10-10	38	6
1178	2018-10-10	16	11
1179	2018-10-10	13	5
1180	2018-10-10	35	9
1181	2018-10-10	1	1
1182	2018-10-10	11	4
1183	2018-10-10	10	2
1184	2018-10-10	11	8
1185	2018-10-10	5	3
1186	2018-10-10	28	7
1187	2018-10-10	7	10
1188	2018-10-10	20	6
1189	2018-10-10	37	11
1190	2018-10-10	13	5
1191	2018-10-10	34	9
1192	2018-10-10	36	1
1193	2018-10-10	1	4
1194	2018-10-10	10	2
1195	2018-10-10	5	8
1196	2018-10-10	28	3
1197	2018-10-10	7	7
1198	2018-10-10	19	10
1199	2018-10-10	38	6
1200	2018-10-10	16	11
1201	2018-10-10	14	5
1202	2018-10-10	36	9
1203	2018-10-10	1	1
1204	2018-10-10	2	4
1205	2018-10-10	11	2
1206	2018-10-10	5	8
1207	2018-10-10	28	3
1208	2018-10-10	7	7
1209	2018-10-10	19	10
1210	2018-10-10	38	6
1211	2018-10-10	16	11
1212	2018-10-10	13	5
1213	2018-10-10	36	9
1214	2018-10-10	2	1
1215	2018-10-10	10	4
1216	2018-10-10	5	2
1217	2018-10-10	28	8
1218	2018-10-10	7	3
1219	2018-10-10	7	7
1220	2018-10-10	19	10
1221	2018-10-10	37	6
1222	2018-10-10	16	11
1223	2018-10-10	14	5
1224	2018-10-10	34	9
1225	2018-10-10	2	1
1226	2018-10-10	11	4
1227	2018-10-10	5	2
1228	2018-10-10	27	8
1229	2018-10-10	28	3
1230	2018-10-10	7	7
1231	2018-10-10	19	10
1232	2018-10-10	37	6
1233	2018-10-10	16	11
1234	2018-10-10	14	5
1235	2018-10-10	32	9
1236	2018-10-10	2	1
1237	2018-10-10	11	4
1238	2018-10-10	5	2
1239	2018-10-10	28	8
1240	2018-10-10	7	3
1241	2018-10-10	22	7
1242	2018-10-10	22	10
1243	2018-10-10	38	6
1244	2018-10-10	16	11
1245	2018-10-10	13	5
1246	2018-10-10	32	9
1247	2018-10-10	1	1
1248	2018-10-10	10	4
1249	2018-10-10	5	2
1250	2018-10-10	28	8
1251	2018-10-10	7	3
1252	2018-10-10	19	7
1253	2018-10-10	37	10
1254	2018-10-10	38	6
1255	2018-10-10	16	11
1256	2018-10-10	13	5
1257	2018-10-10	32	9
1258	2018-10-10	1	1
1259	2018-10-10	10	4
1260	2018-10-10	5	2
1261	2018-10-10	28	8
1262	2018-10-10	7	3
1263	2018-10-10	19	7
1264	2018-10-10	37	10
1265	2018-10-10	38	6
1266	2018-10-10	16	11
1267	2018-10-10	13	5
1268	2018-10-10	31	9
1269	2018-10-10	1	1
1270	2018-10-10	10	4
1271	2018-10-10	4	2
1272	2018-10-10	5	8
1273	2018-10-10	28	3
1274	2018-10-10	7	7
1275	2018-10-10	19	10
1276	2018-10-10	38	6
1277	2018-10-10	16	11
1278	2018-10-10	14	5
1279	2018-10-10	32	9
1280	2018-10-10	2	1
1281	2018-10-10	10	4
1282	2018-10-10	5	2
1283	2018-10-10	27	8
1284	2018-10-10	28	3
1285	2018-10-10	7	7
1286	2018-10-10	19	10
1287	2018-10-10	37	6
1288	2018-10-10	38	11
1289	2018-10-10	14	5
1290	2018-10-10	32	9
1291	2018-10-10	1	1
1292	2018-10-10	2	4
1293	2018-10-10	10	2
1294	2018-10-10	5	8
1295	2018-10-10	28	3
1296	2018-10-10	7	7
1297	2018-10-10	20	10
1298	2018-10-10	38	6
1299	2018-10-10	16	11
1300	2018-10-10	14	5
1301	2018-10-10	31	9
1302	2018-10-10	2	1
1303	2018-10-10	10	4
1304	2018-10-10	5	8
1305	2018-10-10	28	2
1306	2018-10-10	4	3
1307	2018-10-10	7	7
1308	2018-10-10	19	10
1309	2018-10-10	38	6
1310	2018-10-10	16	11
1311	2018-10-10	14	5
1312	2018-10-10	31	9
1313	2018-10-10	1	1
1314	2018-10-10	10	4
1315	2018-10-10	5	2
1316	2018-10-10	28	8
1317	2018-10-10	7	3
1318	2018-10-10	19	7
1319	2018-10-10	38	10
1320	2018-10-10	16	6
1321	2018-10-10	39	11
1322	2018-10-10	14	5
1323	2018-10-10	31	9
1324	2018-10-10	1	1
1325	2018-10-10	2	4
1326	2018-10-10	11	2
1327	2018-10-10	5	8
1328	2018-10-10	4	3
1329	2018-10-10	28	7
1330	2018-10-10	7	10
1331	2018-10-10	19	6
1332	2018-10-10	38	11
1333	2018-10-10	14	5
1334	2018-10-10	31	9
1335	2018-10-10	2	1
1336	2018-10-10	10	4
1337	2018-10-10	5	2
1338	2018-10-10	28	8
1339	2018-10-10	7	3
1340	2018-10-10	20	7
1341	2018-10-10	37	10
1342	2018-10-10	16	6
1343	2018-10-10	39	11
1344	2018-10-10	13	5
1345	2018-10-10	14	9
1346	2018-10-10	32	1
1347	2018-10-10	2	4
1348	2018-10-10	10	2
1349	2018-10-10	4	8
1350	2018-10-10	28	3
1351	2018-10-10	7	7
1352	2018-10-10	19	10
1353	2018-10-10	37	6
1354	2018-10-10	38	11
1355	2018-10-10	14	5
1356	2018-10-10	32	9
1357	2018-10-10	1	1
1358	2018-10-10	10	4
1359	2018-10-10	4	2
1360	2018-10-10	28	8
1361	2018-10-10	7	3
1362	2018-10-10	20	7
1363	2018-10-10	38	10
1364	2018-10-10	16	6
1365	2018-10-10	39	11
1366	2018-10-10	14	5
1367	2018-10-10	32	9
1368	2018-10-10	1	1
1369	2018-10-10	10	4
1370	2018-10-10	5	2
1371	2018-10-10	28	8
1372	2018-10-10	7	3
1373	2018-10-10	21	7
1374	2018-10-10	38	10
1375	2018-10-10	16	6
1376	2018-10-10	39	11
1377	2018-10-10	14	5
1378	2018-10-10	33	9
1379	2018-10-10	1	1
1380	2018-10-10	10	4
1381	2018-10-10	5	2
1382	2018-10-10	28	8
1383	2018-10-10	7	3
1384	2018-10-10	19	7
1385	2018-10-10	37	10
1386	2018-10-10	38	6
1387	2018-10-10	16	11
1388	2018-10-10	14	5
1389	2018-10-10	33	9
1390	2018-10-10	1	1
1391	2018-10-10	2	4
1392	2018-10-10	10	2
1393	2018-10-10	5	8
1394	2018-10-10	28	3
1395	2018-10-10	7	7
1396	2018-10-10	19	10
1397	2018-10-10	38	6
1398	2018-10-10	16	11
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add datatable	7	add_datatable
20	Can change datatable	7	change_datatable
21	Can delete datatable	7	delete_datatable
22	Can add area question data	8	add_areaquestiondata
23	Can change area question data	8	change_areaquestiondata
24	Can delete area question data	8	delete_areaquestiondata
25	Can add all data	9	add_alldata
26	Can change all data	9	change_alldata
27	Can delete all data	9	delete_alldata
28	Can add timelines	10	add_timelines
29	Can change timelines	10	change_timelines
30	Can delete timelines	10	delete_timelines
31	Can add choices	11	add_choices
32	Can change choices	11	change_choices
33	Can delete choices	11	delete_choices
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: datatable; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.datatable (choice_id, question_id, choice_text, question_text, total_count) FROM stdin;
1	3	 Yes            	 What mode of transport do you use daily?       	1
26	3	 Kibera         	 What mode of transport do you use daily?       	11
15	3	 Skip           	 What mode of transport do you use daily?       	1
13	3	 Yes            	 What mode of transport do you use daily?       	1
34	9	 31-35          	 What was the age group of the respondent?      	23
7	11	 Matatu         	 Surveyor name                                  	1
37	6	 Male           	 What form of transport do students use?        	9
36	9	 Above 45       	 What was the age group of the respondent?      	18
31	9	 14-18          	 What was the age group of the respondent?      	8
37	10	 Male           	 What was the gender of the respondent?         	16
18	6	 Private car    	 What form of transport do students use?        	2
38	7	 Female         	 If you walk  how long do you walk daily?       	1
10	1	 Yes            	 Does transport care for women?                 	1
38	6	 Female         	 What form of transport do students use?        	28
13	5	 Yes            	 Does transport care for students?              	60
15	5	 Skip           	 Does transport care for students?              	7
4	3	 Yes            	 What mode of transport do you use daily?       	6
3	7	 Skip           	 If you walk  how long do you walk daily?       	1
32	1	 19-24          	 Does transport care for women?                 	1
38	10	 Female         	 What was the gender of the respondent?         	53
1	5	 Yes            	 Does transport care for students?              	1
3	4	 Skip           	 Do you think transport cares for the disabled? 	1
13	6	 Yes            	 What form of transport do students use?        	1
26	10	 Kibera         	 What was the gender of the respondent?         	1
2	8	 No             	 Which area was the respondent from?            	1
35	9	 36-45          	 What was the age group of the respondent?      	15
4	8	 Yes            	 Which area was the respondent from?            	8
39	6	 Michelle       	 What form of transport do students use?        	1
32	2	 19-24          	 Have you faced any form of abuse?              	1
35	4	 36-45          	 Do you think transport cares for the disabled? 	1
10	2	 Yes            	 Have you faced any form of abuse?              	19
21	7	 2 Km           	 If you walk  how long do you walk daily?       	9
2	4	 No             	 Do you think transport cares for the disabled? 	13
20	10	 1 Km           	 What was the gender of the respondent?         	5
28	2	 Kawangware     	 Have you faced any form of abuse?              	2
19	6	 Less than 1 Km 	 What form of transport do students use?        	5
19	10	 Less than 1 Km 	 What was the gender of the respondent?         	22
20	6	 1 Km           	 What form of transport do students use?        	4
11	7	 No             	 If you walk  how long do you walk daily?       	1
40	9	 Salma          	 What was the age group of the respondent?      	1
13	4	 Yes            	 Do you think transport cares for the disabled? 	3
26	7	 Kibera         	 If you walk  how long do you walk daily?       	4
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	application	datatable
8	application	areaquestiondata
9	application	alldata
10	application	timelines
11	application	choices
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-10-29 15:49:49.520562-04
2	auth	0001_initial	2019-10-29 15:49:49.730577-04
3	admin	0001_initial	2019-10-29 15:49:49.794101-04
4	admin	0002_logentry_remove_auto_add	2019-10-29 15:49:49.813924-04
5	application	0001_initial	2019-10-29 15:49:49.841745-04
6	application	0002_auto_20191029_1948	2019-10-29 15:49:49.847875-04
7	application	0003_auto_20191029_1948	2019-10-29 15:49:49.856352-04
8	contenttypes	0002_remove_content_type_name	2019-10-29 15:49:49.89503-04
9	auth	0002_alter_permission_name_max_length	2019-10-29 15:49:49.904879-04
10	auth	0003_alter_user_email_max_length	2019-10-29 15:49:49.92564-04
11	auth	0004_alter_user_username_opts	2019-10-29 15:49:49.950539-04
12	auth	0005_alter_user_last_login_null	2019-10-29 15:49:49.979325-04
13	auth	0006_require_contenttypes_0002	2019-10-29 15:49:49.988302-04
14	auth	0007_alter_validators_add_error_messages	2019-10-29 15:49:50.008132-04
15	auth	0008_alter_user_username_max_length	2019-10-29 15:49:50.034425-04
16	sessions	0001_initial	2019-10-29 15:49:50.067957-04
17	application	0004_auto_20191029_2000	2019-10-29 16:00:58.06843-04
18	application	0005_areaquestiondata	2019-10-30 04:22:22.245421-04
19	application	0006_alldata	2019-10-30 08:41:16.063309-04
20	application	0007_remove_alldata_choice_id	2019-10-30 10:11:54.831671-04
21	application	0008_timelines	2019-11-01 05:00:31.911909-04
22	application	0009_timelines_timeline_id	2019-11-01 05:12:02.11612-04
23	application	0010_remove_timelines_timeline_id	2019-11-01 05:15:07.408022-04
24	application	0011_choices	2019-11-02 08:41:58.981908-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: dummy; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.dummy (question_text, choice_text) FROM stdin;
\.


--
-- Name: application_alldata_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.application_alldata
    ADD CONSTRAINT application_alldata_pkey PRIMARY KEY (id);


--
-- Name: application_areaquestiondata_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.application_areaquestiondata
    ADD CONSTRAINT application_areaquestiondata_pkey PRIMARY KEY (id);


--
-- Name: application_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.application_choices
    ADD CONSTRAINT application_choices_pkey PRIMARY KEY (id);


--
-- Name: application_datatable_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.application_datatable
    ADD CONSTRAINT application_datatable_pkey PRIMARY KEY (id);


--
-- Name: application_timelines_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.application_timelines
    ADD CONSTRAINT application_timelines_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: dmatat
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect dmatat

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect gtfs

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect ma3tycoon

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ma3tycoon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ma3tycoon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ma3tycoon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ma3tycoon;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ma3tycoon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ma3tycoon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ma3tycoon;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ma3tycoon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ma3tycoon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ma3tycoon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ma3tycoon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ma3tycoon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ma3tycoon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ma3tycoon;

--
-- Name: fares_fare; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.fares_fare (
    id integer NOT NULL,
    stop_to character varying(255),
    stop_from character varying(255),
    amount character varying(255),
    stop_from_id character varying(255),
    route_id character varying(255),
    stop_to_id character varying(255),
    weather character varying(255),
    traffic_jam character varying(255),
    demand character varying(255),
    air_quality character varying(255),
    peak character varying(255),
    travel_time character varying(255),
    crowd character varying(255),
    safety character varying(255),
    drive_safety character varying(255),
    music character varying(255),
    internet character varying(255),
    date_added timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.fares_fare OWNER TO ma3tycoon;

--
-- Name: fares_fare_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.fares_fare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fares_fare_id_seq OWNER TO ma3tycoon;

--
-- Name: fares_fare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.fares_fare_id_seq OWNED BY public.fares_fare.id;


--
-- Name: questions_choice; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    points integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.questions_choice OWNER TO ma3tycoon;

--
-- Name: questions_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_choice_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_choice_id_seq OWNED BY public.questions_choice.id;


--
-- Name: questions_leaderboard; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_leaderboard (
    id integer NOT NULL,
    transit_points integer NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    trivia_points integer NOT NULL
);


ALTER TABLE public.questions_leaderboard OWNER TO ma3tycoon;

--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_leaderboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_leaderboard_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_leaderboard_id_seq OWNED BY public.questions_leaderboard.id;


--
-- Name: questions_question; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    attachment character varying(100),
    pub_date timestamp with time zone NOT NULL,
    persona integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.questions_question OWNER TO ma3tycoon;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions_question.id;


--
-- Name: questions_transitfeedback; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_transitfeedback (
    id integer NOT NULL,
    stop character varying(255) NOT NULL,
    point public.geometry(Point,4326) NOT NULL,
    position_correct character varying(1) NOT NULL,
    user_id integer NOT NULL,
    date_added timestamp with time zone NOT NULL
);


ALTER TABLE public.questions_transitfeedback OWNER TO ma3tycoon;

--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_transitfeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_transitfeedback_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_transitfeedback_id_seq OWNED BY public.questions_transitfeedback.id;


--
-- Name: questions_triviafeedback; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_triviafeedback (
    id integer NOT NULL,
    date_added timestamp with time zone NOT NULL,
    choice_id integer,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    latitude character varying(200),
    longitude character varying(200),
    other character varying(200),
    choice_text character varying(200)
);


ALTER TABLE public.questions_triviafeedback OWNER TO ma3tycoon;

--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_triviafeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_triviafeedback_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_triviafeedback_id_seq OWNED BY public.questions_triviafeedback.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare ALTER COLUMN id SET DEFAULT nextval('public.fares_fare_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice ALTER COLUMN id SET DEFAULT nextval('public.questions_choice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard ALTER COLUMN id SET DEFAULT nextval('public.questions_leaderboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_question ALTER COLUMN id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback ALTER COLUMN id SET DEFAULT nextval('public.questions_transitfeedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback ALTER COLUMN id SET DEFAULT nextval('public.questions_triviafeedback_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add choice	8	add_choice
23	Can change choice	8	change_choice
24	Can delete choice	8	delete_choice
25	Can add question	9	add_question
26	Can change question	9	change_question
27	Can delete question	9	delete_question
28	Can add Transit feedback	10	add_transitfeedback
29	Can change Transit feedback	10	change_transitfeedback
30	Can delete Transit feedback	10	delete_transitfeedback
31	Can add Leaderboard	11	add_leaderboard
32	Can change Leaderboard	11	change_leaderboard
33	Can delete Leaderboard	11	delete_leaderboard
34	Can add Trivia feedback	12	add_triviafeedback
35	Can change Trivia feedback	12	change_triviafeedback
36	Can delete Trivia feedback	12	delete_triviafeedback
37	Can add fare	13	add_fare
38	Can change fare	13	change_fare
39	Can delete fare	13	delete_fare
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$JPQ7e7gG5ays$UWx9d8V8q1uRy3czQ84mwZwN2TdEfBDOB3flI5+Ij0w=	\N	f	test				f	t	2020-03-10 11:26:29.31673-04
8	pbkdf2_sha256$100000$5kmlhFIocJFF$WBy/kbJDgKmMHQhcYwpONBLfKI64G81+JNtq/wHsJwM=	\N	f	gladwell				f	t	2020-03-14 18:55:58.997636-04
9	pbkdf2_sha256$100000$EsKGz0CdGj8f$j0+dA3kpm9f8NI0OqK/b88vMu2UzsCwpysmdOUXtW+g=	\N	f	daisy				f	t	2020-03-14 19:26:08.600999-04
10	pbkdf2_sha256$100000$nrdAQrktlHH6$sb6Ys7RodFxRHgXauDyTZ8RMT/mYdjJuxzk7HJehHd8=	\N	f	frankline				f	t	2020-03-14 19:26:58.051105-04
11	pbkdf2_sha256$100000$z8CyBCcfNwrI$RbNCsi+s47pZlZwSfE+Vtx5x+/kKCLn7jyytF5vV798=	\N	f	mary				f	t	2020-03-14 19:27:50.242917-04
12	pbkdf2_sha256$100000$aQP1scEDN4lF$nR6lf0NHLB7NxRd/GZJdkg9rwf/AEs8tcIGqhldbips=	\N	f	collins				f	t	2020-03-14 19:29:32.559124-04
13	pbkdf2_sha256$100000$wlSnNVjRRGgC$CUFfUheHSEqBqY1v+wvU2QUpLMLPtBiD9jU9BMBWtrM=	\N	f	sonia				f	t	2020-03-14 19:31:08.924699-04
14	pbkdf2_sha256$100000$7UQYUO30QVN2$VNYcjFs5vuHKX3ui0AvbsHSQ7eGSfhuhcOOmfsTYAUo=	\N	f	salma				f	t	2020-03-23 14:40:16.000443-04
15	pbkdf2_sha256$100000$3SwE2evcfRi2$Wh+wj1ZFf7AhqRFJXZv9yAkQ/3EAAtZbBCyHJudD8xY=	\N	f	nyamusimercy			nyamusimercy61@gmail.com	f	t	2020-03-24 11:10:33.887959-04
16	pbkdf2_sha256$100000$m5gXsiBO8GXg$sh40rmL59H3P+1s0kuDlz9TheUpRHC/XOFTlj5bb5VY=	\N	f	mercy				f	t	2020-03-24 14:01:14.043971-04
17	pbkdf2_sha256$100000$ZlkgFYDO9hlh$QygJYc+cS3mEyVmwgOQlC2efSrQX38KDqiJ9I6EqmYw=	\N	f	steve			rstephenosoro@gmail.com	f	t	2021-02-21 11:05:19.383511-05
18	pbkdf2_sha256$100000$HHKobDIeYeN7$H1NpwLNyrTQFqKttslQeoQahQ8IQGsqUuzwEA3ZkpKs=	\N	f	sreve			digitalmatatus27@gmail.com	f	t	2021-02-22 10:31:31.14824-05
19	pbkdf2_sha256$100000$APizqYKdu0hA$hnCHJA9hAjlDT0eG4x8RQ/S4OaYC6nw9goOFBpV8B+o=	\N	f	Sonia			soniawaiganjo@gmail.com	f	t	2021-02-22 10:58:27.477972-05
20	pbkdf2_sha256$100000$APLSI4ze5hSI$VFp23IbTVaVZmM0f/Nd9z6XRZ8+ABfpZx9utJJrQtwo=	\N	f	raremo			rstephenooro@gmail.com	f	t	2021-02-23 05:44:34.48141-05
21	pbkdf2_sha256$100000$JgcVom6yiB6l$EdDQTQH7JPL7r6qV48f1uwVSqAGnedK+BjbphPUQ1+o=	\N	f	sorryia			rstehenosoro@gmail.com	f	t	2021-02-23 05:50:41.80939-05
22	pbkdf2_sha256$100000$7mtBRGUecvVU$DLWEx+GTW774z1wMSVnyjHFGPzn3LV4alLzUlIJE+IE=	\N	f	tester			tester@gmail.com	f	t	2021-02-23 17:21:08.128557-05
23	pbkdf2_sha256$100000$DtgNItiVF2sh$pP1Q6WLfIxR0DenpoqIINGl7usgC72RfTNWPY1P4CMo=	\N	f	easter			eastergeorge830@gmail.com	f	t	2021-03-01 23:23:27.109187-05
24	pbkdf2_sha256$100000$acBIE6fV1wTM$k06obAeZl2B8jTZHUfsoza6BCQdl2P6K4thFc1Jil0c=	\N	f	jeremy			jere9184@gmail.com	f	t	2021-03-02 06:43:35.881761-05
25	pbkdf2_sha256$100000$fjPCBLZ9JvpY$phLpkIFirq3rIN+o5XcsSfuz8Qy/OXwtOg9EyyafhB8=	\N	f	Gladwell			gladwell@gmail.com	f	t	2021-03-02 11:50:11.668368-05
26	pbkdf2_sha256$100000$MsR5ZW45ytKm$rBAHa/vylSQASUUaM+UYWJTC6Ybg3oNRtDe23BhUnkA=	\N	f	Gladys			gladysjebet98@gmail.com	f	t	2021-03-03 05:23:57.288467-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 26, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	questions	choice
9	questions	question
10	questions	transitfeedback
11	questions	leaderboard
12	questions	triviafeedback
13	fares	fare
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-08 23:55:33.358479-04
2	auth	0001_initial	2020-03-08 23:55:33.893698-04
3	admin	0001_initial	2020-03-08 23:55:34.007508-04
4	admin	0002_logentry_remove_auto_add	2020-03-08 23:55:34.024025-04
5	admin	0003_logentry_add_action_flag_choices	2020-03-08 23:55:34.041552-04
6	contenttypes	0002_remove_content_type_name	2020-03-08 23:55:34.085244-04
7	auth	0002_alter_permission_name_max_length	2020-03-08 23:55:34.103001-04
8	auth	0003_alter_user_email_max_length	2020-03-08 23:55:34.120957-04
9	auth	0004_alter_user_username_opts	2020-03-08 23:55:34.136729-04
10	auth	0005_alter_user_last_login_null	2020-03-08 23:55:34.17489-04
11	auth	0006_require_contenttypes_0002	2020-03-08 23:55:34.180842-04
12	auth	0007_alter_validators_add_error_messages	2020-03-08 23:55:34.197066-04
13	auth	0008_alter_user_username_max_length	2020-03-08 23:55:34.240941-04
14	auth	0009_alter_user_last_name_max_length	2020-03-08 23:55:34.258788-04
15	auth	0010_alter_group_name_max_length	2020-03-08 23:55:34.283013-04
16	auth	0011_update_proxy_permissions	2020-03-08 23:55:34.30116-04
17	authtoken	0001_initial	2020-03-08 23:55:34.39099-04
18	authtoken	0002_auto_20160226_1747	2020-03-08 23:55:34.444871-04
19	fares	0001_initial	2020-03-08 23:55:34.559093-04
20	questions	0001_initial	2020-03-08 23:55:34.655329-04
21	questions	0002_auto_20180709_1407	2020-03-08 23:55:34.668905-04
22	questions	0003_auto_20180709_1408	2020-03-08 23:55:34.680878-04
23	questions	0004_triviafeedback	2020-03-08 23:55:34.788031-04
24	questions	0005_transitfeedback	2020-03-08 23:55:34.890312-04
25	questions	0006_auto_20180712_0951	2020-03-08 23:55:34.927353-04
26	questions	0007_auto_20180809_0546	2020-03-08 23:55:35.100971-04
27	questions	0008_auto_20180809_0606	2020-03-08 23:55:35.214512-04
28	sessions	0001_initial	2020-03-08 23:55:35.312947-04
29	admin	0004_auto_20200309_0512	2020-03-09 01:12:54.136793-04
30	auth	0012_auto_20200309_0512	2020-03-09 01:12:54.262208-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bdnwm14epe6gd3mee7dv0fv9m3ljo9b0	NDRhZGFkZmEwNmEyMDhmZGFhNzgwZTM0ZTc2NjQ5Zjg1OGIyODhjYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWM3MDFlMTA2NWU4OGZjZWZhMTU1YzM4NzNhOTI5M2JjZTVkN2ZiMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-07-26 12:35:24.890774-04
\.


--
-- Data for Name: fares_fare; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.fares_fare (id, stop_to, stop_from, amount, stop_from_id, route_id, stop_to_id, weather, traffic_jam, demand, air_quality, peak, travel_time, crowd, safety, drive_safety, music, internet, date_added, user_id) FROM stdin;
\.


--
-- Name: fares_fare_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.fares_fare_id_seq', 4, true);


--
-- Data for Name: questions_choice; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_choice (id, choice_text, points, question_id) FROM stdin;
10	Private Car	1	3
11	Matatu	1	3
12	Boda boda	1	3
13	Train	1	3
14	Other	1	3
15	Cheap	1	4
16	Convenient	1	4
17	Other	1	4
18	Yes	1	5
19	No	1	5
20	Physical touch	1	6
21	Verbal	1	6
22	Sexual advances	1	6
23	Please specify below	1	7
24	Yes	1	8
25	No	1	8
26	Yes	1	9
27	No	1	9
28	Please specify below	1	10
29	Please specify below	1	11
30	Yes	1	12
31	No	1	12
32	Please specify below	1	13
33	Yes	1	14
34	No	1	14
35	Yes	1	15
36	No	1	15
37	Please specify below	1	16
38	Please specify below	1	17
39	Please specify below	1	18
40	Please specify below	1	19
41	Visually impaired	1	20
42	Deaf or Hard of hearing	1	20
43	Physically handicapped	1	20
44	Other	1	20
45	Please specify below	1	21
46	Yes	1	22
47	No	1	22
48	Please specify below	1	23
49	Yes	1	24
50	No	1	24
51	Everyday	1	25
52	A few time a week	1	25
53	A few times a month	1	25
54	A few times a year	1	25
55	Please specify below	1	26
56	Driver	1	27
57	Conductor	1	27
58	Kamagera or Stage attendants	1	27
60	Other	1	27
61	Yes	1	28
62	No	1	28
63	Please specify below	1	29
64	Please specify below	1	30
65	Please specify below	1	31
3	Below 18	1	1
4	18-25	1	1
5	26-30	1	1
6	31-35	1	1
7	36-40	1	1
8	45-50	1	1
9	Above 50	1	1
2	Female	1	2
1	Male	1	2
\.


--
-- Name: questions_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_choice_id_seq', 1, false);


--
-- Data for Name: questions_leaderboard; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_leaderboard (id, transit_points, date_modified, user_id, trivia_points) FROM stdin;
\.


--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_leaderboard_id_seq', 1, true);


--
-- Data for Name: questions_question; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_question (id, question_text, attachment, pub_date, persona) FROM stdin;
1	Age	\N	2018-10-04 06:56:48.003644-04	21
2	Gender	\N	2018-10-04 06:56:48.003644-04	21
3	What form/mode of transport do you normally use?	\N	2018-10-04 06:56:48.003644-04	21
4	Why do you prefer the above means of transport?	\N	2018-10-04 06:56:48.003644-04	21
5	Have you ever experienced any form of sexual harassment during commute?	\N	2018-10-04 06:56:48.003644-04	22
6	What type of harassment was it?	\N	2018-10-04 06:56:48.003644-04	22
7	Please give an account of your experience	\N	2018-10-04 06:56:48.003644-04	22
8	Was the perpetrator someone you knew/close to you?	\N	2018-10-04 06:56:48.003644-04	22
9	Did you report them or reach out for help? 	\N	2018-10-04 06:56:48.003644-04	22
11	Did you face any challenges when reporting/reaching out?	\N	2018-10-04 06:56:48.003644-04	22
12	Have you ever witnessed any form of sexual harassment during commute?	\N	2018-10-04 06:56:48.003644-04	22
13	Please give an account of the experience (if yes)	\N	2018-10-04 06:56:48.003644-04	22
14	Was the victim someone you knew/close to you?	\N	2018-10-04 06:56:48.003644-04	22
15	Would you feel safe reporting sexual harassment to relevant authorities or taking action?	\N	2018-10-04 06:56:48.003644-04	22
16	If no, why?	\N	2018-10-04 06:56:48.003644-04	22
17	Approximately how many times would you say you have witnessed sexual harassment?	\N	2018-10-04 06:56:48.003644-04	22
18	Approximately how many times would you say you have experienced sexual harassment during commute?	\N	2018-10-04 06:56:48.003644-04	22
10	Why not? (if didnt reach out for help)	\N	2018-10-04 06:56:48.003644-04	22
19	Do you have any suggestions for how sexual harassment can be reduced during commute?	\N	2018-10-04 06:56:48.003644-04	22
20	Type of disability. 	\N	2018-10-04 06:56:48.003644-04	23
21	What is your frequently traveled route?	\N	2018-10-04 06:56:48.003644-04	23
22	Have you ever had a positive public transport experience?	\N	2018-10-04 06:56:48.003644-04	23
23	If you answered yes, give an instance.	\N	2018-10-04 06:56:48.003644-04	23
24	Have you ever been discriminated against when using any means of transport?	\N	2018-10-04 06:56:48.003644-04	23
25	How often have you experienced discrimination?	\N	2018-10-04 06:56:48.003644-04	23
26	Was the dicrimination verbal, non verbal or physical? Elaborate.	\N	2018-10-04 06:56:48.003644-04	23
27	Who discriminated against you?	\N	2018-10-04 06:56:48.003644-04	23
28	Did you report it? 	\N	2018-10-04 06:56:48.003644-04	23
29	If the answer is no give your reasons why?	\N	2018-10-04 06:56:48.003644-04	23
30	Has covid 19 impacted your travel experience negatively or positively? Elaborate.	\N	2018-10-04 06:56:48.003644-04	23
31	What changes would you suggest to make your transport experience easier?	\N	2018-10-04 06:56:48.003644-04	23
\.


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 1, false);


--
-- Data for Name: questions_transitfeedback; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_transitfeedback (id, stop, point, position_correct, user_id, date_added) FROM stdin;
\.


--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_transitfeedback_id_seq', 1, true);


--
-- Data for Name: questions_triviafeedback; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_triviafeedback (id, date_added, choice_id, question_id, user_id, latitude, longitude, other, choice_text) FROM stdin;
3185	2021-03-01 23:30:11.480901-05	45	21	18	-1.2977806	36.8950104	roure	Please specify below
3186	2021-03-01 23:30:11.492427-05	48	23	18	-1.2977806	36.8950104	wue	Please specify below
3187	2021-03-01 23:30:11.498091-05	55	26	18	-1.2977806	36.8950104	verbalek	Please specify below
3188	2021-03-01 23:30:11.503904-05	63	29	18	-1.2977806	36.8950104	jj	Please specify below
3189	2021-03-01 23:30:11.509872-05	64	30	18	-1.2977806	36.8950104	ekk	Please specify below
3190	2021-03-01 23:30:11.515871-05	65	31	18	-1.2977806	36.8950104	dk	Please specify below
3191	2021-03-01 23:30:11.521878-05	6	1	18	-1.2977806	36.8950104	NA	31-35
3192	2021-03-01 23:30:11.527852-05	2	2	18	-1.2977806	36.8950104	NA	Female
3193	2021-03-01 23:30:11.533825-05	13	3	18	-1.2977806	36.8950104	NA	Train
3194	2021-03-01 23:30:11.539821-05	15	4	18	-1.2977806	36.8950104	NA	Cheap
3195	2021-03-01 23:30:11.545801-05	43	20	18	-1.2977806	36.8950104	NA	Physically handicapped
3196	2021-03-01 23:30:11.551805-05	46	22	18	-1.2977806	36.8950104	NA	Yes
3197	2021-03-01 23:30:11.557783-05	50	24	18	-1.2977806	36.8950104	NA	No
3198	2021-03-01 23:30:11.563871-05	52	25	18	-1.2977806	36.8950104	NA	A few time a week
3199	2021-03-01 23:30:11.56984-05	60	27	18	-1.2977806	36.8950104	NA	Other
3200	2021-03-01 23:30:11.575829-05	61	28	18	-1.2977806	36.8950104	NA	Yes
3201	2021-03-01 23:36:39.609829-05	45	21	18	NA	NA	Rongai 	Please specify below
3202	2021-03-01 23:36:39.625089-05	48	23	18	NA	NA	jsishehrhrjrjrjrhrjr	Please specify below
3203	2021-03-01 23:36:39.630966-05	55	26	18	NA	NA	jdjdjdvfbrjdjdkdh	Please specify below
3204	2021-03-01 23:36:39.636953-05	63	29	18	NA	NA	jsjdjjdbdhfjfjfkfjfn	Please specify below
3205	2021-03-01 23:36:39.666991-05	64	30	18	NA	NA	jdkdododjdhdbdbrbrnr	Please specify below
3206	2021-03-01 23:36:39.678941-05	65	31	18	NA	NA	jsjdodododkrbrbrjkr	Please specify below
3207	2021-03-01 23:36:39.690917-05	4	1	18	NA	NA	NA	18-25
3208	2021-03-01 23:36:39.702899-05	2	2	18	NA	NA	NA	Female
3209	2021-03-01 23:36:39.720881-05	11	3	18	NA	NA	NA	Matatu
3210	2021-03-01 23:36:39.726843-05	16	4	18	NA	NA	NA	Convenient
3211	2021-03-01 23:36:39.732844-05	43	20	18	NA	NA	NA	Physically handicapped
3212	2021-03-01 23:36:39.738816-05	46	22	18	NA	NA	NA	Yes
3213	2021-03-01 23:36:39.744834-05	49	24	18	NA	NA	j	Yes
3214	2021-03-01 23:36:39.750794-05	52	25	18	NA	NA	NA	A few time a week
3215	2021-03-01 23:36:39.756795-05	56	27	18	NA	NA	NA	Driver
3216	2021-03-01 23:36:39.762767-05	61	28	18	NA	NA	NA	Yes
3217	2021-03-03 02:10:11.734236-05	23	7	23	-1.2954705	36.7872881	A fellow passenger brushed their hand on my body	Please specify below
3218	2021-03-03 02:10:11.795454-05	28	10	23	-1.2954705	36.7872881	Too embarrassed 	Please specify below
3219	2021-03-03 02:10:11.801295-05	29	11	23	-1.2954705	36.7872881	Did not report 	Please specify below
3220	2021-03-03 02:10:11.807292-05	32	13	23	-1.2954705	36.7872881	Catcalling 	Please specify below
3221	2021-03-03 02:10:11.813267-05	37	16	23	-1.2954705	36.7872881	I don't feel they would care to investigate 	Please specify below
3222	2021-03-03 02:10:11.819265-05	38	17	23	-1.2954705	36.7872881	At least every week 	Please specify below
3223	2021-03-03 02:10:11.82524-05	39	18	23	-1.2954705	36.7872881	Rarely 	Please specify below
3224	2021-03-03 02:10:11.831247-05	40	19	23	-1.2954705	36.7872881	Not really 	Please specify below
3225	2021-03-03 02:10:11.837225-05	4	1	23	-1.2954705	36.7872881	NA	18-25
3226	2021-03-03 02:10:11.843218-05	2	2	23	-1.2954705	36.7872881	NA	Female
3227	2021-03-03 02:10:11.849282-05	11	3	23	-1.2954705	36.7872881	NA	Matatu
3228	2021-03-03 02:10:11.855286-05	16	4	23	-1.2954705	36.7872881	NA	Convenient
3229	2021-03-03 02:10:11.861256-05	18	5	23	-1.2954705	36.7872881	NA	Yes
3230	2021-03-03 02:10:11.867259-05	20	6	23	-1.2954705	36.7872881	NA	Physical touch
3231	2021-03-03 02:10:11.873273-05	25	8	23	-1.2954705	36.7872881	NA	No
3232	2021-03-03 02:10:11.879239-05	27	9	23	-1.2954705	36.7872881	NA	No
3233	2021-03-03 02:10:11.885218-05	30	12	23	-1.2954705	36.7872881	NA	Yes
3234	2021-03-03 02:10:11.891209-05	34	14	23	-1.2954705	36.7872881	NA	No
3235	2021-03-03 02:10:11.897187-05	36	15	23	-1.2954705	36.7872881	NA	No
3236	2021-03-03 02:34:16.319645-05	23	7	23	-1.3116817	36.7779679	Catcalling that leads to being followed 	Please specify below
3237	2021-03-03 02:34:16.336152-05	28	10	23	-1.3116817	36.7779679	Not worth the time	Please specify below
3238	2021-03-03 02:34:16.342061-05	29	11	23	-1.3116817	36.7779679	Did not report 	Please specify below
3239	2021-03-03 02:34:16.348049-05	32	13	23	-1.3116817	36.7779679	Other being catcalled 	Please specify below
3240	2021-03-03 02:34:16.354037-05	37	16	23	-1.3116817	36.7779679	Answer was yes	Please specify below
3241	2021-03-03 02:34:16.360014-05	38	17	23	-1.3116817	36.7779679	Once a month 	Please specify below
3242	2021-03-03 02:34:16.366011-05	39	18	23	-1.3116817	36.7779679	Not often	Please specify below
3243	2021-03-03 02:34:16.371993-05	40	19	23	-1.3116817	36.7779679	Tell off the perpetrators 	Please specify below
3244	2021-03-03 02:34:16.377984-05	5	1	23	-1.3116817	36.7779679	NA	26-30
3245	2021-03-03 02:34:16.384063-05	2	2	23	-1.3116817	36.7779679	NA	Female
3246	2021-03-03 02:34:16.39002-05	11	3	23	-1.3116817	36.7779679	NA	Matatu
3247	2021-03-03 02:34:16.396026-05	15	4	23	-1.3116817	36.7779679	NA	Cheap
3248	2021-03-03 02:34:16.402015-05	18	5	23	-1.3116817	36.7779679	NA	Yes
3249	2021-03-03 02:34:16.40799-05	21	6	23	-1.3116817	36.7779679	NA	Verbal
3250	2021-03-03 02:34:16.413995-05	25	8	23	-1.3116817	36.7779679	NA	No
3251	2021-03-03 02:34:16.419965-05	27	9	23	-1.3116817	36.7779679	NA	No
3252	2021-03-03 02:34:16.425969-05	30	12	23	-1.3116817	36.7779679	NA	Yes
3253	2021-03-03 02:34:16.431941-05	34	14	23	-1.3116817	36.7779679	NA	No
3254	2021-03-03 02:34:16.437964-05	35	15	23	-1.3116817	36.7779679	NA	Yes
3255	2021-03-03 02:46:53.485167-05	23	7	23	-1.3033961	36.7877762	No harassment 	Please specify below
3256	2021-03-03 02:46:53.49522-05	28	10	23	-1.3033961	36.7877762	No harassment 	Please specify below
3257	2021-03-03 02:46:53.501192-05	29	11	23	-1.3033961	36.7877762	None	Please specify below
3258	2021-03-03 02:46:53.507192-05	32	13	23	-1.3033961	36.7877762	No account 	Please specify below
3259	2021-03-03 02:46:53.513157-05	37	16	23	-1.3033961	36.7877762	Afraid of the police 	Please specify below
3260	2021-03-03 02:46:53.519154-05	38	17	23	-1.3033961	36.7877762	None	Please specify below
3261	2021-03-03 02:46:53.525138-05	39	18	23	-1.3033961	36.7877762	None 	Please specify below
3262	2021-03-03 02:46:53.531128-05	40	19	23	-1.3033961	36.7877762	None	Please specify below
3263	2021-03-03 02:46:53.537102-05	34	14	23	-1.3033961	36.7877762	NA	No
3264	2021-03-03 02:46:53.543111-05	31	12	23	-1.3033961	36.7877762	NA	No
3265	2021-03-03 02:46:53.549085-05	27	9	23	-1.3033961	36.7877762	NA	No
3266	2021-03-03 02:46:53.55509-05	25	8	23	-1.3033961	36.7877762	NA	No
3267	2021-03-03 02:46:53.561066-05	19	5	23	-1.3033961	36.7877762	NA	No
3268	2021-03-03 02:46:53.567055-05	16	4	23	-1.3033961	36.7877762	NA	Convenient
3269	2021-03-03 02:46:53.573035-05	11	3	23	-1.3033961	36.7877762	NA	Matatu
3270	2021-03-03 02:46:53.579119-05	2	2	23	-1.3033961	36.7877762	NA	Female
3271	2021-03-03 02:46:53.585094-05	4	1	23	-1.3033961	36.7877762	H7	18-25
3272	2021-03-03 02:46:53.591097-05	36	15	23	-1.3033961	36.7877762	NA	No
3273	2021-03-03 02:46:53.59708-05	21	6	23	-1.3033961	36.7877762	NA	Verbal
3274	2021-03-03 03:40:49.010716-05	23	7	23	-1.303903	36.7879846	NA	Please specify below
3275	2021-03-03 03:40:49.027276-05	28	10	23	-1.303903	36.7879846	NA	Please specify below
3276	2021-03-03 03:40:49.033157-05	29	11	23	-1.303903	36.7879846	NA	Please specify below
3277	2021-03-03 03:40:49.039137-05	32	13	23	-1.303903	36.7879846	NA	Please specify below
3278	2021-03-03 03:40:49.045121-05	37	16	23	-1.303903	36.7879846	NA	Please specify below
3279	2021-03-03 03:40:49.05121-05	38	17	23	-1.303903	36.7879846	NA	Please specify below
3280	2021-03-03 03:40:49.057178-05	39	18	23	-1.303903	36.7879846	NA	Please specify below
3281	2021-03-03 03:40:49.063165-05	40	19	23	-1.303903	36.7879846	NA	Please specify below
3282	2021-03-03 03:40:49.069154-05	7	1	23	-1.303903	36.7879846	NA	36-40
3283	2021-03-03 03:40:49.075151-05	2	2	23	-1.303903	36.7879846	H	Female
3284	2021-03-03 03:40:49.081127-05	11	3	23	-1.303903	36.7879846	NA	Matatu
3285	2021-03-03 03:40:49.087131-05	16	4	23	-1.303903	36.7879846	NA	Convenient
3286	2021-03-03 03:40:49.09311-05	19	5	23	-1.303903	36.7879846	N	No
3287	2021-03-03 03:40:49.099104-05	25	8	23	-1.303903	36.7879846	NA	No
3288	2021-03-03 03:40:49.105089-05	31	12	23	-1.303903	36.7879846	NA	No
3289	2021-03-03 03:40:49.111066-05	35	15	23	-1.303903	36.7879846	NA	Yes
3290	2021-03-03 03:40:49.117061-05	34	14	23	-1.303903	36.7879846	NA	No
3291	2021-03-03 03:40:49.123055-05	21	6	23	-1.303903	36.7879846	N	Verbal
3292	2021-03-03 03:40:49.129042-05	27	9	23	-1.303903	36.7879846	NA	No
3293	2021-03-03 04:06:44.019286-05	23	7	23	-1.2980557	36.7989472	Hand held back by a conductor	Please specify below
3294	2021-03-03 04:06:44.030626-05	28	10	23	-1.2980557	36.7989472	They stopped when I expressed my anger	Please specify below
3295	2021-03-03 04:06:44.036519-05	29	11	23	-1.2980557	36.7989472	NA	Please specify below
3296	2021-03-03 04:06:44.042512-05	32	13	23	-1.2980557	36.7989472	NA	Please specify below
3297	2021-03-03 04:06:44.048492-05	37	16	23	-1.2980557	36.7989472	NA	Please specify below
3298	2021-03-03 04:06:44.054482-05	38	17	23	-1.2980557	36.7989472	NA	Please specify below
3299	2021-03-03 04:06:44.06046-05	39	18	23	-1.2980557	36.7989472	Every 2 weeks 	Please specify below
3300	2021-03-03 04:06:44.066451-05	40	19	23	-1.2980557	36.7989472	NA	Please specify below
3301	2021-03-03 04:06:44.072437-05	5	1	23	-1.2980557	36.7989472	NA	26-30
3302	2021-03-03 04:06:44.07843-05	2	2	23	-1.2980557	36.7989472	NA	Female
3303	2021-03-03 04:06:44.084409-05	11	3	23	-1.2980557	36.7989472	NA	Matatu
3304	2021-03-03 04:06:44.090409-05	15	4	23	-1.2980557	36.7989472	NA	Cheap
3305	2021-03-03 04:06:44.096391-05	18	5	23	-1.2980557	36.7989472	NA	Yes
3306	2021-03-03 04:06:44.102381-05	20	6	23	-1.2980557	36.7989472	NA	Physical touch
3307	2021-03-03 04:06:44.108739-05	25	8	23	-1.2980557	36.7989472	NA	No
3308	2021-03-03 04:06:44.11444-05	27	9	23	-1.2980557	36.7989472	NA	No
3309	2021-03-03 04:06:44.120412-05	31	12	23	-1.2980557	36.7989472	NA	No
3310	2021-03-03 04:06:44.126409-05	34	14	23	-1.2980557	36.7989472	NA	No
3311	2021-03-03 04:06:44.132388-05	35	15	23	-1.2980557	36.7989472	NA	Yes
3312	2021-03-03 06:01:36.527412-05	45	21	18	-1.2787332	36.8171026	827_ waiyaki way	Please specify below
3313	2021-03-03 06:01:36.542658-05	48	23	18	-1.2787332	36.8171026	they carry the wheelchair for him	Please specify below
3314	2021-03-03 06:01:36.548536-05	55	26	18	-1.2787332	36.8171026	verbal	Please specify below
3315	2021-03-03 06:01:36.554525-05	63	29	18	-1.2787332	36.8171026	because who would you report it to	Please specify below
3316	2021-03-03 06:01:36.560509-05	64	30	18	-1.2787332	36.8171026	nothing has changed	Please specify below
3317	2021-03-03 06:01:36.566589-05	65	31	18	-1.2787332	36.8171026	they people concerned should be kind to people living with disabilities.	Please specify below
3318	2021-03-03 06:01:36.572584-05	8	1	18	-1.2787332	36.8171026	49	45-50
3319	2021-03-03 06:01:36.57856-05	1	2	18	-1.2787332	36.8171026	NA	Male
3320	2021-03-03 06:01:36.584534-05	11	3	18	-1.2787332	36.8171026	bus	Matatu
3321	2021-03-03 06:01:36.59053-05	15	4	18	-1.2787332	36.8171026	cheapest	Cheap
3322	2021-03-03 06:01:36.596511-05	43	20	18	-1.2787332	36.8171026	uses a wheelchair	Physically handicapped
3323	2021-03-03 06:01:36.602509-05	46	22	18	-1.2787332	36.8171026	yes	Yes
3324	2021-03-03 06:01:36.608485-05	50	24	18	-1.2787332	36.8171026	not yet	No
3325	2021-03-03 06:01:36.614486-05	54	25	18	-1.2787332	36.8171026	not so often	A few times a year
3326	2021-03-03 06:01:36.620466-05	57	27	18	-1.2787332	36.8171026	conductor	Conductor
3327	2021-03-03 06:01:36.626459-05	62	28	18	-1.2787332	36.8171026	no	No
3328	2021-03-03 06:09:12.620993-05	45	21	18	-1.278796	36.8171723	juja road	Please specify below
3329	2021-03-03 06:09:12.632339-05	48	23	18	-1.278796	36.8171723	the matatu people give me first priority to board the vehicle	Please specify below
3330	2021-03-03 06:09:12.638256-05	55	26	18	-1.278796	36.8171723	I can't say because I haven't	Please specify below
3331	2021-03-03 06:09:12.644232-05	63	29	18	-1.278796	36.8171723	because I don't have anything to report	Please specify below
3332	2021-03-03 06:09:12.650223-05	64	30	18	-1.278796	36.8171723	not really	Please specify below
3333	2021-03-03 06:09:12.656285-05	65	31	18	-1.278796	36.8171723	it's hard for things to change but juja road conductors treatment just fine.	Please specify below
3334	2021-03-03 06:09:12.662283-05	4	1	18	-1.278796	36.8171723	20 years	18-25
3335	2021-03-03 06:09:12.668266-05	2	2	18	-1.278796	36.8171723	female	Female
3336	2021-03-03 06:09:12.674254-05	11	3	18	-1.278796	36.8171723	matatu	Matatu
3337	2021-03-03 06:09:12.680234-05	15	4	18	-1.278796	36.8171723	cheap	Cheap
3338	2021-03-03 06:09:12.686232-05	43	20	18	-1.278796	36.8171723	artificial legs	Physically handicapped
3339	2021-03-03 06:09:12.692212-05	46	22	18	-1.278796	36.8171723	yes	Yes
3340	2021-03-03 06:09:12.698209-05	50	24	18	-1.278796	36.8171723	no	No
3341	2021-03-03 06:09:12.704191-05	54	25	18	-1.278796	36.8171723	I haven't experienced discrimination	A few times a year
3342	2021-03-03 06:09:12.710184-05	60	27	18	-1.278796	36.8171723	they were all really nice	Other
3343	2021-03-03 06:09:12.716169-05	62	28	18	-1.278796	36.8171723	no	No
3344	2021-03-03 06:14:43.117939-05	45	21	18	-1.2787915	36.8171782	Limuru	Please specify below
3345	2021-03-03 06:14:43.131018-05	48	23	18	-1.2787915	36.8171782	They tell people to leave the front seat for me.	Please specify below
3346	2021-03-03 06:14:43.136897-05	55	26	18	-1.2787915	36.8171782	verbal they said I was "sumbua".	Please specify below
3347	2021-03-03 06:14:43.142873-05	63	29	18	-1.2787915	36.8171782	They do not have proper channels for such problems	Please specify below
3348	2021-03-03 06:14:43.148872-05	64	30	18	-1.2787915	36.8171782	Negatively because they fare is now high	Please specify below
3349	2021-03-03 06:14:43.15484-05	65	31	18	-1.2787915	36.8171782	they will never change.	Please specify below
3350	2021-03-03 06:14:43.160817-05	7	1	18	-1.2787915	36.8171782	40 years	36-40
3351	2021-03-03 06:14:43.16681-05	1	2	18	-1.2787915	36.8171782	male	Male
3352	2021-03-03 06:14:43.172791-05	11	3	18	-1.2787915	36.8171782	matatu	Matatu
3353	2021-03-03 06:14:43.178789-05	16	4	18	-1.2787915	36.8171782	convenient	Convenient
3354	2021-03-03 06:14:43.184766-05	43	20	18	-1.2787915	36.8171782	uses crunches and wheelchair	Physically handicapped
3355	2021-03-03 06:14:43.190763-05	46	22	18	-1.2787915	36.8171782	Yes	Yes
3356	2021-03-03 06:14:43.196832-05	49	24	18	-1.2787915	36.8171782	yes	Yes
3357	2021-03-03 06:14:43.20283-05	54	25	18	-1.2787915	36.8171782	 some instances once a while	A few times a year
3358	2021-03-03 06:14:43.208807-05	57	27	18	-1.2787915	36.8171782	conductor	Conductor
3359	2021-03-03 06:14:43.214807-05	62	28	18	-1.2787915	36.8171782	No	No
3360	2021-03-03 06:19:41.546492-05	45	21	18	-1.278796	36.8171706	waiyaki way	Please specify below
3361	2021-03-03 06:19:41.554613-05	48	23	18	-1.278796	36.8171706	the driver and conductor wait till you are seated to take off	Please specify below
3362	2021-03-03 06:19:41.560583-05	55	26	18	-1.278796	36.8171706	verbal	Please specify below
3363	2021-03-03 06:19:41.566579-05	63	29	18	-1.278796	36.8171706	I didn't want any trouble	Please specify below
3364	2021-03-03 06:19:41.572551-05	64	30	18	-1.278796	36.8171706	negatively because the rates of fare are abit high	Please specify below
3365	2021-03-03 06:19:41.578547-05	65	31	18	-1.278796	36.8171706	none at the moment.	Please specify below
3366	2021-03-03 06:19:41.584524-05	5	1	18	-1.278796	36.8171706	26	26-30
3367	2021-03-03 06:19:41.590523-05	1	2	18	-1.278796	36.8171706	NA	Male
3368	2021-03-03 06:19:41.596497-05	11	3	18	-1.278796	36.8171706	matatu	Matatu
3369	2021-03-03 06:19:41.602492-05	15	4	18	-1.278796	36.8171706	cheap	Cheap
3370	2021-03-03 06:19:41.608475-05	43	20	18	-1.278796	36.8171706	one leg is amputated	Physically handicapped
3371	2021-03-03 06:19:41.614468-05	46	22	18	-1.278796	36.8171706	yes	Yes
3372	2021-03-03 06:19:41.620462-05	49	24	18	-1.278796	36.8171706	yes they once left me half my destination because I was taking too much space	Yes
3373	2021-03-03 06:19:41.626448-05	53	25	18	-1.278796	36.8171706	once a month or so	A few times a month
3374	2021-03-03 06:19:41.63243-05	56	27	18	-1.278796	36.8171706	driver . he said these type of people take too long to do anything	Driver
3375	2021-03-03 06:19:41.638504-05	62	28	18	-1.278796	36.8171706	no	No
3376	2021-03-03 06:24:00.665939-05	45	21	18	-1.278789	36.817171	Dandora 32	Please specify below
3377	2021-03-03 06:24:00.688919-05	48	23	18	-1.278789	36.817171	the conductor respects me	Please specify below
3378	2021-03-03 06:24:00.694835-05	55	26	18	-1.278789	36.817171	non verbal just stares really	Please specify below
3379	2021-03-03 06:24:00.7008-05	63	29	18	-1.278789	36.817171	no one would believe me	Please specify below
3380	2021-03-03 06:24:00.706811-05	64	30	18	-1.278789	36.817171	positively. there are less vehicle on the road	Please specify below
3381	2021-03-03 06:24:00.712786-05	65	31	18	-1.278789	36.817171	good treatment of people with disabilities	Please specify below
3382	2021-03-03 06:24:00.718779-05	8	1	18	-1.278789	36.817171	45	45-50
3383	2021-03-03 06:24:00.724751-05	2	2	18	-1.278789	36.817171	Female	Female
3384	2021-03-03 06:24:00.730748-05	14	3	18	-1.278789	36.817171	my wheelchair	Other
3385	2021-03-03 06:24:00.736726-05	16	4	18	-1.278789	36.817171	convenient	Convenient
3386	2021-03-03 06:24:00.742729-05	43	20	18	-1.278789	36.817171	paralyzed both legs	Physically handicapped
3387	2021-03-03 06:24:00.748699-05	46	22	18	-1.278789	36.817171	Yes	Yes
3388	2021-03-03 06:24:00.754701-05	49	24	18	-1.278789	36.817171	yes	Yes
3389	2021-03-03 06:24:00.760777-05	54	25	18	-1.278789	36.817171	not so often	A few times a year
3390	2021-03-03 06:24:00.766774-05	60	27	18	-1.278789	36.817171	passengers	Other
3391	2021-03-03 06:24:00.772745-05	62	28	18	-1.278789	36.817171	No	No
3392	2021-03-03 06:28:41.179825-05	45	21	18	-1.2787961	36.8171714	Githurai 45	Please specify below
3393	2021-03-03 06:28:41.192133-05	48	23	18	-1.2787961	36.8171714	The conductor treats me like a special person.	Please specify below
3394	2021-03-03 06:28:41.198048-05	55	26	18	-1.2787961	36.8171714	physical . this is because I fell from a moving car	Please specify below
3395	2021-03-03 06:28:41.20404-05	63	29	18	-1.2787961	36.8171714	who would I report it to?	Please specify below
3396	2021-03-03 06:28:41.210022-05	64	30	18	-1.2787961	36.8171714	it's just the same	Please specify below
3397	2021-03-03 06:28:41.216006-05	65	31	18	-1.2787961	36.8171714	Buses can have special seats for people like us who have calibrated legs	Please specify below
3398	2021-03-03 06:28:41.222082-05	9	1	18	-1.2787961	36.8171714	55	Above 50
3399	2021-03-03 06:28:41.228072-05	1	2	18	-1.2787961	36.8171714	male	Male
3400	2021-03-03 06:28:41.234053-05	11	3	18	-1.2787961	36.8171714	matatu	Matatu
3401	2021-03-03 06:28:41.240046-05	15	4	18	-1.2787961	36.8171714	cheap	Cheap
3402	2021-03-03 06:28:41.246036-05	43	20	18	-1.2787961	36.8171714	calibrated legs	Physically handicapped
3403	2021-03-03 06:28:41.252057-05	46	22	18	-1.2787961	36.8171714	yes	Yes
3404	2021-03-03 06:28:41.25801-05	49	24	18	-1.2787961	36.8171714	yes	Yes
3405	2021-03-03 06:28:41.264-05	54	25	18	-1.2787961	36.8171714	once in a blue moon	A few times a year
3406	2021-03-03 06:28:41.269983-05	57	27	18	-1.2787961	36.8171714	conductor	Conductor
3407	2021-03-03 06:28:41.275981-05	62	28	18	-1.2787961	36.8171714	no	No
3408	2021-03-03 06:34:50.46795-05	45	21	18	-1.2787967	36.8171746	pangani	Please specify below
3409	2021-03-03 06:34:50.48266-05	48	23	18	-1.2787967	36.8171746	the conductor helps carrying my luggage and makes sure I have a seat	Please specify below
3410	2021-03-03 06:34:50.488555-05	55	26	18	-1.2787967	36.8171746	verbal. called me names	Please specify below
3411	2021-03-03 06:34:50.494546-05	63	29	18	-1.2787967	36.8171746	It happens to all disabled people so there is no point	Please specify below
3412	2021-03-03 06:34:50.500523-05	64	30	18	-1.2787967	36.8171746	negatively. social distancing makes it harder to fight for seats coz they are always full 	Please specify below
3688	2021-03-04 08:00:39.514785-05	18	5	23	-1.3111614	36.7750481	NA	Yes
3413	2021-03-03 06:34:50.506521-05	65	31	18	-1.2787967	36.8171746	They can build ramps on matatu to ease boarding and alighting from buses	Please specify below
3414	2021-03-03 06:34:50.512508-05	9	1	18	-1.2787967	36.8171746	52	Above 50
3415	2021-03-03 06:34:50.518584-05	1	2	18	-1.2787967	36.8171746	male	Male
3416	2021-03-03 06:34:50.524555-05	43	20	18	-1.2787967	36.8171746	lost legs due to polio	Physically handicapped
3417	2021-03-03 06:34:50.530536-05	46	22	18	-1.2787967	36.8171746	Yes	Yes
3418	2021-03-03 06:34:50.53653-05	14	3	18	-1.2787967	36.8171746	my wheelchair	Other
3419	2021-03-03 06:34:50.542526-05	17	4	18	-1.2787967	36.8171746	I don't have to fight with healthy people to get into the bus	Other
3420	2021-03-03 06:34:50.548505-05	49	24	18	-1.2787967	36.8171746	yes. they call me "sumbua"	Yes
3421	2021-03-03 06:34:50.554514-05	54	25	18	-1.2787967	36.8171746	not many times	A few times a year
3422	2021-03-03 06:34:50.56048-05	58	27	18	-1.2787967	36.8171746	stage attendants	Kamagera or Stage attendants
3423	2021-03-03 06:34:50.566485-05	62	28	18	-1.2787967	36.8171746	No	No
3424	2021-03-03 06:41:45.489364-05	45	21	18	-1.2787971	36.8171717	Kangundo road	Please specify below
3425	2021-03-03 06:41:45.499185-05	48	23	18	-1.2787971	36.8171717	The conductor gives me seat closest to the door for easy access	Please specify below
3426	2021-03-03 06:41:45.505091-05	55	26	18	-1.2787971	36.8171717	non verbal. the conductor threw my wheelchair out so that I could alight faster	Please specify below
3427	2021-03-03 06:41:45.511084-05	63	29	18	-1.2787971	36.8171717	People feel sorry enough so no need to spend money in court	Please specify below
3428	2021-03-03 06:41:45.517063-05	64	30	18	-1.2787971	36.8171717	Negatively because the fare is high and business is low	Please specify below
3429	2021-03-03 06:41:45.523058-05	65	31	18	-1.2787971	36.8171717	 Conductor should consider giving more time for people living with disabilities to alight the bus	Please specify below
3430	2021-03-03 06:41:45.529039-05	5	1	18	-1.2787971	36.8171717	29	26-30
3431	2021-03-03 06:41:45.535123-05	2	2	18	-1.2787971	36.8171717	female	Female
3432	2021-03-03 06:41:45.5411-05	11	3	18	-1.2787971	36.8171717	matatu	Matatu
3433	2021-03-03 06:41:45.547091-05	15	4	18	-1.2787971	36.8171717	cheap	Cheap
3434	2021-03-03 06:41:45.553072-05	43	20	18	-1.2787971	36.8171717	paralysis of the leg	Physically handicapped
3435	2021-03-03 06:41:45.55908-05	46	22	18	-1.2787971	36.8171717	Yes	Yes
3436	2021-03-03 06:41:45.565049-05	49	24	18	-1.2787971	36.8171717	Yes	Yes
3437	2021-03-03 06:41:45.571049-05	54	25	18	-1.2787971	36.8171717	just a few incidences	A few times a year
3438	2021-03-03 06:41:45.577022-05	57	27	18	-1.2787971	36.8171717	conductor	Conductor
3439	2021-03-03 06:41:45.58302-05	62	28	18	-1.2787971	36.8171717	No	No
3440	2021-03-03 06:47:06.137223-05	45	21	18	-1.2787953	36.8171705	Kayole	Please specify below
3441	2021-03-03 06:47:06.14815-05	48	23	18	-1.2787953	36.8171705	The bus comes to a total stop for me to board	Please specify below
3442	2021-03-03 06:47:06.154122-05	55	26	18	-1.2787953	36.8171705	verbal. They said he will take forever just like his legs will take forever to grow	Please specify below
3443	2021-03-03 06:47:06.160095-05	63	29	18	-1.2787953	36.8171705	There is no need because it's likely to happen again	Please specify below
3444	2021-03-03 06:47:06.166076-05	64	30	18	-1.2787953	36.8171705	Positively. Because mask business is booming.	Please specify below
3445	2021-03-03 06:47:06.172053-05	65	31	18	-1.2787953	36.8171705	 The fare for disabled people should be a bit less than that of healthy people.	Please specify below
3446	2021-03-03 06:47:06.17805-05	8	1	18	-1.2787953	36.8171705	46	45-50
3447	2021-03-03 06:47:06.184035-05	1	2	18	-1.2787953	36.8171705	male	Male
3448	2021-03-03 06:47:06.190027-05	11	3	18	-1.2787953	36.8171705	matatu	Matatu
3449	2021-03-03 06:47:06.196003-05	15	4	18	-1.2787953	36.8171705	cheap	Cheap
3450	2021-03-03 06:47:06.201998-05	43	20	18	-1.2787953	36.8171705	affected by polio	Physically handicapped
3451	2021-03-03 06:47:06.208067-05	46	22	18	-1.2787953	36.8171705	yes	Yes
3452	2021-03-03 06:47:06.232013-05	49	24	18	-1.2787953	36.8171705	Yes	Yes
3453	2021-03-03 06:47:06.238-05	54	25	18	-1.2787953	36.8171705	It's not a common Occurrence	A few times a year
3454	2021-03-03 06:47:06.243993-05	57	27	18	-1.2787953	36.8171705	conductor	Conductor
3455	2021-03-03 06:47:06.249986-05	62	28	18	-1.2787953	36.8171705	No	No
3456	2021-03-03 06:55:15.620839-05	45	21	18	-1.2787976	36.8171731	mwiki	Please specify below
3457	2021-03-03 06:55:15.63022-05	48	23	18	-1.2787976	36.8171731	At the stage we don't queue	Please specify below
3458	2021-03-03 06:55:15.636148-05	55	26	18	-1.2787976	36.8171731	non verbal. they put a sign saying "no sumbua allowed". meaning no disabled people allowed. they later said it was a joke but it really hurts	Please specify below
3459	2021-03-03 06:55:15.642143-05	63	29	18	-1.2787976	36.8171731	lack of evidence I guess	Please specify below
3460	2021-03-03 06:55:15.648122-05	64	30	18	-1.2787976	36.8171731	Yes.  the fare is high now	Please specify below
3461	2021-03-03 06:55:15.654122-05	65	31	18	-1.2787976	36.8171731	The stages where the alight should allow them to conduct business close by to avoid the hussle in the evening	Please specify below
3462	2021-03-03 06:55:15.6601-05	7	1	18	-1.2787976	36.8171731	40 years	36-40
3463	2021-03-03 06:55:15.666083-05	2	2	18	-1.2787976	36.8171731	female	Female
3464	2021-03-03 06:55:15.67207-05	15	4	18	-1.2787976	36.8171731	cheap	Cheap
3465	2021-03-03 06:55:15.678154-05	43	20	18	-1.2787976	36.8171731	 uses crunches one leg is amputated	Physically handicapped
3466	2021-03-03 06:55:15.684129-05	46	22	18	-1.2787976	36.8171731	Yes	Yes
3467	2021-03-03 06:55:15.690123-05	49	24	18	-1.2787976	36.8171731	Yes	Yes
3468	2021-03-03 06:55:15.696103-05	54	25	18	-1.2787976	36.8171731	Not all the time	A few times a year
3469	2021-03-03 06:55:15.702089-05	58	27	18	-1.2787976	36.8171731	stage attendants	Kamagera or Stage attendants
3470	2021-03-03 06:55:15.708077-05	62	28	18	-1.2787976	36.8171731	No	No
3471	2021-03-03 06:55:15.714287-05	11	3	18	-1.2787976	36.8171731	matatu	Matatu
3472	2021-03-03 07:09:19.248822-05	45	21	26	-1.1071697	37.0154806	thika road 	Please specify below
3473	2021-03-03 07:09:19.259554-05	48	23	26	-1.1071697	37.0154806	today while coming I didn't pay	Please specify below
3474	2021-03-03 07:09:19.265513-05	55	26	26	-1.1071697	37.0154806	not discriminated	Please specify below
3475	2021-03-03 07:09:19.271506-05	63	29	26	-1.1071697	37.0154806	no discrimination so far	Please specify below
3476	2021-03-03 07:09:19.277482-05	64	30	26	-1.1071697	37.0154806	negatively.... sometimes I miss the Matatu because they are few and sometimes have to wait for long	Please specify below
3477	2021-03-03 07:09:19.28349-05	65	31	26	-1.1071697	37.0154806	I'm good \n	Please specify below
3478	2021-03-03 07:09:19.28946-05	2	2	26	-1.1071697	37.0154806	I'm female 	Female
3479	2021-03-03 07:09:19.295461-05	43	20	26	-1.1071697	37.0154806	I dont walk	Physically handicapped
3480	2021-03-03 07:09:19.301431-05	62	28	26	-1.1071697	37.0154806	I didn't report because I wasn't discriminated	No
3481	2021-03-03 07:09:19.307443-05	7	1	26	-1.1071697	37.0154806	I'm 40 years old	36-40
3482	2021-03-03 07:09:19.313433-05	46	22	26	-1.1071697	37.0154806	yeah... the conductors sometimes give me a ride for free	Yes
3483	2021-03-03 07:09:19.319411-05	53	25	26	-1.1071697	37.0154806	I have never	A few times a month
3484	2021-03-03 07:09:19.325381-05	11	3	26	-1.1071697	37.0154806	I use matatu 	Matatu
3485	2021-03-03 07:09:19.331379-05	16	4	26	-1.1071697	37.0154806	it's what I get without struggle 	Convenient
3486	2021-03-03 07:09:19.337359-05	50	24	26	-1.1071697	37.0154806	no one has ever discriminated me	No
3487	2021-03-03 07:09:19.343445-05	58	27	26	-1.1071697	37.0154806	no one 	Kamagera or Stage attendants
3488	2021-03-03 07:16:40.787768-05	45	21	18	-1.2788172	36.8172076	Kariakoo	Please specify below
3489	2021-03-03 07:16:40.799797-05	48	23	18	-1.2788172	36.8172076	they give me respect just like any other man	Please specify below
3490	2021-03-03 07:16:40.805675-05	55	26	18	-1.2788172	36.8172076	verbal. he called me cursed	Please specify below
3491	2021-03-03 07:16:40.811748-05	63	29	18	-1.2788172	36.8172076	 There is no need	Please specify below
3492	2021-03-03 07:16:40.81773-05	64	30	18	-1.2788172	36.8172076	Not really. As long as I get to my destination that is all that matters	Please specify below
3493	2021-03-03 07:16:40.823716-05	65	31	18	-1.2788172	36.8172076	The stage should have seats for Disabled people to seat as they wait for the busses	Please specify below
3494	2021-03-03 07:16:40.829704-05	9	1	18	-1.2788172	36.8172076	54	Above 50
3495	2021-03-03 07:16:40.835711-05	1	2	18	-1.2788172	36.8172076	Male	Male
3496	2021-03-03 07:16:40.841674-05	11	3	18	-1.2788172	36.8172076	matatu	Matatu
3497	2021-03-03 07:16:40.847681-05	15	4	18	-1.2788172	36.8172076	cheap	Cheap
3498	2021-03-03 07:16:40.853658-05	43	20	18	-1.2788172	36.8172076	uses wheelchair	Physically handicapped
3499	2021-03-03 07:16:40.859652-05	46	22	18	-1.2788172	36.8172076	Yes	Yes
3500	2021-03-03 07:16:40.865631-05	49	24	18	-1.2788172	36.8172076	Yes	Yes
3501	2021-03-03 07:16:40.87163-05	54	25	18	-1.2788172	36.8172076	Afew times	A few times a year
3502	2021-03-03 07:16:40.877613-05	57	27	18	-1.2788172	36.8172076	conductor	Conductor
3503	2021-03-03 07:16:40.8836-05	62	28	18	-1.2788172	36.8172076	No	No
3504	2021-03-03 07:24:14.725241-05	45	21	18	-1.2787979	36.8171768	Thika road	Please specify below
3505	2021-03-03 07:24:14.740668-05	48	23	18	-1.2787979	36.8171768	 Majority of conductors and drivers are considerate about our situation	Please specify below
3506	2021-03-03 07:24:14.746567-05	55	26	18	-1.2787979	36.8171768	verbal. he said I pity your family. they must be exhausted carrying you around but am not your family thank God.	Please specify below
3507	2021-03-03 07:24:14.752541-05	63	29	18	-1.2787979	36.8171768	It's unnecessary and am always on survival mode	Please specify below
3508	2021-03-03 07:24:14.75854-05	64	30	18	-1.2787979	36.8171768	positively. the seats are spaced out	Please specify below
3509	2021-03-03 07:24:14.764516-05	65	31	18	-1.2787979	36.8171768	 if all bus stops would have a no queue policy for disabled people	Please specify below
3510	2021-03-03 07:24:14.770505-05	8	1	18	-1.2787979	36.8171768	50	45-50
3511	2021-03-03 07:24:14.776489-05	1	2	18	-1.2787979	36.8171768	Male	Male
3512	2021-03-03 07:24:14.782488-05	11	3	18	-1.2787979	36.8171768	Matatu sometimes my wheelchair	Matatu
3513	2021-03-03 07:24:14.788475-05	15	4	18	-1.2787979	36.8171768	cheap	Cheap
3514	2021-03-03 07:24:14.794456-05	43	20	18	-1.2787979	36.8171768	legs lost due to polio	Physically handicapped
3515	2021-03-03 07:24:14.800438-05	46	22	18	-1.2787979	36.8171768	Yes	Yes
3516	2021-03-03 07:24:14.806429-05	49	24	18	-1.2787979	36.8171768	Yes	Yes
3517	2021-03-03 07:24:14.812409-05	54	25	18	-1.2787979	36.8171768	Doesn't happen all the time	A few times a year
3518	2021-03-03 07:24:14.818497-05	57	27	18	-1.2787979	36.8171768	conductor	Conductor
3519	2021-03-03 07:24:14.82448-05	62	28	18	-1.2787979	36.8171768	No	No
3520	2021-03-03 07:29:09.247262-05	45	21	18	-1.2787878	36.8171619	Ngumba	Please specify below
3521	2021-03-03 07:29:09.260721-05	48	23	18	-1.2787878	36.8171619	 The conductor asks if I need extra help	Please specify below
3522	2021-03-03 07:29:09.266632-05	55	26	18	-1.2787878	36.8171619	verbal. they said am  God's mistake	Please specify below
3523	2021-03-03 07:29:09.272609-05	63	29	18	-1.2787878	36.8171619	 I don't know who to tell	Please specify below
3524	2021-03-03 07:29:09.278678-05	64	30	18	-1.2787878	36.8171619	Positively. the space between seats is good for my legs	Please specify below
3525	2021-03-03 07:29:09.284647-05	65	31	18	-1.2787878	36.8171619	If they would stop judging and spreading love and kindness	Please specify below
3526	2021-03-03 07:29:09.290659-05	7	1	18	-1.2787878	36.8171619	36	36-40
3527	2021-03-03 07:29:09.296624-05	1	2	18	-1.2787878	36.8171619	male	Male
3528	2021-03-03 07:29:09.302621-05	11	3	18	-1.2787878	36.8171619	matatu	Matatu
3529	2021-03-03 07:29:09.308604-05	15	4	18	-1.2787878	36.8171619	cheap	Cheap
3530	2021-03-03 07:29:09.314598-05	43	20	18	-1.2787878	36.8171619	legs are amputated	Physically handicapped
3531	2021-03-03 07:29:09.320568-05	46	22	18	-1.2787878	36.8171619	Yes	Yes
3532	2021-03-03 07:29:09.326582-05	49	24	18	-1.2787878	36.8171619	Yes	Yes
3533	2021-03-03 07:29:09.332546-05	53	25	18	-1.2787878	36.8171619	once a month probably	A few times a month
3534	2021-03-03 07:29:09.33855-05	57	27	18	-1.2787878	36.8171619	conductor	Conductor
3535	2021-03-03 07:29:09.344524-05	62	28	18	-1.2787878	36.8171619	No	No
3536	2021-03-03 07:34:10.970902-05	45	21	18	-1.2787929	36.8171768	Kikuyu	Please specify below
3537	2021-03-03 07:34:10.983862-05	48	23	18	-1.2787929	36.8171768	They gave me first priority to board the bus	Please specify below
3538	2021-03-03 07:34:10.989801-05	55	26	18	-1.2787929	36.8171768	verbal. they said am pretty but where are my legs	Please specify below
3539	2021-03-03 07:34:10.995877-05	63	29	18	-1.2787929	36.8171768	I got used to it	Please specify below
3540	2021-03-03 07:34:11.001857-05	64	30	18	-1.2787929	36.8171768	Positively. because I don't travel much	Please specify below
3541	2021-03-03 07:34:11.007858-05	65	31	18	-1.2787929	36.8171768	Have special cars if possible	Please specify below
3542	2021-03-03 07:34:11.013836-05	8	1	18	-1.2787929	36.8171768	47	45-50
3543	2021-03-03 07:34:11.019827-05	2	2	18	-1.2787929	36.8171768	female	Female
3544	2021-03-03 07:34:11.025805-05	11	3	18	-1.2787929	36.8171768	matatu	Matatu
3545	2021-03-03 07:34:11.031796-05	16	4	18	-1.2787929	36.8171768	convenient	Convenient
3546	2021-03-03 07:34:11.037784-05	43	20	18	-1.2787929	36.8171768	legs are paralyzed	Physically handicapped
3547	2021-03-03 07:34:11.04378-05	46	22	18	-1.2787929	36.8171768	Yes	Yes
3548	2021-03-03 07:34:11.049757-05	49	24	18	-1.2787929	36.8171768	Yes	Yes
3549	2021-03-03 07:34:11.055751-05	54	25	18	-1.2787929	36.8171768	not often (sio sana)	A few times a year
3550	2021-03-03 07:34:11.061737-05	57	27	18	-1.2787929	36.8171768	Conductor	Conductor
3551	2021-03-03 07:34:11.067738-05	62	28	18	-1.2787929	36.8171768	No	No
3552	2021-03-03 07:49:01.934688-05	45	21	26	-1.0987701	37.0115841	thika road road to town 	Please specify below
3553	2021-03-03 07:49:01.949788-05	48	23	26	-1.0987701	37.0115841	the last time I was coming from town, it was raining and at rush hours, the conductor helped me to the bus station and to board the bus 	Please specify below
3554	2021-03-03 07:49:01.95575-05	55	26	26	-1.0987701	37.0115841	verbal	Please specify below
3555	2021-03-03 07:49:01.961671-05	63	29	26	-1.0987701	37.0115841	it's my duty to pay.. so it was my fault... to some extent 	Please specify below
3556	2021-03-03 07:49:01.967664-05	64	30	26	-1.0987701	37.0115841	I depend mostly on the government and begging, so it has impacted me negatively since sometimes I fail to get anything at all	Please specify below
3557	2021-03-03 07:49:01.973646-05	65	31	26	-1.0987701	37.0115841	atleast introduce people who can help those with disabilities to board the cars.... and maybe provide them a different means of transport... specially for us. 	Please specify below
3558	2021-03-03 07:49:01.979645-05	7	1	26	-1.0987701	37.0115841	I'm 38years old	36-40
3559	2021-03-03 07:49:01.985616-05	2	2	26	-1.0987701	37.0115841	I'm a female	Female
3560	2021-03-03 07:49:01.991612-05	12	3	26	-1.0987701	37.0115841	I use bodaboda bike most of the time	Boda boda
3561	2021-03-03 07:49:01.997599-05	16	4	26	-1.0987701	37.0115841	it's convenient since its what I can get	Convenient
3562	2021-03-03 07:49:02.003664-05	41	20	26	-1.0987701	37.0115841	I can't see	Visually impaired
3563	2021-03-03 07:49:02.009653-05	46	22	26	-1.0987701	37.0115841	I sometimes get help to board	Yes
3564	2021-03-03 07:49:02.01566-05	49	24	26	-1.0987701	37.0115841	sometimes when I can't pay the fare and I'm forced not to board	Yes
3565	2021-03-03 07:49:02.021641-05	54	25	26	-1.0987701	37.0115841	a few times, two times that I remember 	A few times a year
3566	2021-03-03 07:49:02.027648-05	57	27	26	-1.0987701	37.0115841	the conductor was pissed that I couldn't pay my fared	Conductor
3567	2021-03-03 07:49:02.033608-05	62	28	26	-1.0987701	37.0115841	I didn't want to report since I felt like I should pay and that it was my fault	No
3568	2021-03-03 07:51:32.2818-05	45	21	18	-1.2787933	36.8171765	Ngumo	Please specify below
3569	2021-03-03 07:51:32.293178-05	48	23	18	-1.2787933	36.8171765	Give me a seat at the door	Please specify below
3570	2021-03-03 07:51:32.299142-05	55	26	18	-1.2787933	36.8171765	verbal. they called me a nuisance	Please specify below
3571	2021-03-03 07:51:32.305123-05	63	29	18	-1.2787933	36.8171765	The channels of reporting are too long	Please specify below
3572	2021-03-03 07:51:32.311123-05	64	30	18	-1.2787933	36.8171765	negatively. the fare is too much	Please specify below
3573	2021-03-03 07:51:32.317091-05	65	31	18	-1.2787933	36.8171765	no changes needed coz they haven't implemented the ones already in existence	Please specify below
3574	2021-03-03 07:51:32.323094-05	5	1	18	-1.2787933	36.8171765	38	26-30
3575	2021-03-03 07:51:32.329154-05	2	2	18	-1.2787933	36.8171765	female	Female
3576	2021-03-03 07:51:32.335141-05	11	3	18	-1.2787933	36.8171765	matatu	Matatu
3577	2021-03-03 07:51:32.341118-05	15	4	18	-1.2787933	36.8171765	cheap	Cheap
3578	2021-03-03 07:51:32.347124-05	43	20	18	-1.2787933	36.8171765	legs are paralyzed	Physically handicapped
3579	2021-03-03 07:51:32.353096-05	46	22	18	-1.2787933	36.8171765	Yes	Yes
3580	2021-03-03 07:51:32.359102-05	49	24	18	-1.2787933	36.8171765	Yes	Yes
3581	2021-03-03 07:51:32.365079-05	54	25	18	-1.2787933	36.8171765	Afew times a year maybe once a while	A few times a year
3582	2021-03-03 07:51:32.371066-05	57	27	18	-1.2787933	36.8171765	conductor	Conductor
3583	2021-03-03 07:51:32.377041-05	62	28	18	-1.2787933	36.8171765	No	No
3584	2021-03-04 06:05:20.178894-05	23	7	25	-1.2822189	36.7368192	N/A	Please specify below
3585	2021-03-04 06:05:20.266037-05	28	10	25	-1.2822189	36.7368192	N/A	Please specify below
3586	2021-03-04 06:05:20.271959-05	29	11	25	-1.2822189	36.7368192	No	Please specify below
3587	2021-03-04 06:05:20.277944-05	32	13	25	-1.2822189	36.7368192	A man seated next to my friend was placing his hand on her thigh 	Please specify below
3588	2021-03-04 06:05:20.283925-05	37	16	25	-1.2822189	36.7368192	n/a	Please specify below
3589	2021-03-04 06:05:20.289946-05	38	17	25	-1.2822189	36.7368192	Just that one time	Please specify below
3590	2021-03-04 06:05:20.295899-05	39	18	25	-1.2822189	36.7368192	none 	Please specify below
3591	2021-03-04 06:05:20.301892-05	40	19	25	-1.2822189	36.7368192	no	Please specify below
3592	2021-03-04 06:05:20.307951-05	2	2	25	-1.2822189	36.7368192	NA	Female
3593	2021-03-04 06:05:20.313955-05	11	3	25	-1.2822189	36.7368192	NA	Matatu
3594	2021-03-04 06:05:20.31993-05	15	4	25	-1.2822189	36.7368192	NA	Cheap
3595	2021-03-04 06:05:20.326112-05	19	5	25	-1.2822189	36.7368192	NA	No
3596	2021-03-04 06:05:20.331891-05	25	8	25	-1.2822189	36.7368192	NA	No
3597	2021-03-04 06:05:20.337871-05	27	9	25	-1.2822189	36.7368192	N/A	No
3598	2021-03-04 06:05:20.343844-05	30	12	25	-1.2822189	36.7368192	NA	Yes
3599	2021-03-04 06:05:20.349854-05	33	14	25	-1.2822189	36.7368192	NA	Yes
3600	2021-03-04 06:05:20.355823-05	35	15	25	-1.2822189	36.7368192	NA	Yes
3601	2021-03-04 06:05:20.361903-05	4	1	25	-1.2822189	36.7368192	21	18-25
3602	2021-03-04 06:05:20.367878-05	20	6	25	-1.2822189	36.7368192	N/A	Physical touch
3603	2021-03-04 07:01:28.970391-05	23	7	25	-1.283024	36.7367767	A conductor and the people at the stage insulted me because of my dressing 	Please specify below
3604	2021-03-04 07:01:28.982813-05	28	10	25	-1.283024	36.7367767	I would just be more embarrassed if I tried to 	Please specify below
3605	2021-03-04 07:01:28.988712-05	29	11	25	-1.283024	36.7367767	N/A	Please specify below
3606	2021-03-04 07:01:28.994691-05	32	13	25	-1.283024	36.7367767	Many ladies get insulted just because they have worn a 'short' dress or skirt	Please specify below
3607	2021-03-04 07:01:29.000808-05	37	16	25	-1.283024	36.7367767	I feel like they wouldn't help much 	Please specify below
3608	2021-03-04 07:01:29.006844-05	38	17	25	-1.283024	36.7367767	Maybe 10	Please specify below
3609	2021-03-04 07:01:29.012735-05	39	18	25	-1.283024	36.7367767	Twice	Please specify below
3610	2021-03-04 07:01:29.018734-05	40	19	25	-1.283024	36.7367767	People should be educated on what sexual harassment is 	Please specify below
3611	2021-03-04 07:01:29.024714-05	5	1	25	-1.283024	36.7367767	NA	26-30
3612	2021-03-04 07:01:29.030709-05	2	2	25	-1.283024	36.7367767	NA	Female
3613	2021-03-04 07:01:29.036685-05	11	3	25	-1.283024	36.7367767	NA	Matatu
3614	2021-03-04 07:01:29.042678-05	15	4	25	-1.283024	36.7367767	NA	Cheap
3615	2021-03-04 07:01:29.048653-05	18	5	25	-1.283024	36.7367767	NA	Yes
3616	2021-03-04 07:01:29.054672-05	21	6	25	-1.283024	36.7367767	A conductor and the people at the stage insulted me because of my dressing 	Verbal
3617	2021-03-04 07:01:29.072623-05	25	8	25	-1.283024	36.7367767	NA	No
3618	2021-03-04 07:01:29.078617-05	27	9	25	-1.283024	36.7367767	NA	No
3619	2021-03-04 07:01:29.084597-05	30	12	25	-1.283024	36.7367767	NA	Yes
3620	2021-03-04 07:01:29.0907-05	34	14	25	-1.283024	36.7367767	NA	No
3621	2021-03-04 07:01:29.09666-05	36	15	25	-1.283024	36.7367767	NA	No
3622	2021-03-04 07:24:19.799694-05	23	7	23	-1.3108553	36.7757381	A passenger putting their hand on her thigh 	Please specify below
3623	2021-03-04 07:24:19.807717-05	28	10	23	-1.3108553	36.7757381	Seemed futile	Please specify below
3624	2021-03-04 07:24:19.813744-05	29	11	23	-1.3108553	36.7757381	NA	Please specify below
3625	2021-03-04 07:24:19.819694-05	32	13	23	-1.3108553	36.7757381	Other passengers physically touching other women 	Please specify below
3626	2021-03-04 07:24:19.825692-05	37	16	23	-1.3108553	36.7757381	Lack of trust in the police 	Please specify below
3627	2021-03-04 07:24:19.831671-05	38	17	23	-1.3108553	36.7757381	Almost weekly	Please specify below
3628	2021-03-04 07:24:19.837669-05	39	18	23	-1.3108553	36.7757381	Almost everyday 	Please specify below
3629	2021-03-04 07:24:19.843644-05	40	19	23	-1.3108553	36.7757381	Alternative transport means	Please specify below
3630	2021-03-04 07:24:19.849652-05	4	1	23	-1.3108553	36.7757381	NA	18-25
3631	2021-03-04 07:24:19.85562-05	2	2	23	-1.3108553	36.7757381	NA	Female
3632	2021-03-04 07:24:19.86162-05	11	3	23	-1.3108553	36.7757381	NA	Matatu
3633	2021-03-04 07:24:19.867591-05	16	4	23	-1.3108553	36.7757381	NA	Convenient
3634	2021-03-04 07:24:19.873692-05	18	5	23	-1.3108553	36.7757381	NA	Yes
3635	2021-03-04 07:24:19.879652-05	20	6	23	-1.3108553	36.7757381	NA	Physical touch
3636	2021-03-04 07:24:19.885651-05	25	8	23	-1.3108553	36.7757381	NA	No
3637	2021-03-04 07:24:19.891708-05	27	9	23	-1.3108553	36.7757381	NA	No
3638	2021-03-04 07:24:19.897725-05	30	12	23	-1.3108553	36.7757381	NA	Yes
3639	2021-03-04 07:24:19.903687-05	34	14	23	-1.3108553	36.7757381	NA	No
3640	2021-03-04 07:24:19.909691-05	36	15	23	-1.3108553	36.7757381	N	No
3641	2021-03-04 07:33:13.636894-05	23	7	23	-1.3108574	36.7757356	Man followed her to her place as she verbal advances had been turned down	Please specify below
3642	2021-03-04 07:33:13.65019-05	28	10	23	-1.3108574	36.7757356	The situation felt unsecured. Priority was in letting the man down gently cause of fear of physical harm	Please specify below
3643	2021-03-04 07:33:13.656089-05	29	11	23	-1.3108574	36.7757356	NA	Please specify below
3644	2021-03-04 07:33:13.662072-05	32	13	23	-1.3108574	36.7757356	Na 	Please specify below
3645	2021-03-04 07:33:13.668054-05	37	16	23	-1.3108574	36.7757356	NA	Please specify below
3646	2021-03-04 07:33:13.674053-05	38	17	23	-1.3108574	36.7757356	More than 5 times daily 	Please specify below
3647	2021-03-04 07:33:13.680119-05	39	18	23	-1.3108574	36.7757356	Almost daily 	Please specify below
3648	2021-03-04 07:33:13.686194-05	40	19	23	-1.3108574	36.7757356	NA	Please specify below
3649	2021-03-04 07:33:13.692169-05	6	1	23	-1.3108574	36.7757356	NA	31-35
3650	2021-03-04 07:33:13.698168-05	2	2	23	-1.3108574	36.7757356	NA	Female
3651	2021-03-04 07:33:13.704145-05	11	3	23	-1.3108574	36.7757356	NA	Matatu
3652	2021-03-04 07:33:13.710145-05	15	4	23	-1.3108574	36.7757356	NA	Cheap
3653	2021-03-04 07:33:13.716136-05	18	5	23	-1.3108574	36.7757356	NA	Yes
3654	2021-03-04 07:33:13.722102-05	22	6	23	-1.3108574	36.7757356	NA	Sexual advances
3655	2021-03-04 07:33:13.728097-05	25	8	23	-1.3108574	36.7757356	NA	No
3656	2021-03-04 07:33:13.734089-05	27	9	23	-1.3108574	36.7757356	The situation felt unsecured. Priority was in letting the man down gently cause of fear of physical harm	No
3657	2021-03-04 07:33:13.740061-05	31	12	23	-1.3108574	36.7757356	NA	No
3658	2021-03-04 07:33:13.746051-05	34	14	23	-1.3108574	36.7757356	NA	No
3659	2021-03-04 07:33:13.752054-05	35	15	23	-1.3108574	36.7757356	NA	Yes
3660	2021-03-04 07:44:59.748558-05	45	21	26	-1.2818276	36.8202698	eastleigh to town	Please specify below
3661	2021-03-04 07:44:59.761297-05	48	23	26	-1.2818276	36.8202698	sometimes the conductor helps me board the vehicle 	Please specify below
3662	2021-03-04 07:44:59.767195-05	55	26	26	-1.2818276	36.8202698	verbal	Please specify below
3663	2021-03-04 07:44:59.773186-05	63	29	26	-1.2818276	36.8202698	I didn't do it because most of the time no action is taken	Please specify below
3664	2021-03-04 07:44:59.779159-05	64	30	26	-1.2818276	36.8202698	negatively. the vehicles would fail to pick me since they would think I won't pay, yet I have the fare	Please specify below
3665	2021-03-04 07:44:59.785238-05	65	31	26	-1.2818276	36.8202698	the way there are spacings in the vehicle now... they should be so even in normal times to allow us to be comftable in the matatu 	Please specify below
3666	2021-03-04 07:44:59.791219-05	4	1	26	-1.2818276	36.8202698	23years old	18-25
3667	2021-03-04 07:44:59.797298-05	1	2	26	-1.2818276	36.8202698	male	Male
3668	2021-03-04 07:44:59.803271-05	11	3	26	-1.2818276	36.8202698	matatu	Matatu
3669	2021-03-04 07:44:59.809288-05	16	4	26	-1.2818276	36.8202698	it's convenient 	Convenient
3670	2021-03-04 07:44:59.815252-05	43	20	26	-1.2818276	36.8202698	can't walk	Physically handicapped
3671	2021-03-04 07:44:59.821261-05	46	22	26	-1.2818276	36.8202698	I have had several	Yes
3672	2021-03-04 07:44:59.827232-05	49	24	26	-1.2818276	36.8202698	yeah... when using the matatu	Yes
3673	2021-03-04 07:44:59.83323-05	54	25	26	-1.2818276	36.8202698	rarely. a few time in a year	A few times a year
3674	2021-03-04 07:44:59.839291-05	57	27	26	-1.2818276	36.8202698	the conductor	Conductor
3675	2021-03-04 07:44:59.84529-05	62	28	26	-1.2818276	36.8202698	I didnt	No
3676	2021-03-04 08:00:39.433601-05	23	7	23	-1.3111614	36.7750481	NA	Please specify below
3677	2021-03-04 08:00:39.448862-05	28	10	23	-1.3111614	36.7750481	Did not have the time	Please specify below
3678	2021-03-04 08:00:39.454754-05	29	11	23	-1.3111614	36.7750481	NA	Please specify below
3679	2021-03-04 08:00:39.460743-05	32	13	23	-1.3111614	36.7750481	NA	Please specify below
3680	2021-03-04 08:00:39.466726-05	37	16	23	-1.3111614	36.7750481	Feels like it would be futile 	Please specify below
3681	2021-03-04 08:00:39.472716-05	38	17	23	-1.3111614	36.7750481	Never	Please specify below
3682	2021-03-04 08:00:39.478785-05	39	18	23	-1.3111614	36.7750481	M\nAt least monthly 	Please specify below
3683	2021-03-04 08:00:39.484768-05	40	19	23	-1.3111614	36.7750481	NA	Please specify below
3684	2021-03-04 08:00:39.491175-05	7	1	23	-1.3111614	36.7750481	NA	36-40
3685	2021-03-04 08:00:39.496824-05	2	2	23	-1.3111614	36.7750481	NA	Female
3686	2021-03-04 08:00:39.502808-05	13	3	23	-1.3111614	36.7750481	NA	Train
3687	2021-03-04 08:00:39.508809-05	16	4	23	-1.3111614	36.7750481	NA	Convenient
3689	2021-03-04 08:00:39.520866-05	22	6	23	-1.3111614	36.7750481	NA	Sexual advances
3690	2021-03-04 08:00:39.526875-05	25	8	23	-1.3111614	36.7750481	NA	No
3691	2021-03-04 08:00:39.532853-05	27	9	23	-1.3111614	36.7750481	NA	No
3692	2021-03-04 08:00:39.53884-05	31	12	23	-1.3111614	36.7750481	NA	No
3693	2021-03-04 08:00:39.544821-05	34	14	23	-1.3111614	36.7750481	NA	No
3694	2021-03-04 08:00:39.550839-05	36	15	23	-1.3111614	36.7750481	NA	No
3695	2021-03-04 08:03:03.570373-05	45	21	18	-1.2365642	36.8861621	102 Dagoretti	Please specify below
3696	2021-03-04 08:03:03.584305-05	48	23	18	-1.2365642	36.8861621	They were considerate in terms of time	Please specify below
3697	2021-03-04 08:03:03.590222-05	55	26	18	-1.2365642	36.8861621	physical. The conductor touched my buttocks in the name of helping me get in the matatu	Please specify below
3698	2021-03-04 08:03:03.596188-05	63	29	18	-1.2365642	36.8861621	No one would believe me 	Please specify below
3699	2021-03-04 08:03:03.602181-05	64	30	18	-1.2365642	36.8861621	positively because the buses do not overload hence more space	Please specify below
3700	2021-03-04 08:03:03.608176-05	65	31	18	-1.2365642	36.8861621	the matatu people should be more understanding	Please specify below
3701	2021-03-04 08:03:03.614164-05	7	1	18	-1.2365642	36.8861621	34	36-40
3702	2021-03-04 08:03:03.620227-05	2	2	18	-1.2365642	36.8861621	female	Female
3703	2021-03-04 08:03:03.626239-05	11	3	18	-1.2365642	36.8861621	matatu	Matatu
3704	2021-03-04 08:03:03.632194-05	15	4	18	-1.2365642	36.8861621	cheap	Cheap
3705	2021-03-04 08:03:03.638194-05	43	20	18	-1.2365642	36.8861621	withered legs	Physically handicapped
3706	2021-03-04 08:03:03.644172-05	46	22	18	-1.2365642	36.8861621	Yes	Yes
3707	2021-03-04 08:03:03.650166-05	49	24	18	-1.2365642	36.8861621	Yes	Yes
3708	2021-03-04 08:03:03.65615-05	53	25	18	-1.2365642	36.8861621	maybe once a month	A few times a month
3709	2021-03-04 08:03:03.662149-05	57	27	18	-1.2365642	36.8861621	conductor	Conductor
3710	2021-03-04 08:03:03.668123-05	62	28	18	-1.2365642	36.8861621	No	No
3711	2021-03-04 08:03:37.606415-05	23	7	23	-1.3106447	36.7767324	Man slid his hand onto her thigh and pretended to be asleep 	Please specify below
3712	2021-03-04 08:03:37.616846-05	28	10	23	-1.3106447	36.7767324	Cause she called them out and felt that was enough 	Please specify below
3713	2021-03-04 08:03:37.622792-05	29	11	23	-1.3106447	36.7767324	NA	Please specify below
3714	2021-03-04 08:03:37.628774-05	32	13	23	-1.3106447	36.7767324	NA	Please specify below
3715	2021-03-04 08:03:37.634845-05	37	16	23	-1.3106447	36.7767324	NA	Please specify below
3716	2021-03-04 08:03:37.64083-05	38	17	23	-1.3106447	36.7767324	NA	Please specify below
3717	2021-03-04 08:03:37.646819-05	39	18	23	-1.3106447	36.7767324	Rarely 	Please specify below
3718	2021-03-04 08:03:37.652804-05	40	19	23	-1.3106447	36.7767324	Talking to men about it	Please specify below
3719	2021-03-04 08:03:37.658801-05	7	1	23	-1.3106447	36.7767324	NA	36-40
3720	2021-03-04 08:03:37.66477-05	2	2	23	-1.3106447	36.7767324	NA	Female
3721	2021-03-04 08:03:37.670757-05	11	3	23	-1.3106447	36.7767324	NA	Matatu
3722	2021-03-04 08:03:37.676759-05	16	4	23	-1.3106447	36.7767324	NA	Convenient
3723	2021-03-04 08:03:37.682738-05	18	5	23	-1.3106447	36.7767324	NA	Yes
3724	2021-03-04 08:03:37.688715-05	20	6	23	-1.3106447	36.7767324	NA	Physical touch
3725	2021-03-04 08:03:37.694722-05	25	8	23	-1.3106447	36.7767324	NA	No
3726	2021-03-04 08:03:37.700689-05	27	9	23	-1.3106447	36.7767324	NA	No
3727	2021-03-04 08:03:37.706702-05	31	12	23	-1.3106447	36.7767324	NA	No
3728	2021-03-04 08:03:37.712676-05	34	14	23	-1.3106447	36.7767324	NA	No
3729	2021-03-04 08:03:37.718758-05	35	15	23	-1.3106447	36.7767324	NA	Yes
3730	2021-03-04 08:05:12.643281-05	23	7	23	-1.3108556	36.7758011	She was asleep and passenger started caressing her body. When she felt the hand, she woke up and slapped him. 	Please specify below
3731	2021-03-04 08:05:12.661453-05	28	10	23	-1.3108556	36.7758011	NA	Please specify below
3732	2021-03-04 08:05:12.667338-05	29	11	23	-1.3108556	36.7758011	NA	Please specify below
3733	2021-03-04 08:05:12.673334-05	32	13	23	-1.3108556	36.7758011	NA	Please specify below
3734	2021-03-04 08:05:12.679303-05	37	16	23	-1.3108556	36.7758011	NA	Please specify below
3735	2021-03-04 08:05:12.685304-05	38	17	23	-1.3108556	36.7758011	NA	Please specify below
3736	2021-03-04 08:05:12.691453-05	39	18	23	-1.3108556	36.7758011	Weekly 	Please specify below
3737	2021-03-04 08:05:12.697446-05	40	19	23	-1.3108556	36.7758011	Talk to the men 	Please specify below
3738	2021-03-04 08:05:12.703461-05	7	1	23	-1.3108556	36.7758011	NA	36-40
3739	2021-03-04 08:05:12.709425-05	2	2	23	-1.3108556	36.7758011	NA	Female
3740	2021-03-04 08:05:12.715401-05	11	3	23	-1.3108556	36.7758011	NA	Matatu
3741	2021-03-04 08:05:12.721394-05	16	4	23	-1.3108556	36.7758011	NA	Convenient
3742	2021-03-04 08:05:12.727377-05	18	5	23	-1.3108556	36.7758011	NA	Yes
3743	2021-03-04 08:05:12.733378-05	20	6	23	-1.3108556	36.7758011	NA	Physical touch
3744	2021-03-04 08:05:12.739354-05	25	8	23	-1.3108556	36.7758011	NA	No
3745	2021-03-04 08:05:12.745348-05	26	9	23	-1.3108556	36.7758011	NA	Yes
3746	2021-03-04 08:05:12.751323-05	31	12	23	-1.3108556	36.7758011	NA	No
3747	2021-03-04 08:05:12.75732-05	34	14	23	-1.3108556	36.7758011	NA	No
3748	2021-03-04 08:05:12.763391-05	35	15	23	-1.3108556	36.7758011	NA	Yes
3749	2021-03-04 08:12:06.59735-05	45	21	18	-1.2365668	36.8862157	kasarani, mwiki	Please specify below
3750	2021-03-04 08:12:06.613291-05	48	23	18	-1.2365668	36.8862157	The driver waited for me to board the matatu	Please specify below
3751	2021-03-04 08:12:06.619178-05	55	26	18	-1.2365668	36.8862157	non verbal. the conductor dropped me half way to my destination	Please specify below
3752	2021-03-04 08:12:06.625176-05	63	29	18	-1.2365668	36.8862157	the office of people living with disabilities has such cases unsolved so there is no need	Please specify below
3753	2021-03-04 08:12:06.631231-05	64	30	18	-1.2365668	36.8862157	negatively. the fare is even higher during rush hours	Please specify below
3754	2021-03-04 08:12:06.637221-05	65	31	18	-1.2365668	36.8862157	The buses should have designated seats for people living with disabilities	Please specify below
3755	2021-03-04 08:12:06.643206-05	7	1	18	-1.2365668	36.8862157	39	36-40
3756	2021-03-04 08:12:06.649282-05	2	2	18	-1.2365668	36.8862157	female	Female
3757	2021-03-04 08:12:06.655262-05	11	3	18	-1.2365668	36.8862157	matatu	Matatu
3758	2021-03-04 08:12:06.66134-05	15	4	18	-1.2365668	36.8862157	cheap	Cheap
3759	2021-03-04 08:12:06.667332-05	43	20	18	-1.2365668	36.8862157	physically handicapped (legs)	Physically handicapped
3760	2021-03-04 08:12:06.673305-05	46	22	18	-1.2365668	36.8862157	Yes	Yes
3761	2021-03-04 08:12:06.679304-05	49	24	18	-1.2365668	36.8862157	Yes	Yes
3762	2021-03-04 08:12:06.685277-05	54	25	18	-1.2365668	36.8862157	A few times in a year	A few times a year
3763	2021-03-04 08:12:06.691262-05	57	27	18	-1.2365668	36.8862157	conductor	Conductor
3764	2021-03-04 08:12:06.697283-05	62	28	18	-1.2365668	36.8862157	No	No
3765	2021-03-04 08:15:39.126764-05	23	7	23	-1.3108657	36.7757064	The perpetrator was a conductor who asked for her number after expressing interest in her. After refusing, he resorted to verbal insults. 	Please specify below
3766	2021-03-04 08:15:39.136655-05	28	10	23	-1.3108657	36.7757064	Did not see the importance 	Please specify below
3767	2021-03-04 08:15:39.142577-05	29	11	23	-1.3108657	36.7757064	NA	Please specify below
3768	2021-03-04 08:15:39.148539-05	32	13	23	-1.3108657	36.7757064	NA	Please specify below
3769	2021-03-04 08:15:39.15453-05	37	16	23	-1.3108657	36.7757064	NA	Please specify below
3770	2021-03-04 08:15:39.160609-05	38	17	23	-1.3108657	36.7757064	Never	Please specify below
3771	2021-03-04 08:15:39.166668-05	39	18	23	-1.3108657	36.7757064	Weekly 	Please specify below
3772	2021-03-04 08:15:39.172662-05	40	19	23	-1.3108657	36.7757064	NA	Please specify below
3773	2021-03-04 08:15:39.178652-05	5	1	23	-1.3108657	36.7757064	NA	26-30
3774	2021-03-04 08:15:39.184633-05	2	2	23	-1.3108657	36.7757064	NA	Female
3775	2021-03-04 08:15:39.19063-05	11	3	23	-1.3108657	36.7757064	NA	Matatu
3776	2021-03-04 08:15:39.196604-05	16	4	23	-1.3108657	36.7757064	NA	Convenient
3777	2021-03-04 08:15:39.202615-05	18	5	23	-1.3108657	36.7757064	NA	Yes
3778	2021-03-04 08:15:39.208578-05	21	6	23	-1.3108657	36.7757064	NA	Verbal
3779	2021-03-04 08:15:39.214579-05	25	8	23	-1.3108657	36.7757064	NA	No
3780	2021-03-04 08:15:39.220635-05	27	9	23	-1.3108657	36.7757064	NA	No
3781	2021-03-04 08:15:39.226638-05	34	14	23	-1.3108657	36.7757064	NA	No
3782	2021-03-04 08:15:39.232609-05	35	15	23	-1.3108657	36.7757064	NA	Yes
3783	2021-03-04 08:15:39.238615-05	31	12	23	-1.3108657	36.7757064	NA	No
3784	2021-03-04 08:18:49.844437-05	45	21	18	-1.2365696	36.8861079	Thika road(mountain mall)	Please specify below
3785	2021-03-04 08:18:49.853928-05	48	23	18	-1.2365696	36.8861079	The stage attendants and conductor assisted me on boarding the bus and cross the road	Please specify below
3786	2021-03-04 08:18:49.859834-05	55	26	18	-1.2365696	36.8861079	verbal. He said I had reached my destination only to realize I was not	Please specify below
3787	2021-03-04 08:18:49.865825-05	63	29	18	-1.2365696	36.8861079	It happens all the time so you learn to let go	Please specify below
3788	2021-03-04 08:18:49.871805-05	64	30	18	-1.2365696	36.8861079	positively because I work from home so I travel less	Please specify below
3789	2021-03-04 08:18:49.87792-05	65	31	18	-1.2365696	36.8861079	have braille writings on matatus	Please specify below
3790	2021-03-04 08:18:49.883869-05	6	1	18	-1.2365696	36.8861079	35	31-35
3791	2021-03-04 08:18:49.889864-05	1	2	18	-1.2365696	36.8861079	male	Male
3792	2021-03-04 08:18:49.895835-05	11	3	18	-1.2365696	36.8861079	matatu	Matatu
3793	2021-03-04 08:18:49.901838-05	16	4	18	-1.2365696	36.8861079	convenient	Convenient
3794	2021-03-04 08:18:49.907808-05	41	20	18	-1.2365696	36.8861079	blind	Visually impaired
3795	2021-03-04 08:18:49.913809-05	46	22	18	-1.2365696	36.8861079	Yes	Yes
3796	2021-03-04 08:18:49.91979-05	49	24	18	-1.2365696	36.8861079	Yes	Yes
3797	2021-03-04 08:18:49.925782-05	53	25	18	-1.2365696	36.8861079	once or twice a month	A few times a month
3798	2021-03-04 08:18:49.93176-05	57	27	18	-1.2365696	36.8861079	conductor	Conductor
3799	2021-03-04 08:18:49.937767-05	62	28	18	-1.2365696	36.8861079	No	No
3800	2021-03-04 08:24:45.515015-05	45	21	18	-1.2365664	36.8862113	Thika road	Please specify below
3801	2021-03-04 08:24:45.52959-05	48	23	18	-1.2365664	36.8862113	They treat me like a normal person	Please specify below
3802	2021-03-04 08:24:45.535466-05	55	26	18	-1.2365664	36.8862113	verbal. he said if you were in tanzania you would be dead by now	Please specify below
3803	2021-03-04 08:24:45.541451-05	63	29	18	-1.2365664	36.8862113	I hear it all the time so I got used to it	Please specify below
3804	2021-03-04 08:24:45.547429-05	64	30	18	-1.2365664	36.8862113	negatively. apart from the increased bus fare the rest is the same	Please specify below
3805	2021-03-04 08:24:45.553517-05	65	31	18	-1.2365664	36.8862113	Buses can have curtains to hinder direct sunlight like the Swvl buses have some.	Please specify below
3806	2021-03-04 08:24:45.559494-05	5	1	18	-1.2365664	36.8862113	30	26-30
3807	2021-03-04 08:24:45.56558-05	1	2	18	-1.2365664	36.8862113	male	Male
3808	2021-03-04 08:24:45.571557-05	11	3	18	-1.2365664	36.8862113	matatu	Matatu
3809	2021-03-04 08:24:45.577564-05	15	4	18	-1.2365664	36.8862113	cheap	Cheap
3810	2021-03-04 08:24:45.583615-05	44	20	18	-1.2365664	36.8862113	Albino	Other
3811	2021-03-04 08:24:45.589609-05	46	22	18	-1.2365664	36.8862113	Yes	Yes
3812	2021-03-04 08:24:45.59558-05	49	24	18	-1.2365664	36.8862113	Yes	Yes
3813	2021-03-04 08:24:45.601584-05	54	25	18	-1.2365664	36.8862113	a few times a year	A few times a year
3814	2021-03-04 08:24:45.607562-05	60	27	18	-1.2365664	36.8862113	passenger	Other
3815	2021-03-04 08:24:45.613577-05	62	28	18	-1.2365664	36.8862113	no	No
3816	2021-03-04 08:30:23.391529-05	45	21	18	-1.2365633	36.8862044	Jogoo road	Please specify below
3817	2021-03-04 08:30:23.404959-05	48	23	18	-1.2365633	36.8862044	A lady exchanged seats to block me from sunlight and I felt good	Please specify below
3818	2021-03-04 08:30:23.410882-05	55	26	18	-1.2365633	36.8862044	verbal. someone said I look scary	Please specify below
3819	2021-03-04 08:30:23.416846-05	63	29	18	-1.2365633	36.8862044	It's unnecessary	Please specify below
3820	2021-03-04 08:30:23.42283-05	64	30	18	-1.2365633	36.8862044	Negatively. Prices of fare increased due to social distancing in the buses	Please specify below
3821	2021-03-04 08:30:23.428912-05	65	31	18	-1.2365633	36.8862044	Create more awareness on albinism	Please specify below
3822	2021-03-04 08:30:23.434895-05	5	1	18	-1.2365633	36.8862044	27	26-30
3823	2021-03-04 08:30:23.440962-05	1	2	18	-1.2365633	36.8862044	male	Male
3824	2021-03-04 08:30:23.446954-05	11	3	18	-1.2365633	36.8862044	matatu	Matatu
3825	2021-03-04 08:30:23.452936-05	15	4	18	-1.2365633	36.8862044	cheap	Cheap
3826	2021-03-04 08:30:23.458921-05	44	20	18	-1.2365633	36.8862044	Albino	Other
3827	2021-03-04 08:30:23.465004-05	46	22	18	-1.2365633	36.8862044	Yes	Yes
3828	2021-03-04 08:30:23.470986-05	49	24	18	-1.2365633	36.8862044	Yes	Yes
3829	2021-03-04 08:30:23.476975-05	54	25	18	-1.2365633	36.8862044	Few times a year	A few times a year
3830	2021-03-04 08:30:23.482968-05	60	27	18	-1.2365633	36.8862044	passenger	Other
3831	2021-03-04 08:30:23.488947-05	62	28	18	-1.2365633	36.8862044	no	No
3832	2021-03-04 08:37:46.809431-05	45	21	18	-1.234518	36.8850082	Ngong road	Please specify below
3833	2021-03-04 08:37:46.820311-05	48	23	18	-1.234518	36.8850082	There are parking spaces for disabled people	Please specify below
4034	2021-03-05 03:43:12.453903-05	1	2	26	-1.0914382	37.0216615	male	Male
3834	2021-03-04 08:37:46.826191-05	55	26	18	-1.234518	36.8850082	non verbal. a lady cut me off when I was parking and said just because you have a separate parking it doesn't make you special	Please specify below
3835	2021-03-04 08:37:46.832257-05	63	29	18	-1.234518	36.8850082	it wasn't a big deal	Please specify below
3836	2021-03-04 08:37:46.838244-05	64	30	18	-1.234518	36.8850082	positively. I travel to office less these days I work from home	Please specify below
3837	2021-03-04 08:37:46.844223-05	65	31	18	-1.234518	36.8850082	have more parking for people living with disabilities in town	Please specify below
3838	2021-03-04 08:37:46.850221-05	9	1	18	-1.234518	36.8850082	53	Above 50
3839	2021-03-04 08:37:46.856369-05	2	2	18	-1.234518	36.8850082	female	Female
3840	2021-03-04 08:37:46.862367-05	10	3	18	-1.234518	36.8850082	private car	Private Car
3841	2021-03-04 08:37:46.868339-05	16	4	18	-1.234518	36.8850082	convenient	Convenient
3842	2021-03-04 08:37:46.874343-05	43	20	18	-1.234518	36.8850082	physically handicapped	Physically handicapped
3843	2021-03-04 08:37:46.880311-05	46	22	18	-1.234518	36.8850082	Yes	Yes
3844	2021-03-04 08:37:46.886319-05	49	24	18	-1.234518	36.8850082	Yes	Yes
3845	2021-03-04 08:37:46.892287-05	54	25	18	-1.234518	36.8850082	A few times a year	A few times a year
3846	2021-03-04 08:37:46.898283-05	60	27	18	-1.234518	36.8850082	civilian	Other
3847	2021-03-04 08:37:46.90426-05	62	28	18	-1.234518	36.8850082	no	No
3848	2021-03-04 08:45:49.845296-05	45	21	18	-1.2365672	36.8861213	westlands	Please specify below
3849	2021-03-04 08:45:49.859621-05	48	23	18	-1.2365672	36.8861213	the conductor guided me to my seat give back correct change	Please specify below
3850	2021-03-04 08:45:49.865528-05	55	26	18	-1.2365672	36.8861213	non verbal. He dropped me on the wrong bus stop even though I wrote down for him	Please specify below
3851	2021-03-04 08:45:49.871506-05	63	29	18	-1.2365672	36.8861213	You learn to survive because you meet such people all the time	Please specify below
3852	2021-03-04 08:45:49.877494-05	64	30	18	-1.2365672	36.8861213	positively. My classes are online so I don't travel as often as before	Please specify below
3853	2021-03-04 08:45:49.883575-05	65	31	18	-1.2365672	36.8861213	Help teach sign language to some of the conductors or just many people so as to close the gap in communication	Please specify below
3854	2021-03-04 08:45:49.889563-05	4	1	18	-1.2365672	36.8861213	24	18-25
3855	2021-03-04 08:45:49.895614-05	2	2	18	-1.2365672	36.8861213	female	Female
3856	2021-03-04 08:45:49.901615-05	11	3	18	-1.2365672	36.8861213	matatu	Matatu
3857	2021-03-04 08:45:49.90759-05	15	4	18	-1.2365672	36.8861213	cheap	Cheap
3858	2021-03-04 08:45:49.913686-05	42	20	18	-1.2365672	36.8861213	deaf or hard of hearing	Deaf or Hard of hearing
3859	2021-03-04 08:45:49.919648-05	46	22	18	-1.2365672	36.8861213	Yes	Yes
3860	2021-03-04 08:45:49.925646-05	49	24	18	-1.2365672	36.8861213	Yes	Yes
3861	2021-03-04 08:45:49.93162-05	54	25	18	-1.2365672	36.8861213	A few times a year	A few times a year
3862	2021-03-04 08:45:49.937623-05	57	27	18	-1.2365672	36.8861213	conductor	Conductor
3863	2021-03-04 08:45:49.943604-05	62	28	18	-1.2365672	36.8861213	No	No
3864	2021-03-04 08:55:07.084376-05	45	21	18	-1.2365713	36.8862034	Waiyaki way	Please specify below
3865	2021-03-04 08:55:07.100888-05	48	23	18	-1.2365713	36.8862034	The stage attendants carried my luggage	Please specify below
3866	2021-03-04 08:55:07.124766-05	55	26	18	-1.2365713	36.8862034	Physical. once I fell from a moving vehicle because the driver was in a hurry to leave	Please specify below
3867	2021-03-04 08:55:07.154714-05	63	29	18	-1.2365713	36.8862034	I think when you report them word will travel and you will have problems with transportation. that is the fear so you just don't report	Please specify below
3868	2021-03-04 08:55:07.160703-05	64	30	18	-1.2365713	36.8862034	negatively. fare doubled	Please specify below
3869	2021-03-04 08:55:07.166743-05	65	31	18	-1.2365713	36.8862034	have flexible crunches that can easily be stored under the chair of the matatu	Please specify below
3870	2021-03-04 08:55:07.172726-05	5	1	18	-1.2365713	36.8862034	28	26-30
3871	2021-03-04 08:55:07.178884-05	1	2	18	-1.2365713	36.8862034	male	Male
3872	2021-03-04 08:55:07.184867-05	11	3	18	-1.2365713	36.8862034	matatu	Matatu
3873	2021-03-04 08:55:07.190852-05	15	4	18	-1.2365713	36.8862034	cheap	Cheap
3874	2021-03-04 08:55:07.196844-05	43	20	18	-1.2365713	36.8862034	physically handicapped	Physically handicapped
3875	2021-03-04 08:55:07.202834-05	46	22	18	-1.2365713	36.8862034	Yes	Yes
3876	2021-03-04 08:55:07.208826-05	49	24	18	-1.2365713	36.8862034	Yes	Yes
3877	2021-03-04 08:55:07.214821-05	54	25	18	-1.2365713	36.8862034	A few times a year	A few times a year
3878	2021-03-04 08:55:07.2208-05	56	27	18	-1.2365713	36.8862034	driver	Driver
3879	2021-03-04 08:55:07.226795-05	62	28	18	-1.2365713	36.8862034	No	No
3880	2021-03-04 09:03:16.426051-05	45	21	18	-1.236564	36.8861299	Kawangware	Please specify below
3881	2021-03-04 09:03:16.439145-05	48	23	18	-1.236564	36.8861299	The conductor knew how to use sign language and that made my day	Please specify below
3882	2021-03-04 09:03:16.445045-05	55	26	18	-1.236564	36.8861299	non verbal. A conductor overcharged me because I could see the balance he was returning to other passengers but my own was different	Please specify below
3883	2021-03-04 09:03:16.451021-05	63	29	18	-1.236564	36.8861299	the process of reporting is too complex	Please specify below
3884	2021-03-04 09:03:16.457003-05	64	30	18	-1.236564	36.8861299	negatively. Fare is high because of high economic crisis	Please specify below
3885	2021-03-04 09:03:16.462992-05	65	31	18	-1.236564	36.8861299	There should be more people learning sign language	Please specify below
3886	2021-03-04 09:03:16.468981-05	6	1	18	-1.236564	36.8861299	35	31-35
3887	2021-03-04 09:03:16.475141-05	1	2	18	-1.236564	36.8861299	male	Male
3888	2021-03-04 09:03:16.481145-05	11	3	18	-1.236564	36.8861299	matatu	Matatu
3889	2021-03-04 09:03:16.487157-05	15	4	18	-1.236564	36.8861299	cheap	Cheap
3890	2021-03-04 09:03:16.49312-05	42	20	18	-1.236564	36.8861299	Deaf	Deaf or Hard of hearing
3891	2021-03-04 09:03:16.499093-05	46	22	18	-1.236564	36.8861299	Yes	Yes
3892	2021-03-04 09:03:16.505079-05	49	24	18	-1.236564	36.8861299	Yes	Yes
3893	2021-03-04 09:03:16.511066-05	54	25	18	-1.236564	36.8861299	A few times a year	A few times a year
3894	2021-03-04 09:03:16.51715-05	57	27	18	-1.236564	36.8861299	conductor	Conductor
3895	2021-03-04 09:03:16.52313-05	62	28	18	-1.236564	36.8861299	no	No
3896	2021-03-04 09:13:36.823305-05	45	21	18	-1.2365637	36.8861531	kiambu	Please specify below
3897	2021-03-04 09:13:36.834751-05	48	23	18	-1.2365637	36.8861531	The conductor made another passenger give the front seat next to the driver	Please specify below
3898	2021-03-04 09:13:36.840596-05	55	26	18	-1.2365637	36.8861531	non verbal. during strikes the conductor do not help people with disabilities because of the rush	Please specify below
4035	2021-03-05 03:43:12.465963-05	11	3	26	-1.0914382	37.0216615	matatu 	Matatu
3899	2021-03-04 09:13:36.84701-05	63	29	18	-1.2365637	36.8861531	You learn to be a survivor especially if you were born with disabilities	Please specify below
3900	2021-03-04 09:13:36.852591-05	64	30	18	-1.2365637	36.8861531	negatively. Everything has become expensive even traveling	Please specify below
3901	2021-03-04 09:13:36.858552-05	65	31	18	-1.2365637	36.8861531	It's fine how it is	Please specify below
3902	2021-03-04 09:13:36.864528-05	8	1	18	-1.2365637	36.8861531	45	45-50
3903	2021-03-04 09:13:36.870693-05	1	2	18	-1.2365637	36.8861531	male	Male
3904	2021-03-04 09:13:36.876667-05	11	3	18	-1.2365637	36.8861531	matatu	Matatu
3905	2021-03-04 09:13:36.882672-05	15	4	18	-1.2365637	36.8861531	cheap	Cheap
3906	2021-03-04 09:13:36.888645-05	43	20	18	-1.2365637	36.8861531	physically handicapped	Physically handicapped
3907	2021-03-04 09:13:36.894653-05	46	22	18	-1.2365637	36.8861531	Yes	Yes
3908	2021-03-04 09:13:36.90063-05	49	24	18	-1.2365637	36.8861531	Yes	Yes
3909	2021-03-04 09:13:36.906719-05	54	25	18	-1.2365637	36.8861531	A few times a year	A few times a year
3910	2021-03-04 09:13:36.912688-05	57	27	18	-1.2365637	36.8861531	conductor	Conductor
3911	2021-03-04 09:13:36.918683-05	62	28	18	-1.2365637	36.8861531	No	No
3912	2021-03-04 09:20:45.627121-05	45	21	18	-1.2365682	36.8861553	thika road	Please specify below
3913	2021-03-04 09:20:45.639762-05	48	23	18	-1.2365682	36.8861553	They are considerate and give you first priority	Please specify below
3914	2021-03-04 09:20:45.645671-05	55	26	18	-1.2365682	36.8861553	non verbal. I once stayed in town till late because the conductors kept telling me to wait for the next bus	Please specify below
3915	2021-03-04 09:20:45.651639-05	63	29	18	-1.2365682	36.8861553	The channels are too long. you write to the ministry and before they get back to you other incidences have happened. so I just don't bother	Please specify below
3916	2021-03-04 09:20:45.657638-05	64	30	18	-1.2365682	36.8861553	negatively because of the high charging of the bus fare	Please specify below
3917	2021-03-04 09:20:45.663697-05	65	31	18	-1.2365682	36.8861553	The conductors to be trained to be patient with people living with disabilities	Please specify below
3918	2021-03-04 09:20:45.669697-05	4	1	18	-1.2365682	36.8861553	25	18-25
3919	2021-03-04 09:20:45.67576-05	2	2	18	-1.2365682	36.8861553	female	Female
3920	2021-03-04 09:20:45.681839-05	11	3	18	-1.2365682	36.8861553	matatu	Matatu
3921	2021-03-04 09:20:45.68781-05	15	4	18	-1.2365682	36.8861553	cheap	Cheap
3922	2021-03-04 09:20:45.693816-05	43	20	18	-1.2365682	36.8861553	physically handicapped	Physically handicapped
3923	2021-03-04 09:20:45.699797-05	46	22	18	-1.2365682	36.8861553	Yes	Yes
3924	2021-03-04 09:20:45.705792-05	49	24	18	-1.2365682	36.8861553	Yes	Yes
3925	2021-03-04 09:20:45.711768-05	54	25	18	-1.2365682	36.8861553	a few times a year	A few times a year
3926	2021-03-04 09:20:45.71778-05	57	27	18	-1.2365682	36.8861553	conductor	Conductor
3927	2021-03-04 09:20:45.72374-05	62	28	18	-1.2365682	36.8861553	No	No
3928	2021-03-04 09:28:35.282861-05	45	21	18	-1.236565	36.8861622	Dagoretti center	Please specify below
3929	2021-03-04 09:28:35.29705-05	48	23	18	-1.236565	36.8861622	the conductor helps me dismantle my wheelchair chair and put it in the boot of the car and fix it for me when I reach my destination	Please specify below
3930	2021-03-04 09:28:35.302923-05	55	26	18	-1.236565	36.8861622	verbal. The conductor said the bus is not reaching the CBD just to discourage me from boarding the matatu	Please specify below
3931	2021-03-04 09:28:35.30892-05	63	29	18	-1.236565	36.8861622	I don't see how it will help me	Please specify below
3932	2021-03-04 09:28:35.314916-05	64	30	18	-1.236565	36.8861622	negatively. I spend more money on transportation than before	Please specify below
3933	2021-03-04 09:28:35.32087-05	65	31	18	-1.236565	36.8861622	Government should distribute more flexible wheelchairs that can fit in matatus without the need of dismantling it	Please specify below
3934	2021-03-04 09:28:35.326946-05	8	1	18	-1.236565	36.8861622	48	45-50
3935	2021-03-04 09:28:35.333022-05	1	2	18	-1.236565	36.8861622	Male	Male
3936	2021-03-04 09:28:35.338999-05	11	3	18	-1.236565	36.8861622	matatu	Matatu
3937	2021-03-04 09:28:35.345004-05	15	4	18	-1.236565	36.8861622	cheap	Cheap
3938	2021-03-04 09:28:35.351013-05	43	20	18	-1.236565	36.8861622	physically handicapped	Physically handicapped
3939	2021-03-04 09:28:35.357057-05	46	22	18	-1.236565	36.8861622	Yes	Yes
3940	2021-03-04 09:28:35.363045-05	49	24	18	-1.236565	36.8861622	Yes	Yes
3941	2021-03-04 09:28:35.369023-05	54	25	18	-1.236565	36.8861622	a few times a year	A few times a year
3942	2021-03-04 09:28:35.375027-05	57	27	18	-1.236565	36.8861622	conductor	Conductor
3943	2021-03-04 09:28:35.381-05	62	28	18	-1.236565	36.8861622	No	No
3944	2021-03-05 02:42:35.320825-05	45	21	26	NA	NA	eastleigh -town 	Please specify below
3945	2021-03-05 02:42:35.441043-05	48	23	26	NA	NA	some days I get helped to board the car.. 	Please specify below
3946	2021-03-05 02:42:35.446754-05	55	26	26	NA	NA	non verbal	Please specify below
3947	2021-03-05 02:42:35.452731-05	63	29	26	NA	NA	the rate of ignorance in Kenya makes me not to mind reporting, nothing would be done anyway 	Please specify below
3948	2021-03-05 02:42:35.458713-05	64	30	26	NA	NA	yes... negatively.. life is becoming difficult since most matatu transport fare has been raised.. so getting the money is a problem 	Please specify below
3949	2021-03-05 02:42:35.476771-05	65	31	26	NA	NA	convince the conductor and the drivers to mind the  disabled and allow some time to board or alight from the matatus... not just moving so fast	Please specify below
3950	2021-03-05 02:42:35.482748-05	8	1	26	NA	NA	48	45-50
3951	2021-03-05 02:42:35.488904-05	1	2	26	NA	NA	male	Male
3952	2021-03-05 02:42:35.494909-05	11	3	26	NA	NA	matatu	Matatu
3953	2021-03-05 02:42:35.500875-05	16	4	26	NA	NA	it's convenient 	Convenient
3954	2021-03-05 02:42:35.506876-05	41	20	26	NA	NA	can't see	Visually impaired
3955	2021-03-05 02:42:35.512859-05	46	22	26	NA	NA	in several occasions 	Yes
3956	2021-03-05 02:42:35.518853-05	49	24	26	NA	NA	sometimes I get pushed in during rush hours 	Yes
3957	2021-03-05 02:42:35.524844-05	54	25	26	NA	NA	rarely 	A few times a year
3958	2021-03-05 02:42:35.530821-05	58	27	26	NA	NA	the stage attendants 	Kamagera or Stage attendants
3959	2021-03-05 02:42:35.536821-05	62	28	26	NA	NA	no I didn't 	No
3960	2021-03-05 02:44:02.329993-05	23	7	25	NA	NA	I once entered a matatu and the 'assistant' conductor kept asking me for my number even after politely refusing to give him	Please specify below
3961	2021-03-05 02:44:02.342122-05	28	10	25	NA	NA	There would be no point 	Please specify below
3962	2021-03-05 02:44:02.348045-05	29	11	25	NA	NA	N/A	Please specify below
3963	2021-03-05 02:44:02.354021-05	32	13	25	NA	NA	A friend was touched by an older man on the boob and she slapped his hand which led to chaos and we were asked to alight the bus	Please specify below
4036	2021-03-05 03:43:12.484029-05	16	4	26	-1.0914382	37.0216615	it's convenient 	Convenient
3964	2021-03-05 02:44:02.360026-05	37	16	25	NA	NA	I don't believe that our police can help in any way 	Please specify below
3965	2021-03-05 02:44:02.372003-05	38	17	25	NA	NA	5	Please specify below
3966	2021-03-05 02:44:02.377976-05	39	18	25	NA	NA	Twice 	Please specify below
3967	2021-03-05 02:44:02.383974-05	40	19	25	NA	NA	There should be faster and more efficient ways to report sexual harassment offenders.	Please specify below
3968	2021-03-05 02:44:02.38994-05	5	1	25	NA	NA	NA	26-30
3969	2021-03-05 02:44:02.395942-05	2	2	25	NA	NA	a	Female
3970	2021-03-05 02:44:02.40192-05	11	3	25	NA	NA	NA	Matatu
3971	2021-03-05 02:44:02.407951-05	16	4	25	NA	NA	NA	Convenient
3972	2021-03-05 02:44:02.413897-05	18	5	25	NA	NA	NA	Yes
3973	2021-03-05 02:44:02.419901-05	22	6	25	NA	NA	NA	Sexual advances
3974	2021-03-05 02:44:02.425941-05	25	8	25	NA	NA	NA	No
3975	2021-03-05 02:44:02.431944-05	27	9	25	NA	NA	NA	No
3976	2021-03-05 02:44:02.437922-05	30	12	25	NA	NA	NA	Yes
3977	2021-03-05 02:44:02.443928-05	33	14	25	NA	NA	NA	Yes
3978	2021-03-05 02:44:02.449907-05	36	15	25	NA	NA	NA	No
3979	2021-03-05 02:51:23.605598-05	45	21	26	-1.0921405	37.0208567	Gachororo -juja	Please specify below
3980	2021-03-05 02:51:23.620199-05	48	23	26	-1.0921405	37.0208567	they offered me enough space once when I was going to town.. sat on two seats 	Please specify below
3981	2021-03-05 02:51:23.626445-05	55	26	26	-1.0921405	37.0208567	non verbal 	Please specify below
3982	2021-03-05 02:51:23.632057-05	63	29	26	-1.0921405	37.0208567	I have never known someone to report to	Please specify below
3983	2021-03-05 02:51:23.63803-05	64	30	26	-1.0921405	37.0208567	negatively, the increased fare has really been the problem 	Please specify below
3984	2021-03-05 02:51:23.644117-05	65	31	26	-1.0921405	37.0208567	increase the front spacing between the seats to allow us have a comftable travel 	Please specify below
3985	2021-03-05 02:51:23.650099-05	6	1	26	-1.0921405	37.0208567	33	31-35
3986	2021-03-05 02:51:23.656259-05	1	2	26	-1.0921405	37.0208567	male	Male
3987	2021-03-05 02:51:23.662232-05	12	3	26	-1.0921405	37.0208567	motorbike 	Boda boda
3988	2021-03-05 02:51:23.668236-05	16	4	26	-1.0921405	37.0208567	it's what I can get coz I don't stay far from here and there are no matatus around 	Convenient
3989	2021-03-05 02:51:23.674211-05	43	20	26	-1.0921405	37.0208567	can't walk	Physically handicapped
3990	2021-03-05 02:51:23.680208-05	46	22	26	-1.0921405	37.0208567	some offer really appreciative transport 	Yes
3991	2021-03-05 02:51:23.686191-05	49	24	26	-1.0921405	37.0208567	yes.. 	Yes
3992	2021-03-05 02:51:23.692189-05	54	25	26	-1.0921405	37.0208567	rarely	A few times a year
3993	2021-03-05 02:51:23.698175-05	57	27	26	-1.0921405	37.0208567	the conductor 	Conductor
3994	2021-03-05 02:51:23.704173-05	62	28	26	-1.0921405	37.0208567	I didn't	No
3995	2021-03-05 03:32:01.257395-05	45	21	26	-1.0921412	37.0207664	Kariobangi -All soaps 	Please specify below
3996	2021-03-05 03:32:01.272078-05	48	23	26	-1.0921412	37.0207664	I got helped to board and to alight 	Please specify below
3997	2021-03-05 03:32:01.278005-05	55	26	26	-1.0921412	37.0207664	verbal.. I was shouted at to board fast or I'm left out	Please specify below
3998	2021-03-05 03:32:01.283999-05	63	29	26	-1.0921412	37.0207664	you just can't report	Please specify below
3999	2021-03-05 03:32:01.289971-05	64	30	26	-1.0921412	37.0207664	negative. the curfew rules sometimes leaves me  stranded since the vehicles are all rushing	Please specify below
4000	2021-03-05 03:32:01.296059-05	65	31	26	-1.0921412	37.0207664	Reduce the height of stairs to the vehicles for ease of boarding and alighting 	Please specify below
4001	2021-03-05 03:32:01.302012-05	8	1	26	-1.0921412	37.0207664	47	45-50
4002	2021-03-05 03:32:01.308098-05	2	2	26	-1.0921412	37.0207664	female 	Female
4003	2021-03-05 03:32:01.314151-05	11	3	26	-1.0921412	37.0207664	matatu 	Matatu
4004	2021-03-05 03:32:01.320152-05	15	4	26	-1.0921412	37.0207664	it's cheaper than others 	Cheap
4005	2021-03-05 03:32:01.326132-05	43	20	26	-1.0921412	37.0207664	can't walk	Physically handicapped
4006	2021-03-05 03:32:01.332133-05	46	22	26	-1.0921412	37.0207664	I have 	Yes
4007	2021-03-05 03:32:01.338104-05	49	24	26	-1.0921412	37.0207664	yeah	Yes
4008	2021-03-05 03:32:01.344106-05	54	25	26	-1.0921412	37.0207664	rarely	A few times a year
4009	2021-03-05 03:32:01.350075-05	58	27	26	-1.0921412	37.0207664	the stage attendants 	Kamagera or Stage attendants
4010	2021-03-05 03:32:01.356097-05	62	28	26	-1.0921412	37.0207664	I didnt	No
4011	2021-03-05 03:38:21.25542-05	45	21	26	-1.0914382	37.0216615	langata -town	Please specify below
4012	2021-03-05 03:38:21.268315-05	48	23	26	-1.0914382	37.0216615	talked to nicely in signs without discrimination 	Please specify below
4013	2021-03-05 03:38:21.274251-05	55	26	26	-1.0914382	37.0216615	non verbal	Please specify below
4014	2021-03-05 03:38:21.280538-05	63	29	26	-1.0914382	37.0216615	I just didn't know how to go about 	Please specify below
4015	2021-03-05 03:38:21.286215-05	64	30	26	-1.0914382	37.0216615	positively.. no one has to struggle talking with the mask on	Please specify below
4016	2021-03-05 03:38:21.292274-05	65	31	26	-1.0914382	37.0216615	educate the conductors and the drivers on how to communicate to the deaf 	Please specify below
4017	2021-03-05 03:38:21.298242-05	7	1	26	-1.0914382	37.0216615	40 years old 	36-40
4018	2021-03-05 03:38:21.304404-05	1	2	26	-1.0914382	37.0216615	male	Male
4019	2021-03-05 03:38:21.310379-05	11	3	26	-1.0914382	37.0216615	matatu	Matatu
4020	2021-03-05 03:38:21.316373-05	15	4	26	-1.0914382	37.0216615	it's cheap for me	Cheap
4021	2021-03-05 03:38:21.32236-05	42	20	26	-1.0914382	37.0216615	can't hear	Deaf or Hard of hearing
4022	2021-03-05 03:38:21.328352-05	46	22	26	-1.0914382	37.0216615	yes I have 	Yes
4023	2021-03-05 03:38:21.33433-05	49	24	26	-1.0914382	37.0216615	yes	Yes
4024	2021-03-05 03:38:21.34033-05	54	25	26	-1.0914382	37.0216615	rarely	A few times a year
4025	2021-03-05 03:38:21.346307-05	57	27	26	-1.0914382	37.0216615	the conductor	Conductor
4026	2021-03-05 03:38:21.35231-05	62	28	26	-1.0914382	37.0216615	I didnt	No
4027	2021-03-05 03:43:12.406123-05	45	21	26	-1.0914382	37.0216615	kawangware -town	Please specify below
4028	2021-03-05 03:43:12.417769-05	48	23	26	-1.0914382	37.0216615	I get helped to board severally 	Please specify below
4029	2021-03-05 03:43:12.423724-05	55	26	26	-1.0914382	37.0216615	verbal.. I was shouted at to alight quick rushing to the exit 	Please specify below
4030	2021-03-05 03:43:12.42978-05	63	29	26	-1.0914382	37.0216615	I saw no reason 	Please specify below
4031	2021-03-05 03:43:12.435786-05	64	30	26	-1.0914382	37.0216615	negatively... economically bad	Please specify below
4032	2021-03-05 03:43:12.441764-05	65	31	26	-1.0914382	37.0216615	encourage the dealers in transport to allow time to board and to alight 	Please specify below
4033	2021-03-05 03:43:12.447759-05	6	1	26	-1.0914382	37.0216615	32	31-35
4037	2021-03-05 03:43:12.490071-05	41	20	26	-1.0914382	37.0216615	can't see 	Visually impaired
4038	2021-03-05 03:43:12.49608-05	46	22	26	-1.0914382	37.0216615	yes	Yes
4039	2021-03-05 03:43:12.502052-05	49	24	26	-1.0914382	37.0216615	yes	Yes
4040	2021-03-05 03:43:12.508132-05	52	25	26	-1.0914382	37.0216615	in some occasions 	A few time a week
4041	2021-03-05 03:43:12.514106-05	60	27	26	-1.0914382	37.0216615	the people who were alighting with me	Other
4042	2021-03-05 03:43:12.520106-05	62	28	26	-1.0914382	37.0216615	I didn't 	No
4043	2021-03-05 03:51:28.344669-05	45	21	26	-1.0914361	37.0216641	githurai -town	Please specify below
4044	2021-03-05 03:51:28.353891-05	48	23	26	-1.0914361	37.0216641	I sometimes get allowed to board.. given enough time 	Please specify below
4045	2021-03-05 03:51:28.359789-05	55	26	26	-1.0914361	37.0216641	non verbal.i don't have a wheel chair so the dirt made people not to sit next to me and I ended up being forced to  pay for both the  seats 	Please specify below
4046	2021-03-05 03:51:28.365941-05	63	29	26	-1.0914361	37.0216641	I saw no reason to report 	Please specify below
4047	2021-03-05 03:51:28.371932-05	64	30	26	-1.0914361	37.0216641	positively.. the spacing in the sitting positions has not forced people not to seat far from me.. so we seat far from one another by default 	Please specify below
4048	2021-03-05 03:51:28.377909-05	65	31	26	-1.0914361	37.0216641	spacing... such that I don't have to sit near someone so much that they at uncomftable 	Please specify below
4049	2021-03-05 03:51:28.383902-05	8	1	26	-1.0914361	37.0216641	49	45-50
4050	2021-03-05 03:51:28.390062-05	1	2	26	-1.0914361	37.0216641	male	Male
4051	2021-03-05 03:51:28.396058-05	11	3	26	-1.0914361	37.0216641	matatu	Matatu
4052	2021-03-05 03:51:28.402026-05	15	4	26	-1.0914361	37.0216641	it's cheap 	Cheap
4053	2021-03-05 03:51:28.408023-05	43	20	26	-1.0914361	37.0216641	can't walk	Physically handicapped
4054	2021-03-05 03:51:28.414-05	46	22	26	-1.0914361	37.0216641	yes	Yes
4055	2021-03-05 03:51:28.420004-05	49	24	26	-1.0914361	37.0216641	yeah	Yes
4056	2021-03-05 03:51:28.426059-05	52	25	26	-1.0914361	37.0216641	in most occasions 	A few time a week
4057	2021-03-05 03:51:28.432055-05	60	27	26	-1.0914361	37.0216641	the conductor, the people I was travelling with	Other
4058	2021-03-05 03:51:28.438031-05	62	28	26	-1.0914361	37.0216641	I didn't 	No
4059	2021-03-05 03:56:11.853778-05	45	21	26	-1.0914444	37.0216541	Jogoo road -town	Please specify below
4060	2021-03-05 03:56:11.863546-05	48	23	26	-1.0914444	37.0216541	someone paid my fare 	Please specify below
4061	2021-03-05 03:56:11.869412-05	55	26	26	-1.0914444	37.0216541	non verbal. the car moved while I was alighting since I was slow.. almost broke my arm 	Please specify below
4062	2021-03-05 03:56:11.875497-05	63	29	26	-1.0914444	37.0216541	I couldn't 	Please specify below
4063	2021-03-05 03:56:11.881467-05	64	30	26	-1.0914444	37.0216541	negatively.... rush hours leaves me stranded since I  can't hurry and board 	Please specify below
4064	2021-03-05 03:56:11.887545-05	65	31	26	-1.0914444	37.0216541	educate them on how to treat us.. we are human and is not our wish that we are abit slow	Please specify below
4065	2021-03-05 03:56:11.89352-05	6	1	26	-1.0914444	37.0216541	35	31-35
4066	2021-03-05 03:56:11.899699-05	2	2	26	-1.0914444	37.0216541	female	Female
4067	2021-03-05 03:56:11.905644-05	11	3	26	-1.0914444	37.0216541	matatu 	Matatu
4068	2021-03-05 03:56:11.911658-05	16	4	26	-1.0914444	37.0216541	it's convenient 	Convenient
4069	2021-03-05 03:56:11.917635-05	43	20	26	-1.0914444	37.0216541	can't walk	Physically handicapped
4070	2021-03-05 03:56:11.923637-05	46	22	26	-1.0914444	37.0216541	yes	Yes
4071	2021-03-05 03:56:11.929602-05	49	24	26	-1.0914444	37.0216541	yes	Yes
4072	2021-03-05 03:56:11.935589-05	53	25	26	-1.0914444	37.0216541	rarely	A few times a month
4073	2021-03-05 03:56:11.94158-05	56	27	26	-1.0914444	37.0216541	driver	Driver
4074	2021-03-05 03:56:11.947577-05	62	28	26	-1.0914444	37.0216541	I didn't 	No
4075	2021-03-05 04:01:26.935964-05	45	21	26	-1.0917407	37.0213012	Pipeline -town	Please specify below
4076	2021-03-05 04:01:26.9509-05	48	23	26	-1.0917407	37.0213012	I get helped to board sometimes 	Please specify below
4077	2021-03-05 04:01:26.956784-05	55	26	26	-1.0917407	37.0213012	physical... the stage attendants pushed me to the vehicle I almost knocked the metallic door	Please specify below
4078	2021-03-05 04:01:26.962941-05	63	29	26	-1.0917407	37.0213012	I reported 	Please specify below
4079	2021-03-05 04:01:26.968911-05	64	30	26	-1.0917407	37.0213012	negatively in terms the fact that the fare prices were raised	Please specify below
4080	2021-03-05 04:01:26.974914-05	65	31	26	-1.0917407	37.0213012	encourage them to allow reservation of atleast 2 front seats for the disabled 	Please specify below
4081	2021-03-05 04:01:26.980892-05	7	1	26	-1.0917407	37.0213012	38	36-40
4082	2021-03-05 04:01:26.987045-05	1	2	26	-1.0917407	37.0213012	male	Male
4083	2021-03-05 04:01:26.993028-05	11	3	26	-1.0917407	37.0213012	matatu	Matatu
4084	2021-03-05 04:01:26.999005-05	16	4	26	-1.0917407	37.0213012	it's convenient 	Convenient
4085	2021-03-05 04:01:27.005178-05	41	20	26	-1.0917407	37.0213012	can't see	Visually impaired
4086	2021-03-05 04:01:27.010995-05	46	22	26	-1.0917407	37.0213012	yes	Yes
4087	2021-03-05 04:01:27.017057-05	49	24	26	-1.0917407	37.0213012	yes	Yes
4088	2021-03-05 04:01:27.023047-05	52	25	26	-1.0917407	37.0213012	many occasions 	A few time a week
4089	2021-03-05 04:01:27.029028-05	58	27	26	-1.0917407	37.0213012	stage attendants 	Kamagera or Stage attendants
4090	2021-03-05 04:01:27.035027-05	61	28	26	-1.0917407	37.0213012	I did reported 	Yes
4091	2021-03-05 04:06:31.806316-05	45	21	26	-1.0914382	37.0216615	Mathare-town 	Please specify below
4092	2021-03-05 04:06:31.817356-05	48	23	26	-1.0914382	37.0216615	sometimes am allowed not to pay when I  have nothing 	Please specify below
4093	2021-03-05 04:06:31.823257-05	55	26	26	-1.0914382	37.0216615	non verbal 	Please specify below
4094	2021-03-05 04:06:31.829403-05	63	29	26	-1.0914382	37.0216615	for no reason 	Please specify below
4095	2021-03-05 04:06:31.8354-05	64	30	26	-1.0914382	37.0216615	positive.the spacing is of great help 	Please specify below
4096	2021-03-05 04:06:31.841383-05	65	31	26	-1.0914382	37.0216615	spacing in the placement of seats such that I would position my seat in my wheel chair without having to hold it 	Please specify below
4097	2021-03-05 04:06:31.847366-05	5	1	26	-1.0914382	37.0216615	28	26-30
4098	2021-03-05 04:06:31.854179-05	1	2	26	-1.0914382	37.0216615	male	Male
4099	2021-03-05 04:06:31.860179-05	11	3	26	-1.0914382	37.0216615	matatu 	Matatu
4100	2021-03-05 04:06:31.866147-05	15	4	26	-1.0914382	37.0216615	it's cheap 	Cheap
4101	2021-03-05 04:06:31.872235-05	43	20	26	-1.0914382	37.0216615	can't walk	Physically handicapped
4102	2021-03-05 04:06:31.878206-05	46	22	26	-1.0914382	37.0216615	yes	Yes
4103	2021-03-05 04:06:31.884206-05	49	24	26	-1.0914382	37.0216615	yes	Yes
4104	2021-03-05 04:06:31.890189-05	52	25	26	-1.0914382	37.0216615	most occasions 	A few time a week
4105	2021-03-05 04:06:31.896193-05	57	27	26	-1.0914382	37.0216615	conductor	Conductor
4106	2021-03-05 04:06:31.902166-05	62	28	26	-1.0914382	37.0216615	I didn't 	No
4107	2021-03-05 04:13:48.642508-05	45	21	26	-1.0923756	37.020545	Kibera -town	Please specify below
4108	2021-03-05 04:13:48.652613-05	48	23	26	-1.0923756	37.020545	someone volunteered to pay my fare 	Please specify below
4109	2021-03-05 04:13:48.658531-05	55	26	26	-1.0923756	37.020545	physical... I couldn't hear or understand what was said and the stage attendants pushed me in due to my delay 	Please specify below
4110	2021-03-05 04:13:48.664603-05	63	29	26	-1.0923756	37.020545	just didn't 	Please specify below
4111	2021-03-05 04:13:48.67059-05	64	30	26	-1.0923756	37.020545	rush hour prices are too high for me... negatively 	Please specify below
4112	2021-03-05 04:13:48.676691-05	65	31	26	-1.0923756	37.020545	you can introduce some vehicles in the industry meant for the disabled such that everyone who works with it is well conversant with how to treat the disabled 	Please specify below
4113	2021-03-05 04:13:48.694632-05	5	1	26	-1.0923756	37.020545	30	26-30
4114	2021-03-05 04:13:48.700779-05	2	2	26	-1.0923756	37.020545	female 	Female
4115	2021-03-05 04:13:48.706758-05	11	3	26	-1.0923756	37.020545	matatu 	Matatu
4116	2021-03-05 04:13:48.712755-05	16	4	26	-1.0923756	37.020545	it's convenient 	Convenient
4117	2021-03-05 04:13:48.718729-05	42	20	26	-1.0923756	37.020545	can't hear	Deaf or Hard of hearing
4118	2021-03-05 04:13:48.724716-05	46	22	26	-1.0923756	37.020545	yes	Yes
4119	2021-03-05 04:13:48.730703-05	49	24	26	-1.0923756	37.020545	yes	Yes
4120	2021-03-05 04:13:48.736693-05	52	25	26	-1.0923756	37.020545	in several occasions 	A few time a week
4121	2021-03-05 04:13:48.7427-05	58	27	26	-1.0923756	37.020545	stage attendants 	Kamagera or Stage attendants
4122	2021-03-05 04:13:48.748683-05	62	28	26	-1.0923756	37.020545	I didn't 	No
4123	2021-03-05 04:18:52.442125-05	45	21	26	-1.0919634	37.0210359	Ngara -town	Please specify below
4124	2021-03-05 04:18:52.453437-05	48	23	26	-1.0919634	37.0210359	I was helped to board and to alight also 	Please specify below
4125	2021-03-05 04:18:52.459363-05	55	26	26	-1.0919634	37.0210359	verbal.. I was shouted at to alight fast and give space for others to alight	Please specify below
4126	2021-03-05 04:18:52.465403-05	63	29	26	-1.0919634	37.0210359	I saw no reason	Please specify below
4127	2021-03-05 04:18:52.471401-05	64	30	26	-1.0919634	37.0210359	negatively... sometimes the bus leaves me and goes with others for no reason 	Please specify below
4128	2021-03-05 04:18:52.477443-05	65	31	26	-1.0919634	37.0210359	encourage allowance of reserved seats for the disabled 	Please specify below
4129	2021-03-05 04:18:52.483456-05	8	1	26	-1.0919634	37.0210359	47	45-50
4130	2021-03-05 04:18:52.489587-05	2	2	26	-1.0919634	37.0210359	female 	Female
4131	2021-03-05 04:18:52.49558-05	11	3	26	-1.0919634	37.0210359	matatu	Matatu
4132	2021-03-05 04:18:52.501552-05	16	4	26	-1.0919634	37.0210359	it's convenient 	Convenient
4133	2021-03-05 04:18:52.507555-05	43	20	26	-1.0919634	37.0210359	NA	Physically handicapped
4134	2021-03-05 04:18:52.513535-05	46	22	26	-1.0919634	37.0210359	NA	Yes
4135	2021-03-05 04:18:52.519554-05	49	24	26	-1.0919634	37.0210359	yes	Yes
4136	2021-03-05 04:18:52.525505-05	53	25	26	-1.0919634	37.0210359	rarely	A few times a month
4137	2021-03-05 04:18:52.531502-05	57	27	26	-1.0919634	37.0210359	the conductor 	Conductor
4138	2021-03-05 04:18:52.537485-05	62	28	26	-1.0919634	37.0210359	no	No
4139	2021-03-05 04:22:22.394067-05	45	21	26	-1.0928716	37.0199542	Kabete -town 	Please specify below
4140	2021-03-05 04:22:22.407868-05	48	23	26	-1.0928716	37.0199542	I get helped to board and to alight 	Please specify below
4141	2021-03-05 04:22:22.41377-05	55	26	26	-1.0928716	37.0199542	I have never... so far	Please specify below
4142	2021-03-05 04:22:22.419929-05	63	29	26	-1.0928716	37.0199542	I haven't experienced any discrimination yet	Please specify below
4143	2021-03-05 04:22:22.425906-05	64	30	26	-1.0928716	37.0199542	negatively... high prices 	Please specify below
4144	2021-03-05 04:22:22.431898-05	65	31	26	-1.0928716	37.0199542	there should be an allowance of time to board and t alight 	Please specify below
4145	2021-03-05 04:22:22.437879-05	9	1	26	-1.0928716	37.0199542	NA	Above 50
4146	2021-03-05 04:22:22.444046-05	1	2	26	-1.0928716	37.0199542	NA	Male
4147	2021-03-05 04:22:22.450027-05	14	3	26	-1.0928716	37.0199542	NA	Other
4148	2021-03-05 04:22:22.456059-05	17	4	26	-1.0928716	37.0199542	NA	Other
4149	2021-03-05 04:22:22.461999-05	41	20	26	-1.0928716	37.0199542	NA	Visually impaired
4150	2021-03-05 04:22:22.468087-05	46	22	26	-1.0928716	37.0199542	NA	Yes
4151	2021-03-05 04:22:22.474055-05	50	24	26	-1.0928716	37.0199542	NA	No
4152	2021-03-05 04:22:22.480058-05	54	25	26	-1.0928716	37.0199542	NA	A few times a year
4153	2021-03-05 04:22:22.486026-05	60	27	26	-1.0928716	37.0199542	NA	Other
4154	2021-03-05 04:22:22.492039-05	62	28	26	-1.0928716	37.0199542	NA	No
4155	2021-03-05 06:02:34.284678-05	23	7	25	NA	NA	The boda rider kept asking me to push forward and he started asking me to marry him 	Please specify below
4156	2021-03-05 06:02:34.301743-05	28	10	25	NA	NA	No one to report it	Please specify below
4157	2021-03-05 06:02:34.307648-05	29	11	25	NA	NA	N/A	Please specify below
4158	2021-03-05 06:02:34.313614-05	32	13	25	NA	NA	N/A	Please specify below
4159	2021-03-05 06:02:34.319614-05	37	16	25	NA	NA	N/A	Please specify below
4160	2021-03-05 06:02:34.325576-05	38	17	25	NA	NA	3	Please specify below
4161	2021-03-05 06:02:34.331665-05	39	18	25	NA	NA	Twice	Please specify below
4162	2021-03-05 06:02:34.337644-05	40	19	25	NA	NA	Sensitization of what sexual harassment	Please specify below
4163	2021-03-05 06:02:34.34364-05	12	3	25	NA	NA	also private car	Boda boda
4164	2021-03-05 06:02:34.349612-05	16	4	25	NA	NA	Immediately	Convenient
4165	2021-03-05 06:02:34.355614-05	18	5	25	NA	NA	NA	Yes
4166	2021-03-05 06:02:34.36159-05	22	6	25	NA	NA	NA	Sexual advances
4167	2021-03-05 06:02:34.367589-05	25	8	25	NA	NA	NA	No
4168	2021-03-05 06:02:34.373661-05	27	9	25	NA	NA	NA	No
4169	2021-03-05 06:02:34.379658-05	31	12	25	NA	NA	NA	No
4170	2021-03-05 06:02:34.385632-05	34	14	25	NA	NA	N/A	No
4171	2021-03-05 06:02:34.391736-05	36	15	25	NA	NA	NA	No
4172	2021-03-05 06:02:34.397693-05	5	1	25	NA	NA	NA	26-30
4173	2021-03-05 06:02:34.403692-05	2	2	25	NA	NA	NA	Female
4174	2021-03-05 06:07:52.636098-05	23	7	25	-1.284479	36.7400812	We were in a cab and an acquaintance tried to put his hands in my skirt	Please specify below
4175	2021-03-05 06:07:52.645836-05	28	10	25	-1.284479	36.7400812	It would embarrass him and cause drama	Please specify below
4176	2021-03-05 06:07:52.651733-05	29	11	25	-1.284479	36.7400812	N/A	Please specify below
4177	2021-03-05 06:07:52.657725-05	32	13	25	-1.284479	36.7400812	N/A	Please specify below
4178	2021-03-05 06:07:52.663709-05	37	16	25	-1.284479	36.7400812	It doesn't make sense 	Please specify below
4179	2021-03-05 06:07:52.66971-05	38	17	25	-1.284479	36.7400812	N/A	Please specify below
4180	2021-03-05 06:07:52.67587-05	39	18	25	-1.284479	36.7400812	2	Please specify below
4181	2021-03-05 06:07:52.681826-05	40	19	25	-1.284479	36.7400812	People should be educated on sexual harassment 	Please specify below
4182	2021-03-05 06:07:52.687818-05	4	1	25	-1.284479	36.7400812	NA	18-25
4183	2021-03-05 06:07:52.693884-05	2	2	25	-1.284479	36.7400812	NA	Female
4184	2021-03-05 06:07:52.700056-05	16	4	25	-1.284479	36.7400812	NA	Convenient
4185	2021-03-05 06:07:52.74183-05	11	3	25	-1.284479	36.7400812	NA	Matatu
4186	2021-03-05 06:07:52.759752-05	18	5	25	-1.284479	36.7400812	NA	Yes
4187	2021-03-05 06:07:52.77772-05	20	6	25	-1.284479	36.7400812	NA	Physical touch
4188	2021-03-05 06:07:52.801654-05	24	8	25	-1.284479	36.7400812	NA	Yes
4189	2021-03-05 06:07:52.837597-05	27	9	25	-1.284479	36.7400812	NA	No
4190	2021-03-05 06:07:52.843582-05	31	12	25	-1.284479	36.7400812	NA	No
4191	2021-03-05 06:07:52.849558-05	34	14	25	-1.284479	36.7400812	NA	No
4192	2021-03-05 06:07:52.855557-05	36	15	25	-1.284479	36.7400812	NA	No
4193	2021-03-05 06:14:49.409341-05	23	7	23	-1.3109043	36.77542	During alighting, passenger rubbed himself on her	Please specify below
4194	2021-03-05 06:14:49.422589-05	28	10	23	-1.3109043	36.77542	She called him out	Please specify below
4195	2021-03-05 06:14:49.428474-05	29	11	23	-1.3109043	36.77542	NA	Please specify below
4196	2021-03-05 06:14:49.434454-05	32	13	23	-1.3109043	36.77542	NA	Please specify below
4197	2021-03-05 06:14:49.440453-05	37	16	23	-1.3109043	36.77542	NA	Please specify below
4198	2021-03-05 06:14:49.44642-05	38	17	23	-1.3109043	36.77542	Almost daily 	Please specify below
4199	2021-03-05 06:14:49.452511-05	39	18	23	-1.3109043	36.77542	About weekly 	Please specify below
4200	2021-03-05 06:14:49.458511-05	40	19	23	-1.3109043	36.77542	Reporting the perpetrators to the police 	Please specify below
4201	2021-03-05 06:14:49.46449-05	4	1	23	-1.3109043	36.77542	NA	18-25
4202	2021-03-05 06:14:49.470635-05	2	2	23	-1.3109043	36.77542	H	Female
4203	2021-03-05 06:14:49.476616-05	11	3	23	-1.3109043	36.77542	NA	Matatu
4204	2021-03-05 06:14:49.482614-05	16	4	23	-1.3109043	36.77542	NA	Convenient
4205	2021-03-05 06:14:49.488593-05	18	5	23	-1.3109043	36.77542	NA	Yes
4206	2021-03-05 06:14:49.494584-05	20	6	23	-1.3109043	36.77542	NA	Physical touch
4207	2021-03-05 06:14:49.500569-05	25	8	23	-1.3109043	36.77542	NA	No
4208	2021-03-05 06:14:49.506563-05	27	9	23	-1.3109043	36.77542	NA	No
4209	2021-03-05 06:14:49.512551-05	31	12	23	-1.3109043	36.77542	NA	No
4210	2021-03-05 06:14:49.518542-05	34	14	23	-1.3109043	36.77542	NA	No
4211	2021-03-05 06:14:49.524526-05	35	15	23	-1.3109043	36.77542	NA	Yes
4212	2021-03-05 06:16:40.449069-05	23	7	23	-1.3109042	36.7754206	NA	Please specify below
4213	2021-03-05 06:16:40.459423-05	28	10	23	-1.3109042	36.7754206	NA	Please specify below
4214	2021-03-05 06:16:40.465267-05	29	11	23	-1.3109042	36.7754206	NA	Please specify below
4215	2021-03-05 06:16:40.471256-05	32	13	23	-1.3109042	36.7754206	A passenger was verbally insulted by the tout	Please specify below
4216	2021-03-05 06:16:40.477248-05	37	16	23	-1.3109042	36.7754206	NA	Please specify below
4217	2021-03-05 06:16:40.483234-05	38	17	23	-1.3109042	36.7754206	Weekly 	Please specify below
4218	2021-03-05 06:16:40.489382-05	39	18	23	-1.3109042	36.7754206	Never	Please specify below
4219	2021-03-05 06:16:40.495377-05	40	19	23	-1.3109042	36.7754206	Train touts to be respectful 	Please specify below
4220	2021-03-05 06:16:40.501352-05	4	1	23	-1.3109042	36.7754206	NA	18-25
4221	2021-03-05 06:16:40.507456-05	2	2	23	-1.3109042	36.7754206	NA	Female
4222	2021-03-05 06:16:40.513405-05	11	3	23	-1.3109042	36.7754206	NA	Matatu
4223	2021-03-05 06:16:40.519398-05	16	4	23	-1.3109042	36.7754206	NA	Convenient
4224	2021-03-05 06:16:40.525378-05	21	6	23	-1.3109042	36.7754206	NA	Verbal
4225	2021-03-05 06:16:40.531378-05	19	5	23	-1.3109042	36.7754206	NA	No
4226	2021-03-05 06:16:40.537361-05	25	8	23	-1.3109042	36.7754206	NA	No
4227	2021-03-05 06:16:40.543356-05	27	9	23	-1.3109042	36.7754206	NA	No
4228	2021-03-05 06:16:40.54933-05	30	12	23	-1.3109042	36.7754206	NA	Yes
4229	2021-03-05 06:16:40.555333-05	34	14	23	-1.3109042	36.7754206	NA	No
4230	2021-03-05 06:16:40.561315-05	35	15	23	-1.3109042	36.7754206	NA	Yes
4231	2021-03-05 06:19:03.391252-05	23	7	23	-1.310901	36.7754236	A tout tried to make advances which upon getting rejected resulted to verbal insults 	Please specify below
4232	2021-03-05 06:19:03.403254-05	28	10	23	-1.310901	36.7754236	Did not see the importance 	Please specify below
4233	2021-03-05 06:19:03.409153-05	29	11	23	-1.310901	36.7754236	NA	Please specify below
4234	2021-03-05 06:19:03.415139-05	32	13	23	-1.310901	36.7754236	NA	Please specify below
4235	2021-03-05 06:19:03.421134-05	37	16	23	-1.310901	36.7754236	NA	Please specify below
4236	2021-03-05 06:19:03.427112-05	38	17	23	-1.310901	36.7754236	Na	Please specify below
4237	2021-03-05 06:19:03.433097-05	39	18	23	-1.310901	36.7754236	At least weekly 	Please specify below
4238	2021-03-05 06:19:03.439141-05	40	19	23	-1.310901	36.7754236	Reporting to the police	Please specify below
4239	2021-03-05 06:19:03.445069-05	8	1	23	-1.310901	36.7754236	41	45-50
4240	2021-03-05 06:19:03.451069-05	2	2	23	-1.310901	36.7754236	NA	Female
4241	2021-03-05 06:19:03.457046-05	11	3	23	-1.310901	36.7754236	NA	Matatu
4242	2021-03-05 06:19:03.463057-05	15	4	23	-1.310901	36.7754236	NA	Cheap
4243	2021-03-05 06:19:03.469022-05	18	5	23	-1.310901	36.7754236	NA	Yes
4244	2021-03-05 06:19:03.47502-05	22	6	23	-1.310901	36.7754236	A tout tried to make advances which upon getting rejected resulted to verbal insults 	Sexual advances
4245	2021-03-05 06:19:03.481089-05	25	8	23	-1.310901	36.7754236	NA	No
4246	2021-03-05 06:19:03.487079-05	27	9	23	-1.310901	36.7754236	NA	No
4247	2021-03-05 06:19:03.493068-05	34	14	23	-1.310901	36.7754236	NA	No
4248	2021-03-05 06:19:03.499055-05	31	12	23	-1.310901	36.7754236	NA	No
4249	2021-03-05 06:19:03.505033-05	35	15	23	-1.310901	36.7754236	NA	Yes
4250	2021-03-05 06:32:15.028935-05	23	7	23	-1.3109101	36.7754175	NA	Please specify below
4251	2021-03-05 06:32:15.038917-05	28	10	23	-1.3109101	36.7754175	NA	Please specify below
4252	2021-03-05 06:32:15.044777-05	29	11	23	-1.3109101	36.7754175	No	Please specify below
4253	2021-03-05 06:32:15.050783-05	32	13	23	-1.3109101	36.7754175	NW	Please specify below
4254	2021-03-05 06:32:15.056746-05	37	16	23	-1.3109101	36.7754175	NA	Please specify below
4255	2021-03-05 06:32:15.062741-05	38	17	23	-1.3109101	36.7754175	NA	Please specify below
4339	2021-03-05 06:55:20.001149-05	21	6	23	-1.3109665	36.7747907	None 	Verbal
4256	2021-03-05 06:32:15.068831-05	39	18	23	-1.3109101	36.7754175	Na	Please specify below
4257	2021-03-05 06:32:15.07482-05	40	19	23	-1.3109101	36.7754175	Na	Please specify below
4258	2021-03-05 06:32:15.080784-05	4	1	23	-1.3109101	36.7754175	NA	18-25
4259	2021-03-05 06:32:15.086877-05	2	2	23	-1.3109101	36.7754175	NA	Female
4260	2021-03-05 06:32:15.092844-05	11	3	23	-1.3109101	36.7754175	NA	Matatu
4261	2021-03-05 06:32:15.098853-05	15	4	23	-1.3109101	36.7754175	NA	Cheap
4262	2021-03-05 06:32:15.104921-05	19	5	23	-1.3109101	36.7754175	NA	No
4263	2021-03-05 06:32:15.110901-05	25	8	23	-1.3109101	36.7754175	NA	No
4264	2021-03-05 06:32:15.116878-05	27	9	23	-1.3109101	36.7754175	NA	No
4265	2021-03-05 06:32:15.122875-05	31	12	23	-1.3109101	36.7754175	NA	No
4266	2021-03-05 06:32:15.128858-05	34	14	23	-1.3109101	36.7754175	NA	No
4267	2021-03-05 06:32:15.134866-05	35	15	23	-1.3109101	36.7754175	NA	Yes
4268	2021-03-05 06:32:15.140833-05	21	6	23	-1.3109101	36.7754175	None	Verbal
4269	2021-03-05 06:46:48.732479-05	23	7	23	-1.3109091	36.7754158	NA	Please specify below
4270	2021-03-05 06:46:48.748969-05	28	10	23	-1.3109091	36.7754158	Na	Please specify below
4271	2021-03-05 06:46:48.754866-05	29	11	23	-1.3109091	36.7754158	Na	Please specify below
4272	2021-03-05 06:46:48.760849-05	32	13	23	-1.3109091	36.7754158	A passenger was assaulted by another passenger. 	Please specify below
4273	2021-03-05 06:46:48.766818-05	37	16	23	-1.3109091	36.7754158	Na	Please specify below
4274	2021-03-05 06:46:48.77281-05	38	17	23	-1.3109091	36.7754158	Almost weekly 	Please specify below
4275	2021-03-05 06:46:48.778983-05	39	18	23	-1.3109091	36.7754158	Na	Please specify below
4276	2021-03-05 06:46:48.784953-05	40	19	23	-1.3109091	36.7754158	Na	Please specify below
4277	2021-03-05 06:46:48.790954-05	4	1	23	-1.3109091	36.7754158	NA	18-25
4278	2021-03-05 06:46:48.797006-05	2	2	23	-1.3109091	36.7754158	NA	Female
4279	2021-03-05 06:46:48.803018-05	11	3	23	-1.3109091	36.7754158	NA	Matatu
4280	2021-03-05 06:46:48.808982-05	16	4	23	-1.3109091	36.7754158	NA	Convenient
4281	2021-03-05 06:46:48.814988-05	19	5	23	-1.3109091	36.7754158	NA	No
4282	2021-03-05 06:46:48.820964-05	21	6	23	-1.3109091	36.7754158	None 	Verbal
4283	2021-03-05 06:46:48.826962-05	25	8	23	-1.3109091	36.7754158	NA	No
4284	2021-03-05 06:46:48.832932-05	27	9	23	-1.3109091	36.7754158	NA	No
4285	2021-03-05 06:46:48.838936-05	30	12	23	-1.3109091	36.7754158	NA	Yes
4286	2021-03-05 06:46:48.84492-05	35	15	23	-1.3109091	36.7754158	NA	Yes
4287	2021-03-05 06:46:48.850899-05	34	14	23	-1.3109091	36.7754158	NA	No
4288	2021-03-05 06:50:59.185751-05	23	7	25	-1.2865317	36.7418775	N/A	Please specify below
4289	2021-03-05 06:50:59.202143-05	28	10	25	-1.2865317	36.7418775	N/A	Please specify below
4290	2021-03-05 06:50:59.208022-05	29	11	25	-1.2865317	36.7418775	no	Please specify below
4291	2021-03-05 06:50:59.21397-05	32	13	25	-1.2865317	36.7418775	N/A	Please specify below
4292	2021-03-05 06:50:59.219976-05	37	16	25	-1.2865317	36.7418775	I would report to the police 	Please specify below
4293	2021-03-05 06:50:59.225957-05	38	17	25	-1.2865317	36.7418775	None	Please specify below
4294	2021-03-05 06:50:59.232037-05	39	18	25	-1.2865317	36.7418775	None	Please specify below
4295	2021-03-05 06:50:59.238002-05	40	19	25	-1.2865317	36.7418775	No	Please specify below
4296	2021-03-05 06:50:59.244087-05	8	1	25	-1.2865317	36.7418775	NA	45-50
4297	2021-03-05 06:50:59.250149-05	2	2	25	-1.2865317	36.7418775	NA	Female
4298	2021-03-05 06:50:59.256144-05	11	3	25	-1.2865317	36.7418775	NA	Matatu
4299	2021-03-05 06:50:59.26212-05	15	4	25	-1.2865317	36.7418775	NA	Cheap
4300	2021-03-05 06:50:59.268123-05	19	5	25	-1.2865317	36.7418775	NA	No
4301	2021-03-05 06:50:59.274109-05	21	6	25	-1.2865317	36.7418775	None	Verbal
4302	2021-03-05 06:50:59.280097-05	25	8	25	-1.2865317	36.7418775	NA	No
4303	2021-03-05 06:50:59.286072-05	27	9	25	-1.2865317	36.7418775	NA	No
4304	2021-03-05 06:50:59.292076-05	31	12	25	-1.2865317	36.7418775	NA	No
4305	2021-03-05 06:50:59.298064-05	34	14	25	-1.2865317	36.7418775	NA	No
4306	2021-03-05 06:50:59.304056-05	35	15	25	-1.2865317	36.7418775	NA	Yes
4307	2021-03-05 06:53:38.677505-05	23	7	23	-1.31099	36.7746991	NA	Please specify below
4308	2021-03-05 06:53:38.694383-05	28	10	23	-1.31099	36.7746991	Na	Please specify below
4309	2021-03-05 06:53:38.700313-05	29	11	23	-1.31099	36.7746991	Na	Please specify below
4310	2021-03-05 06:53:38.706357-05	32	13	23	-1.31099	36.7746991	Na	Please specify below
4311	2021-03-05 06:53:38.712362-05	37	16	23	-1.31099	36.7746991	Na	Please specify below
4312	2021-03-05 06:53:38.718335-05	38	17	23	-1.31099	36.7746991	Na	Please specify below
4313	2021-03-05 06:53:38.724345-05	39	18	23	-1.31099	36.7746991	Na	Please specify below
4314	2021-03-05 06:53:38.73031-05	40	19	23	-1.31099	36.7746991	Praying because some of these events are spiritual 	Please specify below
4315	2021-03-05 06:53:38.736308-05	7	1	23	-1.31099	36.7746991	NA	36-40
4316	2021-03-05 06:53:38.742287-05	11	3	23	-1.31099	36.7746991	NA	Matatu
4317	2021-03-05 06:53:38.748287-05	16	4	23	-1.31099	36.7746991	NA	Convenient
4318	2021-03-05 06:53:38.754264-05	19	5	23	-1.31099	36.7746991	NA	No
4319	2021-03-05 06:53:38.760266-05	21	6	23	-1.31099	36.7746991	None 	Verbal
4320	2021-03-05 06:53:38.766256-05	25	8	23	-1.31099	36.7746991	NA	No
4321	2021-03-05 06:53:38.772242-05	27	9	23	-1.31099	36.7746991	NA	No
4322	2021-03-05 06:53:38.77822-05	31	12	23	-1.31099	36.7746991	NA	No
4323	2021-03-05 06:53:38.784217-05	34	14	23	-1.31099	36.7746991	NA	No
4324	2021-03-05 06:53:38.790283-05	35	15	23	-1.31099	36.7746991	NA	Yes
4325	2021-03-05 06:53:38.796292-05	2	2	23	-1.31099	36.7746991	NA	Female
4326	2021-03-05 06:55:19.916585-05	23	7	23	-1.3109665	36.7747907	NA	Please specify below
4327	2021-03-05 06:55:19.929301-05	28	10	23	-1.3109665	36.7747907	Na	Please specify below
4328	2021-03-05 06:55:19.935222-05	29	11	23	-1.3109665	36.7747907	NA	Please specify below
4329	2021-03-05 06:55:19.941181-05	32	13	23	-1.3109665	36.7747907	Na	Please specify below
4330	2021-03-05 06:55:19.947173-05	37	16	23	-1.3109665	36.7747907	Na	Please specify below
4331	2021-03-05 06:55:19.95315-05	38	17	23	-1.3109665	36.7747907	Na	Please specify below
4332	2021-03-05 06:55:19.959154-05	39	18	23	-1.3109665	36.7747907	Na	Please specify below
4333	2021-03-05 06:55:19.965132-05	40	19	23	-1.3109665	36.7747907	Women should dress appropriately 	Please specify below
4334	2021-03-05 06:55:19.971118-05	4	1	23	-1.3109665	36.7747907	NA	18-25
4335	2021-03-05 06:55:19.977108-05	2	2	23	-1.3109665	36.7747907	H	Female
4336	2021-03-05 06:55:19.983188-05	11	3	23	-1.3109665	36.7747907	NA	Matatu
4337	2021-03-05 06:55:19.98917-05	16	4	23	-1.3109665	36.7747907	NA	Convenient
4338	2021-03-05 06:55:19.995168-05	19	5	23	-1.3109665	36.7747907	NA	No
4340	2021-03-05 06:55:20.007226-05	25	8	23	-1.3109665	36.7747907	NA	No
4341	2021-03-05 06:55:20.013209-05	27	9	23	-1.3109665	36.7747907	NA	No
4342	2021-03-05 06:55:20.019478-05	31	12	23	-1.3109665	36.7747907	NA	No
4343	2021-03-05 06:55:20.025186-05	34	14	23	-1.3109665	36.7747907	NA	No
4344	2021-03-05 06:55:20.031178-05	36	15	23	-1.3109665	36.7747907	NA	No
4345	2021-03-05 07:01:23.317719-05	23	7	25	-1.2896751	36.7453734	We were traveling and the bus was full so I was told to seat on my uncles lap. He started touching me just after the bus started moving 	Please specify below
4346	2021-03-05 07:01:23.334334-05	28	10	25	-1.2896751	36.7453734	I didn't know what to say 	Please specify below
4347	2021-03-05 07:01:23.340247-05	29	11	25	-1.2896751	36.7453734	N/A	Please specify below
4348	2021-03-05 07:01:23.346214-05	32	13	25	-1.2896751	36.7453734	N/A	Please specify below
4349	2021-03-05 07:01:23.352211-05	37	16	25	-1.2896751	36.7453734	I don't know 	Please specify below
4350	2021-03-05 07:01:23.358187-05	38	17	25	-1.2896751	36.7453734	none 	Please specify below
4351	2021-03-05 07:01:23.364286-05	39	18	25	-1.2896751	36.7453734	Once	Please specify below
4352	2021-03-05 07:01:23.370251-05	40	19	25	-1.2896751	36.7453734	People should speak up	Please specify below
4353	2021-03-05 07:01:23.376249-05	3	1	25	-1.2896751	36.7453734	NA	Below 18
4354	2021-03-05 07:01:23.382393-05	2	2	25	-1.2896751	36.7453734	NA	Female
4355	2021-03-05 07:01:23.388389-05	11	3	25	-1.2896751	36.7453734	Bus	Matatu
4356	2021-03-05 07:01:23.394366-05	15	4	25	-1.2896751	36.7453734	NA	Cheap
4357	2021-03-05 07:01:23.400382-05	18	5	25	-1.2896751	36.7453734	NA	Yes
4358	2021-03-05 07:01:23.406346-05	20	6	25	-1.2896751	36.7453734	NA	Physical touch
4359	2021-03-05 07:01:23.412361-05	24	8	25	-1.2896751	36.7453734	NA	Yes
4360	2021-03-05 07:01:23.41832-05	27	9	25	-1.2896751	36.7453734	NA	No
4361	2021-03-05 07:01:23.424324-05	31	12	25	-1.2896751	36.7453734	NA	No
4362	2021-03-05 07:01:23.430316-05	34	14	25	-1.2896751	36.7453734	B	No
4363	2021-03-05 07:01:23.436305-05	36	15	25	-1.2896751	36.7453734	NA	No
4364	2021-03-05 07:14:14.209394-05	23	7	23	-1.3110296	36.7751123	Na	Please specify below
4365	2021-03-05 07:14:14.223014-05	28	10	23	-1.3110296	36.7751123	Felt it wouldn't help	Please specify below
4366	2021-03-05 07:14:14.228898-05	29	11	23	-1.3110296	36.7751123	Na	Please specify below
4367	2021-03-05 07:14:14.234885-05	32	13	23	-1.3110296	36.7751123	A woman was kicked out of a matatu after turning down a tout	Please specify below
4368	2021-03-05 07:14:14.240864-05	37	16	23	-1.3110296	36.7751123	Na	Please specify below
4369	2021-03-05 07:14:14.246862-05	38	17	23	-1.3110296	36.7751123	Weekly 	Please specify below
4370	2021-03-05 07:14:14.253016-05	39	18	23	-1.3110296	36.7751123	NA	Please specify below
4371	2021-03-05 07:14:14.259008-05	40	19	23	-1.3110296	36.7751123	Training the touts in their SACCOs	Please specify below
4372	2021-03-05 07:14:14.264981-05	5	1	23	-1.3110296	36.7751123	NA	26-30
4373	2021-03-05 07:14:14.271061-05	2	2	23	-1.3110296	36.7751123	NA	Female
4374	2021-03-05 07:14:14.277054-05	11	3	23	-1.3110296	36.7751123	NA	Matatu
4375	2021-03-05 07:14:14.283041-05	15	4	23	-1.3110296	36.7751123	NA	Cheap
4376	2021-03-05 07:14:14.289054-05	18	5	23	-1.3110296	36.7751123	NA	Yes
4377	2021-03-05 07:14:14.29503-05	20	6	23	-1.3110296	36.7751123	NA	Physical touch
4378	2021-03-05 07:14:14.30101-05	25	8	23	-1.3110296	36.7751123	NA	No
4379	2021-03-05 07:14:14.307094-05	27	9	23	-1.3110296	36.7751123	NA	No
4380	2021-03-05 07:14:14.313148-05	30	12	23	-1.3110296	36.7751123	NA	Yes
4381	2021-03-05 07:14:14.319126-05	34	14	23	-1.3110296	36.7751123	NA	No
4382	2021-03-05 07:14:14.325107-05	35	15	23	-1.3110296	36.7751123	NA	Yes
4383	2021-03-05 07:16:14.330474-05	23	7	23	-1.3110297	36.7751113	Na	Please specify below
4384	2021-03-05 07:16:14.342696-05	28	10	23	-1.3110297	36.7751113	Na	Please specify below
4385	2021-03-05 07:16:14.348685-05	29	11	23	-1.3110297	36.7751113	Na	Please specify below
4386	2021-03-05 07:16:14.354661-05	32	13	23	-1.3110297	36.7751113	Verbal assaults by touts in a terminus 	Please specify below
4387	2021-03-05 07:16:14.360646-05	37	16	23	-1.3110297	36.7751113	The police would need a bribe to act on the case	Please specify below
4388	2021-03-05 07:16:14.366635-05	38	17	23	-1.3110297	36.7751113	Daily	Please specify below
4389	2021-03-05 07:16:14.372714-05	39	18	23	-1.3110297	36.7751113	Na	Please specify below
4390	2021-03-05 07:16:14.378697-05	40	19	23	-1.3110297	36.7751113	Na	Please specify below
4391	2021-03-05 07:16:14.384679-05	6	1	23	-1.3110297	36.7751113	NA	31-35
4392	2021-03-05 07:16:14.390759-05	2	2	23	-1.3110297	36.7751113	T	Female
4393	2021-03-05 07:16:14.396828-05	16	4	23	-1.3110297	36.7751113	NA	Convenient
4394	2021-03-05 07:16:14.402812-05	19	5	23	-1.3110297	36.7751113	NA	No
4395	2021-03-05 07:16:14.408798-05	25	8	23	-1.3110297	36.7751113	NA	No
4396	2021-03-05 07:16:14.414786-05	27	9	23	-1.3110297	36.7751113	NA	No
4397	2021-03-05 07:16:14.420774-05	30	12	23	-1.3110297	36.7751113	NA	Yes
4398	2021-03-05 07:16:14.426757-05	34	14	23	-1.3110297	36.7751113	NA	No
4399	2021-03-05 07:16:14.432758-05	36	15	23	-1.3110297	36.7751113	NA	No
4400	2021-03-05 07:16:14.438736-05	21	6	23	-1.3110297	36.7751113	Na	Verbal
4401	2021-03-05 07:16:14.444724-05	11	3	23	-1.3110297	36.7751113	NA	Matatu
4402	2021-03-05 07:17:53.141536-05	23	7	23	-1.311029	36.7751122	A passenger came onto her	Please specify below
4403	2021-03-05 07:17:53.160367-05	28	10	23	-1.311029	36.7751122	Na	Please specify below
4404	2021-03-05 07:17:53.165409-05	29	11	23	-1.311029	36.7751122	Na	Please specify below
4405	2021-03-05 07:17:53.17138-05	32	13	23	-1.311029	36.7751122	Na	Please specify below
4406	2021-03-05 07:17:53.177445-05	37	16	23	-1.311029	36.7751122	Na	Please specify below
4407	2021-03-05 07:17:53.183442-05	38	17	23	-1.311029	36.7751122	Na	Please specify below
4408	2021-03-05 07:17:53.189407-05	39	18	23	-1.311029	36.7751122	Daily	Please specify below
4409	2021-03-05 07:17:53.195409-05	40	19	23	-1.311029	36.7751122	None	Please specify below
4410	2021-03-05 07:17:53.201727-05	7	1	23	-1.311029	36.7751122	NA	36-40
4411	2021-03-05 07:17:53.20739-05	2	2	23	-1.311029	36.7751122	NA	Female
4412	2021-03-05 07:17:53.213347-05	11	3	23	-1.311029	36.7751122	NA	Matatu
4413	2021-03-05 07:17:53.219357-05	16	4	23	-1.311029	36.7751122	NA	Convenient
4414	2021-03-05 07:17:53.225332-05	18	5	23	-1.311029	36.7751122	NA	Yes
4415	2021-03-05 07:17:53.231339-05	22	6	23	-1.311029	36.7751122	NA	Sexual advances
4416	2021-03-05 07:17:53.237342-05	25	8	23	-1.311029	36.7751122	NA	No
4417	2021-03-05 07:17:53.243305-05	26	9	23	-1.311029	36.7751122	NA	Yes
4418	2021-03-05 07:17:53.249291-05	31	12	23	-1.311029	36.7751122	NA	No
4419	2021-03-05 07:17:53.255372-05	34	14	23	-1.311029	36.7751122	NA	No
4420	2021-03-05 07:17:53.261351-05	35	15	23	-1.311029	36.7751122	NA	Yes
4421	2021-03-05 08:00:57.642299-05	45	21	18	-1.2365736	36.8862281	Kayole	Please specify below
4422	2021-03-05 08:00:57.657441-05	48	23	18	-1.2365736	36.8862281	The conductor lets me board the matatu first	Please specify below
4423	2021-03-05 08:00:57.663381-05	55	26	18	-1.2365736	36.8862281	verbal. He called me a nuisance and said I was causing traffic	Please specify below
4424	2021-03-05 08:00:57.66941-05	63	29	18	-1.2365736	36.8862281	Am a survivor you learn to ignore such people	Please specify below
4425	2021-03-05 08:00:57.675439-05	64	30	18	-1.2365736	36.8862281	negatively. the prices of travel even a short distance has increased	Please specify below
4426	2021-03-05 08:00:57.681471-05	65	31	18	-1.2365736	36.8862281	Have special seats for Disabled people	Please specify below
4427	2021-03-05 08:00:57.687472-05	5	1	18	-1.2365736	36.8862281	28	26-30
4428	2021-03-05 08:00:57.693525-05	2	2	18	-1.2365736	36.8862281	female	Female
4429	2021-03-05 08:00:57.699518-05	11	3	18	-1.2365736	36.8862281	matatu	Matatu
4430	2021-03-05 08:00:57.706248-05	15	4	18	-1.2365736	36.8862281	cheap	Cheap
4431	2021-03-05 08:00:57.712246-05	43	20	18	-1.2365736	36.8862281	physically handicapped	Physically handicapped
4432	2021-03-05 08:00:57.718224-05	46	22	18	-1.2365736	36.8862281	Yes	Yes
4433	2021-03-05 08:00:57.724208-05	49	24	18	-1.2365736	36.8862281	Yes	Yes
4434	2021-03-05 08:00:57.730198-05	54	25	18	-1.2365736	36.8862281	a few times a year	A few times a year
4435	2021-03-05 08:00:57.736188-05	57	27	18	-1.2365736	36.8862281	conductor	Conductor
4436	2021-03-05 08:00:57.742169-05	62	28	18	-1.2365736	36.8862281	No	No
4437	2021-03-05 08:07:30.427724-05	45	21	18	-1.2344522	36.8849562	Thika road	Please specify below
4438	2021-03-05 08:07:30.437386-05	48	23	18	-1.2344522	36.8849562	majority of the conductors are nice like they help me with my bags and also show me where to place my crutches	Please specify below
4439	2021-03-05 08:07:30.443348-05	55	26	18	-1.2344522	36.8849562	non verbal. the conductor said the matatu was full yet I could see empty seats	Please specify below
4440	2021-03-05 08:07:30.449399-05	63	29	18	-1.2344522	36.8849562	The process of reporting is too long	Please specify below
4441	2021-03-05 08:07:30.455398-05	64	30	18	-1.2344522	36.8849562	negatively. fare is more than before	Please specify below
4442	2021-03-05 08:07:30.461458-05	65	31	18	-1.2344522	36.8849562	I feel like change is personal so if someone learns to treat another person well then we won't have the discrimination that we experience	Please specify below
4443	2021-03-05 08:07:30.467459-05	8	1	18	-1.2344522	36.8849562	47	45-50
4444	2021-03-05 08:07:30.473517-05	1	2	18	-1.2344522	36.8849562	male	Male
4445	2021-03-05 08:07:30.479515-05	11	3	18	-1.2344522	36.8849562	matatu	Matatu
4446	2021-03-05 08:07:30.485573-05	15	4	18	-1.2344522	36.8849562	cheap	Cheap
4447	2021-03-05 08:07:30.491577-05	43	20	18	-1.2344522	36.8849562	physically handicapped	Physically handicapped
4448	2021-03-05 08:07:30.497552-05	46	22	18	-1.2344522	36.8849562	Yes	Yes
4449	2021-03-05 08:07:30.503559-05	49	24	18	-1.2344522	36.8849562	Yes	Yes
4450	2021-03-05 08:07:30.509525-05	54	25	18	-1.2344522	36.8849562	A few times a year	A few times a year
4451	2021-03-05 08:07:30.515532-05	57	27	18	-1.2344522	36.8849562	conductor	Conductor
4452	2021-03-05 08:07:30.5215-05	62	28	18	-1.2344522	36.8849562	No	No
4453	2021-03-05 08:13:59.53804-05	45	21	18	-1.2345516	36.8850538	Kayole	Please specify below
4454	2021-03-05 08:13:59.552402-05	48	23	18	-1.2345516	36.8850538	The driver allowed me to cycle ahead of him so I could use the light from the bus	Please specify below
4455	2021-03-05 08:13:59.558268-05	55	26	18	-1.2345516	36.8850538	non verbal. I was once asked to pay double price because of my wheelchair	Please specify below
4456	2021-03-05 08:13:59.564349-05	63	29	18	-1.2345516	36.8850538	I just got used to such treatment	Please specify below
4457	2021-03-05 08:13:59.570402-05	64	30	18	-1.2345516	36.8850538	positively at first because the number of cars on the road reduced	Please specify below
4458	2021-03-05 08:13:59.57641-05	65	31	18	-1.2345516	36.8850538	People should be more kind to people living with disabilities	Please specify below
4459	2021-03-05 08:13:59.582385-05	8	1	18	-1.2345516	36.8850538	50	45-50
4460	2021-03-05 08:13:59.588459-05	1	2	18	-1.2345516	36.8850538	Male	Male
4461	2021-03-05 08:13:59.594522-05	14	3	18	-1.2345516	36.8850538	My wheelchair	Other
4462	2021-03-05 08:13:59.600509-05	16	4	18	-1.2345516	36.8850538	Convenient	Convenient
4463	2021-03-05 08:13:59.606581-05	43	20	18	-1.2345516	36.8850538	physically handicapped	Physically handicapped
4464	2021-03-05 08:13:59.612577-05	46	22	18	-1.2345516	36.8850538	Yes	Yes
4465	2021-03-05 08:13:59.618558-05	49	24	18	-1.2345516	36.8850538	Yes	Yes
4466	2021-03-05 08:13:59.624543-05	54	25	18	-1.2345516	36.8850538	a few times a year	A few times a year
4467	2021-03-05 08:13:59.630528-05	57	27	18	-1.2345516	36.8850538	conductor	Conductor
4468	2021-03-05 08:13:59.636541-05	62	28	18	-1.2345516	36.8850538	No	No
4469	2021-03-05 08:19:23.125769-05	45	21	18	-1.2365718	36.8862346	juja road	Please specify below
4470	2021-03-05 08:19:23.141513-05	48	23	18	-1.2365718	36.8862346	The driver called out a passenger who was refusing to seat next to me because of my disabilities	Please specify below
4471	2021-03-05 08:19:23.147409-05	55	26	18	-1.2365718	36.8862346	verbal. she said I don't seat with people like you	Please specify below
4472	2021-03-05 08:19:23.15353-05	63	29	18	-1.2365718	36.8862346	The other passengers put her in her place so that's enough for me	Please specify below
4473	2021-03-05 08:19:23.159524-05	64	30	18	-1.2365718	36.8862346	negatively. Economy is hard so prices have spiked including fare	Please specify below
4474	2021-03-05 08:19:23.1655-05	65	31	18	-1.2365718	36.8862346	Have discounted prices for people dealing with disabilities	Please specify below
4475	2021-03-05 08:19:23.171498-05	9	1	18	-1.2365718	36.8862346	52	Above 50
4476	2021-03-05 08:19:23.17766-05	1	2	18	-1.2365718	36.8862346	male	Male
4477	2021-03-05 08:19:23.183645-05	14	3	18	-1.2365718	36.8862346	wheelchair	Other
4478	2021-03-05 08:19:23.189627-05	16	4	18	-1.2365718	36.8862346	convenient	Convenient
4479	2021-03-05 08:19:23.195707-05	43	20	18	-1.2365718	36.8862346	physically handicapped	Physically handicapped
4480	2021-03-05 08:19:23.20168-05	46	22	18	-1.2365718	36.8862346	Yes	Yes
4481	2021-03-05 08:19:23.207674-05	49	24	18	-1.2365718	36.8862346	Yes	Yes
4482	2021-03-05 08:19:23.21366-05	54	25	18	-1.2365718	36.8862346	A few times a year	A few times a year
4483	2021-03-05 08:19:23.219654-05	60	27	18	-1.2365718	36.8862346	passenger	Other
4484	2021-03-05 08:19:23.225632-05	62	28	18	-1.2365718	36.8862346	No	No
4485	2021-03-05 08:32:39.090778-05	23	7	25	-1.2874162	36.7485987	I had carried some drunk ladies from an event and one sat at the front and kept trying to touch my leg	Please specify below
4642	2021-03-06 03:03:14.725527-05	16	4	23	-1.3098594	36.7785279	NA	Convenient
4486	2021-03-05 08:32:39.105792-05	28	10	25	-1.2874162	36.7485987	Report to who now? I would get more embarrassed	Please specify below
4487	2021-03-05 08:32:39.111705-05	29	11	25	-1.2874162	36.7485987	N/A	Please specify below
4488	2021-03-05 08:32:39.117659-05	32	13	25	-1.2874162	36.7485987	Female drunk passengers normally get harassed by their friends but they don't say anything	Please specify below
4489	2021-03-05 08:32:39.123752-05	37	16	25	-1.2874162	36.7485987	I don't think we are at that point in our society yet	Please specify below
4490	2021-03-05 08:32:39.129721-05	38	17	25	-1.2874162	36.7485987	like 5 times	Please specify below
4491	2021-03-05 08:32:39.135805-05	39	18	25	-1.2874162	36.7485987	Once	Please specify below
4492	2021-03-05 08:32:39.141784-05	40	19	25	-1.2874162	36.7485987	Having clear boundaries and being stern when handling ladies especially those who are drunk	Please specify below
4493	2021-03-05 08:32:39.147771-05	5	1	25	-1.2874162	36.7485987	30	26-30
4494	2021-03-05 08:32:39.153908-05	1	2	25	-1.2874162	36.7485987	NA	Male
4495	2021-03-05 08:32:39.159904-05	10	3	25	-1.2874162	36.7485987	NA	Private Car
4496	2021-03-05 08:32:39.165897-05	16	4	25	-1.2874162	36.7485987	I am a taxi driver	Convenient
4497	2021-03-05 08:32:39.171892-05	22	6	25	-1.2874162	36.7485987	N	Sexual advances
4498	2021-03-05 08:32:39.177875-05	18	5	25	-1.2874162	36.7485987	NA	Yes
4499	2021-03-05 08:32:39.183865-05	25	8	25	-1.2874162	36.7485987	NA	No
4500	2021-03-05 08:32:39.189849-05	27	9	25	-1.2874162	36.7485987	NA	No
4501	2021-03-05 08:32:39.195825-05	30	12	25	-1.2874162	36.7485987	NA	Yes
4502	2021-03-05 08:32:39.201808-05	34	14	25	-1.2874162	36.7485987	NA	No
4503	2021-03-05 08:32:39.207818-05	36	15	25	-1.2874162	36.7485987	NA	No
4504	2021-03-05 09:50:07.677457-05	23	7	25	-1.2885908	36.7478723	n/a	Please specify below
4505	2021-03-05 09:50:07.690123-05	28	10	25	-1.2885908	36.7478723	n/a	Please specify below
4506	2021-03-05 09:50:07.69603-05	29	11	25	-1.2885908	36.7478723	n/a	Please specify below
4507	2021-03-05 09:50:07.702-05	32	13	25	-1.2885908	36.7478723	n/a	Please specify below
4508	2021-03-05 09:50:07.707986-05	37	16	25	-1.2885908	36.7478723	I fear authorities 	Please specify below
4509	2021-03-05 09:50:07.713964-05	38	17	25	-1.2885908	36.7478723	none	Please specify below
4510	2021-03-05 09:50:07.720057-05	39	18	25	-1.2885908	36.7478723	None	Please specify below
4511	2021-03-05 09:50:07.726113-05	40	19	25	-1.2885908	36.7478723	No	Please specify below
4512	2021-03-05 09:50:07.732108-05	3	1	25	-1.2885908	36.7478723	16	Below 18
4513	2021-03-05 09:50:07.73818-05	2	2	25	-1.2885908	36.7478723	NA	Female
4514	2021-03-05 09:50:07.744168-05	11	3	25	-1.2885908	36.7478723	NA	Matatu
4515	2021-03-05 09:50:07.750146-05	15	4	25	-1.2885908	36.7478723	NA	Cheap
4516	2021-03-05 09:50:07.756153-05	19	5	25	-1.2885908	36.7478723	NA	No
4517	2021-03-05 09:50:07.762117-05	21	6	25	-1.2885908	36.7478723	none	Verbal
4518	2021-03-05 09:50:07.768122-05	25	8	25	-1.2885908	36.7478723	NA	No
4519	2021-03-05 09:50:07.774098-05	27	9	25	-1.2885908	36.7478723	NA	No
4520	2021-03-05 09:50:07.780101-05	31	12	25	-1.2885908	36.7478723	NA	No
4521	2021-03-05 09:50:07.78616-05	34	14	25	-1.2885908	36.7478723	NA	No
4522	2021-03-05 09:50:07.79218-05	36	15	25	-1.2885908	36.7478723	NA	No
4523	2021-03-06 01:19:18.776458-05	45	21	26	-1.2008978	36.9200766	thika  road 	Please specify below
4524	2021-03-06 01:19:18.786272-05	48	23	26	-1.2008978	36.9200766	getting help to board and to alight 	Please specify below
4525	2021-03-06 01:19:18.792178-05	55	26	26	-1.2008978	36.9200766	no discrimination 	Please specify below
4526	2021-03-06 01:19:18.798319-05	63	29	26	-1.2008978	36.9200766	I haven't been discriminated 	Please specify below
4527	2021-03-06 01:19:18.804311-05	64	30	26	-1.2008978	36.9200766	negatively.... I rarely get the favors I used to get... of boarding for free	Please specify below
4528	2021-03-06 01:19:18.810407-05	65	31	26	-1.2008978	36.9200766	no idea	Please specify below
4529	2021-03-06 01:19:18.81638-05	3	1	26	-1.2008978	36.9200766	NA	Below 18
4530	2021-03-06 01:19:18.822453-05	1	2	26	-1.2008978	36.9200766	NA	Male
4531	2021-03-06 01:19:18.828427-05	11	3	26	-1.2008978	36.9200766	NA	Matatu
4532	2021-03-06 01:19:18.834418-05	16	4	26	-1.2008978	36.9200766	NA	Convenient
4533	2021-03-06 01:19:18.840497-05	43	20	26	-1.2008978	36.9200766	j	Physically handicapped
4534	2021-03-06 01:19:18.846474-05	46	22	26	-1.2008978	36.9200766	NA	Yes
4535	2021-03-06 01:19:18.852468-05	50	24	26	-1.2008978	36.9200766	NA	No
4536	2021-03-06 01:19:18.858446-05	54	25	26	-1.2008978	36.9200766	NA	A few times a year
4537	2021-03-06 01:19:18.864434-05	60	27	26	-1.2008978	36.9200766	NA	Other
4538	2021-03-06 01:19:18.87042-05	62	28	26	-1.2008978	36.9200766	NA	No
4539	2021-03-06 01:19:21.377382-05	45	21	26	-1.2008978	36.9200766	thika  road 	Please specify below
4540	2021-03-06 01:19:21.385176-05	48	23	26	-1.2008978	36.9200766	getting help to board and to alight 	Please specify below
4541	2021-03-06 01:19:21.391117-05	55	26	26	-1.2008978	36.9200766	no discrimination 	Please specify below
4542	2021-03-06 01:19:21.409057-05	63	29	26	-1.2008978	36.9200766	I haven't been discriminated 	Please specify below
4543	2021-03-06 01:19:21.41505-05	64	30	26	-1.2008978	36.9200766	negatively.... I rarely get the favors I used to get... of boarding for free	Please specify below
4544	2021-03-06 01:19:21.421118-05	65	31	26	-1.2008978	36.9200766	no idea	Please specify below
4545	2021-03-06 01:19:21.427113-05	3	1	26	-1.2008978	36.9200766	NA	Below 18
4546	2021-03-06 01:19:21.433089-05	1	2	26	-1.2008978	36.9200766	NA	Male
4547	2021-03-06 01:19:21.439084-05	11	3	26	-1.2008978	36.9200766	NA	Matatu
4548	2021-03-06 01:19:21.445061-05	16	4	26	-1.2008978	36.9200766	NA	Convenient
4549	2021-03-06 01:19:21.45106-05	43	20	26	-1.2008978	36.9200766	j	Physically handicapped
4550	2021-03-06 01:19:21.457042-05	46	22	26	-1.2008978	36.9200766	NA	Yes
4551	2021-03-06 01:19:21.463038-05	50	24	26	-1.2008978	36.9200766	NA	No
4552	2021-03-06 01:19:21.469016-05	54	25	26	-1.2008978	36.9200766	NA	A few times a year
4553	2021-03-06 01:19:21.475011-05	60	27	26	-1.2008978	36.9200766	NA	Other
4554	2021-03-06 01:19:21.480994-05	62	28	26	-1.2008978	36.9200766	NA	No
4555	2021-03-06 02:29:30.913858-05	23	7	23	-1.3117795	36.777636	NA	Please specify below
4556	2021-03-06 02:29:30.925779-05	28	10	23	-1.3117795	36.777636	NA	Please specify below
4557	2021-03-06 02:29:30.93169-05	29	11	23	-1.3117795	36.777636	Na 	Please specify below
4558	2021-03-06 02:29:30.937658-05	32	13	23	-1.3117795	36.777636	Na	Please specify below
4559	2021-03-06 02:29:30.943735-05	37	16	23	-1.3117795	36.777636	Na	Please specify below
4560	2021-03-06 02:29:30.991637-05	38	17	23	-1.3117795	36.777636	Na	Please specify below
4561	2021-03-06 02:29:31.051595-05	39	18	23	-1.3117795	36.777636	Na	Please specify below
4562	2021-03-06 02:29:31.057567-05	40	19	23	-1.3117795	36.777636	Na	Please specify below
4563	2021-03-06 02:29:31.063572-05	4	1	23	-1.3117795	36.777636	NA	18-25
4564	2021-03-06 02:29:31.069707-05	2	2	23	-1.3117795	36.777636	NA	Female
4565	2021-03-06 02:29:31.075698-05	11	3	23	-1.3117795	36.777636	NA	Matatu
4566	2021-03-06 02:29:31.081683-05	16	4	23	-1.3117795	36.777636	NA	Convenient
4567	2021-03-06 02:29:31.087679-05	19	5	23	-1.3117795	36.777636	NA	No
4568	2021-03-06 02:29:31.093656-05	25	8	23	-1.3117795	36.777636	NA	No
4569	2021-03-06 02:29:31.099653-05	27	9	23	-1.3117795	36.777636	NA	No
4570	2021-03-06 02:29:31.105627-05	31	12	23	-1.3117795	36.777636	NA	No
4571	2021-03-06 02:29:31.11163-05	34	14	23	-1.3117795	36.777636	NA	No
4572	2021-03-06 02:29:31.117698-05	35	15	23	-1.3117795	36.777636	NA	Yes
4573	2021-03-06 02:29:31.123699-05	21	6	23	-1.3117795	36.777636	H	Verbal
4574	2021-03-06 02:30:49.447724-05	23	7	23	-1.3117797	36.7776347	Sexual advances made by the driver as shed sat in the Co-driver's seat	Please specify below
4575	2021-03-06 02:30:49.464826-05	28	10	23	-1.3117797	36.7776347	Na	Please specify below
4576	2021-03-06 02:30:49.470328-05	29	11	23	-1.3117797	36.7776347	Na	Please specify below
4577	2021-03-06 02:30:49.476391-05	32	13	23	-1.3117797	36.7776347	Na	Please specify below
4578	2021-03-06 02:30:49.482357-05	37	16	23	-1.3117797	36.7776347	Na	Please specify below
4579	2021-03-06 02:30:49.488368-05	38	17	23	-1.3117797	36.7776347	Na	Please specify below
4580	2021-03-06 02:30:49.494424-05	39	18	23	-1.3117797	36.7776347	Na	Please specify below
4581	2021-03-06 02:30:49.500416-05	40	19	23	-1.3117797	36.7776347	Na	Please specify below
4582	2021-03-06 02:30:49.506394-05	5	1	23	-1.3117797	36.7776347	NA	26-30
4583	2021-03-06 02:30:49.51256-05	2	2	23	-1.3117797	36.7776347	NA	Female
4584	2021-03-06 02:30:49.518543-05	11	3	23	-1.3117797	36.7776347	NA	Matatu
4585	2021-03-06 02:30:49.524532-05	16	4	23	-1.3117797	36.7776347	NA	Convenient
4586	2021-03-06 02:30:49.530515-05	19	5	23	-1.3117797	36.7776347	NA	No
4587	2021-03-06 02:30:49.536502-05	22	6	23	-1.3117797	36.7776347	H	Sexual advances
4588	2021-03-06 02:30:49.542494-05	25	8	23	-1.3117797	36.7776347	NA	No
4589	2021-03-06 02:30:49.548479-05	26	9	23	-1.3117797	36.7776347	NA	Yes
4590	2021-03-06 02:30:49.554467-05	31	12	23	-1.3117797	36.7776347	NA	No
4591	2021-03-06 02:30:49.56046-05	34	14	23	-1.3117797	36.7776347	NA	No
4592	2021-03-06 02:30:49.566446-05	35	15	23	-1.3117797	36.7776347	NA	Yes
4593	2021-03-06 02:35:02.059974-05	23	7	23	-1.3117802	36.7776363	Na	Please specify below
4594	2021-03-06 02:35:02.072733-05	28	10	23	-1.3117802	36.7776363	Na	Please specify below
4595	2021-03-06 02:35:02.079049-05	29	11	23	-1.3117802	36.7776363	Na	Please specify below
4596	2021-03-06 02:35:02.084661-05	32	13	23	-1.3117802	36.7776363	She witnessed someone being physically assaulted 	Please specify below
4597	2021-03-06 02:35:02.090641-05	37	16	23	-1.3117802	36.7776363	Na	Please specify below
4598	2021-03-06 02:35:02.096636-05	38	17	23	-1.3117802	36.7776363	Rarely, once in a long time 	Please specify below
4599	2021-03-06 02:35:02.10262-05	39	18	23	-1.3117802	36.7776363	Zero 	Please specify below
4600	2021-03-06 02:35:02.108609-05	40	19	23	-1.3117802	36.7776363	Na	Please specify below
4601	2021-03-06 02:35:02.114598-05	5	1	23	-1.3117802	36.7776363	NA	26-30
4602	2021-03-06 02:35:02.12058-05	2	2	23	-1.3117802	36.7776363	NA	Female
4603	2021-03-06 02:35:02.126569-05	12	3	23	-1.3117802	36.7776363	NA	Boda boda
4604	2021-03-06 02:35:02.132555-05	16	4	23	-1.3117802	36.7776363	NA	Convenient
4605	2021-03-06 02:35:02.138547-05	19	5	23	-1.3117802	36.7776363	NA	No
4606	2021-03-06 02:35:02.14454-05	21	6	23	-1.3117802	36.7776363	None	Verbal
4607	2021-03-06 02:35:02.150622-05	25	8	23	-1.3117802	36.7776363	NA	No
4608	2021-03-06 02:35:02.156597-05	27	9	23	-1.3117802	36.7776363	NA	No
4609	2021-03-06 02:35:02.162588-05	30	12	23	-1.3117802	36.7776363	NA	Yes
4610	2021-03-06 02:35:02.168579-05	34	14	23	-1.3117802	36.7776363	NA	No
4611	2021-03-06 02:35:02.174575-05	35	15	23	-1.3117802	36.7776363	NA	Yes
4612	2021-03-06 03:01:02.459269-05	23	7	23	-1.3097844	36.7785002	Na	Please specify below
4613	2021-03-06 03:01:02.469774-05	28	10	23	-1.3097844	36.7785002	Na	Please specify below
4614	2021-03-06 03:01:02.475787-05	29	11	23	-1.3097844	36.7785002	Na	Please specify below
4615	2021-03-06 03:01:02.48255-05	32	13	23	-1.3097844	36.7785002	Na	Please specify below
4616	2021-03-06 03:01:02.48774-05	37	16	23	-1.3097844	36.7785002	Na	Please specify below
4617	2021-03-06 03:01:02.493712-05	38	17	23	-1.3097844	36.7785002	Never	Please specify below
4618	2021-03-06 03:01:02.499882-05	39	18	23	-1.3097844	36.7785002	Never	Please specify below
4619	2021-03-06 03:01:02.505858-05	40	19	23	-1.3097844	36.7785002	Prayer	Please specify below
4620	2021-03-06 03:01:02.511854-05	2	2	23	-1.3097844	36.7785002	NA	Female
4621	2021-03-06 03:01:02.518003-05	11	3	23	-1.3097844	36.7785002	NA	Matatu
4622	2021-03-06 03:01:02.523996-05	16	4	23	-1.3097844	36.7785002	NA	Convenient
4623	2021-03-06 03:01:02.529975-05	19	5	23	-1.3097844	36.7785002	NA	No
4624	2021-03-06 03:01:02.535972-05	21	6	23	-1.3097844	36.7785002	NA	Verbal
4625	2021-03-06 03:01:02.541948-05	7	1	23	-1.3097844	36.7785002	NA	36-40
4626	2021-03-06 03:01:02.547947-05	25	8	23	-1.3097844	36.7785002	NA	No
4627	2021-03-06 03:01:02.553922-05	27	9	23	-1.3097844	36.7785002	NA	No
4628	2021-03-06 03:01:02.559924-05	31	12	23	-1.3097844	36.7785002	NA	No
4629	2021-03-06 03:01:02.565902-05	36	15	23	-1.3097844	36.7785002	NA	No
4630	2021-03-06 03:01:02.571891-05	34	14	23	-1.3097844	36.7785002	NA	No
4631	2021-03-06 03:03:14.650946-05	23	7	23	-1.3098594	36.7785279	While leaving the matatu as she squeezed herself in between seats. Someone behind her roughed her inappropriately 	Please specify below
4632	2021-03-06 03:03:14.665631-05	28	10	23	-1.3098594	36.7785279	Felt embarrassed 	Please specify below
4633	2021-03-06 03:03:14.671561-05	29	11	23	-1.3098594	36.7785279	Na	Please specify below
4634	2021-03-06 03:03:14.677527-05	32	13	23	-1.3098594	36.7785279	Na	Please specify below
4635	2021-03-06 03:03:14.683622-05	37	16	23	-1.3098594	36.7785279	Evidence would be needed and she feels evidence in such a case is hard to find or prove	Please specify below
4636	2021-03-06 03:03:14.689623-05	38	17	23	-1.3098594	36.7785279	Never	Please specify below
4637	2021-03-06 03:03:14.695593-05	39	18	23	-1.3098594	36.7785279	Once in a while 	Please specify below
4638	2021-03-06 03:03:14.701582-05	40	19	23	-1.3098594	36.7785279	Na	Please specify below
4639	2021-03-06 03:03:14.707559-05	6	1	23	-1.3098594	36.7785279	NA	31-35
4640	2021-03-06 03:03:14.713543-05	2	2	23	-1.3098594	36.7785279	NA	Female
4641	2021-03-06 03:03:14.719539-05	11	3	23	-1.3098594	36.7785279	NA	Matatu
4643	2021-03-06 03:03:14.731615-05	18	5	23	-1.3098594	36.7785279	NA	Yes
4644	2021-03-06 03:03:14.737584-05	20	6	23	-1.3098594	36.7785279	NA	Physical touch
4645	2021-03-06 03:03:14.74358-05	25	8	23	-1.3098594	36.7785279	NA	No
4646	2021-03-06 03:03:14.749559-05	27	9	23	-1.3098594	36.7785279	NA	No
4647	2021-03-06 03:03:14.755586-05	31	12	23	-1.3098594	36.7785279	NA	No
4648	2021-03-06 03:03:14.761614-05	34	14	23	-1.3098594	36.7785279	NA	No
4649	2021-03-06 03:03:14.767614-05	36	15	23	-1.3098594	36.7785279	H	No
4650	2021-03-06 03:04:31.935029-05	23	7	23	-1.3097714	36.7785554	Na	Please specify below
4651	2021-03-06 03:04:31.951097-05	28	10	23	-1.3097714	36.7785554	Na	Please specify below
4652	2021-03-06 03:04:31.956991-05	29	11	23	-1.3097714	36.7785554	Na	Please specify below
4653	2021-03-06 03:04:31.962983-05	32	13	23	-1.3097714	36.7785554	Na	Please specify below
4654	2021-03-06 03:04:31.969-05	37	16	23	-1.3097714	36.7785554	Na	Please specify below
4655	2021-03-06 03:04:31.974949-05	38	17	23	-1.3097714	36.7785554	Rarely 	Please specify below
4656	2021-03-06 03:04:31.980931-05	39	18	23	-1.3097714	36.7785554	Never 	Please specify below
4657	2021-03-06 03:04:31.98693-05	40	19	23	-1.3097714	36.7785554	Confront the perpetrators and that would result in them not doing it again	Please specify below
4658	2021-03-06 03:04:31.992902-05	9	1	23	-1.3097714	36.7785554	NA	Above 50
4659	2021-03-06 03:04:31.998901-05	2	2	23	-1.3097714	36.7785554	NA	Female
4660	2021-03-06 03:04:32.004888-05	11	3	23	-1.3097714	36.7785554	NA	Matatu
4661	2021-03-06 03:04:32.010892-05	16	4	23	-1.3097714	36.7785554	NA	Convenient
4662	2021-03-06 03:04:32.016949-05	19	5	23	-1.3097714	36.7785554	NA	No
4663	2021-03-06 03:04:32.022938-05	21	6	23	-1.3097714	36.7785554	None 	Verbal
4664	2021-03-06 03:04:32.028916-05	25	8	23	-1.3097714	36.7785554	NA	No
4665	2021-03-06 03:04:32.034917-05	27	9	23	-1.3097714	36.7785554	NA	No
4666	2021-03-06 03:04:32.040893-05	31	12	23	-1.3097714	36.7785554	NA	No
4667	2021-03-06 03:04:32.046888-05	34	14	23	-1.3097714	36.7785554	NA	No
4668	2021-03-06 03:04:32.052871-05	35	15	23	-1.3097714	36.7785554	NA	Yes
4669	2021-03-06 03:15:35.701415-05	23	7	23	-1.3088122	36.7810351	Fellow passenger who made sexual advances towards them	Please specify below
4670	2021-03-06 03:15:35.713583-05	28	10	23	-1.3088122	36.7810351	Did not even remember their face or know their identity to make a case	Please specify below
4671	2021-03-06 03:15:35.719575-05	29	11	23	-1.3088122	36.7810351	Na	Please specify below
4672	2021-03-06 03:15:35.725537-05	32	13	23	-1.3088122	36.7810351	Na	Please specify below
4673	2021-03-06 03:15:35.731627-05	37	16	23	-1.3088122	36.7810351	Na	Please specify below
4674	2021-03-06 03:15:35.737591-05	38	17	23	-1.3088122	36.7810351	Na	Please specify below
4675	2021-03-06 03:15:35.743683-05	39	18	23	-1.3088122	36.7810351	At least weekly 	Please specify below
4676	2021-03-06 03:15:35.749656-05	40	19	23	-1.3088122	36.7810351	NA	Please specify below
4677	2021-03-06 03:15:35.755654-05	4	1	23	-1.3088122	36.7810351	NA	18-25
4678	2021-03-06 03:15:35.761799-05	2	2	23	-1.3088122	36.7810351	NA	Female
4679	2021-03-06 03:15:35.767792-05	11	3	23	-1.3088122	36.7810351	NA	Matatu
4680	2021-03-06 03:15:35.773774-05	15	4	23	-1.3088122	36.7810351	NA	Cheap
4681	2021-03-06 03:15:35.779773-05	18	5	23	-1.3088122	36.7810351	NA	Yes
4682	2021-03-06 03:15:35.785752-05	22	6	23	-1.3088122	36.7810351	NA	Sexual advances
4683	2021-03-06 03:15:35.791755-05	25	8	23	-1.3088122	36.7810351	NA	No
4684	2021-03-06 03:15:35.797733-05	27	9	23	-1.3088122	36.7810351	NA	No
4685	2021-03-06 03:15:35.803718-05	31	12	23	-1.3088122	36.7810351	NA	No
4686	2021-03-06 03:15:35.809713-05	34	14	23	-1.3088122	36.7810351	NA	No
4687	2021-03-06 03:15:35.815813-05	35	15	23	-1.3088122	36.7810351	NA	Yes
4688	2021-03-06 06:51:04.231443-05	23	7	25	NA	NA	N/A	Please specify below
4689	2021-03-06 06:51:04.243429-05	28	10	25	NA	NA	N/A	Please specify below
4690	2021-03-06 06:51:04.249391-05	29	11	25	NA	NA	No	Please specify below
4691	2021-03-06 06:51:04.255464-05	32	13	25	NA	NA	N/A	Please specify below
4692	2021-03-06 06:51:04.261442-05	37	16	25	NA	NA	It is funny for a man to report such cases	Please specify below
4693	2021-03-06 06:51:04.267429-05	38	17	25	NA	NA	none	Please specify below
4694	2021-03-06 06:51:04.273496-05	39	18	25	NA	NA	none	Please specify below
4695	2021-03-06 06:51:04.279483-05	40	19	25	NA	NA	No	Please specify below
4696	2021-03-06 06:51:04.285539-05	1	2	25	NA	NA	NA	Male
4697	2021-03-06 06:51:04.291626-05	6	1	25	NA	NA	33	31-35
4698	2021-03-06 06:51:04.297611-05	11	3	25	NA	NA	NA	Matatu
4699	2021-03-06 06:51:04.303597-05	15	4	25	NA	NA	NA	Cheap
4700	2021-03-06 06:51:04.309578-05	19	5	25	NA	NA	NA	No
4701	2021-03-06 06:51:04.315591-05	21	6	25	NA	NA	N/A	Verbal
4702	2021-03-06 06:51:04.321556-05	25	8	25	NA	NA	NA	No
4703	2021-03-06 06:51:04.327641-05	27	9	25	NA	NA	NA	No
4704	2021-03-06 06:51:04.333623-05	31	12	25	NA	NA	NA	No
4705	2021-03-06 06:51:04.339625-05	34	14	25	NA	NA	NA	No
4706	2021-03-06 06:51:04.345592-05	36	15	25	NA	NA	NA	No
4707	2021-03-06 06:59:39.820157-05	23	7	25	-1.2856545	36.7454164	N/a	Please specify below
4708	2021-03-06 06:59:39.829996-05	28	10	25	-1.2856545	36.7454164	n/a	Please specify below
4709	2021-03-06 06:59:39.835981-05	29	11	25	-1.2856545	36.7454164	n/a	Please specify below
4710	2021-03-06 06:59:39.842027-05	32	13	25	-1.2856545	36.7454164	A lady passenger was grabbed by the boob by a drunk male passenger and she called him out	Please specify below
4711	2021-03-06 06:59:39.848033-05	37	16	25	-1.2856545	36.7454164	I would report	Please specify below
4712	2021-03-06 06:59:39.853998-05	38	17	25	-1.2856545	36.7454164	3 times	Please specify below
4713	2021-03-06 06:59:39.860085-05	39	18	25	-1.2856545	36.7454164	none	Please specify below
4714	2021-03-06 06:59:39.866049-05	40	19	25	-1.2856545	36.7454164	People should be educated on where to report cases	Please specify below
4715	2021-03-06 06:59:39.87205-05	2	2	25	-1.2856545	36.7454164	NA	Female
4716	2021-03-06 06:59:39.878193-05	5	1	25	-1.2856545	36.7454164	30	26-30
4717	2021-03-06 06:59:39.884194-05	11	3	25	-1.2856545	36.7454164	NA	Matatu
4718	2021-03-06 06:59:39.890173-05	15	4	25	-1.2856545	36.7454164	NA	Cheap
4719	2021-03-06 06:59:39.896166-05	19	5	25	-1.2856545	36.7454164	NA	No
4720	2021-03-06 06:59:39.902149-05	20	6	25	-1.2856545	36.7454164	No	Physical touch
4721	2021-03-06 06:59:39.908142-05	25	8	25	-1.2856545	36.7454164	NA	No
4722	2021-03-06 06:59:39.914123-05	27	9	25	-1.2856545	36.7454164	NA	No
4723	2021-03-06 06:59:39.920204-05	30	12	25	-1.2856545	36.7454164	NA	Yes
4724	2021-03-06 06:59:39.926176-05	34	14	25	-1.2856545	36.7454164	NA	No
4725	2021-03-06 06:59:39.932183-05	35	15	25	-1.2856545	36.7454164	NA	Yes
4801	2021-03-06 07:54:52.668676-05	35	15	25	-1.2807921	36.7440995	NA	Yes
4726	2021-03-06 07:07:03.858787-05	23	7	25	-1.2859383	36.7452188	A passenger behind me kept acting like he was opening the window and touching my boob area 'by mistake'. He continued doing this even after I moved a bit and I had to change seats	Please specify below
4727	2021-03-06 07:07:03.87335-05	28	10	25	-1.2859383	36.7452188	Report to who?	Please specify below
4728	2021-03-06 07:07:03.879428-05	29	11	25	-1.2859383	36.7452188	N/A	Please specify below
4729	2021-03-06 07:07:03.885396-05	32	13	25	-1.2859383	36.7452188	N/A	Please specify below
4730	2021-03-06 07:07:03.891398-05	37	16	25	-1.2859383	36.7452188	I would only report extreme cases	Please specify below
4731	2021-03-06 07:07:03.897369-05	38	17	25	-1.2859383	36.7452188	2	Please specify below
4732	2021-03-06 07:07:03.903541-05	39	18	25	-1.2859383	36.7452188	Maybe 3	Please specify below
4733	2021-03-06 07:07:03.909511-05	40	19	25	-1.2859383	36.7452188	Education to the masses on what sexual harassment entails	Please specify below
4734	2021-03-06 07:07:03.915513-05	4	1	25	-1.2859383	36.7452188	25	18-25
4735	2021-03-06 07:07:03.921585-05	2	2	25	-1.2859383	36.7452188	NA	Female
4736	2021-03-06 07:07:03.927651-05	11	3	25	-1.2859383	36.7452188	NA	Matatu
4737	2021-03-06 07:07:03.933617-05	15	4	25	-1.2859383	36.7452188	NA	Cheap
4738	2021-03-06 07:07:03.93961-05	18	5	25	-1.2859383	36.7452188	NA	Yes
4739	2021-03-06 07:07:03.945586-05	20	6	25	-1.2859383	36.7452188	NA	Physical touch
4740	2021-03-06 07:07:03.951589-05	25	8	25	-1.2859383	36.7452188	NA	No
4741	2021-03-06 07:07:03.957564-05	27	9	25	-1.2859383	36.7452188	NA	No
4742	2021-03-06 07:07:03.963574-05	31	12	25	-1.2859383	36.7452188	NA	No
4743	2021-03-06 07:07:03.969543-05	34	14	25	-1.2859383	36.7452188	NA	No
4744	2021-03-06 07:07:03.975542-05	36	15	25	-1.2859383	36.7452188	But only in extreme cases	No
4745	2021-03-06 07:22:43.455674-05	23	7	25	-1.2862213	36.7457843	N/A	Please specify below
4746	2021-03-06 07:22:43.469892-05	28	10	25	-1.2862213	36.7457843	N/a	Please specify below
4747	2021-03-06 07:22:43.475983-05	29	11	25	-1.2862213	36.7457843	no	Please specify below
4748	2021-03-06 07:22:43.481945-05	32	13	25	-1.2862213	36.7457843	n/a	Please specify below
4749	2021-03-06 07:22:43.487958-05	37	16	25	-1.2862213	36.7457843	n/a	Please specify below
4750	2021-03-06 07:22:43.493912-05	38	17	25	-1.2862213	36.7457843	none	Please specify below
4751	2021-03-06 07:22:43.500094-05	39	18	25	-1.2862213	36.7457843	None	Please specify below
4752	2021-03-06 07:22:43.506063-05	40	19	25	-1.2862213	36.7457843	No	Please specify below
4753	2021-03-06 07:22:43.512054-05	9	1	25	-1.2862213	36.7457843	57	Above 50
4754	2021-03-06 07:22:43.518113-05	2	2	25	-1.2862213	36.7457843	NA	Female
4755	2021-03-06 07:22:43.524111-05	11	3	25	-1.2862213	36.7457843	NA	Matatu
4756	2021-03-06 07:22:43.530089-05	15	4	25	-1.2862213	36.7457843	NA	Cheap
4757	2021-03-06 07:22:43.536176-05	19	5	25	-1.2862213	36.7457843	NA	No
4758	2021-03-06 07:22:43.542147-05	21	6	25	-1.2862213	36.7457843	none	Verbal
4759	2021-03-06 07:22:43.548149-05	25	8	25	-1.2862213	36.7457843	NA	No
4760	2021-03-06 07:22:43.554135-05	27	9	25	-1.2862213	36.7457843	NA	No
4761	2021-03-06 07:22:43.560122-05	31	12	25	-1.2862213	36.7457843	NA	No
4762	2021-03-06 07:22:43.566099-05	34	14	25	-1.2862213	36.7457843	NA	No
4763	2021-03-06 07:22:43.572107-05	35	15	25	-1.2862213	36.7457843	NA	Yes
4764	2021-03-06 07:38:21.623552-05	23	7	25	-1.2832358	36.7447428	I was at the boda station waiting for my guy and the other riders started calling me names	Please specify below
4765	2021-03-06 07:38:21.635269-05	28	10	25	-1.2832358	36.7447428	I was too embarrassed to do anything	Please specify below
4766	2021-03-06 07:38:21.641255-05	29	11	25	-1.2832358	36.7447428	N/a	Please specify below
4767	2021-03-06 07:38:21.647242-05	32	13	25	-1.2832358	36.7447428	N/A	Please specify below
4768	2021-03-06 07:38:21.653211-05	37	16	25	-1.2832358	36.7447428	These sexual harassment cases will just be brushed off	Please specify below
4769	2021-03-06 07:38:21.659215-05	38	17	25	-1.2832358	36.7447428	None	Please specify below
4770	2021-03-06 07:38:21.665351-05	39	18	25	-1.2832358	36.7447428	2	Please specify below
4771	2021-03-06 07:38:21.671346-05	40	19	25	-1.2832358	36.7447428	Sensitization of everyone from kids to older people	Please specify below
4772	2021-03-06 07:38:21.677314-05	5	1	25	-1.2832358	36.7447428	NA	26-30
4773	2021-03-06 07:38:21.683489-05	2	2	25	-1.2832358	36.7447428	NA	Female
4774	2021-03-06 07:38:21.68946-05	12	3	25	-1.2832358	36.7447428	NA	Boda boda
4775	2021-03-06 07:38:21.695458-05	16	4	25	-1.2832358	36.7447428	NA	Convenient
4776	2021-03-06 07:38:21.701438-05	18	5	25	-1.2832358	36.7447428	NA	Yes
4777	2021-03-06 07:38:21.707434-05	21	6	25	-1.2832358	36.7447428	NA	Verbal
4778	2021-03-06 07:38:21.713413-05	25	8	25	-1.2832358	36.7447428	NA	No
4779	2021-03-06 07:38:21.719413-05	27	9	25	-1.2832358	36.7447428	NA	No
4780	2021-03-06 07:38:21.725389-05	31	12	25	-1.2832358	36.7447428	NA	No
4781	2021-03-06 07:38:21.7314-05	34	14	25	-1.2832358	36.7447428	NA	No
4782	2021-03-06 07:38:21.73737-05	36	15	25	-1.2832358	36.7447428	NA	No
4783	2021-03-06 07:54:52.556721-05	23	7	25	-1.2807921	36.7440995	I was seated at the front seat next to the driver and when changing gears kept brushing his hands against my thighs even after moving my legs sideways	Please specify below
4784	2021-03-06 07:54:52.566489-05	28	10	25	-1.2807921	36.7440995	I didn't feel like it was necessary to say anything at that time	Please specify below
4785	2021-03-06 07:54:52.57255-05	29	11	25	-1.2807921	36.7440995	N/A	Please specify below
4786	2021-03-06 07:54:52.578526-05	32	13	25	-1.2807921	36.7440995	n/a	Please specify below
4787	2021-03-06 07:54:52.584517-05	37	16	25	-1.2807921	36.7440995	I think people should report their cases	Please specify below
4788	2021-03-06 07:54:52.590502-05	38	17	25	-1.2807921	36.7440995	none	Please specify below
4789	2021-03-06 07:54:52.596667-05	39	18	25	-1.2807921	36.7440995	once	Please specify below
4790	2021-03-06 07:54:52.60264-05	40	19	25	-1.2807921	36.7440995	The relevant authorities should be proactive when cases are reported to them	Please specify below
4791	2021-03-06 07:54:52.608633-05	4	1	25	-1.2807921	36.7440995	NA	18-25
4792	2021-03-06 07:54:52.614773-05	2	2	25	-1.2807921	36.7440995	NA	Female
4793	2021-03-06 07:54:52.620753-05	11	3	25	-1.2807921	36.7440995	NA	Matatu
4794	2021-03-06 07:54:52.626741-05	15	4	25	-1.2807921	36.7440995	NA	Cheap
4795	2021-03-06 07:54:52.632732-05	18	5	25	-1.2807921	36.7440995	NA	Yes
4796	2021-03-06 07:54:52.638732-05	22	6	25	-1.2807921	36.7440995	NA	Sexual advances
4797	2021-03-06 07:54:52.644708-05	25	8	25	-1.2807921	36.7440995	NA	No
4798	2021-03-06 07:54:52.650713-05	27	9	25	-1.2807921	36.7440995	NA	No
4799	2021-03-06 07:54:52.656706-05	31	12	25	-1.2807921	36.7440995	NA	No
4800	2021-03-06 07:54:52.662691-05	34	14	25	-1.2807921	36.7440995	NA	No
4802	2021-03-06 08:04:57.75553-05	23	7	25	-1.2801853	36.7403641	N/A	Please specify below
4803	2021-03-06 08:04:57.76655-05	28	10	25	-1.2801853	36.7403641	N/A	Please specify below
4804	2021-03-06 08:04:57.772611-05	29	11	25	-1.2801853	36.7403641	no	Please specify below
4805	2021-03-06 08:04:57.778592-05	32	13	25	-1.2801853	36.7403641	N/A	Please specify below
4806	2021-03-06 08:04:57.784569-05	37	16	25	-1.2801853	36.7403641	I would be embarrassed	Please specify below
4807	2021-03-06 08:04:57.790559-05	38	17	25	-1.2801853	36.7403641	None	Please specify below
4808	2021-03-06 08:04:57.796723-05	39	18	25	-1.2801853	36.7403641	none	Please specify below
4809	2021-03-06 08:04:57.802699-05	40	19	25	-1.2801853	36.7403641	No	Please specify below
4810	2021-03-06 08:04:57.808687-05	5	1	25	-1.2801853	36.7403641	26	26-30
4811	2021-03-06 08:04:57.814858-05	1	2	25	-1.2801853	36.7403641	NA	Male
4812	2021-03-06 08:04:57.82083-05	12	3	25	-1.2801853	36.7403641	NA	Boda boda
4813	2021-03-06 08:04:57.826817-05	16	4	25	-1.2801853	36.7403641	NA	Convenient
4814	2021-03-06 08:04:57.832806-05	19	5	25	-1.2801853	36.7403641	NA	No
4815	2021-03-06 08:04:57.838803-05	21	6	25	-1.2801853	36.7403641	None	Verbal
4816	2021-03-06 08:04:57.84479-05	25	8	25	-1.2801853	36.7403641	NA	No
4817	2021-03-06 08:04:57.85077-05	27	9	25	-1.2801853	36.7403641	NA	No
4818	2021-03-06 08:04:57.856767-05	31	12	25	-1.2801853	36.7403641	NA	No
4819	2021-03-06 08:04:57.862753-05	34	14	25	-1.2801853	36.7403641	NA	No
4820	2021-03-06 08:04:57.868737-05	36	15	25	-1.2801853	36.7403641	NA	No
4821	2021-03-06 08:36:46.380996-05	23	7	25	NA	NA	One day my boda rider decided to ask me for sex in exchange for the payment. I refused and paid him after the ride. \nI changed my rider from then	Please specify below
4822	2021-03-06 08:36:46.39627-05	28	10	25	NA	NA	I decided to change the boda rider for my own safety	Please specify below
4823	2021-03-06 08:36:46.402232-05	29	11	25	NA	NA	No	Please specify below
4824	2021-03-06 08:36:46.408314-05	32	13	25	NA	NA	N/A	Please specify below
4825	2021-03-06 08:36:46.414275-05	37	16	25	NA	NA	N/A	Please specify below
4826	2021-03-06 08:36:46.42028-05	38	17	25	NA	NA	none 	Please specify below
4827	2021-03-06 08:36:46.426339-05	39	18	25	NA	NA	Twice 	Please specify below
4828	2021-03-06 08:36:46.43234-05	40	19	25	NA	NA	Campaigns should be done about sexual harassment frequently 	Please specify below
4829	2021-03-06 08:36:46.438409-05	5	1	25	NA	NA	NA	26-30
4830	2021-03-06 08:36:46.444478-05	2	2	25	NA	NA	NA	Female
4831	2021-03-06 08:36:46.450461-05	12	3	25	NA	NA	NA	Boda boda
4832	2021-03-06 08:36:46.45645-05	16	4	25	NA	NA	NA	Convenient
4833	2021-03-06 08:36:46.462431-05	18	5	25	NA	NA	NA	Yes
4834	2021-03-06 08:36:46.468507-05	22	6	25	NA	NA	NA	Sexual advances
4835	2021-03-06 08:36:46.474494-05	24	8	25	NA	NA	NA	Yes
4836	2021-03-06 08:36:46.480485-05	27	9	25	NA	NA	NA	No
4837	2021-03-06 08:36:46.48647-05	31	12	25	NA	NA	NA	No
4838	2021-03-06 08:36:46.492461-05	34	14	25	NA	NA	NA	No
4839	2021-03-06 08:36:46.498449-05	35	15	25	NA	NA	NA	Yes
4840	2021-03-06 08:48:36.26924-05	23	7	25	-1.2800325	36.7399929	Heckling and whistling from the guys at the matatu stage as I was boarding a bus 	Please specify below
4841	2021-03-06 08:48:36.285684-05	28	10	25	-1.2800325	36.7399929	This happens so often and it seems /harmless' to most people 	Please specify below
4842	2021-03-06 08:48:36.291663-05	29	11	25	-1.2800325	36.7399929	N/A	Please specify below
4843	2021-03-06 08:48:36.29763-05	32	13	25	-1.2800325	36.7399929	The same cat calling thing happened to a friend 	Please specify below
4844	2021-03-06 08:48:36.30371-05	37	16	25	-1.2800325	36.7399929	It just seems pointless 	Please specify below
4845	2021-03-06 08:48:36.309686-05	38	17	25	-1.2800325	36.7399929	4	Please specify below
4846	2021-03-06 08:48:36.315782-05	39	18	25	-1.2800325	36.7399929	2	Please specify below
4847	2021-03-06 08:48:36.32175-05	40	19	25	-1.2800325	36.7399929	Educate people and put strict laws to curb sexual harassment 	Please specify below
4848	2021-03-06 08:48:36.327823-05	5	1	25	-1.2800325	36.7399929	NA	26-30
4849	2021-03-06 08:48:36.333892-05	2	2	25	-1.2800325	36.7399929	a	Female
4850	2021-03-06 08:48:36.339877-05	11	3	25	-1.2800325	36.7399929	NA	Matatu
4851	2021-03-06 08:48:36.345875-05	15	4	25	-1.2800325	36.7399929	NA	Cheap
4852	2021-03-06 08:48:36.351863-05	18	5	25	-1.2800325	36.7399929	NA	Yes
4853	2021-03-06 08:48:36.357839-05	21	6	25	-1.2800325	36.7399929	NA	Verbal
4854	2021-03-06 08:48:36.363929-05	25	8	25	-1.2800325	36.7399929	NA	No
4855	2021-03-06 08:48:36.369906-05	27	9	25	-1.2800325	36.7399929	NA	No
4856	2021-03-06 08:48:36.375893-05	30	12	25	-1.2800325	36.7399929	NA	Yes
4857	2021-03-06 08:48:36.381877-05	33	14	25	-1.2800325	36.7399929	NA	Yes
4858	2021-03-06 08:48:36.387877-05	36	15	25	-1.2800325	36.7399929	NA	No
4859	2021-03-06 09:15:00.432268-05	23	7	25	-1.2817668	36.7403551	I was slapped on my behind when alighting a bus	Please specify below
4860	2021-03-06 09:15:00.448-05	28	10	25	-1.2817668	36.7403551	It happened so fast and no one to report to 	Please specify below
4861	2021-03-06 09:15:00.454099-05	29	11	25	-1.2817668	36.7403551	no	Please specify below
4862	2021-03-06 09:15:00.460032-05	32	13	25	-1.2817668	36.7403551	I witnessed a certain lady being insulted regarding her body and dressing after she refused to board a matatu because it was full 	Please specify below
4863	2021-03-06 09:15:00.465985-05	37	16	25	-1.2817668	36.7403551	No reason given	Please specify below
4864	2021-03-06 09:15:00.471994-05	38	17	25	-1.2817668	36.7403551	1	Please specify below
4865	2021-03-06 09:15:00.478137-05	39	18	25	-1.2817668	36.7403551	3	Please specify below
4866	2021-03-06 09:15:00.48416-05	40	19	25	-1.2817668	36.7403551	Education about sexual harassment 	Please specify below
4867	2021-03-06 09:15:00.490151-05	4	1	25	-1.2817668	36.7403551	23	18-25
4868	2021-03-06 09:15:00.496336-05	2	2	25	-1.2817668	36.7403551	NA	Female
4869	2021-03-06 09:15:00.502245-05	11	3	25	-1.2817668	36.7403551	NA	Matatu
4870	2021-03-06 09:15:00.508267-05	15	4	25	-1.2817668	36.7403551	NA	Cheap
4871	2021-03-06 09:15:00.514238-05	18	5	25	-1.2817668	36.7403551	NA	Yes
4872	2021-03-06 09:15:00.52023-05	20	6	25	-1.2817668	36.7403551	I was slapped on my behind when alighting a bus	Physical touch
4873	2021-03-06 09:15:00.526199-05	25	8	25	-1.2817668	36.7403551	NA	No
4874	2021-03-06 09:15:00.532223-05	27	9	25	-1.2817668	36.7403551	NA	No
4875	2021-03-06 09:15:00.538177-05	30	12	25	-1.2817668	36.7403551	NA	Yes
4876	2021-03-06 09:15:00.544191-05	34	14	25	-1.2817668	36.7403551	NA	No
4877	2021-03-06 09:15:00.550154-05	36	15	25	-1.2817668	36.7403551	NA	No
4878	2021-03-07 03:00:32.450443-05	45	21	26	-1.0917884	37.0224259	kariobangi -all soaps	Please specify below
4879	2021-03-07 03:00:32.572-05	48	23	26	-1.0917884	37.0224259	sometimes I get helped to board the vehicle 	Please specify below
4880	2021-03-07 03:00:32.577844-05	55	26	26	-1.0917884	37.0224259	verbal.. I have been shouted at to alight faster 	Please specify below
4881	2021-03-07 03:00:32.601874-05	63	29	26	-1.0917884	37.0224259	I didn't see a reason to report 	Please specify below
4882	2021-03-07 03:00:32.607917-05	64	30	26	-1.0917884	37.0224259	positively. the spacing in the the vehicles are so much of an advantage to us	Please specify below
4883	2021-03-07 03:00:32.625894-05	65	31	26	-1.0917884	37.0224259	allow us alight at spots that are not busy and sometimes where there are ramps to move easily 	Please specify below
4884	2021-03-07 03:00:32.631861-05	4	1	26	-1.0917884	37.0224259	NA	18-25
4885	2021-03-07 03:00:32.638015-05	1	2	26	-1.0917884	37.0224259	NA	Male
4886	2021-03-07 03:00:32.643991-05	11	3	26	-1.0917884	37.0224259	NA	Matatu
4887	2021-03-07 03:00:32.649987-05	15	4	26	-1.0917884	37.0224259	NA	Cheap
4888	2021-03-07 03:00:32.655964-05	43	20	26	-1.0917884	37.0224259	NA	Physically handicapped
4889	2021-03-07 03:00:32.661968-05	46	22	26	-1.0917884	37.0224259	NA	Yes
4890	2021-03-07 03:00:32.667934-05	49	24	26	-1.0917884	37.0224259	NA	Yes
4891	2021-03-07 03:00:32.673928-05	53	25	26	-1.0917884	37.0224259	NA	A few times a month
4892	2021-03-07 03:00:32.679903-05	57	27	26	-1.0917884	37.0224259	NA	Conductor
4893	2021-03-07 03:00:32.685992-05	62	28	26	-1.0917884	37.0224259	NA	No
4894	2021-03-07 03:04:16.992353-05	45	21	26	-1.0914382	37.0216615	Kariobangi All soaps 	Please specify below
4895	2021-03-07 03:04:17.003806-05	48	23	26	-1.0914382	37.0216615	boarding for free 	Please specify below
4896	2021-03-07 03:04:17.009492-05	55	26	26	-1.0914382	37.0216615	physical 	Please specify below
4897	2021-03-07 03:04:17.015612-05	63	29	26	-1.0914382	37.0216615	there's no one to report to 	Please specify below
4898	2021-03-07 03:04:17.021611-05	64	30	26	-1.0914382	37.0216615	negatively. the fare was raised and is becoming a problem 	Please specify below
4899	2021-03-07 03:04:17.02767-05	65	31	26	-1.0914382	37.0216615	educate those in the the transport sector in how to treat the disabled 	Please specify below
4900	2021-03-07 03:04:17.033655-05	4	1	26	-1.0914382	37.0216615	NA	18-25
4901	2021-03-07 03:04:17.039808-05	1	2	26	-1.0914382	37.0216615	NA	Male
4902	2021-03-07 03:04:17.045811-05	11	3	26	-1.0914382	37.0216615	NA	Matatu
4903	2021-03-07 03:04:17.051789-05	16	4	26	-1.0914382	37.0216615	NA	Convenient
4904	2021-03-07 03:04:17.057786-05	41	20	26	-1.0914382	37.0216615	NA	Visually impaired
4905	2021-03-07 03:04:17.063829-05	46	22	26	-1.0914382	37.0216615	NA	Yes
4906	2021-03-07 03:04:17.069816-05	49	24	26	-1.0914382	37.0216615	NA	Yes
4907	2021-03-07 03:04:17.075784-05	53	25	26	-1.0914382	37.0216615	NA	A few times a month
4908	2021-03-07 03:04:17.081787-05	58	27	26	-1.0914382	37.0216615	NA	Kamagera or Stage attendants
4909	2021-03-07 03:04:17.087766-05	62	28	26	-1.0914382	37.0216615	NA	No
4910	2021-03-07 03:09:20.618044-05	45	21	26	-1.0933555	37.019805	Kariobangi -All Soaps 	Please specify below
4911	2021-03-07 03:09:20.630699-05	48	23	26	-1.0933555	37.019805	I  occasionally  get helped to board	Please specify below
4912	2021-03-07 03:09:20.636592-05	55	26	26	-1.0933555	37.019805	physical ..i was pushed to move fast... maybe they didn't know I was deaf	Please specify below
4913	2021-03-07 03:09:20.642758-05	63	29	26	-1.0933555	37.019805	they didn't know I was deaf	Please specify below
4914	2021-03-07 03:09:20.648724-05	64	30	26	-1.0933555	37.019805	negatively. the fare was doubled the initial amount and it's not something easy 	Please specify below
4915	2021-03-07 03:09:20.654726-05	65	31	26	-1.0933555	37.019805	atleast reserve seats for the disabled... for easy boarding and alighting 	Please specify below
4916	2021-03-07 03:09:20.660778-05	5	1	26	-1.0933555	37.019805	NA	26-30
4917	2021-03-07 03:09:20.666869-05	1	2	26	-1.0933555	37.019805	NA	Male
4918	2021-03-07 03:09:20.672845-05	11	3	26	-1.0933555	37.019805	NA	Matatu
4919	2021-03-07 03:09:20.678842-05	16	4	26	-1.0933555	37.019805	NA	Convenient
4920	2021-03-07 03:09:20.684908-05	42	20	26	-1.0933555	37.019805	NA	Deaf or Hard of hearing
4921	2021-03-07 03:09:20.690914-05	46	22	26	-1.0933555	37.019805	NA	Yes
4922	2021-03-07 03:09:20.696881-05	49	24	26	-1.0933555	37.019805	NA	Yes
4923	2021-03-07 03:09:20.702878-05	53	25	26	-1.0933555	37.019805	NA	A few times a month
4924	2021-03-07 03:09:20.708864-05	60	27	26	-1.0933555	37.019805	passengers 	Other
4925	2021-03-07 03:09:20.714949-05	62	28	26	-1.0933555	37.019805	NA	No
4926	2021-03-07 03:13:16.696912-05	45	21	26	-1.0914428	37.0216431	Thika road 	Please specify below
4927	2021-03-07 03:13:16.714249-05	48	23	26	-1.0914428	37.0216431	 I get helped to board 	Please specify below
4928	2021-03-07 03:13:16.720127-05	55	26	26	-1.0914428	37.0216431	non verbal. I got squeezed the whole journey 	Please specify below
4929	2021-03-07 03:13:16.726291-05	63	29	26	-1.0914428	37.0216431	I reported 	Please specify below
4930	2021-03-07 03:13:16.732263-05	64	30	26	-1.0914428	37.0216431	positively. the spacing in the vehicles is to an advantage 	Please specify below
4931	2021-03-07 03:13:16.738258-05	65	31	26	-1.0914428	37.0216431	create more space for us just the way there are spacings in them due to covid 19,make it a requirement even after covid	Please specify below
4932	2021-03-07 03:13:16.744319-05	6	1	26	-1.0914428	37.0216431	NA	31-35
4933	2021-03-07 03:13:16.750449-05	2	2	26	-1.0914428	37.0216431	NA	Female
4934	2021-03-07 03:13:16.756384-05	11	3	26	-1.0914428	37.0216431	NA	Matatu
4935	2021-03-07 03:13:16.762777-05	15	4	26	-1.0914428	37.0216431	NA	Cheap
4936	2021-03-07 03:13:16.768446-05	43	20	26	-1.0914428	37.0216431	NA	Physically handicapped
4937	2021-03-07 03:13:16.774436-05	46	22	26	-1.0914428	37.0216431	NA	Yes
4938	2021-03-07 03:13:16.780412-05	49	24	26	-1.0914428	37.0216431	NA	Yes
4939	2021-03-07 03:13:16.786406-05	52	25	26	-1.0914428	37.0216431	NA	A few time a week
4940	2021-03-07 03:13:16.792394-05	57	27	26	-1.0914428	37.0216431	NA	Conductor
4941	2021-03-07 03:13:16.798385-05	61	28	26	-1.0914428	37.0216431	NA	Yes
4942	2021-03-07 03:18:03.509487-05	45	21	26	-1.0917185	37.0213915	thika road 	Please specify below
4943	2021-03-07 03:18:03.522491-05	48	23	26	-1.0917185	37.0213915	I get helped to board and to alight 	Please specify below
4944	2021-03-07 03:18:03.528387-05	55	26	26	-1.0917185	37.0213915	physical. I got pushed inside others even stepped on me	Please specify below
4945	2021-03-07 03:18:03.53438-05	63	29	26	-1.0917185	37.0213915	there was nothing to report 	Please specify below
4946	2021-03-07 03:18:03.540347-05	64	30	26	-1.0917185	37.0213915	negatively... the economy is of no favour so payment of the raised fare is a problem 	Please specify below
4947	2021-03-07 03:18:03.546352-05	65	31	26	-1.0917185	37.0213915	create ramps instead of stairs for easy boarding and alighting by the disabled 	Please specify below
4948	2021-03-07 03:18:03.552334-05	8	1	26	-1.0917185	37.0213915	NA	45-50
4949	2021-03-07 03:18:03.558761-05	2	2	26	-1.0917185	37.0213915	NA	Female
4950	2021-03-07 03:18:03.570396-05	11	3	26	-1.0917185	37.0213915	NA	Matatu
4951	2021-03-07 03:18:03.576353-05	15	4	26	-1.0917185	37.0213915	NA	Cheap
4952	2021-03-07 03:18:03.582363-05	43	20	26	-1.0917185	37.0213915	NA	Physically handicapped
4953	2021-03-07 03:18:03.588336-05	46	22	26	-1.0917185	37.0213915	NA	Yes
4954	2021-03-07 03:18:03.594329-05	49	24	26	-1.0917185	37.0213915	NA	Yes
4955	2021-03-07 03:18:03.600312-05	53	25	26	-1.0917185	37.0213915	NA	A few times a month
4956	2021-03-07 03:18:03.606312-05	60	27	26	-1.0917185	37.0213915	the passengers while boarding	Other
4957	2021-03-07 03:18:03.61229-05	62	28	26	-1.0917185	37.0213915	NA	No
4958	2021-03-07 03:29:07.144385-05	45	21	26	-1.0921781	37.0207801	thika road 	Please specify below
4959	2021-03-07 03:29:07.159208-05	48	23	26	-1.0921781	37.0207801	I get helped to board and to alight 	Please specify below
4960	2021-03-07 03:29:07.165084-05	55	26	26	-1.0921781	37.0207801	verbal. the conductor couldn't allow me to occupy more than one seat so I had to pay for the other seat too	Please specify below
4961	2021-03-07 03:29:07.171234-05	63	29	26	-1.0921781	37.0207801	I reported 	Please specify below
4962	2021-03-07 03:29:07.177217-05	64	30	26	-1.0921781	37.0207801	positively.. atleast the spacing favours us a little 	Please specify below
4963	2021-03-07 03:29:07.183295-05	65	31	26	-1.0921781	37.0207801	reserve even the front seats for the disabled and create space for them so that they can seat on one seat instead of two	Please specify below
4964	2021-03-07 03:29:07.189299-05	8	1	26	-1.0921781	37.0207801	NA	45-50
4965	2021-03-07 03:29:07.195434-05	2	2	26	-1.0921781	37.0207801	NA	Female
4966	2021-03-07 03:29:07.201425-05	11	3	26	-1.0921781	37.0207801	NA	Matatu
4967	2021-03-07 03:29:07.207412-05	15	4	26	-1.0921781	37.0207801	NA	Cheap
4968	2021-03-07 03:29:07.213413-05	43	20	26	-1.0921781	37.0207801	NA	Physically handicapped
4969	2021-03-07 03:29:07.219373-05	46	22	26	-1.0921781	37.0207801	NA	Yes
4970	2021-03-07 03:29:07.225374-05	49	24	26	-1.0921781	37.0207801	NA	Yes
4971	2021-03-07 03:29:07.231386-05	52	25	26	-1.0921781	37.0207801	NA	A few time a week
4972	2021-03-07 03:29:07.237359-05	57	27	26	-1.0921781	37.0207801	NA	Conductor
4973	2021-03-07 03:29:07.243335-05	61	28	26	-1.0921781	37.0207801	NA	Yes
4974	2021-03-07 05:41:42.47761-05	45	21	26	-1.091437	37.0221502	Thika road 	Please specify below
4975	2021-03-07 05:41:42.485837-05	48	23	26	-1.091437	37.0221502	I get help to board 	Please specify below
4976	2021-03-07 05:41:42.491725-05	55	26	26	-1.091437	37.0221502	non verbal. couldn't seat with anyone on the same row due to "dirt "so I was forced to pay for two seats 	Please specify below
4977	2021-03-07 05:41:42.497881-05	63	29	26	-1.091437	37.0221502	I had no reason to do so	Please specify below
4978	2021-03-07 05:41:42.503845-05	64	30	26	-1.091437	37.0221502	negatively... the raised fare is a problem 	Please specify below
4979	2021-03-07 05:41:42.509843-05	65	31	26	-1.091437	37.0221502	educate people to understand that it's not anyone's wish to be disabled such that they get dirty due to their mode of walking... they should be accomodative instead 	Please specify below
4980	2021-03-07 05:41:42.515817-05	8	1	26	-1.091437	37.0221502	NA	45-50
4981	2021-03-07 05:41:42.521994-05	1	2	26	-1.091437	37.0221502	NA	Male
4982	2021-03-07 05:41:42.527958-05	11	3	26	-1.091437	37.0221502	NA	Matatu
4983	2021-03-07 05:41:42.533957-05	16	4	26	-1.091437	37.0221502	NA	Convenient
4984	2021-03-07 05:41:42.540023-05	43	20	26	-1.091437	37.0221502	NA	Physically handicapped
4985	2021-03-07 05:41:42.546007-05	46	22	26	-1.091437	37.0221502	NA	Yes
4986	2021-03-07 05:41:42.551996-05	49	24	26	-1.091437	37.0221502	NA	Yes
4987	2021-03-07 05:41:42.557987-05	52	25	26	-1.091437	37.0221502	NA	A few time a week
4988	2021-03-07 05:41:42.563962-05	60	27	26	-1.091437	37.0221502	the passengers 	Other
4989	2021-03-07 05:41:42.570044-05	62	28	26	-1.091437	37.0221502	NA	No
4990	2021-03-07 05:47:56.607638-05	45	21	26	-1.0914428	37.0216431	Pangani -Town 	Please specify below
4991	2021-03-07 05:47:56.621127-05	48	23	26	-1.0914428	37.0216431	I get helped to board and to alight 	Please specify below
4992	2021-03-07 05:47:56.627017-05	55	26	26	-1.0914428	37.0216431	physical. rushed out to alight and missed the stairs at the exit, almost fell	Please specify below
4993	2021-03-07 05:47:56.633177-05	63	29	26	-1.0914428	37.0216431	I reported to the matatu owner's 	Please specify below
4994	2021-03-07 05:47:56.639169-05	64	30	26	-1.0914428	37.0216431	negatively. curfew hours meets me stranded at the stage when they don't allow me to board for no apparent reason 	Please specify below
4995	2021-03-07 05:47:56.64522-05	65	31	26	-1.0914428	37.0216431	create ramps or reduce the stairs at the entrance to allow easy boarding and alighting 	Please specify below
4996	2021-03-07 05:47:56.651237-05	6	1	26	-1.0914428	37.0216431	NA	31-35
4997	2021-03-07 05:47:56.657374-05	2	2	26	-1.0914428	37.0216431	NA	Female
4998	2021-03-07 05:47:56.663345-05	11	3	26	-1.0914428	37.0216431	NA	Matatu
4999	2021-03-07 05:47:56.669331-05	16	4	26	-1.0914428	37.0216431	NA	Convenient
5000	2021-03-07 05:47:56.675409-05	42	20	26	-1.0914428	37.0216431	NA	Deaf or Hard of hearing
5001	2021-03-07 05:47:56.681405-05	46	22	26	-1.0914428	37.0216431	NA	Yes
5002	2021-03-07 05:47:56.687379-05	49	24	26	-1.0914428	37.0216431	NA	Yes
5003	2021-03-07 05:47:56.693379-05	53	25	26	-1.0914428	37.0216431	NA	A few times a month
5004	2021-03-07 05:47:56.699357-05	57	27	26	-1.0914428	37.0216431	NA	Conductor
5005	2021-03-07 05:47:56.705346-05	61	28	26	-1.0914428	37.0216431	NA	Yes
5006	2021-03-07 05:51:49.008148-05	45	21	26	-1.0914931	37.0215827	Pangani -Town 	Please specify below
5007	2021-03-07 05:51:49.022597-05	48	23	26	-1.0914931	37.0215827	some people really nice to help board and In alighting 	Please specify below
5008	2021-03-07 05:51:49.028468-05	55	26	26	-1.0914931	37.0215827	non verbal. forced to pay for two seats I Occupied 	Please specify below
5009	2021-03-07 05:51:49.034626-05	63	29	26	-1.0914931	37.0215827	reporting won't help	Please specify below
5010	2021-03-07 05:51:49.040595-05	64	30	26	-1.0914931	37.0215827	positively... the spacing is to my advantage 	Please specify below
5011	2021-03-07 05:51:49.046678-05	65	31	26	-1.0914931	37.0215827	allow spacing between the seats just a slight improvement from how they are now	Please specify below
5012	2021-03-07 05:51:49.05264-05	7	1	26	-1.0914931	37.0215827	NA	36-40
5013	2021-03-07 05:51:49.058797-05	2	2	26	-1.0914931	37.0215827	NA	Female
5014	2021-03-07 05:51:49.064768-05	11	3	26	-1.0914931	37.0215827	NA	Matatu
5015	2021-03-07 05:51:49.070798-05	15	4	26	-1.0914931	37.0215827	NA	Cheap
5016	2021-03-07 05:51:49.076743-05	43	20	26	-1.0914931	37.0215827	NA	Physically handicapped
5017	2021-03-07 05:51:49.082734-05	46	22	26	-1.0914931	37.0215827	NA	Yes
5018	2021-03-07 05:51:49.088712-05	49	24	26	-1.0914931	37.0215827	NA	Yes
5019	2021-03-07 05:51:49.094728-05	52	25	26	-1.0914931	37.0215827	NA	A few time a week
5020	2021-03-07 05:51:49.100698-05	57	27	26	-1.0914931	37.0215827	NA	Conductor
5021	2021-03-07 05:51:49.10678-05	62	28	26	-1.0914931	37.0215827	NA	No
5022	2021-03-07 05:54:29.336382-05	45	21	26	-1.091455	37.0216279	Ngara -Town 	Please specify below
5023	2021-03-07 05:54:29.347682-05	48	23	26	-1.091455	37.0216279	I don't get to pay sometimes 	Please specify below
5024	2021-03-07 05:54:29.353639-05	55	26	26	-1.091455	37.0216279	physical. pushed to rush in and settle 	Please specify below
5025	2021-03-07 05:54:29.359776-05	63	29	26	-1.091455	37.0216279	I had no good reason to report 	Please specify below
5026	2021-03-07 05:54:29.365784-05	64	30	26	-1.091455	37.0216279	negatively. the raised fare is a problem 	Please specify below
5027	2021-03-07 05:54:29.371844-05	65	31	26	-1.091455	37.0216279	allow time to to board and to alight 	Please specify below
5028	2021-03-07 05:54:29.377839-05	8	1	26	-1.091455	37.0216279	NA	45-50
5029	2021-03-07 05:54:29.383983-05	1	2	26	-1.091455	37.0216279	NA	Male
5030	2021-03-07 05:54:29.389982-05	11	3	26	-1.091455	37.0216279	NA	Matatu
5031	2021-03-07 05:54:29.395954-05	15	4	26	-1.091455	37.0216279	NA	Cheap
5032	2021-03-07 05:54:29.401961-05	41	20	26	-1.091455	37.0216279	NA	Visually impaired
5033	2021-03-07 05:54:29.40793-05	46	22	26	-1.091455	37.0216279	NA	Yes
5034	2021-03-07 05:54:29.413936-05	49	24	26	-1.091455	37.0216279	NA	Yes
5035	2021-03-07 05:54:29.419915-05	53	25	26	-1.091455	37.0216279	NA	A few times a month
5036	2021-03-07 05:54:29.425909-05	60	27	26	-1.091455	37.0216279	the boarding passengers 	Other
5037	2021-03-07 05:54:29.431894-05	62	28	26	-1.091455	37.0216279	NA	No
5038	2021-03-07 06:01:28.003905-05	45	21	26	-1.0914426	37.0216629	Ngara -Town 	Please specify below
5039	2021-03-07 06:01:28.01662-05	48	23	26	-1.0914426	37.0216629	boarding for free sometimes 	Please specify below
5040	2021-03-07 06:01:28.022512-05	55	26	26	-1.0914426	37.0216629	non verbal. rushed to Settle and the car moves even before I sit 	Please specify below
5041	2021-03-07 06:01:28.028664-05	63	29	26	-1.0914426	37.0216629	I reported 	Please specify below
5042	2021-03-07 06:01:28.034634-05	64	30	26	-1.0914426	37.0216629	negatively. sometimes I'm left in stage while the matatu is picking others leaving me due to rushing to beat the curfew time	Please specify below
5043	2021-03-07 06:01:28.040708-05	65	31	26	-1.0914426	37.0216629	allow time for the disabled especially before the car is set up to leave 	Please specify below
5044	2021-03-07 06:01:28.046701-05	8	1	26	-1.0914426	37.0216629	NA	45-50
5045	2021-03-07 06:01:28.052848-05	2	2	26	-1.0914426	37.0216629	NA	Female
5046	2021-03-07 06:01:28.058844-05	11	3	26	-1.0914426	37.0216629	NA	Matatu
5047	2021-03-07 06:01:28.064828-05	16	4	26	-1.0914426	37.0216629	NA	Convenient
5048	2021-03-07 06:01:28.070914-05	41	20	26	-1.0914426	37.0216629	NA	Visually impaired
5049	2021-03-07 06:01:28.076882-05	46	22	26	-1.0914426	37.0216629	NA	Yes
5050	2021-03-07 06:01:28.082899-05	49	24	26	-1.0914426	37.0216629	NA	Yes
5051	2021-03-07 06:01:28.08887-05	53	25	26	-1.0914426	37.0216629	NA	A few times a month
5052	2021-03-07 06:01:28.094857-05	56	27	26	-1.0914426	37.0216629	NA	Driver
5053	2021-03-07 06:01:28.100834-05	61	28	26	-1.0914426	37.0216629	NA	Yes
5054	2021-03-07 06:03:43.969765-05	45	21	26	-1.0914428	37.0216432	Huruma -town 	Please specify below
5055	2021-03-07 06:03:43.985173-05	48	23	26	-1.0914428	37.0216432	boarding for free sometimes 	Please specify below
5056	2021-03-07 06:03:43.991077-05	55	26	26	-1.0914428	37.0216432	physical 	Please specify below
5057	2021-03-07 06:03:43.997232-05	63	29	26	-1.0914428	37.0216432	I did reported 	Please specify below
5058	2021-03-07 06:03:44.003197-05	64	30	26	-1.0914428	37.0216432	negatively... the fare has been doubled from the previous and you it's a challenge 	Please specify below
5059	2021-03-07 06:03:44.009269-05	65	31	26	-1.0914428	37.0216432	educate them on allowing time to board and to alight 	Please specify below
5060	2021-03-07 06:03:44.015254-05	8	1	26	-1.0914428	37.0216432	NA	45-50
5061	2021-03-07 06:03:44.021428-05	1	2	26	-1.0914428	37.0216432	NA	Male
5062	2021-03-07 06:03:44.027394-05	11	3	26	-1.0914428	37.0216432	NA	Matatu
5063	2021-03-07 06:03:44.033395-05	16	4	26	-1.0914428	37.0216432	NA	Convenient
5064	2021-03-07 06:03:44.039471-05	41	20	26	-1.0914428	37.0216432	NA	Visually impaired
5065	2021-03-07 06:03:44.045451-05	46	22	26	-1.0914428	37.0216432	NA	Yes
5066	2021-03-07 06:03:44.051435-05	49	24	26	-1.0914428	37.0216432	NA	Yes
5067	2021-03-07 06:03:44.057435-05	52	25	26	-1.0914428	37.0216432	NA	A few time a week
5068	2021-03-07 06:03:44.063401-05	57	27	26	-1.0914428	37.0216432	NA	Conductor
5069	2021-03-07 06:03:44.08148-05	61	28	26	-1.0914428	37.0216432	NA	Yes
5070	2021-03-07 06:07:53.562714-05	45	21	26	-1.091444	37.0216379	Huruma -Town 	Please specify below
5071	2021-03-07 06:07:53.575908-05	48	23	26	-1.091444	37.0216379	boarding for free sometimes 	Please specify below
5072	2021-03-07 06:07:53.581873-05	55	26	26	-1.091444	37.0216379	non verbal. sometimes I don't understand what the conductor means and they can do even reach to my pocket for the fare 	Please specify below
5073	2021-03-07 06:07:53.58783-05	63	29	26	-1.091444	37.0216379	I reported 	Please specify below
5074	2021-03-07 06:07:53.593824-05	64	30	26	-1.091444	37.0216379	negatively. the raised fare is a problem 	Please specify below
5075	2021-03-07 06:07:53.599794-05	65	31	26	-1.091444	37.0216379	educate the drivers and the conductors on how to handle people with disabilities 	Please specify below
5076	2021-03-07 06:07:53.605796-05	6	1	26	-1.091444	37.0216379	NA	31-35
5077	2021-03-07 06:07:53.611771-05	2	2	26	-1.091444	37.0216379	NA	Female
5078	2021-03-07 06:07:53.617762-05	16	4	26	-1.091444	37.0216379	NA	Convenient
5079	2021-03-07 06:07:53.62374-05	11	3	26	-1.091444	37.0216379	NA	Matatu
5080	2021-03-07 06:07:53.629737-05	42	20	26	-1.091444	37.0216379	NA	Deaf or Hard of hearing
5081	2021-03-07 06:07:53.635717-05	46	22	26	-1.091444	37.0216379	NA	Yes
5082	2021-03-07 06:07:53.641715-05	49	24	26	-1.091444	37.0216379	NA	Yes
5083	2021-03-07 06:07:53.647784-05	51	25	26	-1.091444	37.0216379	NA	Everyday
5084	2021-03-07 06:07:53.653771-05	57	27	26	-1.091444	37.0216379	NA	Conductor
5085	2021-03-07 06:07:53.659757-05	61	28	26	-1.091444	37.0216379	NA	Yes
5086	2021-03-07 06:11:01.557314-05	45	21	26	-1.0914347	37.0216532	Huruma -Town 	Please specify below
5087	2021-03-07 06:11:01.568929-05	48	23	26	-1.0914347	37.0216532	boarding for free sometimes you 	Please specify below
5088	2021-03-07 06:11:01.574888-05	55	26	26	-1.0914347	37.0216532	physical. pushed out of the car to alight quickly 	Please specify below
5089	2021-03-07 06:11:01.581033-05	63	29	26	-1.0914347	37.0216532	I reported 	Please specify below
5090	2021-03-07 06:11:01.58703-05	64	30	26	-1.0914347	37.0216532	positively. the spacing is to an advantage 	Please specify below
5091	2021-03-07 06:11:01.593464-05	65	31	26	-1.0914347	37.0216532	the government should include a policy or allocate resources to build stages where the disabled board and alight specifically, and build it with ramps to favour their situation 	Please specify below
5092	2021-03-07 06:11:01.59899-05	7	1	26	-1.0914347	37.0216532	NA	36-40
5093	2021-03-07 06:11:01.605805-05	1	2	26	-1.0914347	37.0216532	NA	Male
5094	2021-03-07 06:11:01.611865-05	11	3	26	-1.0914347	37.0216532	NA	Matatu
5095	2021-03-07 06:11:01.617841-05	15	4	26	-1.0914347	37.0216532	NA	Cheap
5096	2021-03-07 06:11:01.623814-05	43	20	26	-1.0914347	37.0216532	NA	Physically handicapped
5097	2021-03-07 06:11:01.629809-05	46	22	26	-1.0914347	37.0216532	NA	Yes
5098	2021-03-07 06:11:01.635782-05	49	24	26	-1.0914347	37.0216532	NA	Yes
5099	2021-03-07 06:11:01.64178-05	51	25	26	-1.0914347	37.0216532	NA	Everyday
5100	2021-03-07 06:11:01.647758-05	57	27	26	-1.0914347	37.0216532	NA	Conductor
5101	2021-03-07 06:11:01.653753-05	61	28	26	-1.0914347	37.0216532	NA	Yes
5102	2021-03-07 06:16:14.018909-05	45	21	26	-1.0913783	37.0217193	Huruma -Town 	Please specify below
5103	2021-03-07 06:16:14.028103-05	48	23	26	-1.0913783	37.0217193	helped to board 	Please specify below
5104	2021-03-07 06:16:14.03401-05	55	26	26	-1.0913783	37.0217193	non verbal. I took a mat and I was forced to hold my wheelchair coz there was no space 	Please specify below
5105	2021-03-07 06:16:14.040153-05	63	29	26	-1.0913783	37.0217193	I just talked to the conductor to atleast not to discriminate since its no one's wish	Please specify below
5106	2021-03-07 06:16:14.046232-05	64	30	26	-1.0913783	37.0217193	negative. sometimes I'm left in stage while others are picked... just because they are rushing 	Please specify below
5107	2021-03-07 06:16:14.052209-05	65	31	26	-1.0913783	37.0217193	allow time especially for the disabled before starting the car 	Please specify below
5108	2021-03-07 06:16:14.058199-05	8	1	26	-1.0913783	37.0217193	NA	45-50
5109	2021-03-07 06:16:14.064359-05	1	2	26	-1.0913783	37.0217193	NA	Male
5110	2021-03-07 06:16:14.07034-05	12	3	26	-1.0913783	37.0217193	NA	Boda boda
5111	2021-03-07 06:16:14.07632-05	16	4	26	-1.0913783	37.0217193	NA	Convenient
5112	2021-03-07 06:16:14.082385-05	43	20	26	-1.0913783	37.0217193	NA	Physically handicapped
5113	2021-03-07 06:16:14.088372-05	46	22	26	-1.0913783	37.0217193	NA	Yes
5114	2021-03-07 06:16:14.094718-05	49	24	26	-1.0913783	37.0217193	NA	Yes
5115	2021-03-07 06:16:14.100428-05	52	25	26	-1.0913783	37.0217193	NA	A few time a week
5116	2021-03-07 06:16:14.106414-05	57	27	26	-1.0913783	37.0217193	NA	Conductor
5117	2021-03-07 06:16:14.112385-05	62	28	26	-1.0913783	37.0217193	NA	No
5118	2021-03-07 06:19:50.399433-05	45	21	26	-1.0922696	37.0206654	Huruma -Town 	Please specify below
5119	2021-03-07 06:19:50.413128-05	48	23	26	-1.0922696	37.0206654	boarding for free 	Please specify below
5120	2021-03-07 06:19:50.419025-05	55	26	26	-1.0922696	37.0206654	physical 	Please specify below
5121	2021-03-07 06:19:50.425188-05	63	29	26	-1.0922696	37.0206654	I reported to the company owner's 	Please specify below
5122	2021-03-07 06:19:50.431254-05	64	30	26	-1.0922696	37.0206654	negatively. fare increment is a problem 	Please specify below
5123	2021-03-07 06:19:50.437233-05	65	31	26	-1.0922696	37.0206654	allow time to board and to alight 	Please specify below
5124	2021-03-07 06:19:50.443223-05	8	1	26	-1.0922696	37.0206654	NA	45-50
5125	2021-03-07 06:19:50.449388-05	1	2	26	-1.0922696	37.0206654	NA	Male
5126	2021-03-07 06:19:50.455559-05	11	3	26	-1.0922696	37.0206654	NA	Matatu
5127	2021-03-07 06:19:50.461526-05	16	4	26	-1.0922696	37.0206654	NA	Convenient
5128	2021-03-07 06:19:50.467502-05	41	20	26	-1.0922696	37.0206654	NA	Visually impaired
5129	2021-03-07 06:19:50.473571-05	46	22	26	-1.0922696	37.0206654	NA	Yes
5130	2021-03-07 06:19:50.479539-05	49	24	26	-1.0922696	37.0206654	NA	Yes
5131	2021-03-07 06:19:50.485622-05	52	25	26	-1.0922696	37.0206654	NA	A few time a week
5132	2021-03-07 06:19:50.491598-05	57	27	26	-1.0922696	37.0206654	NA	Conductor
5133	2021-03-07 06:19:50.497603-05	61	28	26	-1.0922696	37.0206654	NA	Yes
5134	2021-03-08 05:32:27.323944-05	23	7	25	-1.2847163	36.7433956	N/A	Please specify below
5135	2021-03-08 05:32:27.351055-05	28	10	25	-1.2847163	36.7433956	N/A	Please specify below
5136	2021-03-08 05:32:27.357028-05	29	11	25	-1.2847163	36.7433956	no	Please specify below
5137	2021-03-08 05:32:27.363005-05	32	13	25	-1.2847163	36.7433956	N/A	Please specify below
5138	2021-03-08 05:32:27.369071-05	37	16	25	-1.2847163	36.7433956	N/A	Please specify below
5139	2021-03-08 05:32:27.375058-05	38	17	25	-1.2847163	36.7433956	none	Please specify below
5140	2021-03-08 05:32:27.381135-05	39	18	25	-1.2847163	36.7433956	None	Please specify below
5141	2021-03-08 05:32:27.387122-05	40	19	25	-1.2847163	36.7433956	Offenders should be reported to the police and dealt with immediately	Please specify below
5142	2021-03-08 05:32:27.393104-05	5	1	25	-1.2847163	36.7433956	NA	26-30
5143	2021-03-08 05:32:27.399179-05	2	2	25	-1.2847163	36.7433956	NA	Female
5144	2021-03-08 05:32:27.405166-05	11	3	25	-1.2847163	36.7433956	NA	Matatu
5145	2021-03-08 05:32:27.411238-05	16	4	25	-1.2847163	36.7433956	NA	Convenient
5146	2021-03-08 05:32:27.417227-05	19	5	25	-1.2847163	36.7433956	NA	No
5147	2021-03-08 05:32:27.423208-05	20	6	25	-1.2847163	36.7433956	None	Physical touch
5148	2021-03-08 05:32:27.429203-05	25	8	25	-1.2847163	36.7433956	NA	No
5149	2021-03-08 05:32:27.435187-05	27	9	25	-1.2847163	36.7433956	NA	No
5150	2021-03-08 05:32:27.44118-05	31	12	25	-1.2847163	36.7433956	NA	No
5151	2021-03-08 05:32:27.447173-05	34	14	25	-1.2847163	36.7433956	NA	No
5152	2021-03-08 05:32:27.453159-05	35	15	25	-1.2847163	36.7433956	NA	Yes
5153	2021-03-08 05:39:57.826628-05	23	7	25	-1.2862479	36.7465749	I was sitting at the aisle seat and the two male passengers next to me kept asking me to sit between them. I had to wait for someone to alight so that I can change seats	Please specify below
5154	2021-03-08 05:39:57.848874-05	28	10	25	-1.2862479	36.7465749	They looked rowdy and would have turned against me and made it more uncomfortable for me	Please specify below
5155	2021-03-08 05:39:57.854961-05	29	11	25	-1.2862479	36.7465749	No	Please specify below
5156	2021-03-08 05:39:57.860927-05	32	13	25	-1.2862479	36.7465749	N/A	Please specify below
5157	2021-03-08 05:39:57.866919-05	37	16	25	-1.2862479	36.7465749	N/A	Please specify below
5158	2021-03-08 05:39:57.872898-05	38	17	25	-1.2862479	36.7465749	None	Please specify below
5159	2021-03-08 05:39:57.878986-05	39	18	25	-1.2862479	36.7465749	1	Please specify below
5160	2021-03-08 05:39:57.884963-05	40	19	25	-1.2862479	36.7465749	People should speak up about these things	Please specify below
5161	2021-03-08 05:39:57.891035-05	5	1	25	-1.2862479	36.7465749	NA	26-30
5162	2021-03-08 05:39:57.897192-05	2	2	25	-1.2862479	36.7465749	NA	Female
5163	2021-03-08 05:39:57.903176-05	11	3	25	-1.2862479	36.7465749	NA	Matatu
5164	2021-03-08 05:39:57.909166-05	15	4	25	-1.2862479	36.7465749	NA	Cheap
5165	2021-03-08 05:39:57.915237-05	18	5	25	-1.2862479	36.7465749	NA	Yes
5166	2021-03-08 05:39:57.921223-05	22	6	25	-1.2862479	36.7465749	NA	Sexual advances
5167	2021-03-08 05:39:57.927215-05	25	8	25	-1.2862479	36.7465749	NA	No
5168	2021-03-08 05:39:57.933202-05	27	9	25	-1.2862479	36.7465749	NA	No
5169	2021-03-08 05:39:57.939192-05	31	12	25	-1.2862479	36.7465749	NA	No
5170	2021-03-08 05:39:57.945178-05	34	14	25	-1.2862479	36.7465749	NA	No
5171	2021-03-08 05:39:57.95117-05	35	15	25	-1.2862479	36.7465749	NA	Yes
5172	2021-03-08 05:48:18.343187-05	23	7	25	-1.2890452	36.756335	N/A	Please specify below
5173	2021-03-08 05:48:18.35924-05	28	10	25	-1.2890452	36.756335	N/A	Please specify below
5174	2021-03-08 05:48:18.365707-05	29	11	25	-1.2890452	36.756335	No	Please specify below
5175	2021-03-08 05:48:18.371295-05	32	13	25	-1.2890452	36.756335	N/A	Please specify below
5176	2021-03-08 05:48:18.37728-05	37	16	25	-1.2890452	36.756335	It's uncomfortable	Please specify below
5177	2021-03-08 05:48:18.383328-05	38	17	25	-1.2890452	36.756335	None	Please specify below
5178	2021-03-08 05:48:18.389357-05	39	18	25	-1.2890452	36.756335	None	Please specify below
5179	2021-03-08 05:48:18.395329-05	40	19	25	-1.2890452	36.756335	People should learn how to report whenever  they are sexually harassed	Please specify below
5180	2021-03-08 05:48:18.401316-05	1	2	25	-1.2890452	36.756335	NA	Male
5181	2021-03-08 05:48:18.407474-05	4	1	25	-1.2890452	36.756335	23	18-25
5182	2021-03-08 05:48:18.413468-05	11	3	25	-1.2890452	36.756335	NA	Matatu
5183	2021-03-08 05:48:18.419533-05	17	4	25	-1.2890452	36.756335	Matatus are readily available anywhere	Other
5184	2021-03-08 05:48:18.425531-05	19	5	25	-1.2890452	36.756335	NA	No
5185	2021-03-08 05:48:18.431505-05	20	6	25	-1.2890452	36.756335	No	Physical touch
5186	2021-03-08 05:48:18.437509-05	25	8	25	-1.2890452	36.756335	NA	No
5187	2021-03-08 05:48:18.443486-05	27	9	25	-1.2890452	36.756335	NA	No
5188	2021-03-08 05:48:18.449484-05	31	12	25	-1.2890452	36.756335	NA	No
5189	2021-03-08 05:48:18.455463-05	34	14	25	-1.2890452	36.756335	NA	No
5190	2021-03-08 05:48:18.461466-05	36	15	25	-1.2890452	36.756335	NA	No
5191	2021-03-08 10:46:12.626274-05	23	7	23	-1.3066682	36.7873544	It used to happen when she was younger but is no longer the case as she's grown older 	Please specify below
5192	2021-03-08 10:46:12.637368-05	28	10	23	-1.3066682	36.7873544	It's the norm	Please specify below
5193	2021-03-08 10:46:12.64349-05	29	11	23	-1.3066682	36.7873544	Na	Please specify below
5194	2021-03-08 10:46:12.649493-05	32	13	23	-1.3066682	36.7873544	Na	Please specify below
5195	2021-03-08 10:46:12.655462-05	37	16	23	-1.3066682	36.7873544	Na	Please specify below
5196	2021-03-08 10:46:12.661465-05	38	17	23	-1.3066682	36.7873544	Na	Please specify below
5197	2021-03-08 10:46:12.667521-05	39	18	23	-1.3066682	36.7873544	Na	Please specify below
5198	2021-03-08 10:46:12.673516-05	40	19	23	-1.3066682	36.7873544	The older people should ensure they instill values in the younger generation 	Please specify below
5199	2021-03-08 10:46:12.679492-05	8	1	23	-1.3066682	36.7873544	NA	45-50
5200	2021-03-08 10:46:12.685666-05	2	2	23	-1.3066682	36.7873544	NA	Female
5201	2021-03-08 10:46:12.69194-05	11	3	23	-1.3066682	36.7873544	NA	Matatu
5202	2021-03-08 10:46:12.69764-05	15	4	23	-1.3066682	36.7873544	M	Cheap
5203	2021-03-08 10:46:12.703692-05	18	5	23	-1.3066682	36.7873544	NA	Yes
5204	2021-03-08 10:46:12.709693-05	22	6	23	-1.3066682	36.7873544	NA	Sexual advances
5205	2021-03-08 10:46:12.715674-05	25	8	23	-1.3066682	36.7873544	NA	No
5206	2021-03-08 10:46:12.72166-05	27	9	23	-1.3066682	36.7873544	NA	No
5207	2021-03-08 10:46:12.727656-05	31	12	23	-1.3066682	36.7873544	NA	No
5208	2021-03-08 10:46:12.73366-05	34	14	23	-1.3066682	36.7873544	NA	No
5209	2021-03-08 10:46:12.739627-05	35	15	23	-1.3066682	36.7873544	NA	Yes
5210	2021-03-08 10:47:15.686657-05	23	7	23	-1.3066625	36.787355	Catcalling by men 	Please specify below
5211	2021-03-08 10:47:15.697072-05	28	10	23	-1.3066625	36.787355	It's the norm for her 	Please specify below
5212	2021-03-08 10:47:15.70299-05	29	11	23	-1.3066625	36.787355	Na	Please specify below
5213	2021-03-08 10:47:15.708967-05	32	13	23	-1.3066625	36.787355	Na	Please specify below
5214	2021-03-08 10:47:15.714957-05	37	16	23	-1.3066625	36.787355	Na	Please specify below
5215	2021-03-08 10:47:15.720939-05	38	17	23	-1.3066625	36.787355	Na	Please specify below
5216	2021-03-08 10:47:15.727686-05	39	18	23	-1.3066625	36.787355	Almost every day 	Please specify below
5217	2021-03-08 10:47:15.733672-05	40	19	23	-1.3066625	36.787355	When catcalled one should ignore to avoid accelerating the situation 	Please specify below
5218	2021-03-08 10:47:15.739652-05	4	1	23	-1.3066625	36.787355	NA	18-25
5219	2021-03-08 10:47:15.745648-05	2	2	23	-1.3066625	36.787355	NA	Female
5220	2021-03-08 10:47:15.751628-05	11	3	23	-1.3066625	36.787355	NA	Matatu
5221	2021-03-08 10:47:15.757625-05	16	4	23	-1.3066625	36.787355	NA	Convenient
5222	2021-03-08 10:47:15.763606-05	18	5	23	-1.3066625	36.787355	NA	Yes
5223	2021-03-08 10:47:15.769603-05	21	6	23	-1.3066625	36.787355	NA	Verbal
5224	2021-03-08 10:47:15.775581-05	25	8	23	-1.3066625	36.787355	NA	No
5225	2021-03-08 10:47:15.781576-05	27	9	23	-1.3066625	36.787355	NA	No
5226	2021-03-08 10:47:15.787555-05	31	12	23	-1.3066625	36.787355	NA	No
5227	2021-03-08 10:47:15.79355-05	34	14	23	-1.3066625	36.787355	NA	No
5228	2021-03-08 10:47:15.799534-05	35	15	23	-1.3066625	36.787355	NA	Yes
5229	2021-03-08 10:49:20.96089-05	23	7	23	-1.3066614	36.7873569	She was on her commute when an older man tried making sexual advances towards her	Please specify below
5230	2021-03-08 10:49:20.978368-05	28	10	23	-1.3066614	36.7873569	Did not remember the person's name or face	Please specify below
5231	2021-03-08 10:49:20.984474-05	29	11	23	-1.3066614	36.7873569	Na	Please specify below
5232	2021-03-08 10:49:20.990459-05	32	13	23	-1.3066614	36.7873569	Na	Please specify below
5233	2021-03-08 10:49:20.99644-05	37	16	23	-1.3066614	36.7873569	Na	Please specify below
5234	2021-03-08 10:49:21.002474-05	38	17	23	-1.3066614	36.7873569	Na	Please specify below
5235	2021-03-08 10:49:21.008502-05	39	18	23	-1.3066614	36.7873569	Na	Please specify below
5236	2021-03-08 10:49:21.014511-05	40	19	23	-1.3066614	36.7873569	Ignoring the perpetrators 	Please specify below
5237	2021-03-08 10:49:21.020483-05	5	1	23	-1.3066614	36.7873569	NA	26-30
5238	2021-03-08 10:49:21.026647-05	2	2	23	-1.3066614	36.7873569	NA	Female
5239	2021-03-08 10:49:21.032614-05	11	3	23	-1.3066614	36.7873569	NA	Matatu
5240	2021-03-08 10:49:21.038622-05	18	5	23	-1.3066614	36.7873569	NA	Yes
5241	2021-03-08 10:49:21.044586-05	22	6	23	-1.3066614	36.7873569	NA	Sexual advances
5242	2021-03-08 10:49:21.050594-05	25	8	23	-1.3066614	36.7873569	NA	No
5243	2021-03-08 10:49:21.056649-05	27	9	23	-1.3066614	36.7873569	NA	No
5244	2021-03-08 10:49:21.062657-05	34	14	23	-1.3066614	36.7873569	NA	No
5245	2021-03-08 10:49:21.068642-05	35	15	23	-1.3066614	36.7873569	NA	Yes
5246	2021-03-08 10:49:21.074662-05	31	12	23	-1.3066614	36.7873569	NA	No
5247	2021-03-08 10:49:21.080623-05	16	4	23	-1.3066614	36.7873569	NA	Convenient
5248	2021-03-08 11:22:00.146887-05	23	7	23	-1.2924734	36.7883361	Na	Please specify below
5249	2021-03-08 11:22:00.159992-05	28	10	23	-1.2924734	36.7883361	Na	Please specify below
5250	2021-03-08 11:22:00.166068-05	29	11	23	-1.2924734	36.7883361	Na	Please specify below
5251	2021-03-08 11:22:00.172029-05	32	13	23	-1.2924734	36.7883361	Na	Please specify below
5252	2021-03-08 11:22:00.178114-05	37	16	23	-1.2924734	36.7883361	Na	Please specify below
5253	2021-03-08 11:22:00.184087-05	38	17	23	-1.2924734	36.7883361	Na	Please specify below
5254	2021-03-08 11:22:00.190175-05	39	18	23	-1.2924734	36.7883361	Na	Please specify below
5255	2021-03-08 11:22:00.196145-05	40	19	23	-1.2924734	36.7883361	Reporting to the police when it happens 	Please specify below
5256	2021-03-08 11:22:00.202142-05	6	1	23	-1.2924734	36.7883361	NA	31-35
5257	2021-03-08 11:22:00.208214-05	1	2	23	-1.2924734	36.7883361	NA	Male
5258	2021-03-08 11:22:00.214295-05	11	3	23	-1.2924734	36.7883361	NA	Matatu
5259	2021-03-08 11:22:00.220265-05	16	4	23	-1.2924734	36.7883361	NA	Convenient
5260	2021-03-08 11:22:00.226261-05	19	5	23	-1.2924734	36.7883361	NA	No
5261	2021-03-08 11:22:00.232238-05	21	6	23	-1.2924734	36.7883361	None 	Verbal
5262	2021-03-08 11:22:00.238238-05	25	8	23	-1.2924734	36.7883361	NA	No
5263	2021-03-08 11:22:00.244217-05	27	9	23	-1.2924734	36.7883361	NA	No
5264	2021-03-08 11:22:00.250297-05	31	12	23	-1.2924734	36.7883361	NA	No
5265	2021-03-08 11:22:00.256274-05	34	14	23	-1.2924734	36.7883361	NA	No
5266	2021-03-08 11:22:00.262274-05	35	15	23	-1.2924734	36.7883361	NA	Yes
5267	2021-03-09 06:49:22.909596-05	23	7	25	NA	NA	I was spanked while walking to seat at the back of the matatu by a male passenger 	Please specify below
5268	2021-03-09 06:49:22.919267-05	28	10	25	NA	NA	It wasn't necessary	Please specify below
5269	2021-03-09 06:49:22.925388-05	29	11	25	NA	NA	N/A	Please specify below
5270	2021-03-09 06:49:22.93143-05	32	13	25	NA	NA	N/A	Please specify below
5271	2021-03-09 06:49:22.937419-05	37	16	25	NA	NA	The victim is usually blamed on most occasions	Please specify below
5272	2021-03-09 06:49:22.943403-05	38	17	25	NA	NA	None	Please specify below
5273	2021-03-09 06:49:22.949485-05	39	18	25	NA	NA	4	Please specify below
5274	2021-03-09 06:49:22.955472-05	40	19	25	NA	NA	Pepper sprays should be legal	Please specify below
5275	2021-03-09 06:49:22.961458-05	4	1	25	NA	NA	NA	18-25
5276	2021-03-09 06:49:22.967604-05	2	2	25	NA	NA	NA	Female
5277	2021-03-09 06:49:22.973599-05	11	3	25	NA	NA	NA	Matatu
5278	2021-03-09 06:49:22.979581-05	15	4	25	NA	NA	NA	Cheap
5279	2021-03-09 06:49:22.985559-05	18	5	25	NA	NA	NA	Yes
5280	2021-03-09 06:49:22.991551-05	20	6	25	NA	NA	NA	Physical touch
5281	2021-03-09 06:49:22.997545-05	25	8	25	NA	NA	NA	No
5282	2021-03-09 06:49:23.003918-05	27	9	25	NA	NA	NA	No
5283	2021-03-09 06:49:23.009609-05	31	12	25	NA	NA	NA	No
5284	2021-03-09 06:49:23.015579-05	34	14	25	NA	NA	NA	No
5285	2021-03-09 06:49:23.021572-05	36	15	25	NA	NA	NA	No
5286	2021-03-09 06:59:20.130286-05	23	7	25	-1.2892166	36.7440924	N/A	Please specify below
5287	2021-03-09 06:59:20.144945-05	28	10	25	-1.2892166	36.7440924	N/A	Please specify below
5288	2021-03-09 06:59:20.150994-05	29	11	25	-1.2892166	36.7440924	N/A	Please specify below
5289	2021-03-09 06:59:20.156974-05	32	13	25	-1.2892166	36.7440924	I saw a lady surrounded by men at the matatu stage and some were touching her boobs pretending to persuade her to board the matatu	Please specify below
5290	2021-03-09 06:59:20.162968-05	37	16	25	-1.2892166	36.7440924	Those responsible to punish offenders are also part of the problem	Please specify below
5291	2021-03-09 06:59:20.168948-05	38	17	25	-1.2892166	36.7440924	2	Please specify below
5292	2021-03-09 06:59:20.175022-05	39	18	25	-1.2892166	36.7440924	None	Please specify below
5293	2021-03-09 06:59:20.181009-05	40	19	25	-1.2892166	36.7440924	Offenders should be punished immediately	Please specify below
5294	2021-03-09 06:59:20.186996-05	5	1	25	-1.2892166	36.7440924	NA	26-30
5295	2021-03-09 06:59:20.193135-05	1	2	25	-1.2892166	36.7440924	NA	Male
5296	2021-03-09 06:59:20.199218-05	11	3	25	-1.2892166	36.7440924	NA	Matatu
5297	2021-03-09 06:59:20.20519-05	15	4	25	-1.2892166	36.7440924	NA	Cheap
5298	2021-03-09 06:59:20.211185-05	19	5	25	-1.2892166	36.7440924	NA	No
5299	2021-03-09 06:59:20.217169-05	20	6	25	-1.2892166	36.7440924	N/A	Physical touch
5300	2021-03-09 06:59:20.223165-05	25	8	25	-1.2892166	36.7440924	NA	No
5301	2021-03-09 06:59:20.229153-05	27	9	25	-1.2892166	36.7440924	NA	No
5302	2021-03-09 06:59:20.235228-05	30	12	25	-1.2892166	36.7440924	NA	Yes
5303	2021-03-09 06:59:20.241212-05	34	14	25	-1.2892166	36.7440924	NA	No
5304	2021-03-09 06:59:20.247208-05	36	15	25	-1.2892166	36.7440924	NA	No
5305	2021-03-09 07:08:27.088492-05	23	7	25	-1.2908404	36.7466915	I was seated on the same row with a man who was masturbating and together with the other lady passengers we asked the driver to stop so that he can alight	Please specify below
5306	2021-03-09 07:08:27.100415-05	28	10	25	-1.2908404	36.7466915	N/A	Please specify below
5307	2021-03-09 07:08:27.106166-05	29	11	25	-1.2908404	36.7466915	The conductor told us to mind our own business but we threatened to alight so he forced him out	Please specify below
5308	2021-03-09 07:08:27.112137-05	32	13	25	-1.2908404	36.7466915	I have witnessed sexual advances from matatu crew and passengers a lot	Please specify below
5309	2021-03-09 07:08:27.118142-05	37	16	25	-1.2908404	36.7466915	There are no consequences to the offenders most times	Please specify below
5310	2021-03-09 07:08:27.124112-05	38	17	25	-1.2908404	36.7466915	10	Please specify below
5311	2021-03-09 07:08:27.130283-05	39	18	25	-1.2908404	36.7466915	5	Please specify below
5312	2021-03-09 07:08:27.13626-05	40	19	25	-1.2908404	36.7466915	The victims should stand up for themselves because no one else cares	Please specify below
5313	2021-03-09 07:08:27.142255-05	4	1	25	-1.2908404	36.7466915	NA	18-25
5314	2021-03-09 07:08:27.148318-05	2	2	25	-1.2908404	36.7466915	NA	Female
5315	2021-03-09 07:08:27.154309-05	11	3	25	-1.2908404	36.7466915	NA	Matatu
5316	2021-03-09 07:08:27.16036-05	15	4	25	-1.2908404	36.7466915	NA	Cheap
5317	2021-03-09 07:08:27.166357-05	18	5	25	-1.2908404	36.7466915	NA	Yes
5318	2021-03-09 07:08:27.172337-05	22	6	25	-1.2908404	36.7466915	NA	Sexual advances
5319	2021-03-09 07:08:27.178332-05	25	8	25	-1.2908404	36.7466915	NA	No
5320	2021-03-09 07:08:27.184313-05	26	9	25	-1.2908404	36.7466915	NA	Yes
5321	2021-03-09 07:08:27.190308-05	30	12	25	-1.2908404	36.7466915	NA	Yes
5322	2021-03-09 07:08:27.19638-05	34	14	25	-1.2908404	36.7466915	Sometimes it's a friend	No
5323	2021-03-09 07:08:27.202377-05	36	15	25	-1.2908404	36.7466915	NA	No
5324	2021-03-09 07:14:09.51993-05	23	7	25	-1.2914384	36.7485055	The boda guy kept saying that I move close to him for 'balance' then he started saying he liked me and wanted to marry me	Please specify below
5325	2021-03-09 07:14:09.531673-05	28	10	25	-1.2914384	36.7485055	I didn't need to ask for help	Please specify below
5326	2021-03-09 07:14:09.537765-05	29	11	25	-1.2914384	36.7485055	No	Please specify below
5327	2021-03-09 07:14:09.543739-05	32	13	25	-1.2914384	36.7485055	N/A	Please specify below
5328	2021-03-09 07:14:09.54972-05	37	16	25	-1.2914384	36.7485055	The victims are always blamed and their reports brushed off	Please specify below
5329	2021-03-09 07:14:09.555696-05	38	17	25	-1.2914384	36.7485055	0	Please specify below
5330	2021-03-09 07:14:09.561779-05	39	18	25	-1.2914384	36.7485055	3	Please specify below
5331	2021-03-09 07:14:09.567755-05	40	19	25	-1.2914384	36.7485055	Sexual harassment education for all	Please specify below
5332	2021-03-09 07:14:09.57375-05	5	1	25	-1.2914384	36.7485055	NA	26-30
5333	2021-03-09 07:14:09.579814-05	2	2	25	-1.2914384	36.7485055	NA	Female
5334	2021-03-09 07:14:09.585809-05	12	3	25	-1.2914384	36.7485055	NA	Boda boda
5335	2021-03-09 07:14:09.59187-05	16	4	25	-1.2914384	36.7485055	NA	Convenient
5336	2021-03-09 07:14:09.59796-05	18	5	25	-1.2914384	36.7485055	T	Yes
5337	2021-03-09 07:14:09.603921-05	22	6	25	-1.2914384	36.7485055	NA	Sexual advances
5338	2021-03-09 07:14:09.609931-05	25	8	25	-1.2914384	36.7485055	NA	No
5339	2021-03-09 07:14:09.615908-05	27	9	25	-1.2914384	36.7485055	NA	No
5340	2021-03-09 07:14:09.621905-05	31	12	25	-1.2914384	36.7485055	NA	No
5341	2021-03-09 07:14:09.62786-05	34	14	25	-1.2914384	36.7485055	NA	No
5342	2021-03-09 07:14:09.633883-05	36	15	25	-1.2914384	36.7485055	NA	No
5343	2021-03-09 07:52:26.727935-05	23	7	25	-1.2858739	36.7531532	A male passenger next to me was pretending to be falling asleep on my chest. asked him to lean on the seat and he insulted me.	Please specify below
5344	2021-03-09 07:52:26.737991-05	28	10	25	-1.2858739	36.7531532	I just ignored him and changed seats	Please specify below
5345	2021-03-09 07:52:26.744027-05	29	11	25	-1.2858739	36.7531532	No	Please specify below
5346	2021-03-09 07:52:26.750008-05	32	13	25	-1.2858739	36.7531532	N/A	Please specify below
5347	2021-03-09 07:52:26.755985-05	37	16	25	-1.2858739	36.7531532	It might lead to victim stigma	Please specify below
5348	2021-03-09 07:52:26.762067-05	38	17	25	-1.2858739	36.7531532	1	Please specify below
5349	2021-03-09 07:52:26.76804-05	39	18	25	-1.2858739	36.7531532	3	Please specify below
5350	2021-03-09 07:52:26.774044-05	40	19	25	-1.2858739	36.7531532	Reduce stigma to those who come out to report sexual harassment so that more people can be encouraged to report 	Please specify below
5351	2021-03-09 07:52:26.780019-05	4	1	25	-1.2858739	36.7531532	NA	18-25
5352	2021-03-09 07:52:26.786098-05	2	2	25	-1.2858739	36.7531532	NA	Female
5353	2021-03-09 07:52:26.792083-05	11	3	25	-1.2858739	36.7531532	NA	Matatu
5354	2021-03-09 07:52:26.798239-05	15	4	25	-1.2858739	36.7531532	NA	Cheap
5355	2021-03-09 07:52:26.804212-05	18	5	25	-1.2858739	36.7531532	NA	Yes
5356	2021-03-09 07:52:26.810219-05	20	6	25	-1.2858739	36.7531532	NA	Physical touch
5357	2021-03-09 07:52:26.816193-05	25	8	25	-1.2858739	36.7531532	NA	No
5358	2021-03-09 07:52:26.822195-05	27	9	25	-1.2858739	36.7531532	NA	No
5359	2021-03-09 07:52:26.828167-05	31	12	25	-1.2858739	36.7531532	NA	No
5360	2021-03-09 07:52:26.834168-05	34	14	25	-1.2858739	36.7531532	NA	No
5361	2021-03-09 07:52:26.840154-05	36	15	25	-1.2858739	36.7531532	NA	No
5362	2021-03-09 07:58:38.330221-05	23	7	25	-1.2850075	36.7532358	N/A	Please specify below
5363	2021-03-09 07:58:38.346337-05	28	10	25	-1.2850075	36.7532358	N/A	Please specify below
5364	2021-03-09 07:58:38.352287-05	29	11	25	-1.2850075	36.7532358	No	Please specify below
5365	2021-03-09 07:58:38.358273-05	32	13	25	-1.2850075	36.7532358	Witnessed a certain lady being insulted after she refused to board a matatu	Please specify below
5366	2021-03-09 07:58:38.364245-05	37	16	25	-1.2850075	36.7532358	The authorities don't care about such cases	Please specify below
5367	2021-03-09 07:58:38.370314-05	38	17	25	-1.2850075	36.7532358	3	Please specify below
5368	2021-03-09 07:58:38.37638-05	39	18	25	-1.2850075	36.7532358	0	Please specify below
5369	2021-03-09 07:58:38.382469-05	40	19	25	-1.2850075	36.7532358	The authorities responsible for these matters should take their work seriously	Please specify below
5370	2021-03-09 07:58:38.388429-05	4	1	25	-1.2850075	36.7532358	NA	18-25
5371	2021-03-09 07:58:38.394519-05	2	2	25	-1.2850075	36.7532358	NA	Female
5372	2021-03-09 07:58:38.400494-05	11	3	25	-1.2850075	36.7532358	NA	Matatu
5373	2021-03-09 07:58:38.406585-05	17	4	25	-1.2850075	36.7532358	Reliable	Other
5374	2021-03-09 07:58:38.412557-05	19	5	25	-1.2850075	36.7532358	NA	No
5375	2021-03-09 07:58:38.418557-05	20	6	25	-1.2850075	36.7532358	None	Physical touch
5376	2021-03-09 07:58:38.424523-05	25	8	25	-1.2850075	36.7532358	NA	No
5377	2021-03-09 07:58:38.43053-05	27	9	25	-1.2850075	36.7532358	NA	No
5378	2021-03-09 07:58:38.436502-05	30	12	25	-1.2850075	36.7532358	Y	Yes
5379	2021-03-09 07:58:38.442526-05	34	14	25	-1.2850075	36.7532358	NA	No
5380	2021-03-09 07:58:38.448562-05	36	15	25	-1.2850075	36.7532358	NA	No
5381	2021-03-09 08:30:50.672844-05	23	7	25	-1.2874127	36.7485754	The conductor wanted me to give him my phone number and did not even ask me for my fare	Please specify below
5382	2021-03-09 08:30:50.686729-05	28	10	25	-1.2874127	36.7485754	N/A	Please specify below
5383	2021-03-09 08:30:50.692681-05	29	11	25	-1.2874127	36.7485754	No	Please specify below
5384	2021-03-09 08:30:50.698669-05	32	13	25	-1.2874127	36.7485754	N/A	Please specify below
5385	2021-03-09 08:30:50.704642-05	37	16	25	-1.2874127	36.7485754	N/A	Please specify below
5386	2021-03-09 08:30:50.710708-05	38	17	25	-1.2874127	36.7485754	None	Please specify below
5387	2021-03-09 08:30:50.716782-05	39	18	25	-1.2874127	36.7485754	3	Please specify below
5388	2021-03-09 08:30:50.722772-05	40	19	25	-1.2874127	36.7485754	No	Please specify below
5389	2021-03-09 08:30:50.728746-05	5	1	25	-1.2874127	36.7485754	NA	26-30
5390	2021-03-09 08:30:50.734832-05	2	2	25	-1.2874127	36.7485754	NA	Female
5391	2021-03-09 08:30:50.740894-05	11	3	25	-1.2874127	36.7485754	NA	Matatu
5392	2021-03-09 08:30:50.74697-05	15	4	25	-1.2874127	36.7485754	NA	Cheap
5393	2021-03-09 08:30:50.752946-05	18	5	25	-1.2874127	36.7485754	NA	Yes
5394	2021-03-09 08:30:50.758941-05	22	6	25	-1.2874127	36.7485754	NA	Sexual advances
5395	2021-03-09 08:30:50.764942-05	25	8	25	-1.2874127	36.7485754	NA	No
5396	2021-03-09 08:30:50.770931-05	27	9	25	-1.2874127	36.7485754	NA	No
5397	2021-03-09 08:30:50.776898-05	31	12	25	-1.2874127	36.7485754	NA	No
5398	2021-03-09 08:30:50.78291-05	34	14	25	-1.2874127	36.7485754	NA	No
5399	2021-03-09 08:30:50.788885-05	35	15	25	-1.2874127	36.7485754	NA	Yes
5400	2021-03-09 08:54:42.670771-05	23	7	25	-1.2878589	36.7452555	 Being winked at by a male passenger and him signaling me to move to the seat next to him. He even paid my transport.	Please specify below
5401	2021-03-09 08:54:42.685388-05	28	10	25	-1.2878589	36.7452555	I didn't want to cause unnecessary chaos	Please specify below
5402	2021-03-09 08:54:42.691364-05	29	11	25	-1.2878589	36.7452555	No	Please specify below
5403	2021-03-09 08:54:42.697339-05	32	13	25	-1.2878589	36.7452555	A lady friend was touched repeatedly by a male passenger and had to slap him and shame to the rest of the passengers	Please specify below
5404	2021-03-09 08:54:42.703316-05	37	16	25	-1.2878589	36.7452555	Nothing will be done, you'd rather deal with the situation yourself	Please specify below
5405	2021-03-09 08:54:42.709407-05	38	17	25	-1.2878589	36.7452555	6	Please specify below
5406	2021-03-09 08:54:42.715463-05	39	18	25	-1.2878589	36.7452555	3	Please specify below
5407	2021-03-09 08:54:42.721456-05	40	19	25	-1.2878589	36.7452555	Encourage ladies to reduce commute by public means if necessary and to stand up to the offenders	Please specify below
5408	2021-03-09 08:54:42.727501-05	6	1	25	-1.2878589	36.7452555	NA	31-35
5409	2021-03-09 08:54:42.73359-05	2	2	25	-1.2878589	36.7452555	NA	Female
5410	2021-03-09 08:54:42.739555-05	11	3	25	-1.2878589	36.7452555	NA	Matatu
5411	2021-03-09 08:54:42.745635-05	15	4	25	-1.2878589	36.7452555	NA	Cheap
5412	2021-03-09 08:54:42.751632-05	18	5	25	-1.2878589	36.7452555	NA	Yes
5413	2021-03-09 08:54:42.757627-05	22	6	25	-1.2878589	36.7452555	NA	Sexual advances
5414	2021-03-09 08:54:42.763589-05	25	8	25	-1.2878589	36.7452555	NA	No
5415	2021-03-09 08:54:42.769595-05	27	9	25	-1.2878589	36.7452555	NA	No
5416	2021-03-09 08:54:42.775568-05	30	12	25	-1.2878589	36.7452555	NA	Yes
5417	2021-03-09 08:54:42.781561-05	33	14	25	-1.2878589	36.7452555	NA	Yes
5418	2021-03-09 08:54:42.787546-05	36	15	25	-1.2878589	36.7452555	NA	No
\.


--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_triviafeedback_id_seq', 5418, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fares_fare_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare
    ADD CONSTRAINT fares_fare_pkey PRIMARY KEY (id);


--
-- Name: questions_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice
    ADD CONSTRAINT questions_choice_pkey PRIMARY KEY (id);


--
-- Name: questions_leaderboard_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard
    ADD CONSTRAINT questions_leaderboard_pkey PRIMARY KEY (id);


--
-- Name: questions_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_pkey PRIMARY KEY (id);


--
-- Name: questions_transitfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback
    ADD CONSTRAINT questions_transitfeedback_pkey PRIMARY KEY (id);


--
-- Name: questions_triviafeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeedback_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fares_fare_user_id_76be4f55; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX fares_fare_user_id_76be4f55 ON public.fares_fare USING btree (user_id);


--
-- Name: questions_choice_question_id_2d0da4e9; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_choice_question_id_2d0da4e9 ON public.questions_choice USING btree (question_id);


--
-- Name: questions_leaderboard_user_id_90cf2fdc; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_leaderboard_user_id_90cf2fdc ON public.questions_leaderboard USING btree (user_id);


--
-- Name: questions_transitfeedback_point_id; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_transitfeedback_point_id ON public.questions_transitfeedback USING gist (point);


--
-- Name: questions_transitfeedback_user_id_2e764b97; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_transitfeedback_user_id_2e764b97 ON public.questions_transitfeedback USING btree (user_id);


--
-- Name: questions_triviafeedback_choice_id_623d0221; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_choice_id_623d0221 ON public.questions_triviafeedback USING btree (choice_id);


--
-- Name: questions_triviafeedback_question_id_e8a8d321; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_question_id_e8a8d321 ON public.questions_triviafeedback USING btree (question_id);


--
-- Name: questions_triviafeedback_user_id_f07e8d9f; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_user_id_f07e8d9f ON public.questions_triviafeedback USING btree (user_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fares_fare_user_id_76be4f55_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare
    ADD CONSTRAINT fares_fare_user_id_76be4f55_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_choice_question_id_2d0da4e9_fk_questions_question_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice
    ADD CONSTRAINT questions_choice_question_id_2d0da4e9_fk_questions_question_id FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_leaderboard_user_id_90cf2fdc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard
    ADD CONSTRAINT questions_leaderboard_user_id_90cf2fdc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_transitfeedback_user_id_2e764b97_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback
    ADD CONSTRAINT questions_transitfeedback_user_id_2e764b97_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeed_choice_id_623d0221_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeed_choice_id_623d0221_fk_questions FOREIGN KEY (choice_id) REFERENCES public.questions_choice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeed_question_id_e8a8d321_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeed_question_id_e8a8d321_fk_questions FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeedback_user_id_f07e8d9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeedback_user_id_f07e8d9f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect matatu_rate

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: dmatat
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate character varying(100),
    comment character varying(100),
    number_plate character varying(200),
    route_no character varying(100),
    user_id character varying(200),
    location character varying(200),
    "timestamp" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.ratings OWNER TO dmatat;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: dmatat
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO dmatat;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmatat
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: dmatat
--

COPY public.ratings (id, rate, comment, number_plate, route_no, user_id, location, "timestamp") FROM stdin;
1	rate	comment	number_plate	route_no	\N	\N	2019-11-19 03:01:14.267691
2	rate	comment	number_plate	route_no	\N	\N	2019-11-19 03:11:33.21483
3	rate	comment	number_plate	route_no	\N	\N	2019-11-19 03:11:34.484958
4	rate	comment	number_plate	route_no	\N	\N	2019-11-19 03:16:26.64038
5	rate	comment	number_plate	route_no	\N	\N	2019-11-19 03:32:24.338071
6					\N	\N	2019-11-19 03:57:42.35804
7					\N	\N	2019-11-19 03:57:52.043009
8					\N	\N	2019-11-19 04:31:49.668162
9					\N	\N	2020-02-06 06:53:22.072054
10					\N	\N	2020-02-06 08:23:47.562745
11					\N	\N	2020-02-06 10:36:35.750917
12					\N	\N	2020-02-07 03:27:51.655104
13					\N	\N	2020-02-11 09:44:27.700725
14					\N	\N	2020-02-12 07:48:26.824926
15					\N	\N	2020-02-14 19:10:30.941147
16					\N	\N	2020-08-04 06:14:10.090764
17					\N	\N	2020-08-04 07:41:47.158559
18	2	text\n	KCP 801V	107D	\N	\N	2020-08-23 23:01:14.982186
19	1		KCP 801V	107D	\N	\N	2020-08-23 23:01:20.67921
20	3		KCP 801V	107D	\N	\N	2020-08-23 23:01:50.653766
21	5		KCP 801V	107D	\N	\N	2020-08-23 23:02:00.654016
22	3		KCP 801V	107D	\N	\N	2020-08-29 06:42:29.414309
23	2	text\n	KCP 801V	107D	\N	\N	2020-08-29 06:45:18.957727
24	2	text\n	KCP 801V	107D	\N	\N	2020-09-02 03:26:03.049895
25	1		KCP 801V	107D	\N	\N	2020-09-02 03:26:08.948337
26	3		KCP 801V	107D	\N	\N	2020-09-02 03:26:38.826507
27	5		KCP 801V	107D	\N	\N	2020-09-02 03:26:48.693061
28	2	text\n	KCP 801V	107D	\N	\N	2020-09-05 06:20:46.216757
29	1		KCP 801V	107D	\N	\N	2020-09-05 06:20:52.045374
30	3		KCP 801V	107D	\N	\N	2020-09-05 06:21:21.922491
31	5		KCP 801V	107D	\N	\N	2020-09-05 06:21:31.708866
32					\N	\N	2020-09-05 20:03:03.037777
33					\N	\N	2020-09-11 04:31:27.252386
34					\N	\N	2020-09-13 07:18:17.204877
35					\N	\N	2020-09-21 06:58:31.854662
36					\N	\N	2020-09-29 18:33:33.83164
37	2	text\n	KCP 801V	107D	\N	\N	2020-10-08 12:21:43.843409
38	1		KCP 801V	107D	\N	\N	2020-10-08 12:21:50.207706
39	3		KCP 801V	107D	\N	\N	2020-10-08 12:22:22.512121
40	5		KCP 801V	107D	\N	\N	2020-10-08 12:22:33.183754
41					\N	\N	2020-10-08 15:11:53.558945
42					\N	\N	2020-10-09 03:43:44.075066
43					\N	\N	2020-10-09 03:44:03.179068
44					\N	\N	2020-10-09 03:44:10.651801
45					\N	\N	2020-10-09 03:44:35.063591
46	8				\N	\N	2020-10-09 03:45:05.421054
47	8	8	8	8	\N	\N	2020-10-09 03:45:56.317163
48	3		KCP 801V	107D	\N	\N	2020-11-27 01:37:05.734667
49	4		KCP 801V	114R	\N	\N	2020-11-27 01:37:39.552571
50					\N	\N	2020-12-05 12:59:57.062617
51					\N	\N	2020-12-08 04:04:44.296953
52					\N	\N	2020-12-16 01:57:46.638733
53					\N	\N	2020-12-22 17:04:29.662042
54					\N	\N	2020-12-22 17:04:50.790837
55					\N	\N	2020-12-24 10:16:55.839624
56					\N	\N	2020-12-27 17:39:10.260036
57					\N	\N	2021-01-01 19:43:15.865571
58					\N	\N	2021-01-02 00:15:44.134933
59					\N	\N	2021-01-05 02:37:14.091614
60					\N	\N	2021-01-10 11:10:45.473179
61					\N	\N	2021-01-19 05:19:05.058105
62					\N	\N	2021-01-20 15:49:07.253303
63					\N	\N	2021-01-20 15:52:27.667042
64					\N	\N	2021-01-27 18:17:35.210884
65					\N	\N	2021-02-05 12:32:43.910525
66					\N	\N	2021-02-10 03:07:40.853503
67					\N	\N	2021-02-15 02:30:29.278238
68					\N	\N	2021-02-15 02:31:30.912074
69					\N	\N	2021-02-23 10:40:02.253143
70					\N	\N	2021-03-02 11:34:23.91748
71					\N	\N	2021-03-02 23:45:03.848453
72					\N	\N	2021-03-10 11:13:37.624775
73					\N	\N	2021-03-15 14:07:24.183542
74					\N	\N	2021-03-17 01:44:00.946525
75					\N	\N	2021-03-21 16:59:01.691203
76					\N	\N	2021-03-21 21:52:08.494971
77					\N	\N	2021-03-30 13:30:15.444053
78					\N	\N	2021-03-30 13:39:23.465024
79					\N	\N	2021-04-07 12:17:19.730631
\.


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmatat
--

SELECT pg_catalog.setval('public.ratings_id_seq', 79, true);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: dmatat
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE ratings; Type: ACL; Schema: public; Owner: dmatat
--

REVOKE ALL ON TABLE public.ratings FROM PUBLIC;
REVOKE ALL ON TABLE public.ratings FROM dmatat;
GRANT ALL ON TABLE public.ratings TO dmatat;
GRANT ALL ON TABLE public.ratings TO matatu_rate;


--
-- Name: SEQUENCE ratings_id_seq; Type: ACL; Schema: public; Owner: dmatat
--

REVOKE ALL ON SEQUENCE public.ratings_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.ratings_id_seq FROM dmatat;
GRANT ALL ON SEQUENCE public.ratings_id_seq TO dmatat;
GRANT SELECT,USAGE ON SEQUENCE public.ratings_id_seq TO matatu_rate;


--
-- PostgreSQL database dump complete
--

\connect matatud

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ma3tycoon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ma3tycoon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ma3tycoon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ma3tycoon;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ma3tycoon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ma3tycoon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ma3tycoon;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ma3tycoon;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ma3tycoon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ma3tycoon;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ma3tycoon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ma3tycoon;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ma3tycoon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ma3tycoon;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ma3tycoon;

--
-- Name: fares_fare; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.fares_fare (
    id integer NOT NULL,
    stop_to character varying(255),
    stop_from character varying(255),
    amount character varying(255),
    stop_from_id character varying(255),
    route_id character varying(255),
    stop_to_id character varying(255),
    weather character varying(255),
    traffic_jam character varying(255),
    demand character varying(255),
    air_quality character varying(255),
    peak character varying(255),
    travel_time character varying(255),
    crowd character varying(255),
    safety character varying(255),
    drive_safety character varying(255),
    music character varying(255),
    internet character varying(255),
    date_added timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.fares_fare OWNER TO ma3tycoon;

--
-- Name: fares_fare_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.fares_fare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fares_fare_id_seq OWNER TO ma3tycoon;

--
-- Name: fares_fare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.fares_fare_id_seq OWNED BY public.fares_fare.id;


--
-- Name: questions_choice; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    points integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.questions_choice OWNER TO ma3tycoon;

--
-- Name: questions_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_choice_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_choice_id_seq OWNED BY public.questions_choice.id;


--
-- Name: questions_leaderboard; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_leaderboard (
    id integer NOT NULL,
    transit_points integer NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    trivia_points integer NOT NULL
);


ALTER TABLE public.questions_leaderboard OWNER TO ma3tycoon;

--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_leaderboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_leaderboard_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_leaderboard_id_seq OWNED BY public.questions_leaderboard.id;


--
-- Name: questions_question; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    attachment character varying(100),
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE public.questions_question OWNER TO ma3tycoon;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions_question.id;


--
-- Name: questions_transitfeedback; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_transitfeedback (
    id integer NOT NULL,
    stop character varying(255) NOT NULL,
    point public.geometry(Point,4326) NOT NULL,
    position_correct character varying(1) NOT NULL,
    user_id integer NOT NULL,
    date_added timestamp with time zone NOT NULL
);


ALTER TABLE public.questions_transitfeedback OWNER TO ma3tycoon;

--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_transitfeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_transitfeedback_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_transitfeedback_id_seq OWNED BY public.questions_transitfeedback.id;


--
-- Name: questions_triviafeedback; Type: TABLE; Schema: public; Owner: ma3tycoon
--

CREATE TABLE public.questions_triviafeedback (
    id integer NOT NULL,
    date_added timestamp with time zone NOT NULL,
    choice_id integer NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.questions_triviafeedback OWNER TO ma3tycoon;

--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE; Schema: public; Owner: ma3tycoon
--

CREATE SEQUENCE public.questions_triviafeedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_triviafeedback_id_seq OWNER TO ma3tycoon;

--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ma3tycoon
--

ALTER SEQUENCE public.questions_triviafeedback_id_seq OWNED BY public.questions_triviafeedback.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare ALTER COLUMN id SET DEFAULT nextval('public.fares_fare_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice ALTER COLUMN id SET DEFAULT nextval('public.questions_choice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard ALTER COLUMN id SET DEFAULT nextval('public.questions_leaderboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_question ALTER COLUMN id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback ALTER COLUMN id SET DEFAULT nextval('public.questions_transitfeedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback ALTER COLUMN id SET DEFAULT nextval('public.questions_triviafeedback_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add question	8	add_question
23	Can change question	8	change_question
24	Can delete question	8	delete_question
25	Can add choice	9	add_choice
26	Can change choice	9	change_choice
27	Can delete choice	9	delete_choice
28	Can add Transit feedback	10	add_transitfeedback
29	Can change Transit feedback	10	change_transitfeedback
30	Can delete Transit feedback	10	delete_transitfeedback
31	Can add Trivia feedback	11	add_triviafeedback
32	Can change Trivia feedback	11	change_triviafeedback
33	Can delete Trivia feedback	11	delete_triviafeedback
34	Can add Leaderboard	12	add_leaderboard
35	Can change Leaderboard	12	change_leaderboard
36	Can delete Leaderboard	12	delete_leaderboard
37	Can add fare	13	add_fare
38	Can change fare	13	change_fare
39	Can delete fare	13	delete_fare
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$ODVBkGAuOtjl$7aaKSppUtEC6vHpAiWsFzGpcmRA8Uwov4L6kzkBE9io=	2018-07-12 12:35:24.873391-04	t	tycoon				t	t	2018-07-12 09:00:41.363796-04
2	pbkdf2_sha256$100000$xnGfQvk7koxh$CB0OZEcz1CTfCyw5Oo+jSAIleAOnvo07sFohVr5B27U=	\N	f	test1			test1@google.com	f	t	2018-07-12 12:38:49.252236-04
3	pbkdf2_sha256$100000$VckvSjyBDTQn$UBhggmmFyTqARsdIR1qqxTTnTxEXDCOTDcyoqxjYmeo=	\N	f	test			test@gmail.com	f	t	2018-07-23 14:13:19.637289-04
4	pbkdf2_sha256$100000$fzORBwBCKf30$Cu2aWBd2BtxkTCsu/L4xu8LavBcHp0v2WaWTeHy/f4s=	\N	t	twiga				t	t	2018-07-31 13:37:36.2506-04
5	pbkdf2_sha256$100000$iCPaYbqoVary$cmPlnirDm9IOVzCJNzumzQS9+GTOfEBX4ezYFOqBb6s=	\N	f	steve			steve@gmail.com	f	t	2018-08-15 16:46:35.457992-04
6	pbkdf2_sha256$100000$DaRspvgxtgNp$x/RN7uyepdmz9puFsTscVgMHjc80M+YPbMCM91TJV3Q=	\N	f	steve2			rstephenosoro@gmail.com	f	t	2018-09-17 14:35:44.972431-04
7	pbkdf2_sha256$100000$wssSaIOEjTfM$kQOuWl8dTxcV1Tr+mFYQ3mFgVzN8xOYSsxphS2auEOE=	\N	f	Martinie			ecc.martin@gmail.com	f	t	2019-03-04 05:45:22.202425-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	questions	question
9	questions	choice
10	questions	transitfeedback
11	questions	triviafeedback
12	questions	leaderboard
13	fares	fare
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-12 08:45:48.116265-04
2	auth	0001_initial	2018-07-12 08:45:48.356281-04
3	admin	0001_initial	2018-07-12 08:45:48.43475-04
4	admin	0002_logentry_remove_auto_add	2018-07-12 08:45:48.451095-04
5	contenttypes	0002_remove_content_type_name	2018-07-12 08:45:48.483463-04
6	auth	0002_alter_permission_name_max_length	2018-07-12 08:45:48.494269-04
7	auth	0003_alter_user_email_max_length	2018-07-12 08:45:48.511155-04
8	auth	0004_alter_user_username_opts	2018-07-12 08:45:48.523029-04
9	auth	0005_alter_user_last_login_null	2018-07-12 08:45:48.536127-04
10	auth	0006_require_contenttypes_0002	2018-07-12 08:45:48.542099-04
11	auth	0007_alter_validators_add_error_messages	2018-07-12 08:45:48.558329-04
12	auth	0008_alter_user_username_max_length	2018-07-12 08:45:48.583746-04
13	auth	0009_alter_user_last_name_max_length	2018-07-12 08:45:48.610002-04
14	authtoken	0001_initial	2018-07-12 08:45:48.644615-04
15	authtoken	0002_auto_20160226_1747	2018-07-12 08:45:48.706335-04
16	questions	0001_initial	2018-07-12 08:45:48.759022-04
17	questions	0002_auto_20180709_1407	2018-07-12 08:45:48.778781-04
18	questions	0003_auto_20180709_1408	2018-07-12 08:45:48.788301-04
19	questions	0004_triviafeedback	2018-07-12 08:45:48.83755-04
20	questions	0005_transitfeedback	2018-07-12 08:45:48.890939-04
21	questions	0006_auto_20180712_0951	2018-07-12 08:45:48.934625-04
22	sessions	0001_initial	2018-07-12 08:45:48.980916-04
23	questions	0007_auto_20180809_0546	2018-08-09 03:29:05.285808-04
24	questions	0008_auto_20180809_0606	2018-08-09 03:29:05.348572-04
25	fares	0001_initial	2018-09-12 20:56:07.742151-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bdnwm14epe6gd3mee7dv0fv9m3ljo9b0	NDRhZGFkZmEwNmEyMDhmZGFhNzgwZTM0ZTc2NjQ5Zjg1OGIyODhjYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWM3MDFlMTA2NWU4OGZjZWZhMTU1YzM4NzNhOTI5M2JjZTVkN2ZiMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-07-26 12:35:24.890774-04
\.


--
-- Data for Name: fares_fare; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.fares_fare (id, stop_to, stop_from, amount, stop_from_id, route_id, stop_to_id, weather, traffic_jam, demand, air_quality, peak, travel_time, crowd, safety, drive_safety, music, internet, date_added, user_id) FROM stdin;
1	Townterminal	Umoja Junction	50	894		607	Bad Weather	Low/No traffic	High Demand	Good Air-Quality	Peak Hour	2018-09-17 19:18:17	Overcrowded	Personally Safe	Driving unsafe	Music	Internet Connection	2018-09-17 12:19:54.064167-04	3
2	Total/Muchatha	Umoja Junction	110	894		71	Good Weather	High Traffic	High Demand	Good Air-Quality	Peak Hour	2018-09-17 20:11:33	Overcrowded	No music	Driving safe	Music	Internet Connection	2018-09-17 13:11:41.422392-04	3
3	Church Army	Umoja Junction	140	894		1194	Good Weather	High Traffic	High Demand	Good Air-Quality	Peak Hour	2018-09-17 21:39:59	Overcrowded	Personally Safe	Driving safe	Music	Internet Connection	2018-09-17 14:40:05.297115-04	6
4	Townterminal	Umoja Junction	80	894		607	Good Weather	High Traffic	High Demand	Good Air-Quality	Peak Hour	2018-09-17 21:42:29	Not Overcrowded	Personally Safe	Driving unsafe	Music	Internet Connection	2018-09-17 14:42:36.502341-04	6
\.


--
-- Name: fares_fare_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.fares_fare_id_seq', 4, true);


--
-- Data for Name: questions_choice; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_choice (id, choice_text, points, question_id) FROM stdin;
1	Yes	1	1
2	No	1	1
3	Skip	0	1
4	Yes	1	2
5	No	1	2
6	Skip	0	2
7	Matatu	1	3
8	Taxi	1	3
9	Private car	1	3
10	Yes	1	4
11	No	1	4
12	Skip	0	4
13	Yes	1	5
14	No	1	5
15	Skip	0	5
16	Matatu	1	6
17	Taxi	1	6
18	Private car	1	6
19	Less than 1 Km	1	7
20	1 Km	1	7
21	2 Km	1	7
22	3 Km	1	7
23	4 Km	1	7
24	5 Km	1	7
25	More than 5 Km	1	7
26	Kibera	1	8
27	Babadogo	1	8
28	Kawangware	1	8
29	Mathare	1	8
30	Other	1	8
31	14-18	1	9
32	19-24	1	9
33	25-30	1	9
34	31-35	1	9
35	36-45	1	9
36	Above 45	1	9
37	Male	1	10
38	Female	1	10
39	Michelle	1	11
40	Salma	1	11
\.


--
-- Name: questions_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_choice_id_seq', 1, false);


--
-- Data for Name: questions_leaderboard; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_leaderboard (id, transit_points, date_modified, user_id, trivia_points) FROM stdin;
1	10	2018-08-13 12:38:44.2425-04	3	2807
\.


--
-- Name: questions_leaderboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_leaderboard_id_seq', 1, true);


--
-- Data for Name: questions_question; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_question (id, question_text, attachment, pub_date) FROM stdin;
1	Does transport care for women?	\N	2018-09-28 23:45:58.439629-04
2	Have you faced any form of abuse?	\N	2018-09-28 23:46:40.919344-04
3	What mode of transport do you use daily?	\N	2018-09-28 23:47:14.659765-04
4	Do you think transport cares for the disabled?	\N	2018-09-28 23:47:41.089499-04
5	Does transport care for students?	\N	2018-09-28 23:48:07.609275-04
6	What form of transport do students use?	\N	2018-09-28 23:48:38.949411-04
7	If you walk, how long do you walk daily?	\N	2018-09-28 23:49:09.959572-04
8	Which area was the respondent from?	\N	2018-10-04 02:55:16.823147-04
9	What was the age group of the respondent?	\N	2018-10-04 02:55:54.813897-04
10	What was the gender of the respondent?	\N	2018-10-04 02:56:12.33337-04
11	Surveyor name	\N	2018-10-04 02:56:48.003644-04
\.


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 1, false);


--
-- Data for Name: questions_transitfeedback; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_transitfeedback (id, stop, point, position_correct, user_id, date_added) FROM stdin;
1	0510MSL	0101000020E6100000FCE3B4381A604240803DC827BF49F6BF	1	3	2018-08-13 12:38:44.207162-04
\.


--
-- Name: questions_transitfeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_transitfeedback_id_seq', 1, true);


--
-- Data for Name: questions_triviafeedback; Type: TABLE DATA; Schema: public; Owner: ma3tycoon
--

COPY public.questions_triviafeedback (id, date_added, choice_id, question_id, user_id) FROM stdin;
1	2018-10-03 03:51:55.471327-04	1	1	3
2	2018-10-03 03:51:55.488401-04	10	4	3
3	2018-10-03 11:09:52.7729-04	13	5	3
4	2018-10-03 11:09:52.791622-04	13	1	3
5	2018-10-03 11:09:52.815152-04	13	4	3
6	2018-10-03 11:09:52.835984-04	15	2	3
7	2018-10-03 11:09:52.856655-04	14	3	3
8	2018-10-03 11:09:52.877298-04	14	7	3
9	2018-10-03 11:09:52.898156-04	13	6	3
10	2018-10-03 11:11:05.06583-04	13	5	3
11	2018-10-03 11:11:05.069849-04	13	1	3
12	2018-10-03 11:11:05.079571-04	13	4	3
13	2018-10-03 11:11:05.085571-04	15	3	3
14	2018-10-03 11:11:05.091625-04	14	7	3
15	2018-10-03 11:11:05.097597-04	14	6	3
16	2018-10-03 11:11:05.103597-04	13	2	3
17	2018-10-03 11:15:01.488342-04	13	5	3
18	2018-10-03 11:15:01.502636-04	10	4	3
19	2018-10-03 11:15:51.425828-04	1	1	3
20	2018-10-03 11:16:01.285724-04	16	6	3
21	2018-10-03 11:16:45.216064-04	13	5	3
22	2018-10-03 11:16:45.230269-04	10	4	3
23	2018-10-03 11:16:45.238273-04	4	2	3
24	2018-10-03 11:17:02.087612-04	13	5	3
25	2018-10-03 11:17:02.091603-04	2	1	3
26	2018-10-03 11:17:02.094746-04	12	4	3
27	2018-10-03 11:20:06.698593-04	13	5	3
28	2018-10-03 11:20:06.726423-04	14	1	3
29	2018-10-03 11:20:06.747206-04	14	4	3
30	2018-10-03 11:20:06.767742-04	13	3	3
31	2018-10-03 11:20:06.788227-04	13	7	3
32	2018-10-05 03:09:06.992382-04	14	5	3
33	2018-10-05 03:09:06.996464-04	32	9	3
34	2018-10-05 03:09:07.002531-04	2	1	3
35	2018-10-05 03:09:07.00848-04	10	4	3
36	2018-10-05 03:09:07.014874-04	4	2	3
37	2018-10-05 03:09:07.020592-04	28	8	3
38	2018-10-05 03:09:07.026441-04	5	2	3
39	2018-10-05 03:09:07.032434-04	7	3	3
40	2018-10-05 03:09:07.038447-04	20	7	3
41	2018-10-05 03:09:07.04449-04	22	10	3
42	2018-10-05 03:09:07.050465-04	38	6	3
43	2018-10-05 03:09:07.056473-04	16	11	3
44	2018-10-05 03:10:18.12057-04	13	5	3
45	2018-10-05 03:10:18.148065-04	36	9	3
46	2018-10-05 03:10:18.168587-04	1	1	3
47	2018-10-05 03:10:18.188925-04	10	4	3
48	2018-10-05 03:10:18.209266-04	28	8	3
49	2018-10-05 03:10:18.229659-04	7	3	3
50	2018-10-05 03:10:18.2502-04	21	7	3
51	2018-10-05 03:10:18.269677-04	38	10	3
52	2018-10-05 03:10:18.289064-04	16	6	3
53	2018-10-05 03:10:18.308518-04	39	11	3
54	2018-10-05 03:11:42.149022-04	13	5	3
55	2018-10-05 03:11:42.153039-04	36	9	3
56	2018-10-05 03:11:42.159155-04	1	1	3
57	2018-10-05 03:11:42.165149-04	10	4	3
58	2018-10-05 03:11:42.171124-04	5	2	3
59	2018-10-05 03:11:42.177414-04	28	8	3
60	2018-10-05 03:11:42.201113-04	7	3	3
61	2018-10-05 03:11:42.207224-04	19	7	3
62	2018-10-05 03:11:42.213189-04	38	10	3
63	2018-10-05 03:11:42.219198-04	16	6	3
64	2018-10-05 03:11:42.225163-04	39	11	3
65	2018-10-05 03:12:41.636552-04	14	5	3
66	2018-10-05 03:12:41.640886-04	32	9	3
67	2018-10-05 03:12:41.649706-04	1	1	3
68	2018-10-05 03:12:41.655696-04	10	4	3
69	2018-10-05 03:12:41.661662-04	5	2	3
70	2018-10-05 03:12:41.667664-04	28	8	3
71	2018-10-05 03:12:41.671911-04	7	3	3
72	2018-10-05 03:12:41.677489-04	22	7	3
73	2018-10-05 03:12:41.683489-04	37	10	3
74	2018-10-05 03:12:41.689461-04	16	6	3
75	2018-10-05 03:12:41.69546-04	39	11	3
76	2018-10-05 03:17:22.298979-04	13	5	3
77	2018-10-05 03:17:22.327083-04	34	9	3
78	2018-10-05 03:17:22.348007-04	1	1	3
79	2018-10-05 03:17:22.368409-04	10	4	3
80	2018-10-05 03:17:22.388877-04	5	2	3
81	2018-10-05 03:17:22.409326-04	28	8	3
82	2018-10-05 03:17:22.429999-04	7	3	3
83	2018-10-05 03:17:22.449368-04	19	7	3
84	2018-10-05 03:17:22.468797-04	37	10	3
85	2018-10-05 03:17:22.488133-04	16	6	3
86	2018-10-05 03:17:22.507657-04	39	11	3
87	2018-10-05 03:18:26.102538-04	13	5	3
88	2018-10-05 03:18:26.133634-04	33	9	3
89	2018-10-05 03:18:26.155001-04	1	1	3
90	2018-10-05 03:18:26.175437-04	2	4	3
91	2018-10-05 03:18:26.19586-04	10	2	3
92	2018-10-05 03:18:26.216211-04	5	8	3
93	2018-10-05 03:18:26.237304-04	28	3	3
94	2018-10-05 03:18:26.256783-04	7	7	3
95	2018-10-05 03:18:26.276244-04	19	10	3
96	2018-10-05 03:18:26.295593-04	38	6	3
97	2018-10-05 03:18:26.314972-04	16	11	3
98	2018-10-05 03:28:56.885079-04	14	5	3
99	2018-10-05 03:28:56.8893-04	34	9	3
100	2018-10-05 03:28:56.902067-04	1	1	3
101	2018-10-05 03:28:56.908046-04	11	4	3
102	2018-10-05 03:28:56.914027-04	10	2	3
103	2018-10-05 03:28:56.920017-04	5	8	3
104	2018-10-05 03:28:56.926001-04	28	3	3
105	2018-10-05 03:28:56.931995-04	7	7	3
106	2018-10-05 03:28:56.937981-04	19	10	3
107	2018-10-05 03:28:56.943959-04	38	6	3
108	2018-10-05 03:28:56.949957-04	16	11	3
109	2018-10-05 03:38:36.498692-04	32	5	3
110	2018-10-05 03:38:36.503249-04	34	9	3
111	2018-10-05 03:38:36.511493-04	14	1	3
112	2018-10-05 03:38:36.517458-04	32	4	3
113	2018-10-05 03:38:36.523462-04	2	2	3
114	2018-10-05 03:38:36.52943-04	1	8	3
115	2018-10-05 03:38:36.535442-04	10	3	3
116	2018-10-05 03:38:36.541439-04	5	7	3
117	2018-10-05 03:38:36.547502-04	28	10	3
118	2018-10-05 03:38:36.55386-04	7	6	3
119	2018-10-05 03:38:36.559469-04	19	11	3
120	2018-10-05 03:41:28.859373-04	14	5	3
121	2018-10-05 03:41:28.86426-04	33	9	3
122	2018-10-05 03:41:28.874882-04	1	1	3
123	2018-10-05 03:41:28.880855-04	10	4	3
124	2018-10-05 03:41:28.886853-04	5	2	3
125	2018-10-05 03:41:28.892864-04	28	8	3
126	2018-10-05 03:41:28.89892-04	7	3	3
127	2018-10-05 03:41:28.904888-04	19	7	3
128	2018-10-05 03:41:28.910887-04	38	10	3
129	2018-10-05 03:41:28.916856-04	16	6	3
130	2018-10-05 03:41:28.922859-04	39	11	3
131	2018-10-05 03:43:12.475182-04	14	5	3
132	2018-10-05 03:43:12.503938-04	35	9	3
133	2018-10-05 03:43:12.524434-04	1	1	3
134	2018-10-05 03:43:12.545042-04	10	4	3
135	2018-10-05 03:43:12.565554-04	5	2	3
136	2018-10-05 03:43:12.585978-04	28	8	3
137	2018-10-05 03:43:12.606628-04	7	3	3
138	2018-10-05 03:43:12.62786-04	19	7	3
139	2018-10-05 03:43:12.647338-04	37	10	3
140	2018-10-05 03:43:12.666852-04	16	6	3
141	2018-10-05 03:43:12.686221-04	39	11	3
142	2018-10-05 03:43:34.725842-04	14	5	3
143	2018-10-05 03:43:34.730234-04	35	9	3
144	2018-10-05 03:43:34.733704-04	1	1	3
145	2018-10-05 03:43:34.739691-04	10	4	3
146	2018-10-05 03:43:34.745672-04	5	2	3
147	2018-10-05 03:43:34.751656-04	28	8	3
148	2018-10-05 03:43:34.757653-04	7	3	3
149	2018-10-05 03:43:34.763633-04	19	7	3
150	2018-10-05 03:43:34.769621-04	37	10	3
151	2018-10-05 03:43:34.77561-04	16	6	3
152	2018-10-05 03:43:34.781596-04	39	11	3
153	2018-10-05 03:44:01.421986-04	14	5	3
154	2018-10-05 03:44:01.426098-04	36	9	3
155	2018-10-05 03:44:01.431428-04	1	1	3
156	2018-10-05 03:44:01.437381-04	10	4	3
157	2018-10-05 03:44:01.44339-04	5	2	3
158	2018-10-05 03:44:01.449358-04	28	8	3
159	2018-10-05 03:44:01.455368-04	7	3	3
160	2018-10-05 03:44:01.461326-04	21	7	3
161	2018-10-05 03:44:01.467347-04	37	10	3
162	2018-10-05 03:44:01.473309-04	16	6	3
163	2018-10-05 03:44:01.479312-04	39	11	3
164	2018-10-05 03:44:27.805128-04	13	5	3
165	2018-10-05 03:44:27.819671-04	36	9	3
166	2018-10-05 03:44:27.831717-04	1	1	3
167	2018-10-05 03:44:27.839728-04	10	4	3
168	2018-10-05 03:44:27.847844-04	5	2	3
169	2018-10-05 03:44:27.855923-04	28	8	3
170	2018-10-05 03:44:27.864055-04	7	3	3
171	2018-10-05 03:44:27.870994-04	19	7	3
172	2018-10-05 03:44:27.877864-04	37	10	3
173	2018-10-05 03:44:27.884823-04	16	6	3
174	2018-10-05 03:44:27.891785-04	39	11	3
175	2018-10-05 03:44:53.642259-04	14	5	3
176	2018-10-05 03:44:53.656691-04	33	9	3
177	2018-10-05 03:44:53.670975-04	1	1	3
178	2018-10-05 03:44:53.694112-04	10	4	3
179	2018-10-05 03:44:53.715143-04	5	2	3
180	2018-10-05 03:44:53.735909-04	28	8	3
181	2018-10-05 03:44:53.75662-04	7	3	3
182	2018-10-05 03:44:53.776091-04	19	7	3
183	2018-10-05 03:44:53.795787-04	38	10	3
184	2018-10-05 03:44:53.815295-04	16	6	3
185	2018-10-05 03:44:53.834865-04	39	11	3
186	2018-10-05 03:46:26.236684-04	14	5	3
187	2018-10-05 03:46:26.251147-04	35	9	3
188	2018-10-05 03:46:26.262082-04	1	1	3
189	2018-10-05 03:46:26.270071-04	10	4	3
190	2018-10-05 03:46:26.291807-04	5	2	3
191	2018-10-05 03:46:26.313331-04	28	8	3
192	2018-10-05 03:46:26.334405-04	7	3	3
193	2018-10-05 03:46:26.353941-04	20	7	3
194	2018-10-05 03:46:26.37344-04	38	10	3
195	2018-10-05 03:46:26.39569-04	16	6	3
196	2018-10-05 03:46:26.415279-04	39	11	3
197	2018-10-05 03:47:17.710885-04	14	5	3
198	2018-10-05 03:47:17.715312-04	36	9	3
199	2018-10-05 03:47:17.721581-04	1	4	3
200	2018-10-05 03:47:17.727557-04	10	1	3
201	2018-10-05 03:47:17.733539-04	2	2	3
202	2018-10-05 03:47:17.739541-04	4	8	3
203	2018-10-05 03:47:17.745518-04	28	3	3
204	2018-10-05 03:47:17.751505-04	7	7	3
205	2018-10-05 03:47:17.757488-04	19	10	3
206	2018-10-05 03:47:17.763508-04	38	6	3
207	2018-10-05 03:47:17.769544-04	16	11	3
208	2018-10-05 03:47:50.675616-04	14	5	3
209	2018-10-05 03:47:50.679639-04	33	9	3
210	2018-10-05 03:47:50.687974-04	2	1	3
211	2018-10-05 03:47:50.69393-04	10	4	3
212	2018-10-05 03:47:50.699962-04	5	2	3
213	2018-10-05 03:47:50.705909-04	28	8	3
214	2018-10-05 03:47:50.71192-04	7	3	3
215	2018-10-05 03:47:50.717882-04	19	7	3
216	2018-10-05 03:47:50.72389-04	38	10	3
217	2018-10-05 03:47:50.729849-04	16	6	3
218	2018-10-05 03:47:50.735898-04	39	11	3
219	2018-10-05 03:49:54.752106-04	14	5	3
220	2018-10-05 03:49:54.779756-04	32	9	3
221	2018-10-05 03:49:54.800394-04	2	1	3
222	2018-10-05 03:49:54.820917-04	10	4	3
223	2018-10-05 03:49:54.841392-04	5	2	3
224	2018-10-05 03:49:54.861918-04	28	8	3
225	2018-10-05 03:49:54.882572-04	7	3	3
226	2018-10-05 03:49:54.902062-04	19	7	3
227	2018-10-05 03:49:54.921488-04	38	10	3
228	2018-10-05 03:49:54.940935-04	16	6	3
229	2018-10-05 03:49:54.960306-04	39	11	3
230	2018-10-05 03:52:20.593541-04	15	5	3
231	2018-10-05 03:52:20.622475-04	34	9	3
232	2018-10-05 03:52:20.643241-04	14	1	3
233	2018-10-05 03:52:20.663761-04	32	4	3
234	2018-10-05 03:52:20.684229-04	2	2	3
235	2018-10-05 03:52:20.70468-04	10	8	3
236	2018-10-05 03:52:20.72534-04	5	3	3
237	2018-10-05 03:52:20.744939-04	28	7	3
238	2018-10-05 03:52:20.764407-04	7	10	3
239	2018-10-05 03:52:20.784073-04	19	6	3
240	2018-10-05 03:52:20.803541-04	37	11	3
241	2018-10-05 03:53:07.833242-04	14	5	3
242	2018-10-05 03:53:07.860846-04	32	9	3
243	2018-10-05 03:53:07.881524-04	2	1	3
244	2018-10-05 03:53:07.902163-04	11	4	3
245	2018-10-05 03:53:07.922833-04	5	2	3
246	2018-10-05 03:53:07.943318-04	28	8	3
247	2018-10-05 03:53:07.964056-04	7	3	3
248	2018-10-05 03:53:07.985181-04	19	7	3
249	2018-10-05 03:53:08.004909-04	37	10	3
250	2018-10-05 03:53:08.024362-04	16	6	3
251	2018-10-05 03:53:08.044277-04	39	11	3
252	2018-10-05 03:54:05.760599-04	14	5	3
253	2018-10-05 03:54:05.764672-04	34	9	3
254	2018-10-05 03:54:05.772685-04	2	1	3
255	2018-10-05 03:54:05.778673-04	10	4	3
256	2018-10-05 03:54:05.784659-04	4	2	3
257	2018-10-05 03:54:05.79109-04	28	8	3
258	2018-10-05 03:54:05.796636-04	7	3	3
259	2018-10-05 03:54:05.802612-04	21	7	3
260	2018-10-05 03:54:05.808654-04	38	10	3
261	2018-10-05 03:54:05.814594-04	16	6	3
262	2018-10-05 03:54:05.820571-04	39	11	3
263	2018-10-05 03:55:04.160595-04	14	5	3
264	2018-10-05 03:55:04.188561-04	34	9	3
265	2018-10-05 03:55:04.209279-04	33	1	3
266	2018-10-05 03:55:04.229852-04	2	4	3
267	2018-10-05 03:55:04.250365-04	10	2	3
268	2018-10-05 03:55:04.271248-04	4	8	3
269	2018-10-05 03:55:04.292032-04	28	3	3
270	2018-10-05 03:55:04.311538-04	7	7	3
271	2018-10-05 03:55:04.331734-04	21	10	3
272	2018-10-05 03:55:04.352052-04	37	6	3
273	2018-10-05 03:55:04.371949-04	16	11	3
274	2018-10-05 03:55:54.088038-04	14	5	3
275	2018-10-05 03:55:54.092785-04	32	9	3
276	2018-10-05 03:55:54.102403-04	2	1	3
277	2018-10-05 03:55:54.108382-04	10	4	3
278	2018-10-05 03:55:54.114366-04	5	2	3
279	2018-10-05 03:55:54.120348-04	28	8	3
280	2018-10-05 03:55:54.126341-04	7	3	3
281	2018-10-05 03:55:54.132339-04	20	7	3
282	2018-10-05 03:55:54.138315-04	37	10	3
283	2018-10-05 03:55:54.14434-04	16	6	3
284	2018-10-05 03:55:54.150381-04	39	11	3
285	2018-10-05 03:56:48.725445-04	13	5	3
286	2018-10-05 03:56:48.754342-04	33	9	3
287	2018-10-05 03:56:48.775248-04	1	1	3
288	2018-10-05 03:56:48.795818-04	10	4	3
289	2018-10-05 03:56:48.816319-04	5	2	3
290	2018-10-05 03:56:48.837035-04	28	8	3
291	2018-10-05 03:56:48.857875-04	7	3	3
292	2018-10-05 03:56:48.877439-04	21	7	3
293	2018-10-05 03:56:48.897002-04	38	10	3
294	2018-10-05 03:56:48.916412-04	16	6	3
295	2018-10-05 03:56:48.935913-04	39	11	3
296	2018-10-05 03:57:38.058398-04	14	5	3
297	2018-10-05 03:57:38.062458-04	32	9	3
298	2018-10-05 03:57:38.071127-04	2	1	3
299	2018-10-05 03:57:38.077096-04	10	4	3
300	2018-10-05 03:57:38.083099-04	5	2	3
301	2018-10-05 03:57:38.089099-04	28	8	3
302	2018-10-05 03:57:38.095157-04	7	3	3
303	2018-10-05 03:57:38.101115-04	19	7	3
304	2018-10-05 03:57:38.107126-04	38	10	3
305	2018-10-05 03:57:38.113094-04	16	6	3
306	2018-10-05 03:57:38.119105-04	39	11	3
307	2018-10-05 03:58:35.644734-04	14	5	3
308	2018-10-05 03:58:35.658823-04	31	9	3
309	2018-10-05 03:58:35.666651-04	2	1	3
310	2018-10-05 03:58:35.674497-04	10	4	3
311	2018-10-05 03:58:35.682334-04	5	8	3
312	2018-10-05 03:58:35.68884-04	28	2	3
313	2018-10-05 03:58:35.693488-04	4	3	3
314	2018-10-05 03:58:35.699452-04	7	7	3
315	2018-10-05 03:58:35.705419-04	19	10	3
316	2018-10-05 03:58:35.711452-04	38	6	3
317	2018-10-05 03:58:35.71748-04	16	11	3
318	2018-10-05 04:01:12.344452-04	14	5	3
319	2018-10-05 04:01:12.372417-04	31	9	3
320	2018-10-05 04:01:12.393034-04	36	1	3
321	2018-10-05 04:01:12.413473-04	2	4	3
322	2018-10-05 04:01:12.43398-04	10	2	3
323	2018-10-05 04:01:12.45446-04	4	8	3
324	2018-10-05 04:01:12.475178-04	5	3	3
325	2018-10-05 04:01:12.494543-04	28	7	3
326	2018-10-05 04:01:12.514023-04	7	10	3
327	2018-10-05 04:01:12.533433-04	19	6	3
328	2018-10-05 04:01:12.552854-04	38	11	3
329	2018-10-05 04:33:13.854847-04	14	5	3
330	2018-10-05 04:33:13.859471-04	33	9	3
331	2018-10-05 04:33:13.871004-04	1	1	3
332	2018-10-05 04:33:13.876919-04	10	4	3
333	2018-10-05 04:33:13.882916-04	5	2	3
334	2018-10-05 04:33:13.888891-04	28	8	3
335	2018-10-05 04:33:13.894901-04	7	3	3
336	2018-10-05 04:33:13.901243-04	21	7	3
337	2018-10-05 04:33:13.906867-04	37	10	3
338	2018-10-05 04:33:13.912835-04	16	6	3
339	2018-10-05 04:33:13.918843-04	39	11	3
340	2018-10-05 04:40:44.994413-04	14	5	3
341	2018-10-05 04:40:44.99873-04	33	9	3
342	2018-10-05 04:40:45.008033-04	1	1	3
343	2018-10-05 04:40:45.01398-04	10	4	3
344	2018-10-05 04:40:45.019994-04	5	2	3
345	2018-10-05 04:40:45.025955-04	28	8	3
346	2018-10-05 04:40:45.031972-04	7	3	3
347	2018-10-05 04:40:45.037935-04	19	7	3
348	2018-10-05 04:40:45.04395-04	38	10	3
349	2018-10-05 04:40:45.049909-04	16	6	3
350	2018-10-05 04:40:45.055921-04	39	11	3
351	2018-10-06 04:13:37.355442-04	13	5	3
352	2018-10-06 04:13:37.391528-04	1	1	3
353	2018-10-06 04:13:37.412093-04	4	2	3
354	2018-10-06 04:13:37.432457-04	26	8	3
355	2018-10-06 04:13:37.452861-04	7	7	3
356	2018-10-06 04:13:37.473262-04	19	10	3
357	2018-10-06 04:13:37.493955-04	38	6	3
358	2018-10-06 04:13:37.513384-04	16	11	3
359	2018-10-06 04:13:37.532813-04	40	9	3
360	2018-10-06 04:13:37.552205-04	35	4	3
361	2018-10-06 04:17:49.968574-04	14	9	3
362	2018-10-06 04:17:49.997354-04	36	1	3
363	2018-10-06 04:17:50.018316-04	1	4	3
364	2018-10-06 04:17:50.039076-04	10	2	3
365	2018-10-06 04:17:50.059628-04	5	8	3
366	2018-10-06 04:17:50.080187-04	26	3	3
367	2018-10-06 04:17:50.100949-04	7	10	3
368	2018-10-06 04:17:50.120418-04	38	11	3
369	2018-10-06 04:17:50.139908-04	16	5	3
370	2018-10-06 04:34:18.643323-04	13	5	3
371	2018-10-06 04:34:18.675671-04	32	9	3
372	2018-10-06 04:34:18.696266-04	1	1	3
373	2018-10-06 04:34:18.716716-04	11	4	3
374	2018-10-06 04:34:18.737209-04	5	2	3
375	2018-10-06 04:34:18.757906-04	26	8	3
376	2018-10-06 04:34:18.778624-04	7	3	3
377	2018-10-06 04:34:18.7981-04	38	10	3
378	2018-10-06 04:34:18.817526-04	40	11	3
379	2018-10-06 04:37:18.512647-04	13	5	3
380	2018-10-06 04:37:18.517059-04	34	9	3
381	2018-10-06 04:37:18.525406-04	1	1	3
382	2018-10-06 04:37:18.531383-04	12	4	3
383	2018-10-06 04:37:18.537365-04	5	2	3
384	2018-10-06 04:37:18.543387-04	26	8	3
385	2018-10-06 04:37:18.549426-04	7	3	3
386	2018-10-06 04:37:18.555415-04	38	10	3
387	2018-10-06 04:37:18.561399-04	16	6	3
388	2018-10-06 04:37:18.56739-04	40	11	3
389	2018-10-06 04:38:33.592679-04	13	5	3
390	2018-10-06 04:38:33.606588-04	32	9	3
391	2018-10-06 04:38:33.615238-04	1	1	3
392	2018-10-06 04:38:33.623201-04	10	4	3
393	2018-10-06 04:38:33.631106-04	5	2	3
394	2018-10-06 04:38:33.639199-04	26	8	3
395	2018-10-06 04:38:33.647313-04	20	7	3
396	2018-10-06 04:38:33.654181-04	21	10	3
397	2018-10-06 04:38:33.675563-04	20	6	3
398	2018-10-06 04:38:33.695667-04	38	11	3
399	2018-10-06 04:40:47.070861-04	13	5	3
400	2018-10-06 04:40:47.075084-04	33	9	3
401	2018-10-06 04:40:47.083896-04	2	1	3
402	2018-10-06 04:40:47.089861-04	10	4	3
403	2018-10-06 04:40:47.095859-04	4	2	3
404	2018-10-06 04:40:47.101832-04	26	8	3
405	2018-10-06 04:40:47.107834-04	7	3	3
406	2018-10-06 04:40:47.113811-04	19	7	3
407	2018-10-06 04:40:47.119809-04	38	10	3
408	2018-10-06 04:40:47.12582-04	16	6	3
409	2018-10-06 04:40:47.131893-04	40	11	3
410	2018-10-06 04:42:27.016636-04	13	5	3
411	2018-10-06 04:42:27.0462-04	35	9	3
412	2018-10-06 04:42:27.067102-04	1	1	3
413	2018-10-06 04:42:27.087669-04	11	4	3
414	2018-10-06 04:42:27.108161-04	4	2	3
415	2018-10-06 04:42:27.128661-04	26	8	3
416	2018-10-06 04:42:27.149349-04	7	3	3
417	2018-10-06 04:42:27.168882-04	20	7	3
418	2018-10-06 04:42:27.191242-04	38	10	3
419	2018-10-06 04:42:27.210689-04	16	6	3
420	2018-10-06 04:42:27.230127-04	40	11	3
421	2018-10-06 04:43:41.440701-04	14	5	3
422	2018-10-06 04:43:41.47059-04	32	9	3
423	2018-10-06 04:43:41.491121-04	1	1	3
424	2018-10-06 04:43:41.494791-04	11	4	3
425	2018-10-06 04:43:41.50075-04	4	2	3
426	2018-10-06 04:43:41.506727-04	26	8	3
427	2018-10-06 04:43:41.512862-04	7	3	3
428	2018-10-06 04:43:41.51914-04	19	7	3
429	2018-10-06 04:43:41.524702-04	38	10	3
430	2018-10-06 04:43:41.530664-04	16	6	3
431	2018-10-06 04:43:41.536649-04	40	11	3
432	2018-10-06 04:45:07.177638-04	13	5	3
433	2018-10-06 04:45:07.19198-04	32	9	3
434	2018-10-06 04:45:07.200231-04	2	1	3
435	2018-10-06 04:45:07.208151-04	10	4	3
436	2018-10-06 04:45:07.216101-04	5	2	3
437	2018-10-06 04:45:07.223997-04	26	8	3
438	2018-10-06 04:45:07.232093-04	7	3	3
439	2018-10-06 04:45:07.239034-04	19	7	3
440	2018-10-06 04:45:07.245789-04	38	10	3
441	2018-10-06 04:45:07.252687-04	16	6	3
442	2018-10-06 04:45:07.259709-04	40	11	3
443	2018-10-06 05:00:40.346423-04	13	5	3
444	2018-10-06 05:00:40.375146-04	14	9	3
445	2018-10-06 05:00:40.395898-04	33	1	3
446	2018-10-06 05:00:40.416364-04	1	4	3
447	2018-10-06 05:00:40.436834-04	12	2	3
448	2018-10-06 05:00:40.457339-04	4	8	3
449	2018-10-06 05:00:40.477997-04	26	3	3
450	2018-10-06 05:00:40.497449-04	7	10	3
451	2018-10-06 05:00:40.516916-04	38	11	3
452	2018-10-06 05:30:02.412997-04	15	9	3
453	2018-10-06 05:30:02.428222-04	35	1	3
454	2018-10-06 05:30:02.438554-04	1	5	3
455	2018-10-06 05:30:02.447158-04	13	4	3
456	2018-10-06 05:30:02.455065-04	12	2	3
457	2018-10-06 05:30:02.462885-04	11	8	3
458	2018-10-06 05:30:02.47092-04	5	7	3
459	2018-10-06 05:30:02.477728-04	26	10	3
460	2018-10-06 05:30:02.48462-04	20	6	3
461	2018-10-06 05:30:02.491479-04	38	11	3
462	2018-10-06 05:31:37.553645-04	14	5	3
463	2018-10-06 05:31:37.557901-04	33	9	3
464	2018-10-06 05:31:37.563866-04	1	1	3
465	2018-10-06 05:31:37.569821-04	12	4	3
466	2018-10-06 05:31:37.575821-04	4	2	3
467	2018-10-06 05:31:37.581808-04	26	8	3
468	2018-10-06 05:31:37.587798-04	7	3	3
469	2018-10-06 05:31:37.593774-04	38	10	3
470	2018-10-06 05:31:37.599762-04	16	6	3
471	2018-10-06 05:31:37.605741-04	40	11	3
472	2018-10-06 05:36:06.362428-04	13	5	3
473	2018-10-06 05:36:06.36668-04	32	9	3
474	2018-10-06 05:36:06.372472-04	1	1	3
475	2018-10-06 05:36:06.378488-04	12	4	3
476	2018-10-06 05:36:06.384493-04	11	2	3
477	2018-10-06 05:36:06.390446-04	5	8	3
478	2018-10-06 05:36:06.396431-04	26	3	3
479	2018-10-06 05:36:06.40242-04	7	10	3
480	2018-10-06 05:36:06.408427-04	38	6	3
481	2018-10-06 05:36:06.414393-04	16	11	3
482	2018-10-06 05:38:46.044482-04	14	5	3
483	2018-10-06 05:38:46.048949-04	32	9	3
484	2018-10-06 05:38:46.057608-04	1	1	3
485	2018-10-06 05:38:46.063661-04	10	4	3
486	2018-10-06 05:38:46.070452-04	5	2	3
487	2018-10-06 05:38:46.076437-04	26	8	3
488	2018-10-06 05:38:46.08246-04	21	7	3
489	2018-10-06 05:38:46.088423-04	38	10	3
490	2018-10-06 05:38:46.094415-04	40	11	3
491	2018-10-06 05:40:03.204715-04	15	5	3
492	2018-10-06 05:40:03.208736-04	35	9	3
493	2018-10-06 05:40:03.217856-04	1	1	3
494	2018-10-06 05:40:03.220465-04	12	4	3
495	2018-10-06 05:40:03.22398-04	5	2	3
496	2018-10-06 05:40:03.229896-04	26	8	3
497	2018-10-06 05:40:03.235908-04	9	3	3
498	2018-10-06 05:40:03.241877-04	19	7	3
499	2018-10-06 05:40:03.247887-04	38	10	3
500	2018-10-06 05:40:03.253855-04	18	6	3
501	2018-10-06 05:40:03.259867-04	40	11	3
502	2018-10-06 05:42:16.226752-04	13	5	3
503	2018-10-06 05:42:16.231337-04	36	9	3
504	2018-10-06 05:42:16.239781-04	1	1	3
505	2018-10-06 05:42:16.242824-04	10	4	3
506	2018-10-06 05:42:16.248353-04	5	2	3
507	2018-10-06 05:42:16.254362-04	26	8	3
508	2018-10-06 05:42:16.260396-04	7	3	3
509	2018-10-06 05:42:16.266336-04	20	7	3
510	2018-10-06 05:42:16.272369-04	19	10	3
511	2018-10-06 05:42:16.278325-04	38	6	3
512	2018-10-06 05:42:16.284363-04	16	11	3
513	2018-10-06 05:44:43.763784-04	14	5	3
514	2018-10-06 05:44:43.767859-04	33	9	3
515	2018-10-06 05:44:43.776853-04	1	1	3
516	2018-10-06 05:44:43.782858-04	11	4	3
517	2018-10-06 05:44:43.78882-04	12	2	3
518	2018-10-06 05:44:43.794868-04	5	8	3
519	2018-10-06 05:44:43.800885-04	26	7	3
520	2018-10-06 05:44:43.806866-04	7	10	3
521	2018-10-06 05:44:43.812849-04	20	11	3
522	2018-10-06 05:45:43.904534-04	13	5	3
523	2018-10-06 05:45:43.918535-04	36	9	3
524	2018-10-06 05:45:43.927961-04	1	1	3
525	2018-10-06 05:45:43.935984-04	11	4	3
526	2018-10-06 05:45:43.943966-04	10	8	3
527	2018-10-06 05:45:43.951942-04	5	2	3
528	2018-10-06 05:45:43.960127-04	4	3	3
529	2018-10-06 05:45:43.967162-04	26	7	3
530	2018-10-06 05:45:43.974089-04	5	10	3
531	2018-10-06 05:45:43.981104-04	7	6	3
532	2018-10-06 05:45:43.988015-04	19	11	3
533	2018-10-06 05:53:16.229582-04	13	5	3
534	2018-10-06 05:53:16.23387-04	35	9	3
535	2018-10-06 05:53:16.240597-04	1	1	3
536	2018-10-06 05:53:16.246594-04	10	4	3
537	2018-10-06 05:53:16.252567-04	11	2	3
538	2018-10-06 05:53:16.258565-04	5	8	3
539	2018-10-06 05:53:16.264552-04	26	3	3
540	2018-10-06 05:53:16.270543-04	7	7	3
541	2018-10-06 05:53:16.27652-04	19	10	3
542	2018-10-06 05:53:16.282518-04	38	11	3
543	2018-10-06 05:53:16.288576-04	39	6	3
544	2018-10-06 05:54:14.545351-04	14	5	3
545	2018-10-06 05:54:14.573595-04	34	9	3
546	2018-10-06 05:54:14.595023-04	1	1	3
547	2018-10-06 05:54:14.615787-04	10	4	3
548	2018-10-06 05:54:14.636419-04	12	2	3
549	2018-10-06 05:54:14.657149-04	5	8	3
550	2018-10-06 05:54:14.678004-04	26	7	3
551	2018-10-06 05:54:14.69766-04	20	10	3
552	2018-10-06 05:54:14.717283-04	38	11	3
553	2018-10-06 05:55:50.995333-04	15	5	3
554	2018-10-06 05:55:50.999445-04	13	9	3
555	2018-10-06 05:55:51.002542-04	14	1	3
556	2018-10-06 05:55:51.008528-04	32	2	3
557	2018-10-06 05:55:51.014566-04	1	8	3
558	2018-10-06 05:55:51.020543-04	1	3	3
559	2018-10-06 05:55:51.026544-04	3	7	3
560	2018-10-06 05:55:51.032516-04	5	10	3
561	2018-10-06 05:55:51.03851-04	26	11	3
562	2018-10-06 05:57:19.755563-04	15	5	3
563	2018-10-06 05:57:19.784844-04	35	9	3
564	2018-10-06 05:57:19.812727-04	3	1	3
565	2018-10-06 05:57:19.833368-04	12	4	3
566	2018-10-06 05:57:19.853862-04	1	2	3
567	2018-10-06 05:57:19.874508-04	2	8	3
568	2018-10-06 05:57:19.895316-04	11	7	3
569	2018-10-06 05:57:19.91469-04	6	10	3
570	2018-10-06 05:57:19.93409-04	26	11	3
571	2018-10-06 05:58:52.833576-04	13	5	3
572	2018-10-06 05:58:52.869041-04	36	9	3
573	2018-10-06 05:58:52.889887-04	1	1	3
574	2018-10-06 05:58:52.910427-04	11	4	3
575	2018-10-06 05:58:52.931064-04	10	2	3
576	2018-10-06 05:58:52.951574-04	5	8	3
577	2018-10-06 05:58:52.97226-04	26	3	3
578	2018-10-06 05:58:52.991893-04	7	10	3
579	2018-10-06 05:58:53.011356-04	38	11	3
580	2018-10-06 06:00:37.560842-04	13	5	3
581	2018-10-06 06:00:37.589482-04	36	9	3
582	2018-10-06 06:00:37.613438-04	1	1	3
583	2018-10-06 06:00:37.634012-04	10	4	3
584	2018-10-06 06:00:37.654481-04	5	2	3
585	2018-10-06 06:00:37.675109-04	26	8	3
586	2018-10-06 06:00:37.695808-04	7	3	3
587	2018-10-06 06:00:37.715311-04	38	10	3
588	2018-10-06 06:00:37.734711-04	16	6	3
589	2018-10-06 06:00:37.754137-04	40	11	3
590	2018-10-06 06:02:41.152657-04	15	5	3
591	2018-10-06 06:02:41.181124-04	33	9	3
592	2018-10-06 06:02:41.20214-04	2	1	3
593	2018-10-06 06:02:41.222641-04	10	4	3
594	2018-10-06 06:02:41.243127-04	4	2	3
595	2018-10-06 06:02:41.263821-04	26	8	3
596	2018-10-06 06:02:41.284568-04	7	3	3
597	2018-10-06 06:02:41.304082-04	19	7	3
598	2018-10-06 06:02:41.323585-04	38	10	3
599	2018-10-06 06:02:41.343113-04	16	6	3
600	2018-10-06 06:02:41.362532-04	40	11	3
601	2018-10-06 06:04:15.438202-04	13	5	3
602	2018-10-06 06:04:15.442284-04	34	9	3
603	2018-10-06 06:04:15.451352-04	1	1	3
604	2018-10-06 06:04:15.457363-04	10	4	3
605	2018-10-06 06:04:15.46341-04	5	2	3
606	2018-10-06 06:04:15.469372-04	26	8	3
607	2018-10-06 06:04:15.475378-04	7	3	3
608	2018-10-06 06:04:15.481346-04	38	10	3
609	2018-10-06 06:04:15.487359-04	16	6	3
610	2018-10-06 06:04:15.493324-04	40	11	3
611	2018-10-06 06:05:37.702768-04	13	5	3
612	2018-10-06 06:05:37.730595-04	33	9	3
613	2018-10-06 06:05:37.75138-04	2	1	3
614	2018-10-06 06:05:37.771931-04	3	4	3
615	2018-10-06 06:05:37.792374-04	10	2	3
616	2018-10-06 06:05:37.812871-04	5	8	3
617	2018-10-06 06:05:37.833497-04	26	3	3
618	2018-10-06 06:05:37.853223-04	7	10	3
619	2018-10-06 06:05:37.873045-04	38	7	3
620	2018-10-06 06:05:37.892624-04	19	6	3
621	2018-10-06 06:05:37.912035-04	16	11	3
622	2018-10-06 06:06:34.958032-04	13	5	3
623	2018-10-06 06:06:34.969433-04	15	9	3
624	2018-10-06 06:06:34.975754-04	35	1	3
625	2018-10-06 06:06:34.981283-04	2	4	3
626	2018-10-06 06:06:34.987288-04	12	2	3
627	2018-10-06 06:06:34.99325-04	5	8	3
628	2018-10-06 06:06:34.999252-04	26	3	3
629	2018-10-06 06:06:35.005226-04	8	10	3
630	2018-10-06 06:06:35.011224-04	9	6	3
631	2018-10-06 06:06:35.017203-04	38	11	3
632	2018-10-06 06:07:45.280866-04	13	5	3
633	2018-10-06 06:07:45.285516-04	32	9	3
634	2018-10-06 06:07:45.294133-04	1	1	3
635	2018-10-06 06:07:45.300176-04	10	4	3
636	2018-10-06 06:07:45.306142-04	4	2	3
637	2018-10-06 06:07:45.312147-04	26	8	3
638	2018-10-06 06:07:45.318119-04	7	3	3
639	2018-10-06 06:07:45.324537-04	19	7	3
640	2018-10-06 06:07:45.330093-04	20	10	3
641	2018-10-06 06:07:45.336129-04	38	6	3
642	2018-10-06 06:07:45.342154-04	16	11	3
643	2018-10-06 06:10:16.056218-04	13	5	3
644	2018-10-06 06:10:16.07354-04	34	9	3
645	2018-10-06 06:10:16.089352-04	1	1	3
646	2018-10-06 06:10:16.105218-04	10	4	3
647	2018-10-06 06:10:16.121044-04	5	2	3
648	2018-10-06 06:10:16.136882-04	4	8	3
649	2018-10-06 06:10:16.152666-04	5	3	3
650	2018-10-06 06:10:16.168347-04	6	7	3
651	2018-10-06 06:10:16.18399-04	5	10	3
652	2018-10-06 06:10:16.199659-04	4	6	3
653	2018-10-06 06:10:16.215401-04	26	11	3
654	2018-10-06 06:11:02.237452-04	13	5	3
655	2018-10-06 06:11:02.26553-04	33	9	3
656	2018-10-06 06:11:02.286308-04	1	1	3
657	2018-10-06 06:11:02.307-04	10	4	3
658	2018-10-06 06:11:02.327517-04	6	2	3
659	2018-10-06 06:11:02.348115-04	26	8	3
660	2018-10-06 06:11:02.368827-04	7	3	3
661	2018-10-06 06:11:02.388337-04	20	7	3
662	2018-10-06 06:11:02.407893-04	21	10	3
663	2018-10-06 06:11:02.42736-04	38	6	3
664	2018-10-06 06:11:02.44696-04	16	11	3
665	2018-10-06 06:12:03.838027-04	15	5	3
666	2018-10-06 06:12:03.842019-04	35	9	3
667	2018-10-06 06:12:03.852499-04	2	1	3
668	2018-10-06 06:12:03.858202-04	10	4	3
669	2018-10-06 06:12:03.864493-04	5	2	3
670	2018-10-06 06:12:03.87048-04	26	8	3
671	2018-10-06 06:12:03.876482-04	9	3	3
672	2018-10-06 06:12:03.882454-04	20	7	3
673	2018-10-06 06:12:03.888441-04	38	10	3
674	2018-10-06 06:12:03.894428-04	18	6	3
675	2018-10-06 06:12:03.900419-04	40	11	3
676	2018-10-06 06:13:55.371867-04	13	5	3
677	2018-10-06 06:13:55.400724-04	33	9	3
678	2018-10-06 06:13:55.421931-04	1	1	3
679	2018-10-06 06:13:55.442505-04	10	4	3
680	2018-10-06 06:13:55.463253-04	5	2	3
681	2018-10-06 06:13:55.483846-04	26	8	3
682	2018-10-06 06:13:55.50505-04	7	3	3
683	2018-10-06 06:13:55.524519-04	19	7	3
684	2018-10-06 06:13:55.543997-04	38	10	3
685	2018-10-06 06:13:55.563442-04	16	6	3
686	2018-10-06 06:13:55.582926-04	40	11	3
687	2018-10-06 06:14:22.139668-04	13	5	3
688	2018-10-06 06:14:22.153644-04	34	9	3
689	2018-10-06 06:14:22.161521-04	1	1	3
690	2018-10-06 06:14:22.169392-04	10	4	3
691	2018-10-06 06:14:22.177367-04	5	2	3
692	2018-10-06 06:14:22.185362-04	26	8	3
693	2018-10-06 06:14:22.193499-04	7	3	3
694	2018-10-06 06:14:22.200385-04	20	7	3
695	2018-10-06 06:14:22.207293-04	38	10	3
696	2018-10-06 06:14:22.214194-04	16	6	3
697	2018-10-06 06:14:22.221089-04	40	11	3
698	2018-10-06 06:15:33.843498-04	14	5	3
699	2018-10-06 06:15:33.871583-04	34	9	3
700	2018-10-06 06:15:33.892692-04	2	1	3
701	2018-10-06 06:15:33.913245-04	10	4	3
702	2018-10-06 06:15:33.933748-04	4	2	3
703	2018-10-06 06:15:33.954257-04	26	8	3
704	2018-10-06 06:15:33.975049-04	7	3	3
705	2018-10-06 06:15:33.994496-04	20	7	3
706	2018-10-06 06:15:34.014042-04	38	10	3
707	2018-10-06 06:15:34.033481-04	16	6	3
708	2018-10-06 06:15:34.052949-04	40	11	3
709	2018-10-06 06:16:34.825561-04	13	5	3
710	2018-10-06 06:16:34.853183-04	33	9	3
711	2018-10-06 06:16:34.873862-04	36	1	3
712	2018-10-06 06:16:34.894331-04	1	4	3
713	2018-10-06 06:16:34.914913-04	10	2	3
714	2018-10-06 06:16:34.935345-04	5	8	3
715	2018-10-06 06:16:34.956073-04	26	3	3
716	2018-10-06 06:16:34.975511-04	7	10	3
717	2018-10-06 06:16:34.994903-04	38	6	3
718	2018-10-06 06:16:35.01442-04	16	11	3
719	2018-10-06 06:20:11.492329-04	13	5	3
720	2018-10-06 06:20:11.521686-04	33	9	3
721	2018-10-06 06:20:11.542968-04	1	1	3
722	2018-10-06 06:20:11.563472-04	10	4	3
723	2018-10-06 06:20:11.583964-04	5	2	3
724	2018-10-06 06:20:11.604387-04	26	8	3
725	2018-10-06 06:20:11.625085-04	7	3	3
726	2018-10-06 06:20:11.644589-04	19	7	3
727	2018-10-06 06:20:11.664017-04	38	10	3
728	2018-10-06 06:20:11.683418-04	40	11	3
729	2018-10-06 06:50:10.266907-04	13	5	3
730	2018-10-06 06:50:10.299217-04	32	9	3
731	2018-10-06 06:50:10.320575-04	1	1	3
732	2018-10-06 06:50:10.341041-04	12	4	3
733	2018-10-06 06:50:10.361458-04	11	2	3
734	2018-10-06 06:50:10.381871-04	10	8	3
735	2018-10-06 06:50:10.402464-04	5	3	3
736	2018-10-06 06:50:10.421936-04	26	7	3
737	2018-10-06 06:50:10.441364-04	7	10	3
738	2018-10-06 06:50:10.461003-04	19	6	3
739	2018-10-06 06:50:10.480352-04	38	11	3
740	2018-10-06 06:53:14.504346-04	13	5	3
741	2018-10-06 06:53:14.53325-04	14	9	3
742	2018-10-06 06:53:14.55419-04	35	1	3
743	2018-10-06 06:53:14.574828-04	1	4	3
744	2018-10-06 06:53:14.595379-04	10	8	3
745	2018-10-06 06:53:14.615895-04	5	2	3
746	2018-10-06 06:53:14.636469-04	26	3	3
747	2018-10-06 06:53:14.656013-04	6	10	3
748	2018-10-06 06:53:14.675483-04	7	11	3
749	2018-10-06 07:00:19.99779-04	13	5	3
750	2018-10-06 07:00:20.026579-04	32	9	3
751	2018-10-06 07:00:20.047696-04	1	1	3
752	2018-10-06 07:00:20.068159-04	10	4	3
753	2018-10-06 07:00:20.088541-04	5	2	3
754	2018-10-06 07:00:20.109206-04	4	8	3
755	2018-10-06 07:00:20.12997-04	26	3	3
756	2018-10-06 07:00:20.149458-04	7	7	3
757	2018-10-06 07:00:20.168921-04	19	10	3
758	2018-10-06 07:00:20.188282-04	38	6	3
759	2018-10-06 07:00:20.207678-04	16	11	3
760	2018-10-06 07:03:11.18868-04	14	5	3
761	2018-10-06 07:03:11.193473-04	33	9	3
762	2018-10-06 07:03:11.200701-04	34	1	3
763	2018-10-06 07:03:11.206739-04	1	4	3
764	2018-10-06 07:03:11.212703-04	11	8	3
765	2018-10-06 07:03:11.21879-04	4	3	3
766	2018-10-06 07:03:11.22472-04	5	10	3
767	2018-10-06 07:03:11.230757-04	4	11	3
768	2018-10-06 07:03:11.236697-04	26	2	3
769	2018-10-07 12:22:39.548102-04	13	5	3
770	2018-10-07 12:22:39.613769-04	31	9	3
771	2018-10-07 12:22:39.623429-04	1	1	3
772	2018-10-07 12:22:39.627514-04	16	6	3
773	2018-10-07 12:22:39.633417-04	39	11	3
774	2018-10-07 12:23:21.600591-04	13	5	3
775	2018-10-07 12:23:21.604816-04	36	9	3
776	2018-10-07 12:23:21.610815-04	1	1	3
777	2018-10-07 12:23:21.616796-04	10	4	3
778	2018-10-07 12:23:21.622776-04	4	2	3
779	2018-10-07 12:23:21.628771-04	26	8	3
780	2018-10-07 12:23:21.634754-04	7	3	3
781	2018-10-07 12:23:21.640747-04	19	7	3
782	2018-10-07 12:23:21.646758-04	37	10	3
783	2018-10-07 12:23:21.652797-04	16	6	3
784	2018-10-07 12:23:21.658801-04	39	11	3
785	2018-10-07 15:21:48.428418-04	14	5	3
786	2018-10-07 15:21:48.433232-04	32	9	3
787	2018-10-07 15:21:48.444672-04	1	1	3
788	2018-10-07 15:21:48.450649-04	11	4	3
789	2018-10-07 15:21:48.456661-04	4	2	3
790	2018-10-07 15:21:48.462696-04	27	8	3
791	2018-10-07 15:21:48.468692-04	26	3	3
792	2018-10-07 15:21:48.474672-04	7	7	3
793	2018-10-07 15:21:48.480655-04	19	10	3
794	2018-10-07 15:21:48.486646-04	37	6	3
795	2018-10-07 15:21:48.49264-04	16	11	3
796	2018-10-07 15:22:58.359613-04	13	11	3
797	2018-10-07 15:32:52.052648-04	40	11	3
798	2018-10-09 06:37:48.082912-04	13	5	3
799	2018-10-09 06:37:48.087578-04	33	9	3
800	2018-10-09 06:37:48.097116-04	1	1	3
801	2018-10-09 06:37:48.103189-04	11	4	3
802	2018-10-09 06:37:48.109154-04	5	2	3
803	2018-10-09 06:37:48.115146-04	26	8	3
804	2018-10-09 06:37:48.121132-04	7	3	3
805	2018-10-09 06:37:48.12717-04	23	7	3
806	2018-10-09 06:37:48.133194-04	37	10	3
807	2018-10-09 06:37:48.139188-04	16	6	3
808	2018-10-09 06:37:48.14516-04	40	11	3
809	2018-10-10 04:12:57.903891-04	14	5	3
810	2018-10-10 04:12:57.908744-04	32	9	3
811	2018-10-10 04:12:57.91598-04	1	1	3
812	2018-10-10 04:12:57.922035-04	12	4	3
813	2018-10-10 04:12:57.928074-04	5	2	3
814	2018-10-10 04:12:57.934012-04	26	8	3
815	2018-10-10 04:12:57.940035-04	7	3	3
816	2018-10-10 04:12:57.945987-04	19	7	3
817	2018-10-10 04:12:57.951977-04	38	10	3
818	2018-10-10 04:12:57.965934-04	16	6	3
819	2018-10-10 04:12:57.96992-04	40	11	3
820	2018-10-10 04:13:35.84471-04	14	5	3
821	2018-10-10 04:13:35.848787-04	32	9	3
822	2018-10-10 04:13:35.85814-04	1	1	3
823	2018-10-10 04:13:35.864112-04	10	4	3
824	2018-10-10 04:13:35.870091-04	4	2	3
825	2018-10-10 04:13:35.876089-04	26	8	3
826	2018-10-10 04:13:35.882063-04	7	3	3
827	2018-10-10 04:13:35.888056-04	38	10	3
828	2018-10-10 04:13:35.894026-04	40	11	3
829	2018-10-10 04:14:16.169201-04	14	5	3
830	2018-10-10 04:14:16.173621-04	32	9	3
831	2018-10-10 04:14:16.177104-04	1	1	3
832	2018-10-10 04:14:16.179727-04	10	4	3
833	2018-10-10 04:14:16.183169-04	5	2	3
834	2018-10-10 04:14:16.189138-04	26	8	3
835	2018-10-10 04:14:16.195143-04	7	3	3
836	2018-10-10 04:14:16.201113-04	19	7	3
837	2018-10-10 04:14:16.20711-04	38	10	3
838	2018-10-10 04:14:16.21309-04	40	11	3
839	2018-10-10 04:15:22.732417-04	13	5	3
840	2018-10-10 04:15:22.736473-04	33	9	3
841	2018-10-10 04:15:22.744763-04	1	1	3
842	2018-10-10 04:15:22.750737-04	11	4	3
843	2018-10-10 04:15:22.756731-04	5	2	3
844	2018-10-10 04:15:22.762724-04	26	8	3
845	2018-10-10 04:15:22.768715-04	7	3	3
846	2018-10-10 04:15:22.774717-04	38	10	3
847	2018-10-10 04:15:22.780762-04	16	6	3
848	2018-10-10 04:15:22.786736-04	40	11	3
849	2018-10-10 04:17:30.171875-04	13	5	3
850	2018-10-10 04:17:30.213587-04	34	9	3
851	2018-10-10 04:17:30.226102-04	1	1	3
852	2018-10-10 04:17:30.23223-04	12	4	3
853	2018-10-10 04:17:30.238244-04	5	2	3
854	2018-10-10 04:17:30.244238-04	26	8	3
855	2018-10-10 04:17:30.25022-04	9	3	3
856	2018-10-10 04:17:30.256206-04	38	10	3
857	2018-10-10 04:17:30.26219-04	40	11	3
858	2018-10-10 04:18:44.973981-04	14	5	3
859	2018-10-10 04:18:44.977918-04	33	9	3
860	2018-10-10 04:18:44.984503-04	1	1	3
861	2018-10-10 04:18:44.99046-04	12	4	3
862	2018-10-10 04:18:44.996467-04	5	2	3
863	2018-10-10 04:18:45.002443-04	26	8	3
864	2018-10-10 04:18:45.00844-04	7	3	3
865	2018-10-10 04:18:45.014418-04	19	7	3
866	2018-10-10 04:18:45.020411-04	38	10	3
867	2018-10-10 04:18:45.026378-04	40	11	3
868	2018-10-10 04:21:31.024409-04	13	5	3
869	2018-10-10 04:21:31.0287-04	34	9	3
870	2018-10-10 04:21:31.037827-04	1	1	3
871	2018-10-10 04:21:31.043855-04	12	4	3
872	2018-10-10 04:21:31.049883-04	5	2	3
873	2018-10-10 04:21:31.055873-04	26	8	3
874	2018-10-10 04:21:31.061854-04	7	3	3
875	2018-10-10 04:21:31.067853-04	19	7	3
876	2018-10-10 04:21:31.073835-04	38	10	3
877	2018-10-10 04:21:31.07982-04	16	6	3
878	2018-10-10 04:21:31.085795-04	40	11	3
879	2018-10-10 04:22:26.276013-04	14	5	3
880	2018-10-10 04:22:26.280821-04	35	9	3
881	2018-10-10 04:22:26.29202-04	1	1	3
882	2018-10-10 04:22:26.298061-04	11	4	3
883	2018-10-10 04:22:26.304976-04	4	2	3
884	2018-10-10 04:22:26.310949-04	26	8	3
885	2018-10-10 04:22:26.316944-04	7	3	3
886	2018-10-10 04:22:26.32293-04	40	11	3
887	2018-10-10 04:23:42.298255-04	14	5	3
888	2018-10-10 04:23:42.303074-04	32	9	3
889	2018-10-10 04:23:42.314781-04	1	1	3
890	2018-10-10 04:23:42.320761-04	10	4	3
891	2018-10-10 04:23:42.326742-04	5	2	3
892	2018-10-10 04:23:42.332741-04	26	8	3
893	2018-10-10 04:23:42.338717-04	7	3	3
894	2018-10-10 04:23:42.344734-04	20	7	3
895	2018-10-10 04:23:42.350689-04	38	10	3
896	2018-10-10 04:23:42.356699-04	16	6	3
897	2018-10-10 04:23:42.362663-04	40	11	3
898	2018-10-10 04:24:24.272494-04	13	5	3
899	2018-10-10 04:24:24.276455-04	36	9	3
900	2018-10-10 04:24:24.283047-04	1	1	3
901	2018-10-10 04:24:24.289095-04	11	4	3
902	2018-10-10 04:24:24.295216-04	5	2	3
903	2018-10-10 04:24:24.301188-04	26	8	3
904	2018-10-10 04:24:24.30719-04	7	3	3
905	2018-10-10 04:24:24.313155-04	20	7	3
906	2018-10-10 04:24:24.319166-04	38	10	3
907	2018-10-10 04:24:24.325129-04	40	11	3
908	2018-10-10 04:24:24.331218-04	16	6	3
909	2018-10-10 04:25:39.908077-04	14	5	3
910	2018-10-10 04:25:39.912393-04	33	9	3
911	2018-10-10 04:25:39.921549-04	1	1	3
912	2018-10-10 04:25:39.927551-04	10	4	3
913	2018-10-10 04:25:39.933516-04	4	2	3
914	2018-10-10 04:25:39.939513-04	26	8	3
915	2018-10-10 04:25:39.945493-04	19	7	3
916	2018-10-10 04:25:39.951525-04	38	10	3
917	2018-10-10 04:25:39.957556-04	40	11	3
918	2018-10-10 04:26:11.516252-04	14	5	3
919	2018-10-10 04:26:11.520598-04	34	9	3
920	2018-10-10 04:26:11.528917-04	1	1	3
921	2018-10-10 04:26:11.534897-04	12	4	3
922	2018-10-10 04:26:11.540901-04	5	2	3
923	2018-10-10 04:26:11.546878-04	26	8	3
924	2018-10-10 04:26:11.552875-04	20	7	3
925	2018-10-10 04:26:11.558837-04	38	10	3
926	2018-10-10 04:26:11.564899-04	16	6	3
927	2018-10-10 04:26:11.570811-04	40	11	3
928	2018-10-10 04:27:21.918527-04	13	5	3
929	2018-10-10 04:27:21.922719-04	14	9	3
930	2018-10-10 04:27:21.931871-04	33	1	3
931	2018-10-10 04:27:21.937959-04	1	4	3
932	2018-10-10 04:27:21.94405-04	10	2	3
933	2018-10-10 04:27:21.949967-04	5	8	3
934	2018-10-10 04:27:21.956052-04	28	3	3
935	2018-10-10 04:27:21.962072-04	7	7	3
936	2018-10-10 04:27:21.968015-04	19	10	3
937	2018-10-10 04:27:21.97404-04	38	6	3
938	2018-10-10 04:27:21.979997-04	16	11	3
939	2018-10-10 04:28:23.872338-04	14	5	3
940	2018-10-10 04:28:23.876345-04	33	9	3
941	2018-10-10 04:28:23.883547-04	1	1	3
942	2018-10-10 04:28:23.889522-04	2	4	3
943	2018-10-10 04:28:23.895524-04	10	2	3
944	2018-10-10 04:28:23.901497-04	5	8	3
945	2018-10-10 04:28:23.907502-04	28	3	3
946	2018-10-10 04:28:23.913473-04	7	7	3
947	2018-10-10 04:28:23.919463-04	19	10	3
948	2018-10-10 04:28:23.925442-04	38	6	3
949	2018-10-10 04:28:23.931459-04	16	11	3
950	2018-10-10 04:28:51.631191-04	14	5	3
951	2018-10-10 04:28:51.635211-04	33	9	3
952	2018-10-10 04:28:51.641047-04	2	1	3
953	2018-10-10 04:28:51.647086-04	10	4	3
954	2018-10-10 04:28:51.653077-04	4	2	3
955	2018-10-10 04:28:51.659062-04	28	8	3
956	2018-10-10 04:28:51.665045-04	7	3	3
957	2018-10-10 04:28:51.671032-04	19	7	3
958	2018-10-10 04:28:51.676995-04	38	10	3
959	2018-10-10 04:28:51.682997-04	16	6	3
960	2018-10-10 04:28:51.688985-04	39	11	3
961	2018-10-10 04:29:43.302053-04	13	5	3
962	2018-10-10 04:29:43.306363-04	33	9	3
963	2018-10-10 04:29:43.312149-04	1	1	3
964	2018-10-10 04:29:43.318151-04	12	4	3
965	2018-10-10 04:29:43.324208-04	5	2	3
966	2018-10-10 04:29:43.330166-04	26	8	3
967	2018-10-10 04:29:43.336173-04	21	7	3
968	2018-10-10 04:29:43.342138-04	38	10	3
969	2018-10-10 04:29:43.348146-04	40	11	3
970	2018-10-10 04:31:19.010852-04	13	5	3
971	2018-10-10 04:31:19.015183-04	32	9	3
972	2018-10-10 04:31:19.026408-04	1	1	3
973	2018-10-10 04:31:19.032402-04	11	4	3
974	2018-10-10 04:31:19.038393-04	5	2	3
975	2018-10-10 04:31:19.044373-04	26	8	3
976	2018-10-10 04:31:19.050351-04	7	3	3
977	2018-10-10 04:31:19.056352-04	38	10	3
978	2018-10-10 04:31:19.062325-04	16	6	3
979	2018-10-10 04:31:19.069837-04	40	11	3
980	2018-10-10 04:32:10.748224-04	14	5	3
981	2018-10-10 04:32:10.752816-04	33	9	3
982	2018-10-10 04:32:10.765012-04	2	1	3
983	2018-10-10 04:32:10.771054-04	10	4	3
984	2018-10-10 04:32:10.777112-04	5	2	3
985	2018-10-10 04:32:10.783083-04	27	8	3
986	2018-10-10 04:32:10.789119-04	28	3	3
987	2018-10-10 04:32:10.795167-04	7	7	3
988	2018-10-10 04:32:10.801131-04	19	10	3
989	2018-10-10 04:32:10.807131-04	20	6	3
990	2018-10-10 04:32:10.813111-04	38	11	3
991	2018-10-10 04:32:25.969234-04	13	5	3
992	2018-10-10 04:32:25.973289-04	36	9	3
993	2018-10-10 04:32:25.983333-04	1	1	3
994	2018-10-10 04:32:25.98933-04	10	4	3
995	2018-10-10 04:32:25.995368-04	5	2	3
996	2018-10-10 04:32:26.0013-04	26	8	3
997	2018-10-10 04:32:26.00731-04	7	3	3
998	2018-10-10 04:32:26.013276-04	38	10	3
999	2018-10-10 04:32:26.019282-04	16	6	3
1000	2018-10-10 04:32:26.025252-04	40	11	3
1001	2018-10-10 04:32:34.421085-04	14	5	3
1002	2018-10-10 04:32:34.425932-04	34	9	3
1003	2018-10-10 04:32:34.437514-04	1	1	3
1004	2018-10-10 04:32:34.443518-04	2	4	3
1005	2018-10-10 04:32:34.449503-04	10	2	3
1006	2018-10-10 04:32:34.455564-04	5	8	3
1007	2018-10-10 04:32:34.461534-04	28	3	3
1008	2018-10-10 04:32:34.467538-04	7	7	3
1009	2018-10-10 04:32:34.473509-04	21	10	3
1010	2018-10-10 04:32:34.479517-04	38	6	3
1011	2018-10-10 04:32:34.48549-04	16	11	3
1012	2018-10-10 04:32:56.162313-04	14	5	3
1013	2018-10-10 04:32:56.166734-04	35	9	3
1014	2018-10-10 04:32:56.171847-04	1	1	3
1015	2018-10-10 04:32:56.177825-04	2	4	3
1016	2018-10-10 04:32:56.183828-04	10	2	3
1017	2018-10-10 04:32:56.189795-04	4	8	3
1018	2018-10-10 04:32:56.195784-04	28	3	3
1019	2018-10-10 04:32:56.201798-04	7	7	3
1020	2018-10-10 04:32:56.207847-04	20	10	3
1021	2018-10-10 04:32:56.213814-04	38	6	3
1022	2018-10-10 04:32:56.219826-04	16	11	3
1023	2018-10-10 04:33:08.525362-04	15	5	3
1024	2018-10-10 04:33:08.529363-04	35	9	3
1025	2018-10-10 04:33:08.535808-04	3	1	3
1026	2018-10-10 04:33:08.541771-04	12	4	3
1027	2018-10-10 04:33:08.54778-04	6	2	3
1028	2018-10-10 04:33:08.553753-04	26	8	3
1029	2018-10-10 04:33:08.559749-04	40	11	3
1030	2018-10-10 04:33:54.718797-04	14	5	3
1031	2018-10-10 04:33:54.722783-04	36	9	3
1032	2018-10-10 04:33:54.73437-04	2	1	3
1033	2018-10-10 04:33:54.740356-04	10	4	3
1034	2018-10-10 04:33:54.746372-04	5	2	3
1035	2018-10-10 04:33:54.752438-04	28	8	3
1036	2018-10-10 04:33:54.758394-04	7	3	3
1037	2018-10-10 04:33:54.764402-04	20	7	3
1038	2018-10-10 04:33:54.770365-04	38	10	3
1039	2018-10-10 04:33:54.776377-04	16	6	3
1040	2018-10-10 04:33:54.78236-04	39	11	3
1041	2018-10-10 04:33:56.199691-04	14	5	3
1042	2018-10-10 04:33:56.203666-04	34	9	3
1043	2018-10-10 04:33:56.213331-04	1	1	3
1044	2018-10-10 04:33:56.219344-04	11	4	3
1045	2018-10-10 04:33:56.225306-04	4	2	3
1046	2018-10-10 04:33:56.231312-04	26	8	3
1047	2018-10-10 04:33:56.237289-04	7	3	3
1048	2018-10-10 04:33:56.24332-04	19	7	3
1049	2018-10-10 04:33:56.249336-04	38	10	3
1050	2018-10-10 04:33:56.255336-04	40	11	3
1051	2018-10-10 04:34:46.909372-04	14	5	3
1052	2018-10-10 04:34:46.91334-04	32	9	3
1053	2018-10-10 04:34:46.916405-04	1	1	3
1054	2018-10-10 04:34:46.920699-04	12	4	3
1055	2018-10-10 04:34:46.927594-04	4	2	3
1056	2018-10-10 04:34:46.933906-04	26	8	3
1057	2018-10-10 04:34:46.939552-04	20	7	3
1058	2018-10-10 04:34:46.945531-04	38	10	3
1059	2018-10-10 04:34:46.951534-04	40	11	3
1060	2018-10-10 04:34:51.877976-04	14	5	3
1061	2018-10-10 04:34:51.881997-04	36	9	3
1062	2018-10-10 04:34:51.896555-04	2	1	3
1063	2018-10-10 04:34:51.909063-04	10	4	3
1064	2018-10-10 04:34:51.91505-04	5	2	3
1065	2018-10-10 04:34:51.92104-04	28	8	3
1066	2018-10-10 04:34:51.927039-04	7	3	3
1067	2018-10-10 04:34:51.933017-04	21	7	3
1068	2018-10-10 04:34:51.939002-04	38	10	3
1069	2018-10-10 04:34:51.945023-04	16	6	3
1070	2018-10-10 04:34:51.951052-04	39	11	3
1071	2018-10-10 04:35:15.049726-04	14	5	3
1072	2018-10-10 04:35:15.053693-04	34	9	3
1073	2018-10-10 04:35:15.062257-04	1	1	3
1074	2018-10-10 04:35:15.06824-04	2	4	3
1075	2018-10-10 04:35:15.074231-04	10	2	3
1076	2018-10-10 04:35:15.080205-04	5	8	3
1077	2018-10-10 04:35:15.086196-04	28	3	3
1078	2018-10-10 04:35:15.092182-04	7	7	3
1079	2018-10-10 04:35:15.098169-04	20	10	3
1080	2018-10-10 04:35:15.104157-04	38	6	3
1081	2018-10-10 04:35:15.110162-04	16	11	3
1082	2018-10-10 04:35:40.796023-04	14	5	3
1083	2018-10-10 04:35:40.800812-04	34	9	3
1084	2018-10-10 04:35:40.813958-04	2	1	3
1085	2018-10-10 04:35:40.819943-04	10	4	3
1086	2018-10-10 04:35:40.825926-04	5	2	3
1087	2018-10-10 04:35:40.831919-04	28	8	3
1088	2018-10-10 04:35:40.837897-04	7	3	3
1089	2018-10-10 04:35:40.843904-04	22	7	3
1090	2018-10-10 04:35:40.850362-04	37	10	3
1091	2018-10-10 04:35:40.855843-04	16	6	3
1092	2018-10-10 04:35:40.861812-04	39	11	3
1093	2018-10-10 04:35:41.591866-04	13	5	3
1094	2018-10-10 04:35:41.596158-04	36	9	3
1095	2018-10-10 04:35:41.604283-04	2	1	3
1096	2018-10-10 04:35:41.610254-04	11	4	3
1097	2018-10-10 04:35:41.616292-04	4	2	3
1098	2018-10-10 04:35:41.622323-04	26	8	3
1099	2018-10-10 04:35:41.628314-04	20	7	3
1100	2018-10-10 04:35:41.63428-04	38	10	3
1101	2018-10-10 04:35:41.640278-04	16	6	3
1102	2018-10-10 04:35:41.646261-04	40	11	3
1103	2018-10-10 04:36:21.160621-04	13	5	3
1104	2018-10-10 04:36:21.164575-04	34	9	3
1105	2018-10-10 04:36:21.17485-04	1	1	3
1106	2018-10-10 04:36:21.180841-04	10	4	3
1107	2018-10-10 04:36:21.186815-04	5	2	3
1108	2018-10-10 04:36:21.19281-04	26	8	3
1109	2018-10-10 04:36:21.198792-04	7	3	3
1110	2018-10-10 04:36:21.204785-04	19	7	3
1111	2018-10-10 04:36:21.210767-04	38	10	3
1112	2018-10-10 04:36:21.216762-04	16	6	3
1113	2018-10-10 04:36:21.222737-04	40	11	3
1114	2018-10-10 04:37:11.806794-04	13	5	3
1115	2018-10-10 04:37:11.811439-04	34	9	3
1116	2018-10-10 04:37:11.821151-04	1	1	3
1117	2018-10-10 04:37:11.827359-04	12	4	3
1118	2018-10-10 04:37:11.833381-04	5	2	3
1119	2018-10-10 04:37:11.839368-04	26	8	3
1120	2018-10-10 04:37:11.845464-04	7	3	3
1121	2018-10-10 04:37:11.851507-04	38	10	3
1122	2018-10-10 04:37:11.85744-04	16	6	3
1123	2018-10-10 04:37:11.863481-04	40	11	3
1124	2018-10-10 04:37:23.769096-04	14	5	3
1125	2018-10-10 04:37:23.773395-04	35	9	3
1126	2018-10-10 04:37:23.779382-04	1	1	3
1127	2018-10-10 04:37:23.784376-04	10	4	3
1128	2018-10-10 04:37:23.790344-04	5	2	3
1129	2018-10-10 04:37:23.796338-04	28	8	3
1130	2018-10-10 04:37:23.802313-04	7	3	3
1131	2018-10-10 04:37:23.80835-04	20	7	3
1132	2018-10-10 04:37:23.814376-04	23	10	3
1133	2018-10-10 04:37:23.820363-04	37	6	3
1134	2018-10-10 04:37:23.826347-04	16	11	3
1135	2018-10-10 04:37:49.599403-04	14	5	3
1136	2018-10-10 04:37:49.603317-04	35	9	3
1137	2018-10-10 04:37:49.620595-04	1	1	3
1138	2018-10-10 04:37:49.631956-04	10	4	3
1139	2018-10-10 04:37:49.637864-04	11	2	3
1140	2018-10-10 04:37:49.643857-04	5	8	3
1141	2018-10-10 04:37:49.649854-04	4	3	3
1142	2018-10-10 04:37:49.65583-04	28	7	3
1143	2018-10-10 04:37:49.661816-04	7	10	3
1144	2018-10-10 04:37:49.667842-04	22	6	3
1145	2018-10-10 04:37:49.673887-04	37	11	3
1146	2018-10-10 04:38:30.200359-04	14	5	3
1147	2018-10-10 04:38:30.204704-04	35	9	3
1148	2018-10-10 04:38:30.214392-04	1	1	3
1149	2018-10-10 04:38:30.220407-04	10	4	3
1150	2018-10-10 04:38:30.226368-04	4	2	3
1151	2018-10-10 04:38:30.232363-04	27	8	3
1152	2018-10-10 04:38:30.238354-04	28	3	3
1153	2018-10-10 04:38:30.244353-04	7	7	3
1154	2018-10-10 04:38:30.250329-04	22	10	3
1155	2018-10-10 04:38:30.256318-04	37	6	3
1156	2018-10-10 04:38:30.262304-04	16	11	3
1157	2018-10-10 04:39:22.629375-04	14	5	3
1158	2018-10-10 04:39:22.633657-04	36	9	3
1159	2018-10-10 04:39:22.645972-04	1	1	3
1160	2018-10-10 04:39:22.651999-04	10	4	3
1161	2018-10-10 04:39:22.657943-04	4	2	3
1162	2018-10-10 04:39:22.663944-04	5	8	3
1163	2018-10-10 04:39:22.670556-04	28	3	3
1164	2018-10-10 04:39:22.675919-04	7	7	3
1165	2018-10-10 04:39:22.681882-04	21	10	3
1166	2018-10-10 04:39:22.687887-04	37	6	3
1167	2018-10-10 04:39:22.693868-04	16	11	3
1168	2018-10-10 04:39:43.856756-04	14	5	3
1169	2018-10-10 04:39:43.861117-04	13	9	3
1170	2018-10-10 04:39:43.871166-04	34	1	3
1171	2018-10-10 04:39:43.877143-04	1	4	3
1172	2018-10-10 04:39:43.883121-04	10	2	3
1173	2018-10-10 04:39:43.889146-04	5	8	3
1174	2018-10-10 04:39:43.895192-04	28	3	3
1175	2018-10-10 04:39:43.901156-04	7	7	3
1176	2018-10-10 04:39:43.907144-04	19	10	3
1177	2018-10-10 04:39:43.91313-04	38	6	3
1178	2018-10-10 04:39:43.919125-04	16	11	3
1179	2018-10-10 04:40:10.663669-04	13	5	3
1180	2018-10-10 04:40:10.667916-04	35	9	3
1181	2018-10-10 04:40:10.676651-04	1	1	3
1182	2018-10-10 04:40:10.682617-04	11	4	3
1183	2018-10-10 04:40:10.688615-04	10	2	3
1184	2018-10-10 04:40:10.694589-04	11	8	3
1185	2018-10-10 04:40:10.700591-04	5	3	3
1186	2018-10-10 04:40:10.70657-04	28	7	3
1187	2018-10-10 04:40:10.712605-04	7	10	3
1188	2018-10-10 04:40:10.71862-04	20	6	3
1189	2018-10-10 04:40:10.724614-04	37	11	3
1190	2018-10-10 04:40:38.443688-04	13	5	3
1191	2018-10-10 04:40:38.448099-04	34	9	3
1192	2018-10-10 04:40:38.452082-04	36	1	3
1193	2018-10-10 04:40:38.458064-04	1	4	3
1194	2018-10-10 04:40:38.464052-04	10	2	3
1195	2018-10-10 04:40:38.470035-04	5	8	3
1196	2018-10-10 04:40:38.476025-04	28	3	3
1197	2018-10-10 04:40:38.482009-04	7	7	3
1198	2018-10-10 04:40:38.487995-04	19	10	3
1199	2018-10-10 04:40:38.493982-04	38	6	3
1200	2018-10-10 04:40:38.499972-04	16	11	3
1201	2018-10-10 04:41:05.575546-04	14	5	3
1202	2018-10-10 04:41:05.579559-04	36	9	3
1203	2018-10-10 04:41:05.592825-04	1	1	3
1204	2018-10-10 04:41:05.598783-04	2	4	3
1205	2018-10-10 04:41:05.604764-04	11	2	3
1206	2018-10-10 04:41:05.610753-04	5	8	3
1207	2018-10-10 04:41:05.616748-04	28	3	3
1208	2018-10-10 04:41:05.622728-04	7	7	3
1209	2018-10-10 04:41:05.628733-04	19	10	3
1210	2018-10-10 04:41:05.634702-04	38	6	3
1211	2018-10-10 04:41:05.640757-04	16	11	3
1212	2018-10-10 04:50:26.584312-04	13	5	3
1213	2018-10-10 04:50:26.589118-04	36	9	3
1214	2018-10-10 04:50:26.598038-04	2	1	3
1215	2018-10-10 04:50:26.604164-04	10	4	3
1216	2018-10-10 04:50:26.610192-04	5	2	3
1217	2018-10-10 04:50:26.616169-04	28	8	3
1218	2018-10-10 04:50:26.622201-04	7	3	3
1219	2018-10-10 04:50:26.62828-04	7	7	3
1220	2018-10-10 04:50:26.634208-04	19	10	3
1221	2018-10-10 04:50:26.640254-04	37	6	3
1222	2018-10-10 04:50:26.646285-04	16	11	3
1223	2018-10-10 04:51:01.775406-04	14	5	3
1224	2018-10-10 04:51:01.779974-04	34	9	3
1225	2018-10-10 04:51:01.79028-04	2	1	3
1226	2018-10-10 04:51:01.796284-04	11	4	3
1227	2018-10-10 04:51:01.802254-04	5	2	3
1228	2018-10-10 04:51:01.808257-04	27	8	3
1229	2018-10-10 04:51:01.814231-04	28	3	3
1230	2018-10-10 04:51:01.820226-04	7	7	3
1231	2018-10-10 04:51:01.826202-04	19	10	3
1232	2018-10-10 04:51:01.83219-04	37	6	3
1233	2018-10-10 04:51:01.83818-04	16	11	3
1234	2018-10-10 04:51:25.825183-04	14	5	3
1235	2018-10-10 04:51:25.829475-04	32	9	3
1236	2018-10-10 04:51:25.835596-04	2	1	3
1237	2018-10-10 04:51:25.841559-04	11	4	3
1238	2018-10-10 04:51:25.847559-04	5	2	3
1239	2018-10-10 04:51:25.853531-04	28	8	3
1240	2018-10-10 04:51:25.85954-04	7	3	3
1241	2018-10-10 04:51:25.865506-04	22	7	3
1242	2018-10-10 04:51:25.871517-04	22	10	3
1243	2018-10-10 04:51:25.877482-04	38	6	3
1244	2018-10-10 04:51:25.883483-04	16	11	3
1245	2018-10-10 04:51:43.230658-04	13	5	3
1246	2018-10-10 04:51:43.234928-04	32	9	3
1247	2018-10-10 04:51:43.240844-04	1	1	3
1248	2018-10-10 04:51:43.246843-04	10	4	3
1249	2018-10-10 04:51:43.252864-04	5	2	3
1250	2018-10-10 04:51:43.258897-04	28	8	3
1251	2018-10-10 04:51:43.264874-04	7	3	3
1252	2018-10-10 04:51:43.270868-04	19	7	3
1253	2018-10-10 04:51:43.276851-04	37	10	3
1254	2018-10-10 04:51:43.282848-04	38	6	3
1255	2018-10-10 04:51:43.288823-04	16	11	3
1256	2018-10-10 04:52:01.379198-04	13	5	3
1257	2018-10-10 04:52:01.383674-04	32	9	3
1258	2018-10-10 04:52:01.388974-04	1	1	3
1259	2018-10-10 04:52:01.395057-04	10	4	3
1260	2018-10-10 04:52:01.397943-04	5	2	3
1261	2018-10-10 04:52:01.402575-04	28	8	3
1262	2018-10-10 04:52:01.408586-04	7	3	3
1263	2018-10-10 04:52:01.414591-04	19	7	3
1264	2018-10-10 04:52:01.420644-04	37	10	3
1265	2018-10-10 04:52:01.426967-04	38	6	3
1266	2018-10-10 04:52:01.43261-04	16	11	3
1267	2018-10-10 04:52:36.190541-04	13	5	3
1268	2018-10-10 04:52:36.194534-04	31	9	3
1269	2018-10-10 04:52:36.20148-04	1	1	3
1270	2018-10-10 04:52:36.207501-04	10	4	3
1271	2018-10-10 04:52:36.213528-04	4	2	3
1272	2018-10-10 04:52:36.219472-04	5	8	3
1273	2018-10-10 04:52:36.225518-04	28	3	3
1274	2018-10-10 04:52:36.231448-04	7	7	3
1275	2018-10-10 04:52:36.237474-04	19	10	3
1276	2018-10-10 04:52:36.243416-04	38	6	3
1277	2018-10-10 04:52:36.249443-04	16	11	3
1278	2018-10-10 04:53:09.690007-04	14	5	3
1279	2018-10-10 04:53:09.694694-04	32	9	3
1280	2018-10-10 04:53:09.701029-04	2	1	3
1281	2018-10-10 04:53:09.707447-04	10	4	3
1282	2018-10-10 04:53:09.713013-04	5	2	3
1283	2018-10-10 04:53:09.718996-04	27	8	3
1284	2018-10-10 04:53:09.724979-04	28	3	3
1285	2018-10-10 04:53:09.730968-04	7	7	3
1286	2018-10-10 04:53:09.736945-04	19	10	3
1287	2018-10-10 04:53:09.742941-04	37	6	3
1288	2018-10-10 04:53:09.748922-04	38	11	3
1289	2018-10-10 04:53:38.160846-04	14	5	3
1290	2018-10-10 04:53:38.165211-04	32	9	3
1291	2018-10-10 04:53:38.176928-04	1	1	3
1292	2018-10-10 04:53:38.182949-04	2	4	3
1293	2018-10-10 04:53:38.189001-04	10	2	3
1294	2018-10-10 04:53:38.194969-04	5	8	3
1295	2018-10-10 04:53:38.200963-04	28	3	3
1296	2018-10-10 04:53:38.206937-04	7	7	3
1297	2018-10-10 04:53:38.212942-04	20	10	3
1298	2018-10-10 04:53:38.218902-04	38	6	3
1299	2018-10-10 04:53:38.224914-04	16	11	3
1300	2018-10-10 04:54:47.858031-04	14	5	3
1301	2018-10-10 04:54:47.862377-04	31	9	3
1302	2018-10-10 04:54:47.870105-04	2	1	3
1303	2018-10-10 04:54:47.87609-04	10	4	3
1304	2018-10-10 04:54:47.882089-04	5	8	3
1305	2018-10-10 04:54:47.888085-04	28	2	3
1306	2018-10-10 04:54:47.894057-04	4	3	3
1307	2018-10-10 04:54:47.900086-04	7	7	3
1308	2018-10-10 04:54:47.903509-04	19	10	3
1309	2018-10-10 04:54:47.909491-04	38	6	3
1310	2018-10-10 04:54:47.915488-04	16	11	3
1311	2018-10-10 04:55:06.620592-04	14	5	3
1312	2018-10-10 04:55:06.624562-04	31	9	3
1313	2018-10-10 04:55:06.631939-04	1	1	3
1314	2018-10-10 04:55:06.637905-04	10	4	3
1315	2018-10-10 04:55:06.643932-04	5	2	3
1316	2018-10-10 04:55:06.64997-04	28	8	3
1317	2018-10-10 04:55:06.655951-04	7	3	3
1318	2018-10-10 04:55:06.661951-04	19	7	3
1319	2018-10-10 04:55:06.667921-04	38	10	3
1320	2018-10-10 04:55:06.673915-04	16	6	3
1321	2018-10-10 04:55:06.679896-04	39	11	3
1322	2018-10-10 04:55:30.550811-04	14	5	3
1323	2018-10-10 04:55:30.55507-04	31	9	3
1324	2018-10-10 04:55:30.563551-04	1	1	3
1325	2018-10-10 04:55:30.569581-04	2	4	3
1326	2018-10-10 04:55:30.575584-04	11	2	3
1327	2018-10-10 04:55:30.581557-04	5	8	3
1328	2018-10-10 04:55:30.587544-04	4	3	3
1329	2018-10-10 04:55:30.593521-04	28	7	3
1330	2018-10-10 04:55:30.59951-04	7	10	3
1331	2018-10-10 04:55:30.605496-04	19	6	3
1332	2018-10-10 04:55:30.611525-04	38	11	3
1333	2018-10-10 04:55:50.114669-04	14	5	3
1334	2018-10-10 04:55:50.118944-04	31	9	3
1335	2018-10-10 04:55:50.124344-04	2	1	3
1336	2018-10-10 04:55:50.130323-04	10	4	3
1337	2018-10-10 04:55:50.136293-04	5	2	3
1338	2018-10-10 04:55:50.142277-04	28	8	3
1339	2018-10-10 04:55:50.148286-04	7	3	3
1340	2018-10-10 04:55:50.154257-04	20	7	3
1341	2018-10-10 04:55:50.160238-04	37	10	3
1342	2018-10-10 04:55:50.166241-04	16	6	3
1343	2018-10-10 04:55:50.172225-04	39	11	3
1344	2018-10-10 04:56:40.106742-04	13	5	3
1345	2018-10-10 04:56:40.111376-04	14	9	3
1346	2018-10-10 04:56:40.118717-04	32	1	3
1347	2018-10-10 04:56:40.124738-04	2	4	3
1348	2018-10-10 04:56:40.130758-04	10	2	3
1349	2018-10-10 04:56:40.136736-04	4	8	3
1350	2018-10-10 04:56:40.142729-04	28	3	3
1351	2018-10-10 04:56:40.148711-04	7	7	3
1352	2018-10-10 04:56:40.154702-04	19	10	3
1353	2018-10-10 04:56:40.16069-04	37	6	3
1354	2018-10-10 04:56:40.16668-04	38	11	3
1355	2018-10-10 04:56:57.005974-04	14	5	3
1356	2018-10-10 04:56:57.010791-04	32	9	3
1357	2018-10-10 04:56:57.017848-04	1	1	3
1358	2018-10-10 04:56:57.024023-04	10	4	3
1359	2018-10-10 04:56:57.030094-04	4	2	3
1360	2018-10-10 04:56:57.036145-04	28	8	3
1361	2018-10-10 04:56:57.04215-04	7	3	3
1362	2018-10-10 04:56:57.048149-04	20	7	3
1363	2018-10-10 04:56:57.054128-04	38	10	3
1364	2018-10-10 04:56:57.060142-04	16	6	3
1365	2018-10-10 04:56:57.066172-04	39	11	3
1366	2018-10-10 04:57:31.989634-04	14	5	3
1367	2018-10-10 04:57:31.994087-04	32	9	3
1368	2018-10-10 04:57:32.002603-04	1	1	3
1369	2018-10-10 04:57:32.008665-04	10	4	3
1370	2018-10-10 04:57:32.01458-04	5	2	3
1371	2018-10-10 04:57:32.020627-04	28	8	3
1372	2018-10-10 04:57:32.026549-04	7	3	3
1373	2018-10-10 04:57:32.032634-04	21	7	3
1374	2018-10-10 04:57:32.038528-04	38	10	3
1375	2018-10-10 04:57:32.04457-04	16	6	3
1376	2018-10-10 04:57:32.050504-04	39	11	3
1377	2018-10-10 04:58:30.154595-04	14	5	3
1378	2018-10-10 04:58:30.158991-04	33	9	3
1379	2018-10-10 04:58:30.169918-04	1	1	3
1380	2018-10-10 04:58:30.175906-04	10	4	3
1381	2018-10-10 04:58:30.181882-04	5	2	3
1382	2018-10-10 04:58:30.187874-04	28	8	3
1383	2018-10-10 04:58:30.193907-04	7	3	3
1384	2018-10-10 04:58:30.196761-04	19	7	3
1385	2018-10-10 04:58:30.202683-04	37	10	3
1386	2018-10-10 04:58:30.208675-04	38	6	3
1387	2018-10-10 04:58:30.214658-04	16	11	3
1388	2018-10-10 04:59:00.409164-04	14	5	3
1389	2018-10-10 04:59:00.413127-04	33	9	3
1390	2018-10-10 04:59:00.421166-04	1	1	3
1391	2018-10-10 04:59:00.427171-04	2	4	3
1392	2018-10-10 04:59:00.43315-04	10	2	3
1393	2018-10-10 04:59:00.439123-04	5	8	3
1394	2018-10-10 04:59:00.445118-04	28	3	3
1395	2018-10-10 04:59:00.4511-04	7	7	3
1396	2018-10-10 04:59:00.457097-04	19	10	3
1397	2018-10-10 04:59:00.463074-04	38	6	3
1398	2018-10-10 04:59:00.469069-04	16	11	3
\.


--
-- Name: questions_triviafeedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ma3tycoon
--

SELECT pg_catalog.setval('public.questions_triviafeedback_id_seq', 1398, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fares_fare_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare
    ADD CONSTRAINT fares_fare_pkey PRIMARY KEY (id);


--
-- Name: questions_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice
    ADD CONSTRAINT questions_choice_pkey PRIMARY KEY (id);


--
-- Name: questions_leaderboard_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard
    ADD CONSTRAINT questions_leaderboard_pkey PRIMARY KEY (id);


--
-- Name: questions_question_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_pkey PRIMARY KEY (id);


--
-- Name: questions_transitfeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback
    ADD CONSTRAINT questions_transitfeedback_pkey PRIMARY KEY (id);


--
-- Name: questions_triviafeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeedback_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fares_fare_user_id_76be4f55; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX fares_fare_user_id_76be4f55 ON public.fares_fare USING btree (user_id);


--
-- Name: questions_choice_question_id_2d0da4e9; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_choice_question_id_2d0da4e9 ON public.questions_choice USING btree (question_id);


--
-- Name: questions_leaderboard_user_id_90cf2fdc; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_leaderboard_user_id_90cf2fdc ON public.questions_leaderboard USING btree (user_id);


--
-- Name: questions_transitfeedback_point_id; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_transitfeedback_point_id ON public.questions_transitfeedback USING gist (point);


--
-- Name: questions_transitfeedback_user_id_2e764b97; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_transitfeedback_user_id_2e764b97 ON public.questions_transitfeedback USING btree (user_id);


--
-- Name: questions_triviafeedback_choice_id_623d0221; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_choice_id_623d0221 ON public.questions_triviafeedback USING btree (choice_id);


--
-- Name: questions_triviafeedback_question_id_e8a8d321; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_question_id_e8a8d321 ON public.questions_triviafeedback USING btree (question_id);


--
-- Name: questions_triviafeedback_user_id_f07e8d9f; Type: INDEX; Schema: public; Owner: ma3tycoon
--

CREATE INDEX questions_triviafeedback_user_id_f07e8d9f ON public.questions_triviafeedback USING btree (user_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fares_fare_user_id_76be4f55_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.fares_fare
    ADD CONSTRAINT fares_fare_user_id_76be4f55_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_choice_question_id_2d0da4e9_fk_questions_question_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_choice
    ADD CONSTRAINT questions_choice_question_id_2d0da4e9_fk_questions_question_id FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_leaderboard_user_id_90cf2fdc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_leaderboard
    ADD CONSTRAINT questions_leaderboard_user_id_90cf2fdc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_transitfeedback_user_id_2e764b97_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_transitfeedback
    ADD CONSTRAINT questions_transitfeedback_user_id_2e764b97_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeed_choice_id_623d0221_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeed_choice_id_623d0221_fk_questions FOREIGN KEY (choice_id) REFERENCES public.questions_choice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeed_question_id_e8a8d321_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeed_question_id_e8a8d321_fk_questions FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_triviafeedback_user_id_f07e8d9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ma3tycoon
--

ALTER TABLE ONLY public.questions_triviafeedback
    ADD CONSTRAINT questions_triviafeedback_user_id_f07e8d9f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

