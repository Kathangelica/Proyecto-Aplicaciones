--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-06-03 14:51:01

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
-- TOC entry 237 (class 1259 OID 36185)
-- Name: administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrador (
    id_admin integer NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    correo_electronico character varying(100) NOT NULL,
    rol character varying(50) NOT NULL,
    fecha_registro date NOT NULL,
    estado character varying(20) NOT NULL
);


ALTER TABLE public.administrador OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 36184)
-- Name: administrador_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrador_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administrador_id_admin_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 236
-- Name: administrador_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrador_id_admin_seq OWNED BY public.administrador.id_admin;


--
-- TOC entry 217 (class 1259 OID 36109)
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id_carrera integer NOT NULL,
    id_facultad integer,
    nombre_carrera character varying(100)
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 36108)
-- Name: carrera_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrera_id_carrera_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 216
-- Name: carrera_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_carrera_seq OWNED BY public.carrera.id_carrera;


--
-- TOC entry 225 (class 1259 OID 36137)
-- Name: convenio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.convenio (
    id integer NOT NULL,
    id_empresa integer NOT NULL,
    convenio character varying(200),
    f_inicioc date NOT NULL,
    f_finc date NOT NULL
);


ALTER TABLE public.convenio OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 36136)
-- Name: convenio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.convenio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.convenio_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 224
-- Name: convenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.convenio_id_seq OWNED BY public.convenio.id;


--
-- TOC entry 235 (class 1259 OID 36178)
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente (
    id_doc integer NOT NULL,
    ci_docente character varying(10) NOT NULL,
    nombre_dct character varying(50),
    apellido_pat character varying(50),
    apellido_mat character varying(50),
    sexo_dct character varying(10),
    direccion_dct character varying(50),
    ciudad_dct character varying(50),
    provincia_dct character varying(50),
    telefono_dct character varying(10),
    e_mail_dct character varying(50)
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 36177)
-- Name: docente_id_doc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.docente_id_doc_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.docente_id_doc_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 234
-- Name: docente_id_doc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.docente_id_doc_seq OWNED BY public.docente.id_doc;


--
-- TOC entry 221 (class 1259 OID 36123)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    nombre_empresa character varying(100) NOT NULL,
    provincia_empresa character varying(50) NOT NULL,
    ciudad_empresa character varying(50) NOT NULL,
    direccion_empresa character varying(50) NOT NULL,
    telefono_empresa character varying(10),
    e_mail_empresa character varying(25),
    intestado integer
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 36122)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empresa_id_empresa_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 220
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- TOC entry 227 (class 1259 OID 36145)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 36144)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 226
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- TOC entry 223 (class 1259 OID 36130)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    id_estudiante integer NOT NULL,
    ci_estudiante character varying(10),
    idcarrera integer NOT NULL,
    idsemestre integer NOT NULL,
    nombre_est character varying(50) NOT NULL,
    apellido_pat character varying(50) NOT NULL,
    apellido_mat character varying(50) NOT NULL,
    sexo_est character varying(10),
    direccion_est character varying(50),
    ciudad_est character varying(50),
    provincia_est character varying(50),
    telefono_est character varying(25),
    e_mail_est character varying(50),
    estado integer
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 36129)
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_id_estudiante_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 222
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_id_estudiante_seq OWNED BY public.estudiante.id_estudiante;


--
-- TOC entry 229 (class 1259 OID 36152)
-- Name: evaluacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluacion (
    id integer NOT NULL,
    fechaevaluacion date NOT NULL,
    ci_estudiante integer NOT NULL,
    ci_docente integer NOT NULL,
    notadocente numeric(18,2) NOT NULL,
    datostutorempresa character varying(250) NOT NULL,
    notaresponsableem numeric(18,2) NOT NULL,
    sumanotas numeric(18,2),
    filename character varying(200),
    filesize integer,
    subirportafolio character varying(255)
);


ALTER TABLE public.evaluacion OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 36151)
-- Name: evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evaluacion_id_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 228
-- Name: evaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluacion_id_seq OWNED BY public.evaluacion.id;


--
-- TOC entry 215 (class 1259 OID 36103)
-- Name: facultad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultad (
    id_facultad integer NOT NULL,
    nombre_facultad character varying(100) NOT NULL,
    estado integer
);


ALTER TABLE public.facultad OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36116)
-- Name: periodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periodo (
    id_periodo integer NOT NULL,
    descripcionperiodo character varying(100) NOT NULL
);


ALTER TABLE public.periodo OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 36115)
-- Name: periodo_id_periodo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.periodo_id_periodo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.periodo_id_periodo_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 218
-- Name: periodo_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.periodo_id_periodo_seq OWNED BY public.periodo.id_periodo;


--
-- TOC entry 231 (class 1259 OID 36162)
-- Name: practica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.practica (
    id_practica integer NOT NULL,
    codigo_practica character varying(15) NOT NULL,
    ci_estudiante integer NOT NULL,
    posee_informe boolean,
    id_empresa integer NOT NULL,
    titulo_proyecto character varying(300) NOT NULL,
    area character varying(100),
    fecha_inscripcion date,
    fecha_inicio_practica date,
    fecha_fin_practica date,
    total_horas_practica character varying(5),
    id_convenio integer,
    id_periodo integer NOT NULL,
    observaciones character varying(200),
    id_estado integer,
    id_docente integer
);


ALTER TABLE public.practica OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 36161)
-- Name: practica_id_practica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.practica_id_practica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.practica_id_practica_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 230
-- Name: practica_id_practica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.practica_id_practica_seq OWNED BY public.practica.id_practica;


--
-- TOC entry 233 (class 1259 OID 36171)
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semestre (
    id integer NOT NULL,
    descripcionsemestre character varying(100) NOT NULL
);


ALTER TABLE public.semestre OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 36170)
-- Name: semestre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semestre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semestre_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 232
-- Name: semestre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semestre_id_seq OWNED BY public.semestre.id;


--
-- TOC entry 239 (class 1259 OID 36257)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character(1)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 36256)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 238
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4757 (class 2604 OID 36188)
-- Name: administrador id_admin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador ALTER COLUMN id_admin SET DEFAULT nextval('public.administrador_id_admin_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 36112)
-- Name: carrera id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id_carrera SET DEFAULT nextval('public.carrera_id_carrera_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 36140)
-- Name: convenio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio ALTER COLUMN id SET DEFAULT nextval('public.convenio_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 36181)
-- Name: docente id_doc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente ALTER COLUMN id_doc SET DEFAULT nextval('public.docente_id_doc_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 36126)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 36148)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 36133)
-- Name: estudiante id_estudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiante_id_estudiante_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 36155)
-- Name: evaluacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion ALTER COLUMN id SET DEFAULT nextval('public.evaluacion_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 36119)
-- Name: periodo id_periodo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo ALTER COLUMN id_periodo SET DEFAULT nextval('public.periodo_id_periodo_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 36165)
-- Name: practica id_practica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica ALTER COLUMN id_practica SET DEFAULT nextval('public.practica_id_practica_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 36174)
-- Name: semestre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre ALTER COLUMN id SET DEFAULT nextval('public.semestre_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 36260)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4963 (class 0 OID 36185)
-- Dependencies: 237
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrador (id_admin, nombre_completo, correo_electronico, rol, fecha_registro, estado) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 36109)
-- Dependencies: 217
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (id_carrera, id_facultad, nombre_carrera) FROM stdin;
\.


--
-- TOC entry 4951 (class 0 OID 36137)
-- Dependencies: 225
-- Data for Name: convenio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.convenio (id, id_empresa, convenio, f_inicioc, f_finc) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 36178)
-- Dependencies: 235
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente (id_doc, ci_docente, nombre_dct, apellido_pat, apellido_mat, sexo_dct, direccion_dct, ciudad_dct, provincia_dct, telefono_dct, e_mail_dct) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 36123)
-- Dependencies: 221
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id_empresa, nombre_empresa, provincia_empresa, ciudad_empresa, direccion_empresa, telefono_empresa, e_mail_empresa, intestado) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 36145)
-- Dependencies: 227
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id, descripcion) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 36130)
-- Dependencies: 223
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (id_estudiante, ci_estudiante, idcarrera, idsemestre, nombre_est, apellido_pat, apellido_mat, sexo_est, direccion_est, ciudad_est, provincia_est, telefono_est, e_mail_est, estado) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 36152)
-- Dependencies: 229
-- Data for Name: evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluacion (id, fechaevaluacion, ci_estudiante, ci_docente, notadocente, datostutorempresa, notaresponsableem, sumanotas, filename, filesize, subirportafolio) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 36103)
-- Dependencies: 215
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facultad (id_facultad, nombre_facultad, estado) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 36116)
-- Dependencies: 219
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periodo (id_periodo, descripcionperiodo) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 36162)
-- Dependencies: 231
-- Data for Name: practica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.practica (id_practica, codigo_practica, ci_estudiante, posee_informe, id_empresa, titulo_proyecto, area, fecha_inscripcion, fecha_inicio_practica, fecha_fin_practica, total_horas_practica, id_convenio, id_periodo, observaciones, id_estado, id_docente) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 36171)
-- Dependencies: 233
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semestre (id, descripcionsemestre) FROM stdin;
\.


--
-- TOC entry 4965 (class 0 OID 36257)
-- Dependencies: 239
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, username, password, rol) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 236
-- Name: administrador_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrador_id_admin_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 216
-- Name: carrera_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_carrera_seq', 1, false);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 224
-- Name: convenio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.convenio_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 234
-- Name: docente_id_doc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.docente_id_doc_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 220
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_id_empresa_seq', 1, false);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 226
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_seq', 1, false);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 222
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_id_estudiante_seq', 1, false);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 228
-- Name: evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluacion_id_seq', 1, false);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 218
-- Name: periodo_id_periodo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.periodo_id_periodo_seq', 1, false);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 230
-- Name: practica_id_practica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.practica_id_practica_seq', 1, false);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 232
-- Name: semestre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semestre_id_seq', 1, false);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 238
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 4782 (class 2606 OID 36190)
-- Name: administrador administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4762 (class 2606 OID 36114)
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id_carrera);


--
-- TOC entry 4770 (class 2606 OID 36142)
-- Name: convenio convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 36183)
-- Name: docente docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (id_doc);


--
-- TOC entry 4766 (class 2606 OID 36128)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 4772 (class 2606 OID 36150)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 36135)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id_estudiante);


--
-- TOC entry 4774 (class 2606 OID 36159)
-- Name: evaluacion evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 36107)
-- Name: facultad facultad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id_facultad);


--
-- TOC entry 4764 (class 2606 OID 36121)
-- Name: periodo periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (id_periodo);


--
-- TOC entry 4776 (class 2606 OID 36169)
-- Name: practica practica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_pkey PRIMARY KEY (id_practica);


--
-- TOC entry 4778 (class 2606 OID 36176)
-- Name: semestre semestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre
    ADD CONSTRAINT semestre_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 36264)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 36211)
-- Name: convenio fk_convenio_empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fk_convenio_empresa FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 4786 (class 2606 OID 36196)
-- Name: estudiante fk_estudiante_carrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_estudiante_carrera FOREIGN KEY (idcarrera) REFERENCES public.carrera(id_carrera);


--
-- TOC entry 4787 (class 2606 OID 36206)
-- Name: estudiante fk_estudiante_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_estudiante_estado FOREIGN KEY (estado) REFERENCES public.estado(id);


--
-- TOC entry 4788 (class 2606 OID 36201)
-- Name: estudiante fk_estudiante_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_estudiante_semestre FOREIGN KEY (idsemestre) REFERENCES public.semestre(id);


--
-- TOC entry 4790 (class 2606 OID 36221)
-- Name: evaluacion fk_evaluacion_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT fk_evaluacion_docente FOREIGN KEY (ci_docente) REFERENCES public.docente(id_doc);


--
-- TOC entry 4791 (class 2606 OID 36216)
-- Name: evaluacion fk_evaluacion_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT fk_evaluacion_estudiante FOREIGN KEY (ci_estudiante) REFERENCES public.estudiante(id_estudiante);


--
-- TOC entry 4785 (class 2606 OID 36191)
-- Name: carrera fk_facultad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT fk_facultad FOREIGN KEY (id_facultad) REFERENCES public.facultad(id_facultad);


--
-- TOC entry 4792 (class 2606 OID 36236)
-- Name: practica fk_practica_convenio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_convenio FOREIGN KEY (id_convenio) REFERENCES public.convenio(id);


--
-- TOC entry 4793 (class 2606 OID 36251)
-- Name: practica fk_practica_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_docente FOREIGN KEY (id_docente) REFERENCES public.docente(id_doc);


--
-- TOC entry 4794 (class 2606 OID 36231)
-- Name: practica fk_practica_empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_empresa FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- TOC entry 4795 (class 2606 OID 36246)
-- Name: practica fk_practica_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id);


--
-- TOC entry 4796 (class 2606 OID 36226)
-- Name: practica fk_practica_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_estudiante FOREIGN KEY (ci_estudiante) REFERENCES public.estudiante(id_estudiante);


--
-- TOC entry 4797 (class 2606 OID 36241)
-- Name: practica fk_practica_periodo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT fk_practica_periodo FOREIGN KEY (id_periodo) REFERENCES public.periodo(id_periodo);


-- Completed on 2025-06-03 14:51:01

--
-- PostgreSQL database dump complete
--

