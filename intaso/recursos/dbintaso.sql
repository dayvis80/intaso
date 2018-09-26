--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: tahorro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tahorro (
    idahorro integer NOT NULL,
    idsocio smallint,
    cuenta character varying(8),
    descripcion character varying(30),
    plazo smallint,
    tem numeric,
    moneda character varying(3),
    fapertura date,
    fvencimiento date,
    saldo numeric,
    estado character varying(10),
    intmensual numeric,
    usuario smallint,
    sucursal smallint
);


ALTER TABLE public.tahorro OWNER TO postgres;

--
-- Name: tahorro_idahorro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tahorro_idahorro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tahorro_idahorro_seq OWNER TO postgres;

--
-- Name: tahorro_idahorro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tahorro_idahorro_seq OWNED BY public.tahorro.idahorro;


--
-- Name: tcaja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tcaja (
    idcaja integer NOT NULL,
    trabajador smallint,
    fapertura date,
    hapertura time without time zone,
    fcierre date,
    hcierre time without time zone,
    minicial numeric,
    mfinal numeric,
    movimientos smallint,
    abierto character varying(8),
    usuario smallint,
    sucursal smallint
);


ALTER TABLE public.tcaja OWNER TO postgres;

--
-- Name: tcaja_idcaja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tcaja_idcaja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tcaja_idcaja_seq OWNER TO postgres;

--
-- Name: tcaja_idcaja_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tcaja_idcaja_seq OWNED BY public.tcaja.idcaja;


--
-- Name: tcuotas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tcuotas (
    idcuota integer NOT NULL,
    nprestamo character varying(8),
    ncuota integer,
    fvencimiento date,
    capital numeric,
    interes numeric,
    amortizacion numeric,
    comision numeric,
    aporte numeric,
    montocuota numeric,
    dmora smallint,
    vmora numeric,
    estado character varying(10),
    sucursal smallint
);


ALTER TABLE public.tcuotas OWNER TO postgres;

--
-- Name: tcuotas_idcuota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tcuotas_idcuota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tcuotas_idcuota_seq OWNER TO postgres;

--
-- Name: tcuotas_idcuota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tcuotas_idcuota_seq OWNED BY public.tcuotas.idcuota;


--
-- Name: tferiado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tferiado (
    idferiado integer NOT NULL,
    dia character varying(30),
    fecha date
);


ALTER TABLE public.tferiado OWNER TO postgres;

--
-- Name: tferiado_idferiado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tferiado_idferiado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tferiado_idferiado_seq OWNER TO postgres;

--
-- Name: tferiado_idferiado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tferiado_idferiado_seq OWNED BY public.tferiado.idferiado;


--
-- Name: tmovimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmovimiento (
    idmovimiento integer NOT NULL,
    idcaja smallint,
    tipomov character varying(2),
    socio smallint,
    cuenta character varying(8),
    descripcion character varying(25),
    numeromov integer,
    moneda character varying(3),
    monto numeric,
    fechamov date,
    horamov time without time zone,
    pago character varying(8),
    conciliado character varying(3),
    dmora smallint,
    vmora numeric,
    usuario smallint,
    sucursal smallint,
    saldo numeric,
    ncuota smallint,
    fechaprog date,
    fcierre date
);


ALTER TABLE public.tmovimiento OWNER TO postgres;

--
-- Name: tmovimiento_idmovimiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tmovimiento_idmovimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmovimiento_idmovimiento_seq OWNER TO postgres;

--
-- Name: tmovimiento_idmovimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tmovimiento_idmovimiento_seq OWNED BY public.tmovimiento.idmovimiento;


--
-- Name: tprestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tprestamo (
    idprestamo integer NOT NULL,
    idsocio smallint,
    nprestamo character varying(8),
    descripcion character varying(30),
    tcuotas smallint,
    mcuota numeric,
    monto numeric,
    plazo smallint,
    comision numeric,
    aporte numeric,
    tea numeric,
    tem numeric,
    mora numeric,
    tipopago character varying(20),
    fprestamo date,
    ftermino date,
    fecpago character varying(15),
    condicion character varying(15),
    garantia character varying(20),
    analista smallint,
    recaudador smallint,
    estado character varying(20),
    aprobado character varying(2),
    usuario smallint,
    sucursal smallint
);


ALTER TABLE public.tprestamo OWNER TO postgres;

--
-- Name: tprestamo_idprestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tprestamo_idprestamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tprestamo_idprestamo_seq OWNER TO postgres;

--
-- Name: tprestamo_idprestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tprestamo_idprestamo_seq OWNED BY public.tprestamo.idprestamo;


--
-- Name: trecaudar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trecaudar (
    idrecaudar integer NOT NULL,
    idcaja smallint,
    idpromotor smallint,
    frecaudacion date,
    hrecaudacion time without time zone,
    total numeric,
    usuario smallint,
    sucursal smallint
);


ALTER TABLE public.trecaudar OWNER TO postgres;

--
-- Name: trecaudar_idrecaudar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trecaudar_idrecaudar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trecaudar_idrecaudar_seq OWNER TO postgres;

--
-- Name: trecaudar_idrecaudar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trecaudar_idrecaudar_seq OWNED BY public.trecaudar.idrecaudar;


--
-- Name: tsocio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tsocio (
    idsocio integer NOT NULL,
    tipodoc character varying(10) NOT NULL,
    numerodoc character varying(10) NOT NULL,
    apaterno character varying(20) NOT NULL,
    amaterno character varying(20) NOT NULL,
    nombres character varying(30) NOT NULL,
    numhijos smallint,
    ecivil character varying(10),
    sexo character varying(10),
    fnacimiento date,
    tcelular character varying(10),
    temergencia character varying(10),
    email character varying(30),
    ocupacion character varying(35),
    departamento character varying(15),
    provincia character varying(15),
    distrito character varying(15),
    direccion character varying(60) NOT NULL,
    referencia character varying(60),
    tvivienda character varying(10),
    mconstruccion character varying(20),
    utrabajo character varying(60),
    rtrabajo character varying(60),
    cdni character varying(10),
    capaterno character varying(20),
    camaterno character varying(20),
    cnombres character varying(30),
    analista smallint,
    mafiliacion numeric,
    afiliado character varying(2),
    sucursal smallint,
    usuario smallint,
    fregistro timestamp without time zone
);


ALTER TABLE public.tsocio OWNER TO postgres;

--
-- Name: tsocio_idsocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tsocio_idsocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tsocio_idsocio_seq OWNER TO postgres;

--
-- Name: tsocio_idsocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tsocio_idsocio_seq OWNED BY public.tsocio.idsocio;


--
-- Name: tsucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tsucursal (
    idsucursal integer NOT NULL,
    descripcion character varying(30),
    direccion character varying(30),
    departamento character varying(20),
    provincia character varying(20),
    distrito character varying(20)
);


ALTER TABLE public.tsucursal OWNER TO postgres;

--
-- Name: tsucursal_idsucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tsucursal_idsucursal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tsucursal_idsucursal_seq OWNER TO postgres;

--
-- Name: tsucursal_idsucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tsucursal_idsucursal_seq OWNED BY public.tsucursal.idsucursal;


--
-- Name: ttipoahorro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttipoahorro (
    idtipoahorro integer NOT NULL,
    descripcion character varying(30),
    plazo smallint,
    tem numeric,
    moneda character varying(3),
    montomin integer,
    montomax integer,
    sucursal smallint
);


ALTER TABLE public.ttipoahorro OWNER TO postgres;

--
-- Name: ttipoahorro_idtipoahorro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ttipoahorro_idtipoahorro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ttipoahorro_idtipoahorro_seq OWNER TO postgres;

--
-- Name: ttipoahorro_idtipoahorro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ttipoahorro_idtipoahorro_seq OWNED BY public.ttipoahorro.idtipoahorro;


--
-- Name: ttipomov; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttipomov (
    idtipomov integer NOT NULL,
    descripcion character varying(15),
    detalle character varying(2),
    sucursal smallint
);


ALTER TABLE public.ttipomov OWNER TO postgres;

--
-- Name: ttipomov_idtipomov_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ttipomov_idtipomov_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ttipomov_idtipomov_seq OWNER TO postgres;

--
-- Name: ttipomov_idtipomov_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ttipomov_idtipomov_seq OWNED BY public.ttipomov.idtipomov;


--
-- Name: ttipoprestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttipoprestamo (
    idtipoprestamo integer NOT NULL,
    descripcion character varying(30),
    plazo smallint,
    tem numeric,
    moneda character varying(3),
    comision numeric,
    mora numeric,
    montomin integer,
    montomax integer,
    sucursal smallint
);


ALTER TABLE public.ttipoprestamo OWNER TO postgres;

--
-- Name: ttipoprestamo_idtipoprestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ttipoprestamo_idtipoprestamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ttipoprestamo_idtipoprestamo_seq OWNER TO postgres;

--
-- Name: ttipoprestamo_idtipoprestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ttipoprestamo_idtipoprestamo_seq OWNED BY public.ttipoprestamo.idtipoprestamo;


--
-- Name: ttipotrabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttipotrabajador (
    idtipotrabajador integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE public.ttipotrabajador OWNER TO postgres;

--
-- Name: ttipotrabajador_idtipotrabajador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ttipotrabajador_idtipotrabajador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ttipotrabajador_idtipotrabajador_seq OWNER TO postgres;

--
-- Name: ttipotrabajador_idtipotrabajador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ttipotrabajador_idtipotrabajador_seq OWNED BY public.ttipotrabajador.idtipotrabajador;


--
-- Name: ttrabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ttrabajador (
    idtrabajador integer NOT NULL,
    dni character varying(10),
    apaterno character varying(20),
    amaterno character varying(20),
    nombres character varying(30),
    celular character varying(12),
    tipotrabajador integer,
    sucursal smallint,
    fregistro timestamp without time zone
);


ALTER TABLE public.ttrabajador OWNER TO postgres;

--
-- Name: ttrabajador_idtrabajador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ttrabajador_idtrabajador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ttrabajador_idtrabajador_seq OWNER TO postgres;

--
-- Name: ttrabajador_idtrabajador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ttrabajador_idtrabajador_seq OWNED BY public.ttrabajador.idtrabajador;


--
-- Name: tusuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tusuario (
    idusuario integer NOT NULL,
    usuario character varying(16),
    contrasena character varying(60),
    clave character varying(30),
    idtrabajador integer
);


ALTER TABLE public.tusuario OWNER TO postgres;

--
-- Name: tusuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tusuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tusuario_idusuario_seq OWNER TO postgres;

--
-- Name: tusuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tusuario_idusuario_seq OWNED BY public.tusuario.idusuario;


--
-- Name: idahorro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tahorro ALTER COLUMN idahorro SET DEFAULT nextval('public.tahorro_idahorro_seq'::regclass);


--
-- Name: idcaja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcaja ALTER COLUMN idcaja SET DEFAULT nextval('public.tcaja_idcaja_seq'::regclass);


--
-- Name: idcuota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcuotas ALTER COLUMN idcuota SET DEFAULT nextval('public.tcuotas_idcuota_seq'::regclass);


--
-- Name: idferiado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tferiado ALTER COLUMN idferiado SET DEFAULT nextval('public.tferiado_idferiado_seq'::regclass);


--
-- Name: idmovimiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmovimiento ALTER COLUMN idmovimiento SET DEFAULT nextval('public.tmovimiento_idmovimiento_seq'::regclass);


--
-- Name: idprestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tprestamo ALTER COLUMN idprestamo SET DEFAULT nextval('public.tprestamo_idprestamo_seq'::regclass);


--
-- Name: idrecaudar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trecaudar ALTER COLUMN idrecaudar SET DEFAULT nextval('public.trecaudar_idrecaudar_seq'::regclass);


--
-- Name: idsocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tsocio ALTER COLUMN idsocio SET DEFAULT nextval('public.tsocio_idsocio_seq'::regclass);


--
-- Name: idsucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tsucursal ALTER COLUMN idsucursal SET DEFAULT nextval('public.tsucursal_idsucursal_seq'::regclass);


--
-- Name: idtipoahorro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipoahorro ALTER COLUMN idtipoahorro SET DEFAULT nextval('public.ttipoahorro_idtipoahorro_seq'::regclass);


--
-- Name: idtipomov; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipomov ALTER COLUMN idtipomov SET DEFAULT nextval('public.ttipomov_idtipomov_seq'::regclass);


--
-- Name: idtipoprestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipoprestamo ALTER COLUMN idtipoprestamo SET DEFAULT nextval('public.ttipoprestamo_idtipoprestamo_seq'::regclass);


--
-- Name: idtipotrabajador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipotrabajador ALTER COLUMN idtipotrabajador SET DEFAULT nextval('public.ttipotrabajador_idtipotrabajador_seq'::regclass);


--
-- Name: idtrabajador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttrabajador ALTER COLUMN idtrabajador SET DEFAULT nextval('public.ttrabajador_idtrabajador_seq'::regclass);


--
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tusuario ALTER COLUMN idusuario SET DEFAULT nextval('public.tusuario_idusuario_seq'::regclass);


--
-- Data for Name: tahorro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tahorro (idahorro, idsocio, cuenta, descripcion, plazo, tem, moneda, fapertura, fvencimiento, saldo, estado, intmensual, usuario, sucursal) FROM stdin;
34	1	30000001	PLAZO FIJO 12	12	9	SOL	2018-07-30	2019-07-30	1000	VIGENTE	\N	2	1
\.


--
-- Name: tahorro_idahorro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tahorro_idahorro_seq', 34, true);


--
-- Data for Name: tcaja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tcaja (idcaja, trabajador, fapertura, hapertura, fcierre, hcierre, minicial, mfinal, movimientos, abierto, usuario, sucursal) FROM stdin;
8	1	2018-07-22	18:52:14	2018-07-25	02:17:00	10000	10000	0	NO	2	1
34	1	2018-07-25	02:18:19	\N	\N	5000	5000	0	SI	2	1
35	8	2018-07-25	10:14:19	\N	\N	33000	33000	0	SI	2	1
7	2	2018-07-19	12:13:20	\N	\N	50000	25832.06	0	SI	2	1
36	4	2018-08-01	17:41:02	\N	\N	10000	6117.50	0	SI	2	1
\.


--
-- Name: tcaja_idcaja_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tcaja_idcaja_seq', 36, true);


--
-- Data for Name: tcuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tcuotas (idcuota, nprestamo, ncuota, fvencimiento, capital, interes, amortizacion, comision, aporte, montocuota, dmora, vmora, estado, sucursal) FROM stdin;
2	2000002	2	2018-07-23	295.03	1.21	4.99	0.37	0.40	6.98	\N	\N	PENDIENTE	1
3	2000002	3	2018-07-24	290.03	1.19	5.01	0.37	0.40	6.98	\N	\N	PENDIENTE	1
4	2000002	4	2018-07-25	285.02	1.17	5.04	0.37	0.40	6.98	\N	\N	PENDIENTE	1
5	2000002	5	2018-07-26	279.98	1.15	5.06	0.37	0.40	6.98	\N	\N	PENDIENTE	1
6	2000002	6	2018-07-27	274.93	1.13	5.08	0.37	0.40	6.98	\N	\N	PENDIENTE	1
7	2000002	7	2018-07-30	269.85	1.11	5.10	0.37	0.40	6.98	\N	\N	PENDIENTE	1
8	2000002	8	2018-07-31	264.75	1.09	5.12	0.37	0.40	6.98	\N	\N	PENDIENTE	1
9	2000002	9	2018-08-01	259.63	1.07	5.14	0.37	0.40	6.98	\N	\N	PENDIENTE	1
10	2000002	10	2018-08-02	254.50	1.05	5.16	0.37	0.40	6.98	\N	\N	PENDIENTE	1
11	2000002	11	2018-08-03	249.33	1.02	5.18	0.37	0.40	6.98	\N	\N	PENDIENTE	1
12	2000002	12	2018-08-06	244.15	1.00	5.20	0.37	0.40	6.98	\N	\N	PENDIENTE	1
13	2000002	13	2018-08-07	238.95	0.98	5.22	0.37	0.40	6.98	\N	\N	PENDIENTE	1
14	2000002	14	2018-08-08	233.73	0.96	5.25	0.37	0.40	6.98	\N	\N	PENDIENTE	1
15	2000002	15	2018-08-09	228.48	0.94	5.27	0.37	0.40	6.98	\N	\N	PENDIENTE	1
16	2000002	16	2018-08-10	223.21	0.92	5.29	0.37	0.40	6.98	\N	\N	PENDIENTE	1
17	2000002	17	2018-08-13	217.92	0.90	5.31	0.37	0.40	6.98	\N	\N	PENDIENTE	1
18	2000002	18	2018-08-14	212.61	0.87	5.33	0.37	0.40	6.98	\N	\N	PENDIENTE	1
19	2000002	19	2018-08-15	207.28	0.85	5.35	0.37	0.40	6.98	\N	\N	PENDIENTE	1
20	2000002	20	2018-08-16	201.93	0.83	5.38	0.37	0.40	6.98	\N	\N	PENDIENTE	1
21	2000002	21	2018-08-17	196.55	0.81	5.40	0.37	0.40	6.98	\N	\N	PENDIENTE	1
22	2000002	22	2018-08-20	191.15	0.79	5.42	0.37	0.40	6.98	\N	\N	PENDIENTE	1
23	2000002	23	2018-08-21	185.73	0.76	5.44	0.37	0.40	6.98	\N	\N	PENDIENTE	1
24	2000002	24	2018-08-22	180.29	0.74	5.47	0.37	0.40	6.98	\N	\N	PENDIENTE	1
25	2000002	25	2018-08-23	174.82	0.72	5.49	0.37	0.40	6.98	\N	\N	PENDIENTE	1
26	2000002	26	2018-08-24	169.33	0.70	5.51	0.37	0.40	6.98	\N	\N	PENDIENTE	1
27	2000002	27	2018-08-27	163.82	0.67	5.53	0.37	0.40	6.98	\N	\N	PENDIENTE	1
28	2000002	28	2018-08-28	158.29	0.65	5.56	0.37	0.40	6.98	\N	\N	PENDIENTE	1
29	2000002	29	2018-08-29	152.74	0.63	5.58	0.37	0.40	6.98	\N	\N	PENDIENTE	1
30	2000002	30	2018-08-31	147.16	0.60	5.60	0.37	0.40	6.98	\N	\N	PENDIENTE	1
31	2000002	31	2018-09-03	141.56	0.58	5.62	0.37	0.40	6.98	\N	\N	PENDIENTE	1
32	2000002	32	2018-09-04	135.93	0.56	5.65	0.37	0.40	6.98	\N	\N	PENDIENTE	1
33	2000002	33	2018-09-05	130.28	0.54	5.67	0.37	0.40	6.98	\N	\N	PENDIENTE	1
34	2000002	34	2018-09-06	124.61	0.51	5.69	0.37	0.40	6.98	\N	\N	PENDIENTE	1
35	2000002	35	2018-09-07	118.92	0.49	5.72	0.37	0.40	6.98	\N	\N	PENDIENTE	1
36	2000002	36	2018-09-10	113.20	0.46	5.74	0.37	0.40	6.98	\N	\N	PENDIENTE	1
37	2000002	37	2018-09-11	107.46	0.44	5.76	0.37	0.40	6.98	\N	\N	PENDIENTE	1
38	2000002	38	2018-09-12	101.70	0.42	5.79	0.37	0.40	6.98	\N	\N	PENDIENTE	1
39	2000002	39	2018-09-13	95.91	0.39	5.81	0.37	0.40	6.98	\N	\N	PENDIENTE	1
40	2000002	40	2018-09-14	90.10	0.37	5.84	0.37	0.40	6.98	\N	\N	PENDIENTE	1
41	2000002	41	2018-09-17	84.26	0.35	5.86	0.37	0.40	6.98	\N	\N	PENDIENTE	1
42	2000002	42	2018-09-18	78.40	0.32	5.88	0.37	0.40	6.98	\N	\N	PENDIENTE	1
43	2000002	43	2018-09-19	72.52	0.30	5.91	0.37	0.40	6.98	\N	\N	PENDIENTE	1
44	2000002	44	2018-09-20	66.61	0.27	5.93	0.37	0.40	6.98	\N	\N	PENDIENTE	1
45	2000002	45	2018-09-21	60.68	0.25	5.96	0.37	0.40	6.98	\N	\N	PENDIENTE	1
46	2000002	46	2018-09-24	54.72	0.22	5.98	0.37	0.40	6.98	\N	\N	PENDIENTE	1
47	2000002	47	2018-09-25	48.74	0.20	6.01	0.37	0.40	6.98	\N	\N	PENDIENTE	1
48	2000002	48	2018-09-26	42.74	0.18	6.03	0.37	0.40	6.98	\N	\N	PENDIENTE	1
49	2000002	49	2018-09-27	36.70	0.15	6.05	0.37	0.40	6.98	\N	\N	PENDIENTE	1
50	2000002	50	2018-09-28	30.65	0.13	6.08	0.37	0.40	6.98	\N	\N	PENDIENTE	1
51	2000002	51	2018-10-01	24.57	0.10	6.10	0.37	0.40	6.98	\N	\N	PENDIENTE	1
52	2000002	52	2018-10-02	18.47	0.08	6.13	0.37	0.40	6.98	\N	\N	PENDIENTE	1
53	2000002	53	2018-10-03	12.34	0.05	6.16	0.37	0.40	6.98	\N	\N	PENDIENTE	1
54	2000002	54	2018-10-04	6.18	0.03	6.18	0.37	0.40	6.98	\N	\N	PENDIENTE	1
55	2000003	1	2018-08-19	800.00	28.00	257.55	10.00	10	305.55	\N	\N	PENDIENTE	1
56	2000003	2	2018-09-19	542.45	18.99	266.56	10.00	10	305.55	\N	\N	PENDIENTE	1
57	2000003	3	2018-10-19	275.89	9.66	275.89	10.00	10	305.55	\N	\N	PENDIENTE	1
58	2000004	1	2018-07-20	500.00	1.34	5.54	0.37	0.40	7.65	\N	\N	PENDIENTE	1
59	2000004	2	2018-07-23	494.46	1.32	5.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
60	2000004	3	2018-07-24	488.91	1.31	5.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
61	2000004	4	2018-07-25	483.35	1.29	5.58	0.37	0.40	7.65	\N	\N	PENDIENTE	1
62	2000004	5	2018-07-26	477.77	1.28	5.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
63	2000004	6	2018-07-27	472.17	1.26	5.61	0.37	0.40	7.65	\N	\N	PENDIENTE	1
64	2000004	7	2018-07-30	466.56	1.25	5.63	0.37	0.40	7.65	\N	\N	PENDIENTE	1
65	2000004	8	2018-07-31	460.94	1.23	5.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
66	2000004	9	2018-08-01	455.30	1.22	5.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
67	2000004	10	2018-08-02	449.64	1.20	5.67	0.37	0.40	7.65	\N	\N	PENDIENTE	1
68	2000004	11	2018-08-03	443.97	1.19	5.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
69	2000004	12	2018-08-06	438.29	1.17	5.70	0.37	0.40	7.65	\N	\N	PENDIENTE	1
70	2000004	13	2018-08-07	432.59	1.16	5.72	0.37	0.40	7.65	\N	\N	PENDIENTE	1
71	2000004	14	2018-08-08	426.87	1.14	5.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
72	2000004	15	2018-08-09	421.14	1.13	5.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
73	2000004	16	2018-08-10	415.39	1.11	5.76	0.37	0.40	7.65	\N	\N	PENDIENTE	1
74	2000004	17	2018-08-13	409.63	1.10	5.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
75	2000004	18	2018-08-14	403.85	1.08	5.79	0.37	0.40	7.65	\N	\N	PENDIENTE	1
1638	20000058	14	2018-08-11	853.74	2.29	11.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
76	2000004	19	2018-08-15	398.06	1.07	5.81	0.37	0.40	7.65	\N	\N	PENDIENTE	1
77	2000004	20	2018-08-16	392.25	1.05	5.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
78	2000004	21	2018-08-17	386.42	1.04	5.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
79	2000004	22	2018-08-20	380.58	1.02	5.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
80	2000004	23	2018-08-21	374.73	1.00	5.87	0.37	0.40	7.65	\N	\N	PENDIENTE	1
81	2000004	24	2018-08-22	368.86	0.99	5.89	0.37	0.40	7.65	\N	\N	PENDIENTE	1
82	2000004	25	2018-08-23	362.97	0.97	5.90	0.37	0.40	7.65	\N	\N	PENDIENTE	1
83	2000004	26	2018-08-24	357.07	0.96	5.92	0.37	0.40	7.65	\N	\N	PENDIENTE	1
84	2000004	27	2018-08-27	351.15	0.94	5.93	0.37	0.40	7.65	\N	\N	PENDIENTE	1
85	2000004	28	2018-08-28	345.22	0.92	5.95	0.37	0.40	7.65	\N	\N	PENDIENTE	1
86	2000004	29	2018-08-29	339.27	0.91	5.97	0.37	0.40	7.65	\N	\N	PENDIENTE	1
87	2000004	30	2018-08-31	333.30	0.89	5.98	0.37	0.40	7.65	\N	\N	PENDIENTE	1
88	2000004	31	2018-09-03	327.32	0.88	6.00	0.37	0.40	7.65	\N	\N	PENDIENTE	1
89	2000004	32	2018-09-04	321.32	0.86	6.01	0.37	0.40	7.65	\N	\N	PENDIENTE	1
90	2000004	33	2018-09-05	315.30	0.84	6.03	0.37	0.40	7.65	\N	\N	PENDIENTE	1
91	2000004	34	2018-09-06	309.27	0.83	6.05	0.37	0.40	7.65	\N	\N	PENDIENTE	1
92	2000004	35	2018-09-07	303.23	0.81	6.06	0.37	0.40	7.65	\N	\N	PENDIENTE	1
93	2000004	36	2018-09-10	297.17	0.80	6.08	0.37	0.40	7.65	\N	\N	PENDIENTE	1
94	2000004	37	2018-09-11	291.09	0.78	6.10	0.37	0.40	7.65	\N	\N	PENDIENTE	1
95	2000004	38	2018-09-12	284.99	0.76	6.11	0.37	0.40	7.65	\N	\N	PENDIENTE	1
96	2000004	39	2018-09-13	278.88	0.75	6.13	0.37	0.40	7.65	\N	\N	PENDIENTE	1
97	2000004	40	2018-09-14	272.75	0.73	6.14	0.37	0.40	7.65	\N	\N	PENDIENTE	1
98	2000004	41	2018-09-17	266.61	0.71	6.16	0.37	0.40	7.65	\N	\N	PENDIENTE	1
99	2000004	42	2018-09-18	260.45	0.70	6.18	0.37	0.40	7.65	\N	\N	PENDIENTE	1
100	2000004	43	2018-09-19	254.27	0.68	6.19	0.37	0.40	7.65	\N	\N	PENDIENTE	1
101	2000004	44	2018-09-20	248.08	0.66	6.21	0.37	0.40	7.65	\N	\N	PENDIENTE	1
102	2000004	45	2018-09-21	241.86	0.65	6.23	0.37	0.40	7.65	\N	\N	PENDIENTE	1
103	2000004	46	2018-09-24	235.64	0.63	6.24	0.37	0.40	7.65	\N	\N	PENDIENTE	1
104	2000004	47	2018-09-25	229.39	0.61	6.26	0.37	0.40	7.65	\N	\N	PENDIENTE	1
105	2000004	48	2018-09-26	223.13	0.60	6.28	0.37	0.40	7.65	\N	\N	PENDIENTE	1
106	2000004	49	2018-09-27	216.86	0.58	6.29	0.37	0.40	7.65	\N	\N	PENDIENTE	1
107	2000004	50	2018-09-28	210.56	0.56	6.31	0.37	0.40	7.65	\N	\N	PENDIENTE	1
108	2000004	51	2018-10-01	204.25	0.55	6.33	0.37	0.40	7.65	\N	\N	PENDIENTE	1
109	2000004	52	2018-10-02	197.92	0.53	6.34	0.37	0.40	7.65	\N	\N	PENDIENTE	1
110	2000004	53	2018-10-03	191.58	0.51	6.36	0.37	0.40	7.65	\N	\N	PENDIENTE	1
111	2000004	54	2018-10-04	185.22	0.50	6.38	0.37	0.40	7.65	\N	\N	PENDIENTE	1
112	2000004	55	2018-10-05	178.84	0.48	6.40	0.37	0.40	7.65	\N	\N	PENDIENTE	1
113	2000004	56	2018-10-09	172.44	0.46	6.41	0.37	0.40	7.65	\N	\N	PENDIENTE	1
114	2000004	57	2018-10-10	166.03	0.44	6.43	0.37	0.40	7.65	\N	\N	PENDIENTE	1
115	2000004	58	2018-10-11	159.60	0.43	6.45	0.37	0.40	7.65	\N	\N	PENDIENTE	1
116	2000004	59	2018-10-12	153.15	0.41	6.46	0.37	0.40	7.65	\N	\N	PENDIENTE	1
117	2000004	60	2018-10-15	146.69	0.39	6.48	0.37	0.40	7.65	\N	\N	PENDIENTE	1
118	2000004	61	2018-10-16	140.21	0.38	6.50	0.37	0.40	7.65	\N	\N	PENDIENTE	1
119	2000004	62	2018-10-17	133.71	0.36	6.52	0.37	0.40	7.65	\N	\N	PENDIENTE	1
120	2000004	63	2018-10-18	127.19	0.34	6.53	0.37	0.40	7.65	\N	\N	PENDIENTE	1
121	2000004	64	2018-10-19	120.65	0.32	6.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
122	2000004	65	2018-10-22	114.10	0.31	6.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
123	2000004	66	2018-10-23	107.53	0.29	6.59	0.37	0.40	7.65	\N	\N	PENDIENTE	1
124	2000004	67	2018-10-24	100.95	0.27	6.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
125	2000004	68	2018-10-25	94.34	0.25	6.62	0.37	0.40	7.65	\N	\N	PENDIENTE	1
126	2000004	69	2018-10-26	87.72	0.23	6.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
127	2000004	70	2018-10-29	81.08	0.22	6.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
128	2000004	71	2018-10-30	74.42	0.20	6.68	0.37	0.40	7.65	\N	\N	PENDIENTE	1
129	2000004	72	2018-10-31	67.75	0.18	6.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
130	2000004	73	2018-11-02	61.05	0.16	6.71	0.37	0.40	7.65	\N	\N	PENDIENTE	1
131	2000004	74	2018-11-05	54.34	0.15	6.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
132	2000004	75	2018-11-06	47.61	0.13	6.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
133	2000004	76	2018-11-07	40.87	0.11	6.77	0.37	0.40	7.65	\N	\N	PENDIENTE	1
134	2000004	77	2018-11-08	34.10	0.09	6.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
135	2000004	78	2018-11-09	27.32	0.07	6.80	0.37	0.40	7.65	\N	\N	PENDIENTE	1
136	2000004	79	2018-11-12	20.51	0.05	6.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
137	2000004	80	2018-11-13	13.69	0.04	6.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
138	2000004	81	2018-11-14	6.86	0.02	6.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
139	2000005	1	2018-07-26	1000.00	16.25	34.40	2.50	2.50	55.65	\N	\N	PENDIENTE	1
140	2000005	2	2018-08-02	965.60	15.69	34.96	2.50	2.50	55.65	\N	\N	PENDIENTE	1
141	2000005	3	2018-08-09	930.64	15.12	35.53	2.50	2.50	55.65	\N	\N	PENDIENTE	1
142	2000005	4	2018-08-16	895.11	14.55	36.11	2.50	2.50	55.65	\N	\N	PENDIENTE	1
143	2000005	5	2018-08-23	859.00	13.96	36.69	2.50	2.50	55.65	\N	\N	PENDIENTE	1
144	2000005	6	2018-08-31	822.31	13.36	37.29	2.50	2.50	55.65	\N	\N	PENDIENTE	1
145	2000005	7	2018-09-07	785.02	12.76	37.90	2.50	2.50	55.65	\N	\N	PENDIENTE	1
146	2000005	8	2018-09-14	747.12	12.14	38.51	2.50	2.50	55.65	\N	\N	PENDIENTE	1
147	2000005	9	2018-09-21	708.61	11.51	39.14	2.50	2.50	55.65	\N	\N	PENDIENTE	1
148	2000005	10	2018-09-28	669.48	10.88	39.77	2.50	2.50	55.65	\N	\N	PENDIENTE	1
149	2000005	11	2018-10-05	629.70	10.23	40.42	2.50	2.50	55.65	\N	\N	PENDIENTE	1
1	2000002	1	2018-07-20	300.00	1.23	4.97	0.37	0.40	6.98	2	0.09	PAGADO	1
150	2000005	12	2018-10-12	589.28	9.58	41.08	2.50	2.50	55.65	\N	\N	PENDIENTE	1
151	2000005	13	2018-10-19	548.21	8.91	41.74	2.50	2.50	55.65	\N	\N	PENDIENTE	1
152	2000005	14	2018-10-26	506.46	8.23	42.42	2.50	2.50	55.65	\N	\N	PENDIENTE	1
153	2000005	15	2018-11-02	464.04	7.54	43.11	2.50	2.50	55.65	\N	\N	PENDIENTE	1
154	2000005	16	2018-11-09	420.93	6.84	43.81	2.50	2.50	55.65	\N	\N	PENDIENTE	1
155	2000005	17	2018-11-16	377.12	6.13	44.52	2.50	2.50	55.65	\N	\N	PENDIENTE	1
156	2000005	18	2018-11-23	332.60	5.40	45.25	2.50	2.50	55.65	\N	\N	PENDIENTE	1
157	2000005	19	2018-11-30	287.35	4.67	45.98	2.50	2.50	55.65	\N	\N	PENDIENTE	1
158	2000005	20	2018-12-07	241.37	3.92	46.73	2.50	2.50	55.65	\N	\N	PENDIENTE	1
159	2000005	21	2018-12-14	194.64	3.16	47.49	2.50	2.50	55.65	\N	\N	PENDIENTE	1
160	2000005	22	2018-12-21	147.15	2.39	48.26	2.50	2.50	55.65	\N	\N	PENDIENTE	1
161	2000005	23	2018-12-28	98.89	1.61	49.04	2.50	2.50	55.65	\N	\N	PENDIENTE	1
162	2000005	24	2019-01-04	49.84	0.81	49.84	2.50	2.50	55.65	\N	\N	PENDIENTE	1
163	2000006	1	2018-07-21	300.00	1.61	10.36	0.30	0.40	12.66	\N	\N	PENDIENTE	1
164	2000006	2	2018-07-23	289.64	1.55	10.41	0.30	0.40	12.66	\N	\N	PENDIENTE	1
165	2000006	3	2018-07-24	279.23	1.50	10.47	0.30	0.40	12.66	\N	\N	PENDIENTE	1
166	2000006	4	2018-07-25	268.76	1.44	10.52	0.30	0.40	12.66	\N	\N	PENDIENTE	1
167	2000006	5	2018-07-26	258.24	1.38	10.58	0.30	0.40	12.66	\N	\N	PENDIENTE	1
168	2000006	6	2018-07-27	247.66	1.33	10.64	0.30	0.40	12.66	\N	\N	PENDIENTE	1
169	2000006	7	2018-07-30	237.02	1.27	10.69	0.30	0.40	12.66	\N	\N	PENDIENTE	1
170	2000006	8	2018-07-31	226.33	1.21	10.75	0.30	0.40	12.66	\N	\N	PENDIENTE	1
171	2000006	9	2018-08-01	215.58	1.15	10.81	0.30	0.40	12.66	\N	\N	PENDIENTE	1
172	2000006	10	2018-08-02	204.77	1.10	10.87	0.30	0.40	12.66	\N	\N	PENDIENTE	1
173	2000006	11	2018-08-03	193.90	1.04	10.92	0.30	0.40	12.66	\N	\N	PENDIENTE	1
174	2000006	12	2018-08-04	182.98	0.98	10.98	0.30	0.40	12.66	\N	\N	PENDIENTE	1
175	2000006	13	2018-08-06	171.99	0.92	11.04	0.30	0.40	12.66	\N	\N	PENDIENTE	1
176	2000006	14	2018-08-07	160.95	0.86	11.10	0.30	0.40	12.66	\N	\N	PENDIENTE	1
177	2000006	15	2018-08-08	149.85	0.80	11.16	0.30	0.40	12.66	\N	\N	PENDIENTE	1
178	2000006	16	2018-08-09	138.69	0.74	11.22	0.30	0.40	12.66	\N	\N	PENDIENTE	1
179	2000006	17	2018-08-10	127.47	0.68	11.28	0.30	0.40	12.66	\N	\N	PENDIENTE	1
180	2000006	18	2018-08-11	116.19	0.62	11.34	0.30	0.40	12.66	\N	\N	PENDIENTE	1
181	2000006	19	2018-08-13	104.85	0.56	11.40	0.30	0.40	12.66	\N	\N	PENDIENTE	1
182	2000006	20	2018-08-14	93.44	0.50	11.46	0.30	0.40	12.66	\N	\N	PENDIENTE	1
183	2000006	21	2018-08-15	81.98	0.44	11.52	0.30	0.40	12.66	\N	\N	PENDIENTE	1
184	2000006	22	2018-08-16	70.46	0.38	11.59	0.30	0.40	12.66	\N	\N	PENDIENTE	1
185	2000006	23	2018-08-17	58.87	0.32	11.65	0.30	0.40	12.66	\N	\N	PENDIENTE	1
186	2000006	24	2018-08-18	47.22	0.25	11.71	0.30	0.40	12.66	\N	\N	PENDIENTE	1
187	2000006	25	2018-08-20	35.51	0.19	11.77	0.30	0.40	12.66	\N	\N	PENDIENTE	1
188	2000006	26	2018-08-21	23.74	0.13	11.84	0.30	0.40	12.66	\N	\N	PENDIENTE	1
189	2000006	27	2018-08-22	11.90	0.06	11.90	0.30	0.40	12.66	\N	\N	PENDIENTE	1
190	2000007	1	2018-07-21	1000.00	2.50	8.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
191	2000007	2	2018-07-23	991.92	2.48	8.10	0.37	0.40	11.35	\N	\N	PENDIENTE	1
192	2000007	3	2018-07-24	983.83	2.46	8.12	0.37	0.40	11.35	\N	\N	PENDIENTE	1
193	2000007	4	2018-07-25	975.71	2.44	8.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
194	2000007	5	2018-07-26	967.57	2.42	8.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
195	2000007	6	2018-07-27	959.41	2.40	8.18	0.37	0.40	11.35	\N	\N	PENDIENTE	1
196	2000007	7	2018-07-30	951.23	2.38	8.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
197	2000007	8	2018-07-31	943.04	2.36	8.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
198	2000007	9	2018-08-01	934.82	2.34	8.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
199	2000007	10	2018-08-02	926.58	2.32	8.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
200	2000007	11	2018-08-03	918.32	2.30	8.28	0.37	0.40	11.35	\N	\N	PENDIENTE	1
201	2000007	12	2018-08-04	910.03	2.28	8.30	0.37	0.40	11.35	\N	\N	PENDIENTE	1
202	2000007	13	2018-08-06	901.73	2.25	8.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
203	2000007	14	2018-08-07	893.41	2.23	8.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
204	2000007	15	2018-08-08	885.07	2.21	8.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
205	2000007	16	2018-08-09	876.70	2.19	8.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
206	2000007	17	2018-08-10	868.32	2.17	8.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
207	2000007	18	2018-08-11	859.91	2.15	8.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
208	2000007	19	2018-08-13	851.48	2.13	8.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
209	2000007	20	2018-08-14	843.04	2.11	8.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
210	2000007	21	2018-08-15	834.57	2.09	8.49	0.37	0.40	11.35	\N	\N	PENDIENTE	1
211	2000007	22	2018-08-16	826.08	2.07	8.51	0.37	0.40	11.35	\N	\N	PENDIENTE	1
212	2000007	23	2018-08-17	817.56	2.04	8.53	0.37	0.40	11.35	\N	\N	PENDIENTE	1
213	2000007	24	2018-08-18	809.03	2.02	8.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
214	2000007	25	2018-08-20	800.48	2.00	8.58	0.37	0.40	11.35	\N	\N	PENDIENTE	1
215	2000007	26	2018-08-21	791.90	1.98	8.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
216	2000007	27	2018-08-22	783.30	1.96	8.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
217	2000007	28	2018-08-23	774.69	1.94	8.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
218	2000007	29	2018-08-24	766.04	1.92	8.66	0.37	0.40	11.35	\N	\N	PENDIENTE	1
219	2000007	30	2018-08-25	757.38	1.89	8.68	0.37	0.40	11.35	\N	\N	PENDIENTE	1
220	2000007	31	2018-08-27	748.70	1.87	8.71	0.37	0.40	11.35	\N	\N	PENDIENTE	1
221	2000007	32	2018-08-28	739.99	1.85	8.73	0.37	0.40	11.35	\N	\N	PENDIENTE	1
222	2000007	33	2018-08-29	731.27	1.83	8.75	0.37	0.40	11.35	\N	\N	PENDIENTE	1
223	2000007	34	2018-08-31	722.52	1.81	8.77	0.37	0.40	11.35	\N	\N	PENDIENTE	1
224	2000007	35	2018-09-01	713.75	1.78	8.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
225	2000007	36	2018-09-03	704.96	1.76	8.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
226	2000007	37	2018-09-04	696.14	1.74	8.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
227	2000007	38	2018-09-05	687.30	1.72	8.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
228	2000007	39	2018-09-06	678.45	1.70	8.88	0.37	0.40	11.35	\N	\N	PENDIENTE	1
229	2000007	40	2018-09-07	669.56	1.67	8.90	0.37	0.40	11.35	\N	\N	PENDIENTE	1
230	2000007	41	2018-09-08	660.66	1.65	8.93	0.37	0.40	11.35	\N	\N	PENDIENTE	1
231	2000007	42	2018-09-10	651.74	1.63	8.95	0.37	0.40	11.35	\N	\N	PENDIENTE	1
232	2000007	43	2018-09-11	642.79	1.61	8.97	0.37	0.40	11.35	\N	\N	PENDIENTE	1
233	2000007	44	2018-09-12	633.82	1.58	8.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
234	2000007	45	2018-09-13	624.83	1.56	9.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
235	2000007	46	2018-09-14	615.81	1.54	9.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
236	2000007	47	2018-09-15	606.77	1.52	9.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
237	2000007	48	2018-09-17	597.71	1.49	9.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
238	2000007	49	2018-09-18	588.63	1.47	9.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
239	2000007	50	2018-09-19	579.53	1.45	9.13	0.37	0.40	11.35	\N	\N	PENDIENTE	1
240	2000007	51	2018-09-20	570.40	1.43	9.15	0.37	0.40	11.35	\N	\N	PENDIENTE	1
241	2000007	52	2018-09-21	561.25	1.40	9.17	0.37	0.40	11.35	\N	\N	PENDIENTE	1
242	2000007	53	2018-09-22	552.07	1.38	9.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
243	2000007	54	2018-09-24	542.88	1.36	9.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
244	2000007	55	2018-09-25	533.66	1.33	9.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
245	2000007	56	2018-09-26	524.41	1.31	9.27	0.37	0.40	11.35	\N	\N	PENDIENTE	1
246	2000007	57	2018-09-27	515.15	1.29	9.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
247	2000007	58	2018-09-28	505.86	1.26	9.31	0.37	0.40	11.35	\N	\N	PENDIENTE	1
248	2000007	59	2018-09-29	496.55	1.24	9.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
249	2000007	60	2018-10-01	487.21	1.22	9.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
250	2000007	61	2018-10-02	477.85	1.19	9.38	0.37	0.40	11.35	\N	\N	PENDIENTE	1
251	2000007	62	2018-10-03	468.47	1.17	9.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
252	2000007	63	2018-10-04	459.06	1.15	9.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
253	2000007	64	2018-10-05	449.64	1.12	9.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
254	2000007	65	2018-10-06	440.18	1.10	9.48	0.37	0.40	11.35	\N	\N	PENDIENTE	1
255	2000007	66	2018-10-09	430.71	1.08	9.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
256	2000007	67	2018-10-10	421.21	1.05	9.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
257	2000007	68	2018-10-11	411.68	1.03	9.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
258	2000007	69	2018-10-12	402.13	1.01	9.57	0.37	0.40	11.35	\N	\N	PENDIENTE	1
259	2000007	70	2018-10-13	392.56	0.98	9.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
260	2000007	71	2018-10-15	382.97	0.96	9.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
261	2000007	72	2018-10-16	373.35	0.93	9.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
262	2000007	73	2018-10-17	363.70	0.91	9.67	0.37	0.40	11.35	\N	\N	PENDIENTE	1
263	2000007	74	2018-10-18	354.04	0.89	9.69	0.37	0.40	11.35	\N	\N	PENDIENTE	1
264	2000007	75	2018-10-19	344.34	0.86	9.72	0.37	0.40	11.35	\N	\N	PENDIENTE	1
265	2000007	76	2018-10-20	334.63	0.84	9.74	0.37	0.40	11.35	\N	\N	PENDIENTE	1
266	2000007	77	2018-10-22	324.89	0.81	9.76	0.37	0.40	11.35	\N	\N	PENDIENTE	1
267	2000007	78	2018-10-23	315.12	0.79	9.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
268	2000007	79	2018-10-24	305.33	0.76	9.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
269	2000007	80	2018-10-25	295.52	0.74	9.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
270	2000007	81	2018-10-26	285.68	0.71	9.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
271	2000007	82	2018-10-27	275.82	0.69	9.89	0.37	0.40	11.35	\N	\N	PENDIENTE	1
272	2000007	83	2018-10-29	265.93	0.66	9.91	0.37	0.40	11.35	\N	\N	PENDIENTE	1
273	2000007	84	2018-10-30	256.02	0.64	9.94	0.37	0.40	11.35	\N	\N	PENDIENTE	1
274	2000007	85	2018-10-31	246.08	0.62	9.96	0.37	0.40	11.35	\N	\N	PENDIENTE	1
275	2000007	86	2018-11-02	236.12	0.59	9.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
276	2000007	87	2018-11-03	226.13	0.57	10.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
277	2000007	88	2018-11-05	216.12	0.54	10.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
278	2000007	89	2018-11-06	206.09	0.52	10.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
279	2000007	90	2018-11-07	196.02	0.49	10.09	0.37	0.40	11.35	\N	\N	PENDIENTE	1
280	2000007	91	2018-11-08	185.94	0.46	10.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
281	2000007	92	2018-11-09	175.83	0.44	10.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
282	2000007	93	2018-11-10	165.69	0.41	10.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
283	2000007	94	2018-11-12	155.53	0.39	10.19	0.37	0.40	11.35	\N	\N	PENDIENTE	1
284	2000007	95	2018-11-13	145.34	0.36	10.21	0.37	0.40	11.35	\N	\N	PENDIENTE	1
285	2000007	96	2018-11-14	135.12	0.34	10.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
286	2000007	97	2018-11-15	124.88	0.31	10.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
287	2000007	98	2018-11-16	114.62	0.29	10.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
288	2000007	99	2018-11-17	104.33	0.26	10.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
289	2000007	100	2018-11-19	94.01	0.24	10.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
290	2000007	101	2018-11-20	83.67	0.21	10.37	0.37	0.40	11.35	\N	\N	PENDIENTE	1
291	2000007	102	2018-11-21	73.30	0.18	10.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
292	2000007	103	2018-11-22	62.91	0.16	10.42	0.37	0.40	11.35	\N	\N	PENDIENTE	1
293	2000007	104	2018-11-23	52.49	0.13	10.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
294	2000007	105	2018-11-24	42.04	0.11	10.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
295	2000007	106	2018-11-26	31.57	0.08	10.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
296	2000007	107	2018-11-27	21.07	0.05	10.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
297	2000007	108	2018-11-28	10.55	0.03	10.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
298	2000008	1	2018-07-23	500.00	1.34	5.54	0.37	0.40	7.65	\N	\N	PENDIENTE	1
299	2000008	2	2018-07-24	494.46	1.32	5.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
300	2000008	3	2018-07-25	488.91	1.31	5.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
301	2000008	4	2018-07-26	483.35	1.29	5.58	0.37	0.40	7.65	\N	\N	PENDIENTE	1
302	2000008	5	2018-07-27	477.77	1.28	5.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
303	2000008	6	2018-07-30	472.17	1.26	5.61	0.37	0.40	7.65	\N	\N	PENDIENTE	1
304	2000008	7	2018-07-31	466.56	1.25	5.63	0.37	0.40	7.65	\N	\N	PENDIENTE	1
305	2000008	8	2018-08-01	460.94	1.23	5.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
306	2000008	9	2018-08-02	455.30	1.22	5.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
307	2000008	10	2018-08-03	449.64	1.20	5.67	0.37	0.40	7.65	\N	\N	PENDIENTE	1
308	2000008	11	2018-08-06	443.97	1.19	5.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
309	2000008	12	2018-08-07	438.29	1.17	5.70	0.37	0.40	7.65	\N	\N	PENDIENTE	1
310	2000008	13	2018-08-08	432.59	1.16	5.72	0.37	0.40	7.65	\N	\N	PENDIENTE	1
311	2000008	14	2018-08-09	426.87	1.14	5.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
312	2000008	15	2018-08-10	421.14	1.13	5.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
313	2000008	16	2018-08-13	415.39	1.11	5.76	0.37	0.40	7.65	\N	\N	PENDIENTE	1
314	2000008	17	2018-08-14	409.63	1.10	5.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
315	2000008	18	2018-08-15	403.85	1.08	5.79	0.37	0.40	7.65	\N	\N	PENDIENTE	1
316	2000008	19	2018-08-16	398.06	1.07	5.81	0.37	0.40	7.65	\N	\N	PENDIENTE	1
317	2000008	20	2018-08-17	392.25	1.05	5.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
318	2000008	21	2018-08-20	386.42	1.04	5.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
319	2000008	22	2018-08-21	380.58	1.02	5.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
320	2000008	23	2018-08-22	374.73	1.00	5.87	0.37	0.40	7.65	\N	\N	PENDIENTE	1
321	2000008	24	2018-08-23	368.86	0.99	5.89	0.37	0.40	7.65	\N	\N	PENDIENTE	1
322	2000008	25	2018-08-24	362.97	0.97	5.90	0.37	0.40	7.65	\N	\N	PENDIENTE	1
323	2000008	26	2018-08-27	357.07	0.96	5.92	0.37	0.40	7.65	\N	\N	PENDIENTE	1
324	2000008	27	2018-08-28	351.15	0.94	5.93	0.37	0.40	7.65	\N	\N	PENDIENTE	1
325	2000008	28	2018-08-29	345.22	0.92	5.95	0.37	0.40	7.65	\N	\N	PENDIENTE	1
326	2000008	29	2018-08-31	339.27	0.91	5.97	0.37	0.40	7.65	\N	\N	PENDIENTE	1
327	2000008	30	2018-09-03	333.30	0.89	5.98	0.37	0.40	7.65	\N	\N	PENDIENTE	1
328	2000008	31	2018-09-04	327.32	0.88	6.00	0.37	0.40	7.65	\N	\N	PENDIENTE	1
329	2000008	32	2018-09-05	321.32	0.86	6.01	0.37	0.40	7.65	\N	\N	PENDIENTE	1
330	2000008	33	2018-09-06	315.30	0.84	6.03	0.37	0.40	7.65	\N	\N	PENDIENTE	1
331	2000008	34	2018-09-07	309.27	0.83	6.05	0.37	0.40	7.65	\N	\N	PENDIENTE	1
332	2000008	35	2018-09-10	303.23	0.81	6.06	0.37	0.40	7.65	\N	\N	PENDIENTE	1
333	2000008	36	2018-09-11	297.17	0.80	6.08	0.37	0.40	7.65	\N	\N	PENDIENTE	1
334	2000008	37	2018-09-12	291.09	0.78	6.10	0.37	0.40	7.65	\N	\N	PENDIENTE	1
335	2000008	38	2018-09-13	284.99	0.76	6.11	0.37	0.40	7.65	\N	\N	PENDIENTE	1
336	2000008	39	2018-09-14	278.88	0.75	6.13	0.37	0.40	7.65	\N	\N	PENDIENTE	1
337	2000008	40	2018-09-17	272.75	0.73	6.14	0.37	0.40	7.65	\N	\N	PENDIENTE	1
338	2000008	41	2018-09-18	266.61	0.71	6.16	0.37	0.40	7.65	\N	\N	PENDIENTE	1
339	2000008	42	2018-09-19	260.45	0.70	6.18	0.37	0.40	7.65	\N	\N	PENDIENTE	1
340	2000008	43	2018-09-20	254.27	0.68	6.19	0.37	0.40	7.65	\N	\N	PENDIENTE	1
341	2000008	44	2018-09-21	248.08	0.66	6.21	0.37	0.40	7.65	\N	\N	PENDIENTE	1
342	2000008	45	2018-09-24	241.86	0.65	6.23	0.37	0.40	7.65	\N	\N	PENDIENTE	1
343	2000008	46	2018-09-25	235.64	0.63	6.24	0.37	0.40	7.65	\N	\N	PENDIENTE	1
344	2000008	47	2018-09-26	229.39	0.61	6.26	0.37	0.40	7.65	\N	\N	PENDIENTE	1
345	2000008	48	2018-09-27	223.13	0.60	6.28	0.37	0.40	7.65	\N	\N	PENDIENTE	1
346	2000008	49	2018-09-28	216.86	0.58	6.29	0.37	0.40	7.65	\N	\N	PENDIENTE	1
347	2000008	50	2018-10-01	210.56	0.56	6.31	0.37	0.40	7.65	\N	\N	PENDIENTE	1
348	2000008	51	2018-10-02	204.25	0.55	6.33	0.37	0.40	7.65	\N	\N	PENDIENTE	1
349	2000008	52	2018-10-03	197.92	0.53	6.34	0.37	0.40	7.65	\N	\N	PENDIENTE	1
350	2000008	53	2018-10-04	191.58	0.51	6.36	0.37	0.40	7.65	\N	\N	PENDIENTE	1
351	2000008	54	2018-10-05	185.22	0.50	6.38	0.37	0.40	7.65	\N	\N	PENDIENTE	1
352	2000008	55	2018-10-09	178.84	0.48	6.40	0.37	0.40	7.65	\N	\N	PENDIENTE	1
353	2000008	56	2018-10-10	172.44	0.46	6.41	0.37	0.40	7.65	\N	\N	PENDIENTE	1
354	2000008	57	2018-10-11	166.03	0.44	6.43	0.37	0.40	7.65	\N	\N	PENDIENTE	1
355	2000008	58	2018-10-12	159.60	0.43	6.45	0.37	0.40	7.65	\N	\N	PENDIENTE	1
356	2000008	59	2018-10-15	153.15	0.41	6.46	0.37	0.40	7.65	\N	\N	PENDIENTE	1
357	2000008	60	2018-10-16	146.69	0.39	6.48	0.37	0.40	7.65	\N	\N	PENDIENTE	1
358	2000008	61	2018-10-17	140.21	0.38	6.50	0.37	0.40	7.65	\N	\N	PENDIENTE	1
359	2000008	62	2018-10-18	133.71	0.36	6.52	0.37	0.40	7.65	\N	\N	PENDIENTE	1
360	2000008	63	2018-10-19	127.19	0.34	6.53	0.37	0.40	7.65	\N	\N	PENDIENTE	1
361	2000008	64	2018-10-22	120.65	0.32	6.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
362	2000008	65	2018-10-23	114.10	0.31	6.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
363	2000008	66	2018-10-24	107.53	0.29	6.59	0.37	0.40	7.65	\N	\N	PENDIENTE	1
364	2000008	67	2018-10-25	100.95	0.27	6.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
365	2000008	68	2018-10-26	94.34	0.25	6.62	0.37	0.40	7.65	\N	\N	PENDIENTE	1
366	2000008	69	2018-10-29	87.72	0.23	6.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
367	2000008	70	2018-10-30	81.08	0.22	6.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
368	2000008	71	2018-10-31	74.42	0.20	6.68	0.37	0.40	7.65	\N	\N	PENDIENTE	1
369	2000008	72	2018-11-02	67.75	0.18	6.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
370	2000008	73	2018-11-05	61.05	0.16	6.71	0.37	0.40	7.65	\N	\N	PENDIENTE	1
371	2000008	74	2018-11-06	54.34	0.15	6.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
372	2000008	75	2018-11-07	47.61	0.13	6.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
373	2000008	76	2018-11-08	40.87	0.11	6.77	0.37	0.40	7.65	\N	\N	PENDIENTE	1
374	2000008	77	2018-11-09	34.10	0.09	6.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
375	2000008	78	2018-11-12	27.32	0.07	6.80	0.37	0.40	7.65	\N	\N	PENDIENTE	1
376	2000008	79	2018-11-13	20.51	0.05	6.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
377	2000008	80	2018-11-14	13.69	0.04	6.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
378	2000008	81	2018-11-15	6.86	0.02	6.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
379	2000009	1	2018-07-21	1000.00	2.14	5.17	0.37	0.40	8.08	\N	\N	PENDIENTE	1
380	2000009	2	2018-07-23	994.83	2.13	5.18	0.37	0.40	8.08	\N	\N	PENDIENTE	1
381	2000009	3	2018-07-24	989.65	2.12	5.19	0.37	0.40	8.08	\N	\N	PENDIENTE	1
382	2000009	4	2018-07-25	984.46	2.11	5.20	0.37	0.40	8.08	\N	\N	PENDIENTE	1
383	2000009	5	2018-07-26	979.25	2.10	5.21	0.37	0.40	8.08	\N	\N	PENDIENTE	1
384	2000009	6	2018-07-27	974.04	2.09	5.23	0.37	0.40	8.08	\N	\N	PENDIENTE	1
385	2000009	7	2018-07-30	968.81	2.08	5.24	0.37	0.40	8.08	\N	\N	PENDIENTE	1
386	2000009	8	2018-07-31	963.58	2.06	5.25	0.37	0.40	8.08	\N	\N	PENDIENTE	1
387	2000009	9	2018-08-01	958.33	2.05	5.26	0.37	0.40	8.08	\N	\N	PENDIENTE	1
388	2000009	10	2018-08-02	953.07	2.04	5.27	0.37	0.40	8.08	\N	\N	PENDIENTE	1
389	2000009	11	2018-08-03	947.80	2.03	5.28	0.37	0.40	8.08	\N	\N	PENDIENTE	1
390	2000009	12	2018-08-04	942.52	2.02	5.29	0.37	0.40	8.08	\N	\N	PENDIENTE	1
391	2000009	13	2018-08-06	937.23	2.01	5.30	0.37	0.40	8.08	\N	\N	PENDIENTE	1
392	2000009	14	2018-08-07	931.92	2.00	5.32	0.37	0.40	8.08	\N	\N	PENDIENTE	1
393	2000009	15	2018-08-08	926.61	1.99	5.33	0.37	0.40	8.08	\N	\N	PENDIENTE	1
394	2000009	16	2018-08-09	921.28	1.97	5.34	0.37	0.40	8.08	\N	\N	PENDIENTE	1
395	2000009	17	2018-08-10	915.94	1.96	5.35	0.37	0.40	8.08	\N	\N	PENDIENTE	1
396	2000009	18	2018-08-11	910.59	1.95	5.36	0.37	0.40	8.08	\N	\N	PENDIENTE	1
397	2000009	19	2018-08-13	905.23	1.94	5.37	0.37	0.40	8.08	\N	\N	PENDIENTE	1
398	2000009	20	2018-08-14	899.86	1.93	5.38	0.37	0.40	8.08	\N	\N	PENDIENTE	1
399	2000009	21	2018-08-15	894.47	1.92	5.40	0.37	0.40	8.08	\N	\N	PENDIENTE	1
400	2000009	22	2018-08-16	889.08	1.91	5.41	0.37	0.40	8.08	\N	\N	PENDIENTE	1
401	2000009	23	2018-08-17	883.67	1.89	5.42	0.37	0.40	8.08	\N	\N	PENDIENTE	1
402	2000009	24	2018-08-18	878.25	1.88	5.43	0.37	0.40	8.08	\N	\N	PENDIENTE	1
403	2000009	25	2018-08-20	872.82	1.87	5.44	0.37	0.40	8.08	\N	\N	PENDIENTE	1
404	2000009	26	2018-08-21	867.38	1.86	5.45	0.37	0.40	8.08	\N	\N	PENDIENTE	1
405	2000009	27	2018-08-22	861.92	1.85	5.47	0.37	0.40	8.08	\N	\N	PENDIENTE	1
406	2000009	28	2018-08-23	856.46	1.84	5.48	0.37	0.40	8.08	\N	\N	PENDIENTE	1
407	2000009	29	2018-08-24	850.98	1.82	5.49	0.37	0.40	8.08	\N	\N	PENDIENTE	1
408	2000009	30	2018-08-25	845.49	1.81	5.50	0.37	0.40	8.08	\N	\N	PENDIENTE	1
409	2000009	31	2018-08-27	839.99	1.80	5.51	0.37	0.40	8.08	\N	\N	PENDIENTE	1
410	2000009	32	2018-08-28	834.48	1.79	5.52	0.37	0.40	8.08	\N	\N	PENDIENTE	1
411	2000009	33	2018-08-29	828.95	1.78	5.54	0.37	0.40	8.08	\N	\N	PENDIENTE	1
412	2000009	34	2018-08-31	823.41	1.76	5.55	0.37	0.40	8.08	\N	\N	PENDIENTE	1
413	2000009	35	2018-09-01	817.87	1.75	5.56	0.37	0.40	8.08	\N	\N	PENDIENTE	1
414	2000009	36	2018-09-03	812.31	1.74	5.57	0.37	0.40	8.08	\N	\N	PENDIENTE	1
415	2000009	37	2018-09-04	806.73	1.73	5.58	0.37	0.40	8.08	\N	\N	PENDIENTE	1
416	2000009	38	2018-09-05	801.15	1.72	5.60	0.37	0.40	8.08	\N	\N	PENDIENTE	1
417	2000009	39	2018-09-06	795.55	1.70	5.61	0.37	0.40	8.08	\N	\N	PENDIENTE	1
418	2000009	40	2018-09-07	789.95	1.69	5.62	0.37	0.40	8.08	\N	\N	PENDIENTE	1
419	2000009	41	2018-09-08	784.33	1.68	5.63	0.37	0.40	8.08	\N	\N	PENDIENTE	1
420	2000009	42	2018-09-10	778.69	1.67	5.64	0.37	0.40	8.08	\N	\N	PENDIENTE	1
421	2000009	43	2018-09-11	773.05	1.66	5.66	0.37	0.40	8.08	\N	\N	PENDIENTE	1
422	2000009	44	2018-09-12	767.39	1.64	5.67	0.37	0.40	8.08	\N	\N	PENDIENTE	1
423	2000009	45	2018-09-13	761.73	1.63	5.68	0.37	0.40	8.08	\N	\N	PENDIENTE	1
424	2000009	46	2018-09-14	756.05	1.62	5.69	0.37	0.40	8.08	\N	\N	PENDIENTE	1
425	2000009	47	2018-09-15	750.35	1.61	5.70	0.37	0.40	8.08	\N	\N	PENDIENTE	1
426	2000009	48	2018-09-17	744.65	1.60	5.72	0.37	0.40	8.08	\N	\N	PENDIENTE	1
427	2000009	49	2018-09-18	738.93	1.58	5.73	0.37	0.40	8.08	\N	\N	PENDIENTE	1
428	2000009	50	2018-09-19	733.20	1.57	5.74	0.37	0.40	8.08	\N	\N	PENDIENTE	1
429	2000009	51	2018-09-20	727.46	1.56	5.75	0.37	0.40	8.08	\N	\N	PENDIENTE	1
430	2000009	52	2018-09-21	721.71	1.55	5.77	0.37	0.40	8.08	\N	\N	PENDIENTE	1
431	2000009	53	2018-09-22	715.94	1.53	5.78	0.37	0.40	8.08	\N	\N	PENDIENTE	1
432	2000009	54	2018-09-24	710.16	1.52	5.79	0.37	0.40	8.08	\N	\N	PENDIENTE	1
433	2000009	55	2018-09-25	704.37	1.51	5.80	0.37	0.40	8.08	\N	\N	PENDIENTE	1
434	2000009	56	2018-09-26	698.57	1.50	5.82	0.37	0.40	8.08	\N	\N	PENDIENTE	1
435	2000009	57	2018-09-27	692.75	1.48	5.83	0.37	0.40	8.08	\N	\N	PENDIENTE	1
436	2000009	58	2018-09-28	686.92	1.47	5.84	0.37	0.40	8.08	\N	\N	PENDIENTE	1
437	2000009	59	2018-09-29	681.08	1.46	5.85	0.37	0.40	8.08	\N	\N	PENDIENTE	1
438	2000009	60	2018-10-01	675.23	1.45	5.87	0.37	0.40	8.08	\N	\N	PENDIENTE	1
439	2000009	61	2018-10-02	669.36	1.43	5.88	0.37	0.40	8.08	\N	\N	PENDIENTE	1
440	2000009	62	2018-10-03	663.49	1.42	5.89	0.37	0.40	8.08	\N	\N	PENDIENTE	1
441	2000009	63	2018-10-04	657.60	1.41	5.90	0.37	0.40	8.08	\N	\N	PENDIENTE	1
442	2000009	64	2018-10-05	651.69	1.40	5.92	0.37	0.40	8.08	\N	\N	PENDIENTE	1
443	2000009	65	2018-10-06	645.78	1.38	5.93	0.37	0.40	8.08	\N	\N	PENDIENTE	1
444	2000009	66	2018-10-09	639.85	1.37	5.94	0.37	0.40	8.08	\N	\N	PENDIENTE	1
445	2000009	67	2018-10-10	633.91	1.36	5.95	0.37	0.40	8.08	\N	\N	PENDIENTE	1
446	2000009	68	2018-10-11	627.95	1.35	5.97	0.37	0.40	8.08	\N	\N	PENDIENTE	1
447	2000009	69	2018-10-12	621.98	1.33	5.98	0.37	0.40	8.08	\N	\N	PENDIENTE	1
448	2000009	70	2018-10-13	616.00	1.32	5.99	0.37	0.40	8.08	\N	\N	PENDIENTE	1
449	2000009	71	2018-10-15	610.01	1.31	6.01	0.37	0.40	8.08	\N	\N	PENDIENTE	1
450	2000009	72	2018-10-16	604.01	1.29	6.02	0.37	0.40	8.08	\N	\N	PENDIENTE	1
451	2000009	73	2018-10-17	597.99	1.28	6.03	0.37	0.40	8.08	\N	\N	PENDIENTE	1
452	2000009	74	2018-10-18	591.96	1.27	6.04	0.37	0.40	8.08	\N	\N	PENDIENTE	1
453	2000009	75	2018-10-19	585.91	1.26	6.06	0.37	0.40	8.08	\N	\N	PENDIENTE	1
454	2000009	76	2018-10-20	579.85	1.24	6.07	0.37	0.40	8.08	\N	\N	PENDIENTE	1
455	2000009	77	2018-10-22	573.78	1.23	6.08	0.37	0.40	8.08	\N	\N	PENDIENTE	1
456	2000009	78	2018-10-23	567.70	1.22	6.10	0.37	0.40	8.08	\N	\N	PENDIENTE	1
457	2000009	79	2018-10-24	561.61	1.20	6.11	0.37	0.40	8.08	\N	\N	PENDIENTE	1
458	2000009	80	2018-10-25	555.50	1.19	6.12	0.37	0.40	8.08	\N	\N	PENDIENTE	1
459	2000009	81	2018-10-26	549.37	1.18	6.14	0.37	0.40	8.08	\N	\N	PENDIENTE	1
460	2000009	82	2018-10-27	543.24	1.16	6.15	0.37	0.40	8.08	\N	\N	PENDIENTE	1
461	2000009	83	2018-10-29	537.09	1.15	6.16	0.37	0.40	8.08	\N	\N	PENDIENTE	1
462	2000009	84	2018-10-30	530.93	1.14	6.17	0.37	0.40	8.08	\N	\N	PENDIENTE	1
463	2000009	85	2018-10-31	524.75	1.12	6.19	0.37	0.40	8.08	\N	\N	PENDIENTE	1
464	2000009	86	2018-11-02	518.56	1.11	6.20	0.37	0.40	8.08	\N	\N	PENDIENTE	1
465	2000009	87	2018-11-03	512.36	1.10	6.21	0.37	0.40	8.08	\N	\N	PENDIENTE	1
466	2000009	88	2018-11-05	506.15	1.08	6.23	0.37	0.40	8.08	\N	\N	PENDIENTE	1
467	2000009	89	2018-11-06	499.92	1.07	6.24	0.37	0.40	8.08	\N	\N	PENDIENTE	1
468	2000009	90	2018-11-07	493.68	1.06	6.25	0.37	0.40	8.08	\N	\N	PENDIENTE	1
469	2000009	91	2018-11-08	487.42	1.04	6.27	0.37	0.40	8.08	\N	\N	PENDIENTE	1
470	2000009	92	2018-11-09	481.16	1.03	6.28	0.37	0.40	8.08	\N	\N	PENDIENTE	1
471	2000009	93	2018-11-10	474.87	1.02	6.30	0.37	0.40	8.08	\N	\N	PENDIENTE	1
472	2000009	94	2018-11-12	468.58	1.00	6.31	0.37	0.40	8.08	\N	\N	PENDIENTE	1
473	2000009	95	2018-11-13	462.27	0.99	6.32	0.37	0.40	8.08	\N	\N	PENDIENTE	1
474	2000009	96	2018-11-14	455.95	0.98	6.34	0.37	0.40	8.08	\N	\N	PENDIENTE	1
475	2000009	97	2018-11-15	449.61	0.96	6.35	0.37	0.40	8.08	\N	\N	PENDIENTE	1
476	2000009	98	2018-11-16	443.26	0.95	6.36	0.37	0.40	8.08	\N	\N	PENDIENTE	1
477	2000009	99	2018-11-17	436.90	0.94	6.38	0.37	0.40	8.08	\N	\N	PENDIENTE	1
478	2000009	100	2018-11-19	430.52	0.92	6.39	0.37	0.40	8.08	\N	\N	PENDIENTE	1
479	2000009	101	2018-11-20	424.13	0.91	6.40	0.37	0.40	8.08	\N	\N	PENDIENTE	1
480	2000009	102	2018-11-21	417.73	0.90	6.42	0.37	0.40	8.08	\N	\N	PENDIENTE	1
481	2000009	103	2018-11-22	411.31	0.88	6.43	0.37	0.40	8.08	\N	\N	PENDIENTE	1
482	2000009	104	2018-11-23	404.88	0.87	6.45	0.37	0.40	8.08	\N	\N	PENDIENTE	1
483	2000009	105	2018-11-24	398.44	0.85	6.46	0.37	0.40	8.08	\N	\N	PENDIENTE	1
484	2000009	106	2018-11-26	391.98	0.84	6.47	0.37	0.40	8.08	\N	\N	PENDIENTE	1
485	2000009	107	2018-11-27	385.50	0.83	6.49	0.37	0.40	8.08	\N	\N	PENDIENTE	1
486	2000009	108	2018-11-28	379.02	0.81	6.50	0.37	0.40	8.08	\N	\N	PENDIENTE	1
487	2000009	109	2018-11-29	372.52	0.80	6.51	0.37	0.40	8.08	\N	\N	PENDIENTE	1
488	2000009	110	2018-11-30	366.00	0.78	6.53	0.37	0.40	8.08	\N	\N	PENDIENTE	1
489	2000009	111	2018-12-01	359.47	0.77	6.54	0.37	0.40	8.08	\N	\N	PENDIENTE	1
490	2000009	112	2018-12-03	352.93	0.76	6.56	0.37	0.40	8.08	\N	\N	PENDIENTE	1
491	2000009	113	2018-12-04	346.38	0.74	6.57	0.37	0.40	8.08	\N	\N	PENDIENTE	1
492	2000009	114	2018-12-05	339.81	0.73	6.58	0.37	0.40	8.08	\N	\N	PENDIENTE	1
493	2000009	115	2018-12-06	333.22	0.71	6.60	0.37	0.40	8.08	\N	\N	PENDIENTE	1
494	2000009	116	2018-12-07	326.62	0.70	6.61	0.37	0.40	8.08	\N	\N	PENDIENTE	1
495	2000009	117	2018-12-09	320.01	0.69	6.63	0.37	0.40	8.08	\N	\N	PENDIENTE	1
496	2000009	118	2018-12-10	313.38	0.67	6.64	0.37	0.40	8.08	\N	\N	PENDIENTE	1
497	2000009	119	2018-12-11	306.74	0.66	6.66	0.37	0.40	8.08	\N	\N	PENDIENTE	1
498	2000009	120	2018-12-12	300.09	0.64	6.67	0.37	0.40	8.08	\N	\N	PENDIENTE	1
499	2000009	121	2018-12-13	293.42	0.63	6.68	0.37	0.40	8.08	\N	\N	PENDIENTE	1
500	2000009	122	2018-12-14	286.73	0.61	6.70	0.37	0.40	8.08	\N	\N	PENDIENTE	1
501	2000009	123	2018-12-15	280.03	0.60	6.71	0.37	0.40	8.08	\N	\N	PENDIENTE	1
502	2000009	124	2018-12-17	273.32	0.59	6.73	0.37	0.40	8.08	\N	\N	PENDIENTE	1
503	2000009	125	2018-12-18	266.59	0.57	6.74	0.37	0.40	8.08	\N	\N	PENDIENTE	1
504	2000009	126	2018-12-19	259.85	0.56	6.76	0.37	0.40	8.08	\N	\N	PENDIENTE	1
505	2000009	127	2018-12-20	253.10	0.54	6.77	0.37	0.40	8.08	\N	\N	PENDIENTE	1
506	2000009	128	2018-12-21	246.33	0.53	6.78	0.37	0.40	8.08	\N	\N	PENDIENTE	1
507	2000009	129	2018-12-22	239.54	0.51	6.80	0.37	0.40	8.08	\N	\N	PENDIENTE	1
508	2000009	130	2018-12-24	232.74	0.50	6.81	0.37	0.40	8.08	\N	\N	PENDIENTE	1
509	2000009	131	2018-12-26	225.93	0.48	6.83	0.37	0.40	8.08	\N	\N	PENDIENTE	1
510	2000009	132	2018-12-27	219.10	0.47	6.84	0.37	0.40	8.08	\N	\N	PENDIENTE	1
511	2000009	133	2018-12-28	212.26	0.45	6.86	0.37	0.40	8.08	\N	\N	PENDIENTE	1
512	2000009	134	2018-12-29	205.40	0.44	6.87	0.37	0.40	8.08	\N	\N	PENDIENTE	1
513	2000009	135	2018-12-31	198.53	0.43	6.89	0.37	0.40	8.08	\N	\N	PENDIENTE	1
514	2000009	136	2019-01-02	191.64	0.41	6.90	0.37	0.40	8.08	\N	\N	PENDIENTE	1
515	2000009	137	2019-01-03	184.74	0.40	6.92	0.37	0.40	8.08	\N	\N	PENDIENTE	1
516	2000009	138	2019-01-04	177.82	0.38	6.93	0.37	0.40	8.08	\N	\N	PENDIENTE	1
517	2000009	139	2019-01-05	170.89	0.37	6.95	0.37	0.40	8.08	\N	\N	PENDIENTE	1
518	2000009	140	2019-01-07	163.94	0.35	6.96	0.37	0.40	8.08	\N	\N	PENDIENTE	1
519	2000009	141	2019-01-08	156.98	0.34	6.98	0.37	0.40	8.08	\N	\N	PENDIENTE	1
520	2000009	142	2019-01-09	150.01	0.32	6.99	0.37	0.40	8.08	\N	\N	PENDIENTE	1
521	2000009	143	2019-01-10	143.01	0.31	7.01	0.37	0.40	8.08	\N	\N	PENDIENTE	1
522	2000009	144	2019-01-11	136.01	0.29	7.02	0.37	0.40	8.08	\N	\N	PENDIENTE	1
523	2000009	145	2019-01-12	128.99	0.28	7.04	0.37	0.40	8.08	\N	\N	PENDIENTE	1
524	2000009	146	2019-01-14	121.95	0.26	7.05	0.37	0.40	8.08	\N	\N	PENDIENTE	1
525	2000009	147	2019-01-15	114.90	0.25	7.07	0.37	0.40	8.08	\N	\N	PENDIENTE	1
526	2000009	148	2019-01-16	107.83	0.23	7.08	0.37	0.40	8.08	\N	\N	PENDIENTE	1
527	2000009	149	2019-01-17	100.75	0.22	7.10	0.37	0.40	8.08	\N	\N	PENDIENTE	1
528	2000009	150	2019-01-18	93.65	0.20	7.11	0.37	0.40	8.08	\N	\N	PENDIENTE	1
529	2000009	151	2019-01-19	86.54	0.19	7.13	0.37	0.40	8.08	\N	\N	PENDIENTE	1
530	2000009	152	2019-01-21	79.41	0.17	7.14	0.37	0.40	8.08	\N	\N	PENDIENTE	1
531	2000009	153	2019-01-22	72.27	0.15	7.16	0.37	0.40	8.08	\N	\N	PENDIENTE	1
532	2000009	154	2019-01-23	65.11	0.14	7.17	0.37	0.40	8.08	\N	\N	PENDIENTE	1
533	2000009	155	2019-01-24	57.94	0.12	7.19	0.37	0.40	8.08	\N	\N	PENDIENTE	1
534	2000009	156	2019-01-25	50.75	0.11	7.20	0.37	0.40	8.08	\N	\N	PENDIENTE	1
535	2000009	157	2019-01-26	43.55	0.09	7.22	0.37	0.40	8.08	\N	\N	PENDIENTE	1
536	2000009	158	2019-01-28	36.33	0.08	7.23	0.37	0.40	8.08	\N	\N	PENDIENTE	1
537	2000009	159	2019-01-29	29.09	0.06	7.25	0.37	0.40	8.08	\N	\N	PENDIENTE	1
538	2000009	160	2019-01-30	21.84	0.05	7.27	0.37	0.40	8.08	\N	\N	PENDIENTE	1
539	2000009	161	2019-01-31	14.58	0.03	7.28	0.37	0.40	8.08	\N	\N	PENDIENTE	1
540	2000009	162	2019-02-01	7.30	0.02	7.30	0.37	0.40	8.08	\N	\N	PENDIENTE	1
541	2000010	1	2018-07-21	2000.00	5.00	16.15	0.37	0.40	21.92	\N	\N	PENDIENTE	1
542	2000010	2	2018-07-23	1983.85	4.96	16.19	0.37	0.40	21.92	\N	\N	PENDIENTE	1
543	2000010	3	2018-07-24	1967.65	4.92	16.23	0.37	0.40	21.92	\N	\N	PENDIENTE	1
544	2000010	4	2018-07-25	1951.42	4.88	16.28	0.37	0.40	21.92	\N	\N	PENDIENTE	1
545	2000010	5	2018-07-26	1935.14	4.84	16.32	0.37	0.40	21.92	\N	\N	PENDIENTE	1
546	2000010	6	2018-07-27	1918.83	4.80	16.36	0.37	0.40	21.92	\N	\N	PENDIENTE	1
547	2000010	7	2018-07-30	1902.47	4.76	16.40	0.37	0.40	21.92	\N	\N	PENDIENTE	1
548	2000010	8	2018-07-31	1886.07	4.72	16.44	0.37	0.40	21.92	\N	\N	PENDIENTE	1
549	2000010	9	2018-08-01	1869.63	4.67	16.48	0.37	0.40	21.92	\N	\N	PENDIENTE	1
550	2000010	10	2018-08-02	1853.15	4.63	16.52	0.37	0.40	21.92	\N	\N	PENDIENTE	1
551	2000010	11	2018-08-03	1836.63	4.59	16.56	0.37	0.40	21.92	\N	\N	PENDIENTE	1
552	2000010	12	2018-08-04	1820.07	4.55	16.60	0.37	0.40	21.92	\N	\N	PENDIENTE	1
553	2000010	13	2018-08-06	1803.47	4.51	16.65	0.37	0.40	21.92	\N	\N	PENDIENTE	1
554	2000010	14	2018-08-07	1786.82	4.47	16.69	0.37	0.40	21.92	\N	\N	PENDIENTE	1
555	2000010	15	2018-08-08	1770.13	4.43	16.73	0.37	0.40	21.92	\N	\N	PENDIENTE	1
556	2000010	16	2018-08-09	1753.41	4.38	16.77	0.37	0.40	21.92	\N	\N	PENDIENTE	1
557	2000010	17	2018-08-10	1736.63	4.34	16.81	0.37	0.40	21.92	\N	\N	PENDIENTE	1
558	2000010	18	2018-08-11	1719.82	4.30	16.85	0.37	0.40	21.92	\N	\N	PENDIENTE	1
559	2000010	19	2018-08-13	1702.97	4.26	16.90	0.37	0.40	21.92	\N	\N	PENDIENTE	1
560	2000010	20	2018-08-14	1686.07	4.22	16.94	0.37	0.40	21.92	\N	\N	PENDIENTE	1
561	2000010	21	2018-08-15	1669.13	4.17	16.98	0.37	0.40	21.92	\N	\N	PENDIENTE	1
562	2000010	22	2018-08-16	1652.15	4.13	17.02	0.37	0.40	21.92	\N	\N	PENDIENTE	1
563	2000010	23	2018-08-17	1635.13	4.09	17.07	0.37	0.40	21.92	\N	\N	PENDIENTE	1
564	2000010	24	2018-08-18	1618.06	4.05	17.11	0.37	0.40	21.92	\N	\N	PENDIENTE	1
565	2000010	25	2018-08-20	1600.95	4.00	17.15	0.37	0.40	21.92	\N	\N	PENDIENTE	1
566	2000010	26	2018-08-21	1583.80	3.96	17.19	0.37	0.40	21.92	\N	\N	PENDIENTE	1
567	2000010	27	2018-08-22	1566.61	3.92	17.24	0.37	0.40	21.92	\N	\N	PENDIENTE	1
568	2000010	28	2018-08-23	1549.37	3.87	17.28	0.37	0.40	21.92	\N	\N	PENDIENTE	1
569	2000010	29	2018-08-24	1532.09	3.83	17.32	0.37	0.40	21.92	\N	\N	PENDIENTE	1
570	2000010	30	2018-08-25	1514.77	3.79	17.37	0.37	0.40	21.92	\N	\N	PENDIENTE	1
571	2000010	31	2018-08-27	1497.40	3.74	17.41	0.37	0.40	21.92	\N	\N	PENDIENTE	1
572	2000010	32	2018-08-28	1479.99	3.70	17.45	0.37	0.40	21.92	\N	\N	PENDIENTE	1
573	2000010	33	2018-08-29	1462.54	3.66	17.50	0.37	0.40	21.92	\N	\N	PENDIENTE	1
574	2000010	34	2018-08-31	1445.04	3.61	17.54	0.37	0.40	21.92	\N	\N	PENDIENTE	1
575	2000010	35	2018-09-01	1427.50	3.57	17.59	0.37	0.40	21.92	\N	\N	PENDIENTE	1
576	2000010	36	2018-09-03	1409.91	3.52	17.63	0.37	0.40	21.92	\N	\N	PENDIENTE	1
577	2000010	37	2018-09-04	1392.28	3.48	17.67	0.37	0.40	21.92	\N	\N	PENDIENTE	1
578	2000010	38	2018-09-05	1374.61	3.44	17.72	0.37	0.40	21.92	\N	\N	PENDIENTE	1
579	2000010	39	2018-09-06	1356.89	3.39	17.76	0.37	0.40	21.92	\N	\N	PENDIENTE	1
580	2000010	40	2018-09-07	1339.13	3.35	17.81	0.37	0.40	21.92	\N	\N	PENDIENTE	1
581	2000010	41	2018-09-08	1321.32	3.30	17.85	0.37	0.40	21.92	\N	\N	PENDIENTE	1
582	2000010	42	2018-09-10	1303.47	3.26	17.90	0.37	0.40	21.92	\N	\N	PENDIENTE	1
583	2000010	43	2018-09-11	1285.58	3.21	17.94	0.37	0.40	21.92	\N	\N	PENDIENTE	1
584	2000010	44	2018-09-12	1267.64	3.17	17.98	0.37	0.40	21.92	\N	\N	PENDIENTE	1
585	2000010	45	2018-09-13	1249.65	3.12	18.03	0.37	0.40	21.92	\N	\N	PENDIENTE	1
586	2000010	46	2018-09-14	1231.62	3.08	18.07	0.37	0.40	21.92	\N	\N	PENDIENTE	1
587	2000010	47	2018-09-15	1213.55	3.03	18.12	0.37	0.40	21.92	\N	\N	PENDIENTE	1
588	2000010	48	2018-09-17	1195.43	2.99	18.17	0.37	0.40	21.92	\N	\N	PENDIENTE	1
589	2000010	49	2018-09-18	1177.26	2.94	18.21	0.37	0.40	21.92	\N	\N	PENDIENTE	1
590	2000010	50	2018-09-19	1159.05	2.90	18.26	0.37	0.40	21.92	\N	\N	PENDIENTE	1
591	2000010	51	2018-09-20	1140.80	2.85	18.30	0.37	0.40	21.92	\N	\N	PENDIENTE	1
592	2000010	52	2018-09-21	1122.49	2.81	18.35	0.37	0.40	21.92	\N	\N	PENDIENTE	1
593	2000010	53	2018-09-22	1104.15	2.76	18.39	0.37	0.40	21.92	\N	\N	PENDIENTE	1
594	2000010	54	2018-09-24	1085.75	2.71	18.44	0.37	0.40	21.92	\N	\N	PENDIENTE	1
595	2000010	55	2018-09-25	1067.31	2.67	18.49	0.37	0.40	21.92	\N	\N	PENDIENTE	1
596	2000010	56	2018-09-26	1048.83	2.62	18.53	0.37	0.40	21.92	\N	\N	PENDIENTE	1
597	2000010	57	2018-09-27	1030.30	2.58	18.58	0.37	0.40	21.92	\N	\N	PENDIENTE	1
598	2000010	58	2018-09-28	1011.72	2.53	18.62	0.37	0.40	21.92	\N	\N	PENDIENTE	1
599	2000010	59	2018-09-29	993.09	2.48	18.67	0.37	0.40	21.92	\N	\N	PENDIENTE	1
600	2000010	60	2018-10-01	974.42	2.44	18.72	0.37	0.40	21.92	\N	\N	PENDIENTE	1
601	2000010	61	2018-10-02	955.70	2.39	18.76	0.37	0.40	21.92	\N	\N	PENDIENTE	1
602	2000010	62	2018-10-03	936.94	2.34	18.81	0.37	0.40	21.92	\N	\N	PENDIENTE	1
603	2000010	63	2018-10-04	918.13	2.30	18.86	0.37	0.40	21.92	\N	\N	PENDIENTE	1
604	2000010	64	2018-10-05	899.27	2.25	18.91	0.37	0.40	21.92	\N	\N	PENDIENTE	1
605	2000010	65	2018-10-06	880.36	2.20	18.95	0.37	0.40	21.92	\N	\N	PENDIENTE	1
606	2000010	66	2018-10-09	861.41	2.15	19.00	0.37	0.40	21.92	\N	\N	PENDIENTE	1
607	2000010	67	2018-10-10	842.41	2.11	19.05	0.37	0.40	21.92	\N	\N	PENDIENTE	1
608	2000010	68	2018-10-11	823.36	2.06	19.10	0.37	0.40	21.92	\N	\N	PENDIENTE	1
609	2000010	69	2018-10-12	804.27	2.01	19.14	0.37	0.40	21.92	\N	\N	PENDIENTE	1
610	2000010	70	2018-10-13	785.12	1.96	19.19	0.37	0.40	21.92	\N	\N	PENDIENTE	1
611	2000010	71	2018-10-15	765.93	1.91	19.24	0.37	0.40	21.92	\N	\N	PENDIENTE	1
612	2000010	72	2018-10-16	746.69	1.87	19.29	0.37	0.40	21.92	\N	\N	PENDIENTE	1
613	2000010	73	2018-10-17	727.41	1.82	19.34	0.37	0.40	21.92	\N	\N	PENDIENTE	1
614	2000010	74	2018-10-18	708.07	1.77	19.38	0.37	0.40	21.92	\N	\N	PENDIENTE	1
615	2000010	75	2018-10-19	688.69	1.72	19.43	0.37	0.40	21.92	\N	\N	PENDIENTE	1
616	2000010	76	2018-10-20	669.26	1.67	19.48	0.37	0.40	21.92	\N	\N	PENDIENTE	1
617	2000010	77	2018-10-22	649.78	1.62	19.53	0.37	0.40	21.92	\N	\N	PENDIENTE	1
618	2000010	78	2018-10-23	630.25	1.58	19.58	0.37	0.40	21.92	\N	\N	PENDIENTE	1
619	2000010	79	2018-10-24	610.67	1.53	19.63	0.37	0.40	21.92	\N	\N	PENDIENTE	1
620	2000010	80	2018-10-25	591.04	1.48	19.68	0.37	0.40	21.92	\N	\N	PENDIENTE	1
621	2000010	81	2018-10-26	571.36	1.43	19.73	0.37	0.40	21.92	\N	\N	PENDIENTE	1
622	2000010	82	2018-10-27	551.64	1.38	19.77	0.37	0.40	21.92	\N	\N	PENDIENTE	1
623	2000010	83	2018-10-29	531.86	1.33	19.82	0.37	0.40	21.92	\N	\N	PENDIENTE	1
624	2000010	84	2018-10-30	512.04	1.28	19.87	0.37	0.40	21.92	\N	\N	PENDIENTE	1
625	2000010	85	2018-10-31	492.17	1.23	19.92	0.37	0.40	21.92	\N	\N	PENDIENTE	1
626	2000010	86	2018-11-02	472.24	1.18	19.97	0.37	0.40	21.92	\N	\N	PENDIENTE	1
627	2000010	87	2018-11-03	452.27	1.13	20.02	0.37	0.40	21.92	\N	\N	PENDIENTE	1
628	2000010	88	2018-11-05	432.25	1.08	20.07	0.37	0.40	21.92	\N	\N	PENDIENTE	1
629	2000010	89	2018-11-06	412.17	1.03	20.12	0.37	0.40	21.92	\N	\N	PENDIENTE	1
630	2000010	90	2018-11-07	392.05	0.98	20.17	0.37	0.40	21.92	\N	\N	PENDIENTE	1
631	2000010	91	2018-11-08	371.88	0.93	20.22	0.37	0.40	21.92	\N	\N	PENDIENTE	1
632	2000010	92	2018-11-09	351.65	0.88	20.27	0.37	0.40	21.92	\N	\N	PENDIENTE	1
633	2000010	93	2018-11-10	331.38	0.83	20.33	0.37	0.40	21.92	\N	\N	PENDIENTE	1
634	2000010	94	2018-11-12	311.05	0.78	20.38	0.37	0.40	21.92	\N	\N	PENDIENTE	1
635	2000010	95	2018-11-13	290.67	0.73	20.43	0.37	0.40	21.92	\N	\N	PENDIENTE	1
636	2000010	96	2018-11-14	270.25	0.68	20.48	0.37	0.40	21.92	\N	\N	PENDIENTE	1
637	2000010	97	2018-11-15	249.77	0.62	20.53	0.37	0.40	21.92	\N	\N	PENDIENTE	1
638	2000010	98	2018-11-16	229.24	0.57	20.58	0.37	0.40	21.92	\N	\N	PENDIENTE	1
639	2000010	99	2018-11-17	208.66	0.52	20.63	0.37	0.40	21.92	\N	\N	PENDIENTE	1
640	2000010	100	2018-11-19	188.03	0.47	20.68	0.37	0.40	21.92	\N	\N	PENDIENTE	1
641	2000010	101	2018-11-20	167.34	0.42	20.74	0.37	0.40	21.92	\N	\N	PENDIENTE	1
642	2000010	102	2018-11-21	146.61	0.37	20.79	0.37	0.40	21.92	\N	\N	PENDIENTE	1
643	2000010	103	2018-11-22	125.82	0.31	20.84	0.37	0.40	21.92	\N	\N	PENDIENTE	1
644	2000010	104	2018-11-23	104.98	0.26	20.89	0.37	0.40	21.92	\N	\N	PENDIENTE	1
645	2000010	105	2018-11-24	84.09	0.21	20.94	0.37	0.40	21.92	\N	\N	PENDIENTE	1
646	2000010	106	2018-11-26	63.15	0.16	21.00	0.37	0.40	21.92	\N	\N	PENDIENTE	1
647	2000010	107	2018-11-27	42.15	0.11	21.05	0.37	0.40	21.92	\N	\N	PENDIENTE	1
648	2000010	108	2018-11-28	21.10	0.05	21.10	0.37	0.40	21.92	\N	\N	PENDIENTE	1
1639	20000058	15	2018-08-13	842.27	2.26	11.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1640	20000058	16	2018-08-14	830.78	2.23	11.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1641	20000058	17	2018-08-15	819.26	2.19	11.56	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1642	20000058	18	2018-08-16	807.70	2.16	11.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1643	20000058	19	2018-08-17	796.11	2.13	11.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1644	20000058	20	2018-08-18	784.50	2.10	11.65	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1645	20000058	21	2018-08-20	772.85	2.07	11.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1646	20000058	22	2018-08-21	761.17	2.04	11.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1647	20000058	23	2018-08-22	749.46	2.01	11.74	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1648	20000058	24	2018-08-23	737.72	1.98	11.77	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1649	20000058	25	2018-08-24	725.94	1.94	11.81	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1650	20000058	26	2018-08-25	714.14	1.91	11.84	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1651	20000058	27	2018-08-27	702.30	1.88	11.87	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1652	20000058	28	2018-08-28	690.43	1.85	11.90	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1653	20000058	29	2018-08-29	678.53	1.82	11.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1654	20000058	30	2018-08-31	666.60	1.79	11.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1655	20000058	31	2018-09-01	654.63	1.75	12.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1656	20000058	32	2018-09-03	642.64	1.72	12.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1657	20000058	33	2018-09-04	630.61	1.69	12.06	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1658	20000058	34	2018-09-05	618.55	1.66	12.09	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1659	20000058	35	2018-09-06	606.46	1.62	12.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1660	20000058	36	2018-09-07	594.33	1.59	12.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
649	2000011	1	2018-07-23	1000.00	2.50	8.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
1661	20000058	37	2018-09-08	582.17	1.56	12.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1662	20000058	38	2018-09-10	569.98	1.53	12.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1663	20000058	39	2018-09-11	557.76	1.49	12.26	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1664	20000058	40	2018-09-12	545.50	1.46	12.29	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1665	20000058	41	2018-09-13	533.21	1.43	12.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1666	20000058	42	2018-09-14	520.89	1.40	12.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1667	20000058	43	2018-09-15	508.54	1.36	12.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1668	20000058	44	2018-09-17	496.15	1.33	12.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1669	20000058	45	2018-09-18	483.73	1.30	12.45	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1670	20000058	46	2018-09-19	471.28	1.26	12.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1671	20000058	47	2018-09-20	458.79	1.23	12.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1672	20000058	48	2018-09-21	446.27	1.20	12.55	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1673	20000058	49	2018-09-22	433.71	1.16	12.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1674	20000058	50	2018-09-24	421.12	1.13	12.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1675	20000058	51	2018-09-25	408.50	1.09	12.66	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1676	20000058	52	2018-09-26	395.85	1.06	12.69	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1677	20000058	53	2018-09-27	383.16	1.03	12.72	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1678	20000058	54	2018-09-28	370.43	0.99	12.76	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1679	20000058	55	2018-09-29	357.68	0.96	12.79	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1680	20000058	56	2018-10-01	344.89	0.92	12.83	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1681	20000058	57	2018-10-02	332.06	0.89	12.86	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1682	20000058	58	2018-10-03	319.20	0.85	12.89	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1683	20000058	59	2018-10-04	306.30	0.82	12.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1684	20000058	60	2018-10-05	293.37	0.79	12.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1685	20000058	61	2018-10-06	280.41	0.75	13.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1686	20000058	62	2018-10-09	267.41	0.72	13.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1687	20000058	63	2018-10-10	254.38	0.68	13.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1688	20000058	64	2018-10-11	241.31	0.65	13.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1689	20000058	65	2018-10-12	228.21	0.61	13.14	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1690	20000058	66	2018-10-13	215.07	0.58	13.17	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1691	20000058	67	2018-10-15	201.89	0.54	13.21	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1692	20000058	68	2018-10-16	188.68	0.51	13.24	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1693	20000058	69	2018-10-17	175.44	0.47	13.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1694	20000058	70	2018-10-18	162.16	0.43	13.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1695	20000058	71	2018-10-19	148.85	0.40	13.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1696	20000058	72	2018-10-20	135.49	0.36	13.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1697	20000058	73	2018-10-22	122.11	0.33	13.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1698	20000058	74	2018-10-23	108.68	0.29	13.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1699	20000058	75	2018-10-24	95.23	0.26	13.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1700	20000058	76	2018-10-25	81.73	0.22	13.53	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1701	20000058	77	2018-10-26	68.20	0.18	13.57	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1702	20000058	78	2018-10-27	54.63	0.15	13.60	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1703	20000058	79	2018-10-29	41.03	0.11	13.64	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1704	20000058	80	2018-10-30	27.39	0.07	13.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1705	20000058	81	2018-10-31	13.71	0.04	13.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1718	20000059	13	2018-08-10	866.03	2.47	11.37	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1719	20000059	14	2018-08-11	854.66	2.44	11.40	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1720	20000059	15	2018-08-13	843.25	2.41	11.44	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1721	20000059	16	2018-08-14	831.82	2.38	11.47	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1722	20000059	17	2018-08-15	820.35	2.34	11.50	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1723	20000059	18	2018-08-16	808.84	2.31	11.54	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1724	20000059	19	2018-08-17	797.31	2.28	11.57	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1725	20000059	20	2018-08-18	785.74	2.24	11.60	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1726	20000059	21	2018-08-20	774.14	2.21	11.64	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1727	20000059	22	2018-08-21	762.50	2.18	11.67	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1728	20000059	23	2018-08-22	750.83	2.15	11.70	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1729	20000059	24	2018-08-23	739.13	2.11	11.74	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1730	20000059	25	2018-08-24	727.40	2.08	11.77	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1731	20000059	26	2018-08-25	715.63	2.04	11.80	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1732	20000059	27	2018-08-27	703.83	2.01	11.84	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1733	20000059	28	2018-08-28	691.99	1.98	11.87	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1734	20000059	29	2018-08-29	680.12	1.94	11.90	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1735	20000059	30	2018-08-31	668.22	1.91	11.94	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1736	20000059	31	2018-09-01	656.28	1.88	11.97	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1737	20000059	32	2018-09-03	644.31	1.84	12.01	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1738	20000059	33	2018-09-04	632.30	1.81	12.04	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1739	20000059	34	2018-09-05	620.26	1.77	12.07	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1740	20000059	35	2018-09-06	608.19	1.74	12.11	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1741	20000059	36	2018-09-07	596.08	1.70	12.14	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1742	20000059	37	2018-09-08	583.93	1.67	12.18	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1743	20000059	38	2018-09-10	571.75	1.63	12.21	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1744	20000059	39	2018-09-11	559.54	1.60	12.25	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1706	20000059	1	2018-07-26	1000.00	2.86	10.99	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1707	20000059	2	2018-07-27	989.01	2.83	11.02	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1708	20000059	3	2018-07-30	977.99	2.79	11.05	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1709	20000059	4	2018-07-31	966.94	2.76	11.08	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1710	20000059	5	2018-08-01	955.85	2.73	11.12	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1711	20000059	6	2018-08-02	944.74	2.70	11.15	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1712	20000059	7	2018-08-03	933.59	2.67	11.18	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1713	20000059	8	2018-08-04	922.41	2.64	11.21	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1714	20000059	9	2018-08-06	911.20	2.60	11.24	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1715	20000059	10	2018-08-07	899.95	2.57	11.28	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1716	20000059	11	2018-08-08	888.68	2.54	11.31	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1717	20000059	12	2018-08-09	877.37	2.51	11.34	0.37	0.40	14.62	\N	\N	PENDIENTE	1
650	2000011	2	2018-07-24	991.92	2.48	8.10	0.37	0.40	11.35	\N	\N	PENDIENTE	1
651	2000011	3	2018-07-25	983.83	2.46	8.12	0.37	0.40	11.35	\N	\N	PENDIENTE	1
652	2000011	4	2018-07-26	975.71	2.44	8.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
653	2000011	5	2018-07-27	967.57	2.42	8.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
654	2000011	6	2018-07-30	959.41	2.40	8.18	0.37	0.40	11.35	\N	\N	PENDIENTE	1
655	2000011	7	2018-07-31	951.23	2.38	8.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
656	2000011	8	2018-08-01	943.04	2.36	8.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
657	2000011	9	2018-08-02	934.82	2.34	8.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
658	2000011	10	2018-08-03	926.58	2.32	8.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
659	2000011	11	2018-08-06	918.32	2.30	8.28	0.37	0.40	11.35	\N	\N	PENDIENTE	1
660	2000011	12	2018-08-07	910.03	2.28	8.30	0.37	0.40	11.35	\N	\N	PENDIENTE	1
661	2000011	13	2018-08-08	901.73	2.25	8.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
662	2000011	14	2018-08-09	893.41	2.23	8.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
663	2000011	15	2018-08-10	885.07	2.21	8.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
664	2000011	16	2018-08-13	876.70	2.19	8.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
665	2000011	17	2018-08-14	868.32	2.17	8.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
666	2000011	18	2018-08-15	859.91	2.15	8.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
667	2000011	19	2018-08-16	851.48	2.13	8.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
668	2000011	20	2018-08-17	843.04	2.11	8.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
669	2000011	21	2018-08-20	834.57	2.09	8.49	0.37	0.40	11.35	\N	\N	PENDIENTE	1
670	2000011	22	2018-08-21	826.08	2.07	8.51	0.37	0.40	11.35	\N	\N	PENDIENTE	1
671	2000011	23	2018-08-22	817.56	2.04	8.53	0.37	0.40	11.35	\N	\N	PENDIENTE	1
672	2000011	24	2018-08-23	809.03	2.02	8.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
673	2000011	25	2018-08-24	800.48	2.00	8.58	0.37	0.40	11.35	\N	\N	PENDIENTE	1
674	2000011	26	2018-08-27	791.90	1.98	8.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
675	2000011	27	2018-08-28	783.30	1.96	8.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
676	2000011	28	2018-08-29	774.69	1.94	8.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
677	2000011	29	2018-08-31	766.04	1.92	8.66	0.37	0.40	11.35	\N	\N	PENDIENTE	1
678	2000011	30	2018-09-03	757.38	1.89	8.68	0.37	0.40	11.35	\N	\N	PENDIENTE	1
679	2000011	31	2018-09-04	748.70	1.87	8.71	0.37	0.40	11.35	\N	\N	PENDIENTE	1
680	2000011	32	2018-09-05	739.99	1.85	8.73	0.37	0.40	11.35	\N	\N	PENDIENTE	1
681	2000011	33	2018-09-06	731.27	1.83	8.75	0.37	0.40	11.35	\N	\N	PENDIENTE	1
682	2000011	34	2018-09-07	722.52	1.81	8.77	0.37	0.40	11.35	\N	\N	PENDIENTE	1
683	2000011	35	2018-09-10	713.75	1.78	8.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
684	2000011	36	2018-09-11	704.96	1.76	8.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
685	2000011	37	2018-09-12	696.14	1.74	8.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
686	2000011	38	2018-09-13	687.30	1.72	8.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
687	2000011	39	2018-09-14	678.45	1.70	8.88	0.37	0.40	11.35	\N	\N	PENDIENTE	1
688	2000011	40	2018-09-17	669.56	1.67	8.90	0.37	0.40	11.35	\N	\N	PENDIENTE	1
689	2000011	41	2018-09-18	660.66	1.65	8.93	0.37	0.40	11.35	\N	\N	PENDIENTE	1
690	2000011	42	2018-09-19	651.74	1.63	8.95	0.37	0.40	11.35	\N	\N	PENDIENTE	1
691	2000011	43	2018-09-20	642.79	1.61	8.97	0.37	0.40	11.35	\N	\N	PENDIENTE	1
692	2000011	44	2018-09-21	633.82	1.58	8.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
693	2000011	45	2018-09-24	624.83	1.56	9.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
694	2000011	46	2018-09-25	615.81	1.54	9.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
695	2000011	47	2018-09-26	606.77	1.52	9.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
696	2000011	48	2018-09-27	597.71	1.49	9.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
697	2000011	49	2018-09-28	588.63	1.47	9.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
698	2000011	50	2018-10-01	579.53	1.45	9.13	0.37	0.40	11.35	\N	\N	PENDIENTE	1
699	2000011	51	2018-10-02	570.40	1.43	9.15	0.37	0.40	11.35	\N	\N	PENDIENTE	1
700	2000011	52	2018-10-03	561.25	1.40	9.17	0.37	0.40	11.35	\N	\N	PENDIENTE	1
701	2000011	53	2018-10-04	552.07	1.38	9.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
702	2000011	54	2018-10-05	542.88	1.36	9.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
703	2000011	55	2018-10-09	533.66	1.33	9.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
704	2000011	56	2018-10-10	524.41	1.31	9.27	0.37	0.40	11.35	\N	\N	PENDIENTE	1
705	2000011	57	2018-10-11	515.15	1.29	9.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
706	2000011	58	2018-10-12	505.86	1.26	9.31	0.37	0.40	11.35	\N	\N	PENDIENTE	1
707	2000011	59	2018-10-15	496.55	1.24	9.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
708	2000011	60	2018-10-16	487.21	1.22	9.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
709	2000011	61	2018-10-17	477.85	1.19	9.38	0.37	0.40	11.35	\N	\N	PENDIENTE	1
710	2000011	62	2018-10-18	468.47	1.17	9.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
711	2000011	63	2018-10-19	459.06	1.15	9.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
712	2000011	64	2018-10-22	449.64	1.12	9.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
713	2000011	65	2018-10-23	440.18	1.10	9.48	0.37	0.40	11.35	\N	\N	PENDIENTE	1
714	2000011	66	2018-10-24	430.71	1.08	9.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
715	2000011	67	2018-10-25	421.21	1.05	9.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
716	2000011	68	2018-10-26	411.68	1.03	9.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
717	2000011	69	2018-10-29	402.13	1.01	9.57	0.37	0.40	11.35	\N	\N	PENDIENTE	1
718	2000011	70	2018-10-30	392.56	0.98	9.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
719	2000011	71	2018-10-31	382.97	0.96	9.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
720	2000011	72	2018-11-02	373.35	0.93	9.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
721	2000011	73	2018-11-05	363.70	0.91	9.67	0.37	0.40	11.35	\N	\N	PENDIENTE	1
722	2000011	74	2018-11-06	354.04	0.89	9.69	0.37	0.40	11.35	\N	\N	PENDIENTE	1
723	2000011	75	2018-11-07	344.34	0.86	9.72	0.37	0.40	11.35	\N	\N	PENDIENTE	1
724	2000011	76	2018-11-08	334.63	0.84	9.74	0.37	0.40	11.35	\N	\N	PENDIENTE	1
725	2000011	77	2018-11-09	324.89	0.81	9.76	0.37	0.40	11.35	\N	\N	PENDIENTE	1
726	2000011	78	2018-11-12	315.12	0.79	9.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
727	2000011	79	2018-11-13	305.33	0.76	9.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
728	2000011	80	2018-11-14	295.52	0.74	9.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
729	2000011	81	2018-11-15	285.68	0.71	9.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
730	2000011	82	2018-11-16	275.82	0.69	9.89	0.37	0.40	11.35	\N	\N	PENDIENTE	1
731	2000011	83	2018-11-19	265.93	0.66	9.91	0.37	0.40	11.35	\N	\N	PENDIENTE	1
732	2000011	84	2018-11-20	256.02	0.64	9.94	0.37	0.40	11.35	\N	\N	PENDIENTE	1
733	2000011	85	2018-11-21	246.08	0.62	9.96	0.37	0.40	11.35	\N	\N	PENDIENTE	1
734	2000011	86	2018-11-22	236.12	0.59	9.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
735	2000011	87	2018-11-23	226.13	0.57	10.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
736	2000011	88	2018-11-26	216.12	0.54	10.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
737	2000011	89	2018-11-27	206.09	0.52	10.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
738	2000011	90	2018-11-28	196.02	0.49	10.09	0.37	0.40	11.35	\N	\N	PENDIENTE	1
739	2000011	91	2018-11-29	185.94	0.46	10.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
740	2000011	92	2018-11-30	175.83	0.44	10.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
741	2000011	93	2018-12-03	165.69	0.41	10.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
742	2000011	94	2018-12-04	155.53	0.39	10.19	0.37	0.40	11.35	\N	\N	PENDIENTE	1
743	2000011	95	2018-12-05	145.34	0.36	10.21	0.37	0.40	11.35	\N	\N	PENDIENTE	1
744	2000011	96	2018-12-06	135.12	0.34	10.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
745	2000011	97	2018-12-07	124.88	0.31	10.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
746	2000011	98	2018-12-10	114.62	0.29	10.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
747	2000011	99	2018-12-11	104.33	0.26	10.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
748	2000011	100	2018-12-12	94.01	0.24	10.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
749	2000011	101	2018-12-13	83.67	0.21	10.37	0.37	0.40	11.35	\N	\N	PENDIENTE	1
750	2000011	102	2018-12-14	73.30	0.18	10.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
751	2000011	103	2018-12-17	62.91	0.16	10.42	0.37	0.40	11.35	\N	\N	PENDIENTE	1
752	2000011	104	2018-12-18	52.49	0.13	10.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
753	2000011	105	2018-12-19	42.04	0.11	10.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
754	2000011	106	2018-12-20	31.57	0.08	10.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
755	2000011	107	2018-12-21	21.07	0.05	10.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
756	2000011	108	2018-12-24	10.55	0.03	10.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
757	2000012	1	2018-07-21	500.00	1.34	5.54	0.37	0.40	7.65	\N	\N	PENDIENTE	1
758	2000012	2	2018-07-23	494.46	1.32	5.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
759	2000012	3	2018-07-24	488.91	1.31	5.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
760	2000012	4	2018-07-25	483.35	1.29	5.58	0.37	0.40	7.65	\N	\N	PENDIENTE	1
761	2000012	5	2018-07-26	477.77	1.28	5.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
762	2000012	6	2018-07-27	472.17	1.26	5.61	0.37	0.40	7.65	\N	\N	PENDIENTE	1
763	2000012	7	2018-07-30	466.56	1.25	5.63	0.37	0.40	7.65	\N	\N	PENDIENTE	1
764	2000012	8	2018-07-31	460.94	1.23	5.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
765	2000012	9	2018-08-01	455.30	1.22	5.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
766	2000012	10	2018-08-02	449.64	1.20	5.67	0.37	0.40	7.65	\N	\N	PENDIENTE	1
767	2000012	11	2018-08-03	443.97	1.19	5.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
768	2000012	12	2018-08-04	438.29	1.17	5.70	0.37	0.40	7.65	\N	\N	PENDIENTE	1
769	2000012	13	2018-08-06	432.59	1.16	5.72	0.37	0.40	7.65	\N	\N	PENDIENTE	1
770	2000012	14	2018-08-07	426.87	1.14	5.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
771	2000012	15	2018-08-08	421.14	1.13	5.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
772	2000012	16	2018-08-09	415.39	1.11	5.76	0.37	0.40	7.65	\N	\N	PENDIENTE	1
773	2000012	17	2018-08-10	409.63	1.10	5.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
774	2000012	18	2018-08-11	403.85	1.08	5.79	0.37	0.40	7.65	\N	\N	PENDIENTE	1
775	2000012	19	2018-08-13	398.06	1.07	5.81	0.37	0.40	7.65	\N	\N	PENDIENTE	1
776	2000012	20	2018-08-14	392.25	1.05	5.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
777	2000012	21	2018-08-15	386.42	1.04	5.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
778	2000012	22	2018-08-16	380.58	1.02	5.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
779	2000012	23	2018-08-17	374.73	1.00	5.87	0.37	0.40	7.65	\N	\N	PENDIENTE	1
780	2000012	24	2018-08-18	368.86	0.99	5.89	0.37	0.40	7.65	\N	\N	PENDIENTE	1
781	2000012	25	2018-08-20	362.97	0.97	5.90	0.37	0.40	7.65	\N	\N	PENDIENTE	1
782	2000012	26	2018-08-21	357.07	0.96	5.92	0.37	0.40	7.65	\N	\N	PENDIENTE	1
783	2000012	27	2018-08-22	351.15	0.94	5.93	0.37	0.40	7.65	\N	\N	PENDIENTE	1
784	2000012	28	2018-08-23	345.22	0.92	5.95	0.37	0.40	7.65	\N	\N	PENDIENTE	1
785	2000012	29	2018-08-24	339.27	0.91	5.97	0.37	0.40	7.65	\N	\N	PENDIENTE	1
786	2000012	30	2018-08-25	333.30	0.89	5.98	0.37	0.40	7.65	\N	\N	PENDIENTE	1
787	2000012	31	2018-08-27	327.32	0.88	6.00	0.37	0.40	7.65	\N	\N	PENDIENTE	1
788	2000012	32	2018-08-28	321.32	0.86	6.01	0.37	0.40	7.65	\N	\N	PENDIENTE	1
789	2000012	33	2018-08-29	315.30	0.84	6.03	0.37	0.40	7.65	\N	\N	PENDIENTE	1
790	2000012	34	2018-08-31	309.27	0.83	6.05	0.37	0.40	7.65	\N	\N	PENDIENTE	1
791	2000012	35	2018-09-01	303.23	0.81	6.06	0.37	0.40	7.65	\N	\N	PENDIENTE	1
792	2000012	36	2018-09-03	297.17	0.80	6.08	0.37	0.40	7.65	\N	\N	PENDIENTE	1
793	2000012	37	2018-09-04	291.09	0.78	6.10	0.37	0.40	7.65	\N	\N	PENDIENTE	1
794	2000012	38	2018-09-05	284.99	0.76	6.11	0.37	0.40	7.65	\N	\N	PENDIENTE	1
795	2000012	39	2018-09-06	278.88	0.75	6.13	0.37	0.40	7.65	\N	\N	PENDIENTE	1
796	2000012	40	2018-09-07	272.75	0.73	6.14	0.37	0.40	7.65	\N	\N	PENDIENTE	1
797	2000012	41	2018-09-08	266.61	0.71	6.16	0.37	0.40	7.65	\N	\N	PENDIENTE	1
798	2000012	42	2018-09-10	260.45	0.70	6.18	0.37	0.40	7.65	\N	\N	PENDIENTE	1
799	2000012	43	2018-09-11	254.27	0.68	6.19	0.37	0.40	7.65	\N	\N	PENDIENTE	1
800	2000012	44	2018-09-12	248.08	0.66	6.21	0.37	0.40	7.65	\N	\N	PENDIENTE	1
801	2000012	45	2018-09-13	241.86	0.65	6.23	0.37	0.40	7.65	\N	\N	PENDIENTE	1
802	2000012	46	2018-09-14	235.64	0.63	6.24	0.37	0.40	7.65	\N	\N	PENDIENTE	1
803	2000012	47	2018-09-15	229.39	0.61	6.26	0.37	0.40	7.65	\N	\N	PENDIENTE	1
804	2000012	48	2018-09-17	223.13	0.60	6.28	0.37	0.40	7.65	\N	\N	PENDIENTE	1
805	2000012	49	2018-09-18	216.86	0.58	6.29	0.37	0.40	7.65	\N	\N	PENDIENTE	1
806	2000012	50	2018-09-19	210.56	0.56	6.31	0.37	0.40	7.65	\N	\N	PENDIENTE	1
807	2000012	51	2018-09-20	204.25	0.55	6.33	0.37	0.40	7.65	\N	\N	PENDIENTE	1
808	2000012	52	2018-09-21	197.92	0.53	6.34	0.37	0.40	7.65	\N	\N	PENDIENTE	1
809	2000012	53	2018-09-22	191.58	0.51	6.36	0.37	0.40	7.65	\N	\N	PENDIENTE	1
810	2000012	54	2018-09-24	185.22	0.50	6.38	0.37	0.40	7.65	\N	\N	PENDIENTE	1
811	2000012	55	2018-09-25	178.84	0.48	6.40	0.37	0.40	7.65	\N	\N	PENDIENTE	1
812	2000012	56	2018-09-26	172.44	0.46	6.41	0.37	0.40	7.65	\N	\N	PENDIENTE	1
813	2000012	57	2018-09-27	166.03	0.44	6.43	0.37	0.40	7.65	\N	\N	PENDIENTE	1
814	2000012	58	2018-09-28	159.60	0.43	6.45	0.37	0.40	7.65	\N	\N	PENDIENTE	1
815	2000012	59	2018-09-29	153.15	0.41	6.46	0.37	0.40	7.65	\N	\N	PENDIENTE	1
816	2000012	60	2018-10-01	146.69	0.39	6.48	0.37	0.40	7.65	\N	\N	PENDIENTE	1
817	2000012	61	2018-10-02	140.21	0.38	6.50	0.37	0.40	7.65	\N	\N	PENDIENTE	1
818	2000012	62	2018-10-03	133.71	0.36	6.52	0.37	0.40	7.65	\N	\N	PENDIENTE	1
819	2000012	63	2018-10-04	127.19	0.34	6.53	0.37	0.40	7.65	\N	\N	PENDIENTE	1
820	2000012	64	2018-10-05	120.65	0.32	6.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
821	2000012	65	2018-10-06	114.10	0.31	6.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
822	2000012	66	2018-10-09	107.53	0.29	6.59	0.37	0.40	7.65	\N	\N	PENDIENTE	1
823	2000012	67	2018-10-10	100.95	0.27	6.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
824	2000012	68	2018-10-11	94.34	0.25	6.62	0.37	0.40	7.65	\N	\N	PENDIENTE	1
825	2000012	69	2018-10-12	87.72	0.23	6.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
826	2000012	70	2018-10-13	81.08	0.22	6.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
827	2000012	71	2018-10-15	74.42	0.20	6.68	0.37	0.40	7.65	\N	\N	PENDIENTE	1
828	2000012	72	2018-10-16	67.75	0.18	6.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
829	2000012	73	2018-10-17	61.05	0.16	6.71	0.37	0.40	7.65	\N	\N	PENDIENTE	1
830	2000012	74	2018-10-18	54.34	0.15	6.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
831	2000012	75	2018-10-19	47.61	0.13	6.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
832	2000012	76	2018-10-20	40.87	0.11	6.77	0.37	0.40	7.65	\N	\N	PENDIENTE	1
833	2000012	77	2018-10-22	34.10	0.09	6.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
834	2000012	78	2018-10-23	27.32	0.07	6.80	0.37	0.40	7.65	\N	\N	PENDIENTE	1
835	2000012	79	2018-10-24	20.51	0.05	6.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
836	2000012	80	2018-10-25	13.69	0.04	6.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
837	2000012	81	2018-10-26	6.86	0.02	6.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
838	2000014	1	2018-07-21	3000.00	6.43	15.51	0.37	0.40	22.71	\N	\N	PENDIENTE	1
839	2000014	2	2018-07-23	2984.49	6.40	15.54	0.37	0.40	22.71	\N	\N	PENDIENTE	1
840	2000014	3	2018-07-24	2968.95	6.36	15.58	0.37	0.40	22.71	\N	\N	PENDIENTE	1
841	2000014	4	2018-07-25	2953.37	6.33	15.61	0.37	0.40	22.71	\N	\N	PENDIENTE	1
842	2000014	5	2018-07-26	2937.76	6.30	15.64	0.37	0.40	22.71	\N	\N	PENDIENTE	1
843	2000014	6	2018-07-27	2922.12	6.26	15.68	0.37	0.40	22.71	\N	\N	PENDIENTE	1
844	2000014	7	2018-07-30	2906.44	6.23	15.71	0.37	0.40	22.71	\N	\N	PENDIENTE	1
845	2000014	8	2018-07-31	2890.73	6.19	15.74	0.37	0.40	22.71	\N	\N	PENDIENTE	1
846	2000014	9	2018-08-01	2874.99	6.16	15.78	0.37	0.40	22.71	\N	\N	PENDIENTE	1
847	2000014	10	2018-08-02	2859.21	6.13	15.81	0.37	0.40	22.71	\N	\N	PENDIENTE	1
848	2000014	11	2018-08-03	2843.40	6.09	15.85	0.37	0.40	22.71	\N	\N	PENDIENTE	1
849	2000014	12	2018-08-04	2827.56	6.06	15.88	0.37	0.40	22.71	\N	\N	PENDIENTE	1
850	2000014	13	2018-08-06	2811.68	6.03	15.91	0.37	0.40	22.71	\N	\N	PENDIENTE	1
851	2000014	14	2018-08-07	2795.76	5.99	15.95	0.37	0.40	22.71	\N	\N	PENDIENTE	1
852	2000014	15	2018-08-08	2779.82	5.96	15.98	0.37	0.40	22.71	\N	\N	PENDIENTE	1
853	2000014	16	2018-08-09	2763.84	5.92	16.02	0.37	0.40	22.71	\N	\N	PENDIENTE	1
854	2000014	17	2018-08-10	2747.82	5.89	16.05	0.37	0.40	22.71	\N	\N	PENDIENTE	1
855	2000014	18	2018-08-11	2731.77	5.85	16.08	0.37	0.40	22.71	\N	\N	PENDIENTE	1
856	2000014	19	2018-08-13	2715.69	5.82	16.12	0.37	0.40	22.71	\N	\N	PENDIENTE	1
857	2000014	20	2018-08-14	2699.57	5.78	16.15	0.37	0.40	22.71	\N	\N	PENDIENTE	1
858	2000014	21	2018-08-15	2683.41	5.75	16.19	0.37	0.40	22.71	\N	\N	PENDIENTE	1
859	2000014	22	2018-08-16	2667.23	5.72	16.22	0.37	0.40	22.71	\N	\N	PENDIENTE	1
860	2000014	23	2018-08-17	2651.00	5.68	16.26	0.37	0.40	22.71	\N	\N	PENDIENTE	1
861	2000014	24	2018-08-18	2634.75	5.65	16.29	0.37	0.40	22.71	\N	\N	PENDIENTE	1
862	2000014	25	2018-08-20	2618.45	5.61	16.33	0.37	0.40	22.71	\N	\N	PENDIENTE	1
863	2000014	26	2018-08-21	2602.13	5.58	16.36	0.37	0.40	22.71	\N	\N	PENDIENTE	1
864	2000014	27	2018-08-22	2585.77	5.54	16.40	0.37	0.40	22.71	\N	\N	PENDIENTE	1
865	2000014	28	2018-08-23	2569.37	5.51	16.43	0.37	0.40	22.71	\N	\N	PENDIENTE	1
866	2000014	29	2018-08-24	2552.94	5.47	16.47	0.37	0.40	22.71	\N	\N	PENDIENTE	1
867	2000014	30	2018-08-25	2536.47	5.44	16.50	0.37	0.40	22.71	\N	\N	PENDIENTE	1
868	2000014	31	2018-08-27	2519.97	5.40	16.54	0.37	0.40	22.71	\N	\N	PENDIENTE	1
869	2000014	32	2018-08-28	2503.43	5.36	16.57	0.37	0.40	22.71	\N	\N	PENDIENTE	1
870	2000014	33	2018-08-29	2486.85	5.33	16.61	0.37	0.40	22.71	\N	\N	PENDIENTE	1
871	2000014	34	2018-08-31	2470.24	5.29	16.64	0.37	0.40	22.71	\N	\N	PENDIENTE	1
872	2000014	35	2018-09-01	2453.60	5.26	16.68	0.37	0.40	22.71	\N	\N	PENDIENTE	1
873	2000014	36	2018-09-03	2436.92	5.22	16.72	0.37	0.40	22.71	\N	\N	PENDIENTE	1
874	2000014	37	2018-09-04	2420.20	5.19	16.75	0.37	0.40	22.71	\N	\N	PENDIENTE	1
875	2000014	38	2018-09-05	2403.45	5.15	16.79	0.37	0.40	22.71	\N	\N	PENDIENTE	1
876	2000014	39	2018-09-06	2386.66	5.11	16.82	0.37	0.40	22.71	\N	\N	PENDIENTE	1
877	2000014	40	2018-09-07	2369.84	5.08	16.86	0.37	0.40	22.71	\N	\N	PENDIENTE	1
878	2000014	41	2018-09-08	2352.98	5.04	16.90	0.37	0.40	22.71	\N	\N	PENDIENTE	1
879	2000014	42	2018-09-10	2336.08	5.01	16.93	0.37	0.40	22.71	\N	\N	PENDIENTE	1
880	2000014	43	2018-09-11	2319.15	4.97	16.97	0.37	0.40	22.71	\N	\N	PENDIENTE	1
881	2000014	44	2018-09-12	2302.18	4.93	17.00	0.37	0.40	22.71	\N	\N	PENDIENTE	1
882	2000014	45	2018-09-13	2285.18	4.90	17.04	0.37	0.40	22.71	\N	\N	PENDIENTE	1
883	2000014	46	2018-09-14	2268.14	4.86	17.08	0.37	0.40	22.71	\N	\N	PENDIENTE	1
884	2000014	47	2018-09-15	2251.06	4.82	17.11	0.37	0.40	22.71	\N	\N	PENDIENTE	1
885	2000014	48	2018-09-17	2233.95	4.79	17.15	0.37	0.40	22.71	\N	\N	PENDIENTE	1
886	2000014	49	2018-09-18	2216.79	4.75	17.19	0.37	0.40	22.71	\N	\N	PENDIENTE	1
887	2000014	50	2018-09-19	2199.61	4.71	17.22	0.37	0.40	22.71	\N	\N	PENDIENTE	1
888	2000014	51	2018-09-20	2182.38	4.68	17.26	0.37	0.40	22.71	\N	\N	PENDIENTE	1
889	2000014	52	2018-09-21	2165.12	4.64	17.30	0.37	0.40	22.71	\N	\N	PENDIENTE	1
890	2000014	53	2018-09-22	2147.82	4.60	17.34	0.37	0.40	22.71	\N	\N	PENDIENTE	1
891	2000014	54	2018-09-24	2130.49	4.57	17.37	0.37	0.40	22.71	\N	\N	PENDIENTE	1
892	2000014	55	2018-09-25	2113.11	4.53	17.41	0.37	0.40	22.71	\N	\N	PENDIENTE	1
893	2000014	56	2018-09-26	2095.70	4.49	17.45	0.37	0.40	22.71	\N	\N	PENDIENTE	1
894	2000014	57	2018-09-27	2078.26	4.45	17.48	0.37	0.40	22.71	\N	\N	PENDIENTE	1
895	2000014	58	2018-09-28	2060.77	4.42	17.52	0.37	0.40	22.71	\N	\N	PENDIENTE	1
896	2000014	59	2018-09-29	2043.25	4.38	17.56	0.37	0.40	22.71	\N	\N	PENDIENTE	1
897	2000014	60	2018-10-01	2025.69	4.34	17.60	0.37	0.40	22.71	\N	\N	PENDIENTE	1
898	2000014	61	2018-10-02	2008.09	4.30	17.63	0.37	0.40	22.71	\N	\N	PENDIENTE	1
899	2000014	62	2018-10-03	1990.46	4.27	17.67	0.37	0.40	22.71	\N	\N	PENDIENTE	1
900	2000014	63	2018-10-04	1972.79	4.23	17.71	0.37	0.40	22.71	\N	\N	PENDIENTE	1
901	2000014	64	2018-10-05	1955.08	4.19	17.75	0.37	0.40	22.71	\N	\N	PENDIENTE	1
902	2000014	65	2018-10-06	1937.33	4.15	17.79	0.37	0.40	22.71	\N	\N	PENDIENTE	1
903	2000014	66	2018-10-09	1919.54	4.11	17.82	0.37	0.40	22.71	\N	\N	PENDIENTE	1
904	2000014	67	2018-10-10	1901.72	4.08	17.86	0.37	0.40	22.71	\N	\N	PENDIENTE	1
905	2000014	68	2018-10-11	1883.85	4.04	17.90	0.37	0.40	22.71	\N	\N	PENDIENTE	1
906	2000014	69	2018-10-12	1865.95	4.00	17.94	0.37	0.40	22.71	\N	\N	PENDIENTE	1
907	2000014	70	2018-10-13	1848.01	3.96	17.98	0.37	0.40	22.71	\N	\N	PENDIENTE	1
908	2000014	71	2018-10-15	1830.03	3.92	18.02	0.37	0.40	22.71	\N	\N	PENDIENTE	1
909	2000014	72	2018-10-16	1812.02	3.88	18.06	0.37	0.40	22.71	\N	\N	PENDIENTE	1
910	2000014	73	2018-10-17	1793.96	3.84	18.09	0.37	0.40	22.71	\N	\N	PENDIENTE	1
911	2000014	74	2018-10-18	1775.87	3.81	18.13	0.37	0.40	22.71	\N	\N	PENDIENTE	1
912	2000014	75	2018-10-19	1757.74	3.77	18.17	0.37	0.40	22.71	\N	\N	PENDIENTE	1
913	2000014	76	2018-10-20	1739.56	3.73	18.21	0.37	0.40	22.71	\N	\N	PENDIENTE	1
914	2000014	77	2018-10-22	1721.35	3.69	18.25	0.37	0.40	22.71	\N	\N	PENDIENTE	1
915	2000014	78	2018-10-23	1703.10	3.65	18.29	0.37	0.40	22.71	\N	\N	PENDIENTE	1
916	2000014	79	2018-10-24	1684.82	3.61	18.33	0.37	0.40	22.71	\N	\N	PENDIENTE	1
917	2000014	80	2018-10-25	1666.49	3.57	18.37	0.37	0.40	22.71	\N	\N	PENDIENTE	1
918	2000014	81	2018-10-26	1648.12	3.53	18.41	0.37	0.40	22.71	\N	\N	PENDIENTE	1
919	2000014	82	2018-10-27	1629.71	3.49	18.45	0.37	0.40	22.71	\N	\N	PENDIENTE	1
920	2000014	83	2018-10-29	1611.27	3.45	18.49	0.37	0.40	22.71	\N	\N	PENDIENTE	1
921	2000014	84	2018-10-30	1592.78	3.41	18.52	0.37	0.40	22.71	\N	\N	PENDIENTE	1
922	2000014	85	2018-10-31	1574.26	3.37	18.56	0.37	0.40	22.71	\N	\N	PENDIENTE	1
923	2000014	86	2018-11-02	1555.69	3.33	18.60	0.37	0.40	22.71	\N	\N	PENDIENTE	1
924	2000014	87	2018-11-03	1537.09	3.29	18.64	0.37	0.40	22.71	\N	\N	PENDIENTE	1
925	2000014	88	2018-11-05	1518.45	3.25	18.68	0.37	0.40	22.71	\N	\N	PENDIENTE	1
926	2000014	89	2018-11-06	1499.76	3.21	18.72	0.37	0.40	22.71	\N	\N	PENDIENTE	1
927	2000014	90	2018-11-07	1481.04	3.17	18.76	0.37	0.40	22.71	\N	\N	PENDIENTE	1
928	2000014	91	2018-11-08	1462.27	3.13	18.80	0.37	0.40	22.71	\N	\N	PENDIENTE	1
929	2000014	92	2018-11-09	1443.47	3.09	18.84	0.37	0.40	22.71	\N	\N	PENDIENTE	1
930	2000014	93	2018-11-10	1424.62	3.05	18.89	0.37	0.40	22.71	\N	\N	PENDIENTE	1
931	2000014	94	2018-11-12	1405.74	3.01	18.93	0.37	0.40	22.71	\N	\N	PENDIENTE	1
932	2000014	95	2018-11-13	1386.81	2.97	18.97	0.37	0.40	22.71	\N	\N	PENDIENTE	1
933	2000014	96	2018-11-14	1367.85	2.93	19.01	0.37	0.40	22.71	\N	\N	PENDIENTE	1
934	2000014	97	2018-11-15	1348.84	2.89	19.05	0.37	0.40	22.71	\N	\N	PENDIENTE	1
935	2000014	98	2018-11-16	1329.79	2.85	19.09	0.37	0.40	22.71	\N	\N	PENDIENTE	1
936	2000014	99	2018-11-17	1310.70	2.81	19.13	0.37	0.40	22.71	\N	\N	PENDIENTE	1
937	2000014	100	2018-11-19	1291.57	2.77	19.17	0.37	0.40	22.71	\N	\N	PENDIENTE	1
938	2000014	101	2018-11-20	1272.40	2.73	19.21	0.37	0.40	22.71	\N	\N	PENDIENTE	1
939	2000014	102	2018-11-21	1253.19	2.69	19.25	0.37	0.40	22.71	\N	\N	PENDIENTE	1
940	2000014	103	2018-11-22	1233.94	2.64	19.29	0.37	0.40	22.71	\N	\N	PENDIENTE	1
941	2000014	104	2018-11-23	1214.64	2.60	19.34	0.37	0.40	22.71	\N	\N	PENDIENTE	1
942	2000014	105	2018-11-24	1195.31	2.56	19.38	0.37	0.40	22.71	\N	\N	PENDIENTE	1
943	2000014	106	2018-11-26	1175.93	2.52	19.42	0.37	0.40	22.71	\N	\N	PENDIENTE	1
944	2000014	107	2018-11-27	1156.51	2.48	19.46	0.37	0.40	22.71	\N	\N	PENDIENTE	1
945	2000014	108	2018-11-28	1137.05	2.44	19.50	0.37	0.40	22.71	\N	\N	PENDIENTE	1
946	2000014	109	2018-11-29	1117.55	2.39	19.54	0.37	0.40	22.71	\N	\N	PENDIENTE	1
947	2000014	110	2018-11-30	1098.01	2.35	19.59	0.37	0.40	22.71	\N	\N	PENDIENTE	1
948	2000014	111	2018-12-01	1078.42	2.31	19.63	0.37	0.40	22.71	\N	\N	PENDIENTE	1
949	2000014	112	2018-12-03	1058.80	2.27	19.67	0.37	0.40	22.71	\N	\N	PENDIENTE	1
950	2000014	113	2018-12-04	1039.13	2.23	19.71	0.37	0.40	22.71	\N	\N	PENDIENTE	1
951	2000014	114	2018-12-05	1019.42	2.18	19.75	0.37	0.40	22.71	\N	\N	PENDIENTE	1
952	2000014	115	2018-12-06	999.66	2.14	19.80	0.37	0.40	22.71	\N	\N	PENDIENTE	1
953	2000014	116	2018-12-07	979.87	2.10	19.84	0.37	0.40	22.71	\N	\N	PENDIENTE	1
954	2000014	117	2018-12-09	960.03	2.06	19.88	0.37	0.40	22.71	\N	\N	PENDIENTE	1
955	2000014	118	2018-12-10	940.15	2.01	19.92	0.37	0.40	22.71	\N	\N	PENDIENTE	1
956	2000014	119	2018-12-11	920.23	1.97	19.97	0.37	0.40	22.71	\N	\N	PENDIENTE	1
957	2000014	120	2018-12-12	900.26	1.93	20.01	0.37	0.40	22.71	\N	\N	PENDIENTE	1
958	2000014	121	2018-12-13	880.25	1.89	20.05	0.37	0.40	22.71	\N	\N	PENDIENTE	1
959	2000014	122	2018-12-14	860.20	1.84	20.09	0.37	0.40	22.71	\N	\N	PENDIENTE	1
960	2000014	123	2018-12-15	840.10	1.80	20.14	0.37	0.40	22.71	\N	\N	PENDIENTE	1
961	2000014	124	2018-12-17	819.97	1.76	20.18	0.37	0.40	22.71	\N	\N	PENDIENTE	1
962	2000014	125	2018-12-18	799.78	1.71	20.22	0.37	0.40	22.71	\N	\N	PENDIENTE	1
963	2000014	126	2018-12-19	779.56	1.67	20.27	0.37	0.40	22.71	\N	\N	PENDIENTE	1
964	2000014	127	2018-12-20	759.29	1.63	20.31	0.37	0.40	22.71	\N	\N	PENDIENTE	1
965	2000014	128	2018-12-21	738.98	1.58	20.35	0.37	0.40	22.71	\N	\N	PENDIENTE	1
966	2000014	129	2018-12-22	718.63	1.54	20.40	0.37	0.40	22.71	\N	\N	PENDIENTE	1
967	2000014	130	2018-12-24	698.23	1.50	20.44	0.37	0.40	22.71	\N	\N	PENDIENTE	1
968	2000014	131	2018-12-26	677.79	1.45	20.49	0.37	0.40	22.71	\N	\N	PENDIENTE	1
969	2000014	132	2018-12-27	657.30	1.41	20.53	0.37	0.40	22.71	\N	\N	PENDIENTE	1
970	2000014	133	2018-12-28	636.77	1.36	20.57	0.37	0.40	22.71	\N	\N	PENDIENTE	1
971	2000014	134	2018-12-29	616.20	1.32	20.62	0.37	0.40	22.71	\N	\N	PENDIENTE	1
972	2000014	135	2018-12-31	595.58	1.28	20.66	0.37	0.40	22.71	\N	\N	PENDIENTE	1
973	2000014	136	2019-01-02	574.92	1.23	20.71	0.37	0.40	22.71	\N	\N	PENDIENTE	1
974	2000014	137	2019-01-03	554.21	1.19	20.75	0.37	0.40	22.71	\N	\N	PENDIENTE	1
975	2000014	138	2019-01-04	533.46	1.14	20.79	0.37	0.40	22.71	\N	\N	PENDIENTE	1
976	2000014	139	2019-01-05	512.67	1.10	20.84	0.37	0.40	22.71	\N	\N	PENDIENTE	1
977	2000014	140	2019-01-07	491.83	1.05	20.88	0.37	0.40	22.71	\N	\N	PENDIENTE	1
978	2000014	141	2019-01-08	470.94	1.01	20.93	0.37	0.40	22.71	\N	\N	PENDIENTE	1
979	2000014	142	2019-01-09	450.02	0.96	20.97	0.37	0.40	22.71	\N	\N	PENDIENTE	1
980	2000014	143	2019-01-10	429.04	0.92	21.02	0.37	0.40	22.71	\N	\N	PENDIENTE	1
981	2000014	144	2019-01-11	408.02	0.87	21.06	0.37	0.40	22.71	\N	\N	PENDIENTE	1
982	2000014	145	2019-01-12	386.96	0.83	21.11	0.37	0.40	22.71	\N	\N	PENDIENTE	1
983	2000014	146	2019-01-14	365.85	0.78	21.15	0.37	0.40	22.71	\N	\N	PENDIENTE	1
984	2000014	147	2019-01-15	344.70	0.74	21.20	0.37	0.40	22.71	\N	\N	PENDIENTE	1
985	2000014	148	2019-01-16	323.50	0.69	21.24	0.37	0.40	22.71	\N	\N	PENDIENTE	1
986	2000014	149	2019-01-17	302.25	0.65	21.29	0.37	0.40	22.71	\N	\N	PENDIENTE	1
987	2000014	150	2019-01-18	280.96	0.60	21.34	0.37	0.40	22.71	\N	\N	PENDIENTE	1
988	2000014	151	2019-01-19	259.63	0.56	21.38	0.37	0.40	22.71	\N	\N	PENDIENTE	1
989	2000014	152	2019-01-21	238.24	0.51	21.43	0.37	0.40	22.71	\N	\N	PENDIENTE	1
990	2000014	153	2019-01-22	216.82	0.46	21.47	0.37	0.40	22.71	\N	\N	PENDIENTE	1
991	2000014	154	2019-01-23	195.34	0.42	21.52	0.37	0.40	22.71	\N	\N	PENDIENTE	1
992	2000014	155	2019-01-24	173.82	0.37	21.57	0.37	0.40	22.71	\N	\N	PENDIENTE	1
993	2000014	156	2019-01-25	152.26	0.33	21.61	0.37	0.40	22.71	\N	\N	PENDIENTE	1
994	2000014	157	2019-01-26	130.65	0.28	21.66	0.37	0.40	22.71	\N	\N	PENDIENTE	1
995	2000014	158	2019-01-28	108.99	0.23	21.70	0.37	0.40	22.71	\N	\N	PENDIENTE	1
996	2000014	159	2019-01-29	87.28	0.19	21.75	0.37	0.40	22.71	\N	\N	PENDIENTE	1
997	2000014	160	2019-01-30	65.53	0.14	21.80	0.37	0.40	22.71	\N	\N	PENDIENTE	1
998	2000014	161	2019-01-31	43.74	0.09	21.84	0.37	0.40	22.71	\N	\N	PENDIENTE	1
999	2000014	162	2019-02-01	21.89	0.05	21.89	0.37	0.40	22.71	\N	\N	PENDIENTE	1
1000	2000015	1	2018-07-27	500.00	14.38	56.48	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1001	2000015	2	2018-08-03	443.52	12.75	58.10	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1002	2000015	3	2018-08-10	385.42	11.08	59.77	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1003	2000015	4	2018-08-17	325.65	9.36	61.49	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1004	2000015	5	2018-08-24	264.16	7.59	63.26	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1005	2000015	6	2018-08-31	200.90	5.78	65.08	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1006	2000015	7	2018-09-07	135.82	3.90	66.95	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1007	2000015	8	2018-09-14	68.87	1.98	68.87	2.50	2.50	75.85	\N	\N	PENDIENTE	1
1008	2000016	1	2018-07-27	500.00	9.38	37.54	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1009	2000016	2	2018-08-03	462.46	8.67	38.25	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1010	2000016	3	2018-08-10	424.21	7.95	38.96	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1011	2000016	4	2018-08-17	385.25	7.22	39.69	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1012	2000016	5	2018-08-24	345.55	6.48	40.44	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1013	2000016	6	2018-08-31	305.11	5.72	41.20	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1014	2000016	7	2018-09-07	263.92	4.95	41.97	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1015	2000016	8	2018-09-14	221.95	4.16	42.76	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1016	2000016	9	2018-09-21	179.19	3.36	43.56	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1017	2000016	10	2018-09-28	135.63	2.54	44.37	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1018	2000016	11	2018-10-05	91.26	1.71	45.21	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1019	2000016	12	2018-10-12	46.05	0.86	46.05	2.50	2.50	51.92	\N	\N	PENDIENTE	1
1020	2000017	1	2018-07-21	3000.00	6.96	18.95	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1021	2000017	2	2018-07-23	2981.05	6.92	18.99	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1022	2000017	3	2018-07-24	2962.06	6.88	19.04	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1023	2000017	4	2018-07-25	2943.03	6.83	19.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1024	2000017	5	2018-07-26	2923.95	6.79	19.12	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1025	2000017	6	2018-07-27	2904.82	6.74	19.17	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1026	2000017	7	2018-07-30	2885.65	6.70	19.21	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1027	2000017	8	2018-07-31	2866.44	6.65	19.26	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1028	2000017	9	2018-08-01	2847.18	6.61	19.30	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1029	2000017	10	2018-08-02	2827.88	6.56	19.35	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1030	2000017	11	2018-08-03	2808.54	6.52	19.39	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1031	2000017	12	2018-08-04	2789.14	6.47	19.44	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1032	2000017	13	2018-08-06	2769.71	6.43	19.48	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1033	2000017	14	2018-08-07	2750.23	6.38	19.53	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1034	2000017	15	2018-08-08	2730.70	6.34	19.57	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1035	2000017	16	2018-08-09	2711.13	6.29	19.62	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1036	2000017	17	2018-08-10	2691.51	6.25	19.66	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1037	2000017	18	2018-08-11	2671.85	6.20	19.71	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1038	2000017	19	2018-08-13	2652.14	6.16	19.75	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1039	2000017	20	2018-08-14	2632.38	6.11	19.80	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1040	2000017	21	2018-08-15	2612.58	6.06	19.85	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1041	2000017	22	2018-08-16	2592.73	6.02	19.89	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1042	2000017	23	2018-08-17	2572.84	5.97	19.94	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1043	2000017	24	2018-08-18	2552.90	5.93	19.99	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1044	2000017	25	2018-08-20	2532.92	5.88	20.03	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1045	2000017	26	2018-08-21	2512.89	5.83	20.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1046	2000017	27	2018-08-22	2492.81	5.79	20.12	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1047	2000017	28	2018-08-23	2472.68	5.74	20.17	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1048	2000017	29	2018-08-24	2452.51	5.69	20.22	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1049	2000017	30	2018-08-25	2432.29	5.65	20.27	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1050	2000017	31	2018-08-27	2412.03	5.60	20.31	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1051	2000017	32	2018-08-28	2391.72	5.55	20.36	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1052	2000017	33	2018-08-29	2371.36	5.50	20.41	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1053	2000017	34	2018-08-31	2350.95	5.46	20.45	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1054	2000017	35	2018-09-01	2330.50	5.41	20.50	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1055	2000017	36	2018-09-03	2309.99	5.36	20.55	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1056	2000017	37	2018-09-04	2289.45	5.31	20.60	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1057	2000017	38	2018-09-05	2268.85	5.27	20.64	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1058	2000017	39	2018-09-06	2248.20	5.22	20.69	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1059	2000017	40	2018-09-07	2227.51	5.17	20.74	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1060	2000017	41	2018-09-08	2206.77	5.12	20.79	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1061	2000017	42	2018-09-10	2185.98	5.07	20.84	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1062	2000017	43	2018-09-11	2165.15	5.03	20.89	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1063	2000017	44	2018-09-12	2144.26	4.98	20.93	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1064	2000017	45	2018-09-13	2123.33	4.93	20.98	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1065	2000017	46	2018-09-14	2102.34	4.88	21.03	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1066	2000017	47	2018-09-15	2081.31	4.83	21.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1067	2000017	48	2018-09-17	2060.23	4.78	21.13	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1068	2000017	49	2018-09-18	2039.10	4.73	21.18	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1069	2000017	50	2018-09-19	2017.93	4.68	21.23	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1070	2000017	51	2018-09-20	1996.70	4.64	21.28	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1071	2000017	52	2018-09-21	1975.42	4.59	21.33	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1072	2000017	53	2018-09-22	1954.10	4.54	21.38	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1073	2000017	54	2018-09-24	1932.72	4.49	21.42	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1074	2000017	55	2018-09-25	1911.30	4.44	21.47	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1075	2000017	56	2018-09-26	1889.82	4.39	21.52	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1076	2000017	57	2018-09-27	1868.30	4.34	21.57	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1077	2000017	58	2018-09-28	1846.72	4.29	21.62	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1078	2000017	59	2018-09-29	1825.10	4.24	21.67	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1079	2000017	60	2018-10-01	1803.43	4.19	21.72	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1080	2000017	61	2018-10-02	1781.70	4.14	21.78	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1081	2000017	62	2018-10-03	1759.92	4.09	21.83	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1082	2000017	63	2018-10-04	1738.10	4.03	21.88	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1083	2000017	64	2018-10-05	1716.22	3.98	21.93	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1084	2000017	65	2018-10-06	1694.29	3.93	21.98	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1085	2000017	66	2018-10-09	1672.32	3.88	22.03	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1086	2000017	67	2018-10-10	1650.29	3.83	22.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1087	2000017	68	2018-10-11	1628.21	3.78	22.13	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1088	2000017	69	2018-10-12	1606.07	3.73	22.18	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1089	2000017	70	2018-10-13	1583.89	3.68	22.23	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1090	2000017	71	2018-10-15	1561.66	3.63	22.29	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1091	2000017	72	2018-10-16	1539.37	3.57	22.34	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1092	2000017	73	2018-10-17	1517.03	3.52	22.39	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1093	2000017	74	2018-10-18	1494.64	3.47	22.44	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1094	2000017	75	2018-10-19	1472.20	3.42	22.49	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1095	2000017	76	2018-10-20	1449.71	3.37	22.55	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1096	2000017	77	2018-10-22	1427.16	3.31	22.60	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1097	2000017	78	2018-10-23	1404.56	3.26	22.65	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1098	2000017	79	2018-10-24	1381.91	3.21	22.70	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1099	2000017	80	2018-10-25	1359.21	3.16	22.76	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1100	2000017	81	2018-10-26	1336.45	3.10	22.81	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1101	2000017	82	2018-10-27	1313.64	3.05	22.86	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1102	2000017	83	2018-10-29	1290.78	3.00	22.92	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1103	2000017	84	2018-10-30	1267.87	2.94	22.97	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1104	2000017	85	2018-10-31	1244.90	2.89	23.02	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1105	2000017	86	2018-11-02	1221.88	2.84	23.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1106	2000017	87	2018-11-03	1198.80	2.78	23.13	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1107	2000017	88	2018-11-05	1175.67	2.73	23.18	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1108	2000017	89	2018-11-06	1152.49	2.68	23.24	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1109	2000017	90	2018-11-07	1129.25	2.62	23.29	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1110	2000017	91	2018-11-08	1105.96	2.57	23.34	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1111	2000017	92	2018-11-09	1082.62	2.51	23.40	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1112	2000017	93	2018-11-10	1059.22	2.46	23.45	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1113	2000017	94	2018-11-12	1035.77	2.40	23.51	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1114	2000017	95	2018-11-13	1012.26	2.35	23.56	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1115	2000017	96	2018-11-14	988.70	2.30	23.62	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1116	2000017	97	2018-11-15	965.08	2.24	23.67	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1117	2000017	98	2018-11-16	941.41	2.19	23.73	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1118	2000017	99	2018-11-17	917.69	2.13	23.78	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1119	2000017	100	2018-11-19	893.91	2.08	23.84	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1120	2000017	101	2018-11-20	870.07	2.02	23.89	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1121	2000017	102	2018-11-21	846.18	1.96	23.95	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1122	2000017	103	2018-11-22	822.23	1.91	24.00	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1123	2000017	104	2018-11-23	798.23	1.85	24.06	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1124	2000017	105	2018-11-24	774.17	1.80	24.11	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1125	2000017	106	2018-11-26	750.05	1.74	24.17	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1126	2000017	107	2018-11-27	725.88	1.69	24.23	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1127	2000017	108	2018-11-28	701.66	1.63	24.28	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1128	2000017	109	2018-11-29	677.38	1.57	24.34	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1129	2000017	110	2018-11-30	653.04	1.52	24.40	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1130	2000017	111	2018-12-01	628.64	1.46	24.45	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1131	2000017	112	2018-12-03	604.19	1.40	24.51	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1132	2000017	113	2018-12-04	579.68	1.35	24.57	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1133	2000017	114	2018-12-05	555.11	1.29	24.62	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1134	2000017	115	2018-12-06	530.49	1.23	24.68	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1135	2000017	116	2018-12-07	505.81	1.17	24.74	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1136	2000017	117	2018-12-09	481.07	1.12	24.79	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1137	2000017	118	2018-12-10	456.28	1.06	24.85	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1138	2000017	119	2018-12-11	431.43	1.00	24.91	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1139	2000017	120	2018-12-12	406.52	0.94	24.97	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1140	2000017	121	2018-12-13	381.55	0.89	25.03	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1141	2000017	122	2018-12-14	356.52	0.83	25.08	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1142	2000017	123	2018-12-15	331.44	0.77	25.14	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1143	2000017	124	2018-12-17	306.30	0.71	25.20	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1144	2000017	125	2018-12-18	281.10	0.65	25.26	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1145	2000017	126	2018-12-19	255.84	0.59	25.32	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1146	2000017	127	2018-12-20	230.52	0.54	25.38	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1147	2000017	128	2018-12-21	205.14	0.48	25.44	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1148	2000017	129	2018-12-22	179.71	0.42	25.49	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1149	2000017	130	2018-12-24	154.21	0.36	25.55	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1150	2000017	131	2018-12-26	128.66	0.30	25.61	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1151	2000017	132	2018-12-27	103.05	0.24	25.67	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1152	2000017	133	2018-12-28	77.38	0.18	25.73	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1153	2000017	134	2018-12-29	51.64	0.12	25.79	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1154	2000017	135	2018-12-31	25.85	0.06	25.85	0.37	0.40	26.68	\N	\N	PENDIENTE	1
1155	2000018	1	2018-07-21	1500.00	3.21	7.75	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1156	2000018	2	2018-07-23	1492.25	3.20	7.77	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1157	2000018	3	2018-07-24	1484.47	3.18	7.79	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1158	2000018	4	2018-07-25	1476.69	3.16	7.80	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1159	2000018	5	2018-07-26	1468.88	3.15	7.82	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1160	2000018	6	2018-07-27	1461.06	3.13	7.84	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1161	2000018	7	2018-07-30	1453.22	3.11	7.85	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1162	2000018	8	2018-07-31	1445.37	3.10	7.87	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1163	2000018	9	2018-08-01	1437.49	3.08	7.89	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1164	2000018	10	2018-08-02	1429.61	3.06	7.91	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1165	2000018	11	2018-08-03	1421.70	3.05	7.92	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1166	2000018	12	2018-08-04	1413.78	3.03	7.94	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1167	2000018	13	2018-08-06	1405.84	3.01	7.96	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1168	2000018	14	2018-08-07	1397.88	3.00	7.97	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1169	2000018	15	2018-08-08	1389.91	2.98	7.99	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1170	2000018	16	2018-08-09	1381.92	2.96	8.01	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1171	2000018	17	2018-08-10	1373.91	2.94	8.02	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1172	2000018	18	2018-08-11	1365.89	2.93	8.04	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1173	2000018	19	2018-08-13	1357.84	2.91	8.06	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1174	2000018	20	2018-08-14	1349.78	2.89	8.08	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1175	2000018	21	2018-08-15	1341.71	2.88	8.09	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1176	2000018	22	2018-08-16	1333.61	2.86	8.11	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1177	2000018	23	2018-08-17	1325.50	2.84	8.13	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1178	2000018	24	2018-08-18	1317.37	2.82	8.15	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1179	2000018	25	2018-08-20	1309.23	2.81	8.16	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1180	2000018	26	2018-08-21	1301.06	2.79	8.18	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1181	2000018	27	2018-08-22	1292.88	2.77	8.20	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1182	2000018	28	2018-08-23	1284.68	2.75	8.22	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1183	2000018	29	2018-08-24	1276.47	2.74	8.23	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1184	2000018	30	2018-08-25	1268.23	2.72	8.25	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1185	2000018	31	2018-08-27	1259.98	2.70	8.27	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1186	2000018	32	2018-08-28	1251.71	2.68	8.29	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1187	2000018	33	2018-08-29	1243.43	2.66	8.30	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1188	2000018	34	2018-08-31	1235.12	2.65	8.32	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1189	2000018	35	2018-09-01	1226.80	2.63	8.34	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1190	2000018	36	2018-09-03	1218.46	2.61	8.36	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1191	2000018	37	2018-09-04	1210.10	2.59	8.38	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1192	2000018	38	2018-09-05	1201.73	2.58	8.39	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1193	2000018	39	2018-09-06	1193.33	2.56	8.41	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1194	2000018	40	2018-09-07	1184.92	2.54	8.43	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1195	2000018	41	2018-09-08	1176.49	2.52	8.45	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1196	2000018	42	2018-09-10	1168.04	2.50	8.47	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1197	2000018	43	2018-09-11	1159.58	2.48	8.48	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1198	2000018	44	2018-09-12	1151.09	2.47	8.50	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1199	2000018	45	2018-09-13	1142.59	2.45	8.52	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1200	2000018	46	2018-09-14	1134.07	2.43	8.54	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1201	2000018	47	2018-09-15	1125.53	2.41	8.56	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1202	2000018	48	2018-09-17	1116.97	2.39	8.58	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1203	2000018	49	2018-09-18	1108.40	2.38	8.59	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1204	2000018	50	2018-09-19	1099.80	2.36	8.61	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1205	2000018	51	2018-09-20	1091.19	2.34	8.63	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1206	2000018	52	2018-09-21	1082.56	2.32	8.65	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1207	2000018	53	2018-09-22	1073.91	2.30	8.67	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1208	2000018	54	2018-09-24	1065.24	2.28	8.69	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1209	2000018	55	2018-09-25	1056.56	2.26	8.70	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1210	2000018	56	2018-09-26	1047.85	2.25	8.72	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1211	2000018	57	2018-09-27	1039.13	2.23	8.74	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1212	2000018	58	2018-09-28	1030.39	2.21	8.76	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1213	2000018	59	2018-09-29	1021.63	2.19	8.78	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1214	2000018	60	2018-10-01	1012.85	2.17	8.80	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1215	2000018	61	2018-10-02	1004.05	2.15	8.82	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1216	2000018	62	2018-10-03	995.23	2.13	8.84	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1217	2000018	63	2018-10-04	986.39	2.11	8.86	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1218	2000018	64	2018-10-05	977.54	2.09	8.87	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1219	2000018	65	2018-10-06	968.66	2.08	8.89	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1220	2000018	66	2018-10-09	959.77	2.06	8.91	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1221	2000018	67	2018-10-10	950.86	2.04	8.93	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1222	2000018	68	2018-10-11	941.93	2.02	8.95	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1223	2000018	69	2018-10-12	932.98	2.00	8.97	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1224	2000018	70	2018-10-13	924.01	1.98	8.99	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1225	2000018	71	2018-10-15	915.02	1.96	9.01	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1226	2000018	72	2018-10-16	906.01	1.94	9.03	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1227	2000018	73	2018-10-17	896.98	1.92	9.05	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1228	2000018	74	2018-10-18	887.93	1.90	9.07	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1229	2000018	75	2018-10-19	878.87	1.88	9.09	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1230	2000018	76	2018-10-20	869.78	1.86	9.11	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1231	2000018	77	2018-10-22	860.68	1.84	9.12	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1232	2000018	78	2018-10-23	851.55	1.82	9.14	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1233	2000018	79	2018-10-24	842.41	1.81	9.16	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1234	2000018	80	2018-10-25	833.24	1.79	9.18	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1235	2000018	81	2018-10-26	824.06	1.77	9.20	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1236	2000018	82	2018-10-27	814.86	1.75	9.22	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1237	2000018	83	2018-10-29	805.63	1.73	9.24	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1238	2000018	84	2018-10-30	796.39	1.71	9.26	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1239	2000018	85	2018-10-31	787.13	1.69	9.28	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1240	2000018	86	2018-11-02	777.85	1.67	9.30	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1241	2000018	87	2018-11-03	768.54	1.65	9.32	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1242	2000018	88	2018-11-05	759.22	1.63	9.34	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1243	2000018	89	2018-11-06	749.88	1.61	9.36	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1244	2000018	90	2018-11-07	740.52	1.59	9.38	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1245	2000018	91	2018-11-08	731.14	1.57	9.40	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1246	2000018	92	2018-11-09	721.73	1.55	9.42	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1247	2000018	93	2018-11-10	712.31	1.53	9.44	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1248	2000018	94	2018-11-12	702.87	1.51	9.46	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1249	2000018	95	2018-11-13	693.41	1.49	9.48	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1250	2000018	96	2018-11-14	683.92	1.47	9.50	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1251	2000018	97	2018-11-15	674.42	1.45	9.52	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1252	2000018	98	2018-11-16	664.90	1.42	9.54	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1253	2000018	99	2018-11-17	655.35	1.40	9.56	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1254	2000018	100	2018-11-19	645.79	1.38	9.59	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1255	2000018	101	2018-11-20	636.20	1.36	9.61	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1256	2000018	102	2018-11-21	626.60	1.34	9.63	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1257	2000018	103	2018-11-22	616.97	1.32	9.65	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1258	2000018	104	2018-11-23	607.32	1.30	9.67	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1259	2000018	105	2018-11-24	597.65	1.28	9.69	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1260	2000018	106	2018-11-26	587.97	1.26	9.71	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1261	2000018	107	2018-11-27	578.26	1.24	9.73	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1262	2000018	108	2018-11-28	568.53	1.22	9.75	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1263	2000018	109	2018-11-29	558.78	1.20	9.77	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1264	2000018	110	2018-11-30	549.00	1.18	9.79	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1265	2000018	111	2018-12-01	539.21	1.16	9.81	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1266	2000018	112	2018-12-03	529.40	1.13	9.83	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1267	2000018	113	2018-12-04	519.56	1.11	9.86	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1268	2000018	114	2018-12-05	509.71	1.09	9.88	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1269	2000018	115	2018-12-06	499.83	1.07	9.90	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1270	2000018	116	2018-12-07	489.93	1.05	9.92	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1271	2000018	117	2018-12-09	480.01	1.03	9.94	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1272	2000018	118	2018-12-10	470.07	1.01	9.96	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1273	2000018	119	2018-12-11	460.11	0.99	9.98	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1274	2000018	120	2018-12-12	450.13	0.96	10.00	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1275	2000018	121	2018-12-13	440.13	0.94	10.03	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1276	2000018	122	2018-12-14	430.10	0.92	10.05	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1277	2000018	123	2018-12-15	420.05	0.90	10.07	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1278	2000018	124	2018-12-17	409.98	0.88	10.09	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1279	2000018	125	2018-12-18	399.89	0.86	10.11	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1280	2000018	126	2018-12-19	389.78	0.84	10.13	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1281	2000018	127	2018-12-20	379.65	0.81	10.16	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1282	2000018	128	2018-12-21	369.49	0.79	10.18	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1283	2000018	129	2018-12-22	359.31	0.77	10.20	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1284	2000018	130	2018-12-24	349.11	0.75	10.22	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1285	2000018	131	2018-12-26	338.89	0.73	10.24	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1286	2000018	132	2018-12-27	328.65	0.70	10.26	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1287	2000018	133	2018-12-28	318.39	0.68	10.29	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1288	2000018	134	2018-12-29	308.10	0.66	10.31	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1289	2000018	135	2018-12-31	297.79	0.64	10.33	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1290	2000018	136	2019-01-02	287.46	0.62	10.35	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1291	2000018	137	2019-01-03	277.11	0.59	10.38	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1292	2000018	138	2019-01-04	266.73	0.57	10.40	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1293	2000018	139	2019-01-05	256.33	0.55	10.42	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1294	2000018	140	2019-01-07	245.91	0.53	10.44	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1295	2000018	141	2019-01-08	235.47	0.50	10.46	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1296	2000018	142	2019-01-09	225.01	0.48	10.49	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1297	2000018	143	2019-01-10	214.52	0.46	10.51	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1298	2000018	144	2019-01-11	204.01	0.44	10.53	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1299	2000018	145	2019-01-12	193.48	0.41	10.55	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1300	2000018	146	2019-01-14	182.93	0.39	10.58	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1301	2000018	147	2019-01-15	172.35	0.37	10.60	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1302	2000018	148	2019-01-16	161.75	0.35	10.62	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1303	2000018	149	2019-01-17	151.13	0.32	10.65	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1304	2000018	150	2019-01-18	140.48	0.30	10.67	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1305	2000018	151	2019-01-19	129.81	0.28	10.69	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1306	2000018	152	2019-01-21	119.12	0.26	10.71	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1307	2000018	153	2019-01-22	108.41	0.23	10.74	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1308	2000018	154	2019-01-23	97.67	0.21	10.76	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1309	2000018	155	2019-01-24	86.91	0.19	10.78	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1310	2000018	156	2019-01-25	76.13	0.16	10.81	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1311	2000018	157	2019-01-26	65.32	0.14	10.83	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1312	2000018	158	2019-01-28	54.49	0.12	10.85	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1313	2000018	159	2019-01-29	43.64	0.09	10.88	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1314	2000018	160	2019-01-30	32.77	0.07	10.90	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1315	2000018	161	2019-01-31	21.87	0.05	10.92	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1316	2000018	162	2019-02-01	10.95	0.02	10.95	0.37	0.40	11.74	\N	\N	PENDIENTE	1
1317	2000019	1	2018-07-21	1000.00	2.32	6.32	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1318	2000019	2	2018-07-23	993.68	2.31	6.33	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1319	2000019	3	2018-07-24	987.35	2.29	6.35	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1320	2000019	4	2018-07-25	981.01	2.28	6.36	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1321	2000019	5	2018-07-26	974.65	2.26	6.37	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1322	2000019	6	2018-07-27	968.27	2.25	6.39	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1323	2000019	7	2018-07-30	961.88	2.23	6.40	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1324	2000019	8	2018-07-31	955.48	2.22	6.42	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1325	2000019	9	2018-08-01	949.06	2.20	6.43	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1326	2000019	10	2018-08-02	942.63	2.19	6.45	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1327	2000019	11	2018-08-03	936.18	2.17	6.46	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1328	2000019	12	2018-08-04	929.71	2.16	6.48	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1329	2000019	13	2018-08-06	923.24	2.14	6.49	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1330	2000019	14	2018-08-07	916.74	2.13	6.51	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1331	2000019	15	2018-08-08	910.23	2.11	6.52	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1332	2000019	16	2018-08-09	903.71	2.10	6.54	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1333	2000019	17	2018-08-10	897.17	2.08	6.55	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1334	2000019	18	2018-08-11	890.62	2.07	6.57	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1335	2000019	19	2018-08-13	884.05	2.05	6.58	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1336	2000019	20	2018-08-14	877.46	2.04	6.60	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1337	2000019	21	2018-08-15	870.86	2.02	6.62	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1338	2000019	22	2018-08-16	864.24	2.01	6.63	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1339	2000019	23	2018-08-17	857.61	1.99	6.65	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1340	2000019	24	2018-08-18	850.97	1.98	6.66	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1341	2000019	25	2018-08-20	844.31	1.96	6.68	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1342	2000019	26	2018-08-21	837.63	1.94	6.69	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1343	2000019	27	2018-08-22	830.94	1.93	6.71	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1344	2000019	28	2018-08-23	824.23	1.91	6.72	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1345	2000019	29	2018-08-24	817.50	1.90	6.74	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1346	2000019	30	2018-08-25	810.76	1.88	6.76	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1347	2000019	31	2018-08-27	804.01	1.87	6.77	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1348	2000019	32	2018-08-28	797.24	1.85	6.79	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1349	2000019	33	2018-08-29	790.45	1.83	6.80	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1350	2000019	34	2018-08-31	783.65	1.82	6.82	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1351	2000019	35	2018-09-01	776.83	1.80	6.83	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1352	2000019	36	2018-09-03	770.00	1.79	6.85	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1353	2000019	37	2018-09-04	763.15	1.77	6.87	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1354	2000019	38	2018-09-05	756.28	1.76	6.88	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1355	2000019	39	2018-09-06	749.40	1.74	6.90	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1356	2000019	40	2018-09-07	742.50	1.72	6.91	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1357	2000019	41	2018-09-08	735.59	1.71	6.93	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1358	2000019	42	2018-09-10	728.66	1.69	6.95	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1359	2000019	43	2018-09-11	721.72	1.68	6.96	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1360	2000019	44	2018-09-12	714.75	1.66	6.98	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1361	2000019	45	2018-09-13	707.78	1.64	6.99	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1362	2000019	46	2018-09-14	700.78	1.63	7.01	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1363	2000019	47	2018-09-15	693.77	1.61	7.03	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1364	2000019	48	2018-09-17	686.74	1.59	7.04	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1365	2000019	49	2018-09-18	679.70	1.58	7.06	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1366	2000019	50	2018-09-19	672.64	1.56	7.08	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1367	2000019	51	2018-09-20	665.57	1.55	7.09	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1368	2000019	52	2018-09-21	658.47	1.53	7.11	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1369	2000019	53	2018-09-22	651.37	1.51	7.13	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1370	2000019	54	2018-09-24	644.24	1.50	7.14	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1371	2000019	55	2018-09-25	637.10	1.48	7.16	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1372	2000019	56	2018-09-26	629.94	1.46	7.17	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1373	2000019	57	2018-09-27	622.77	1.45	7.19	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1374	2000019	58	2018-09-28	615.57	1.43	7.21	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1375	2000019	59	2018-09-29	608.37	1.41	7.22	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1376	2000019	60	2018-10-01	601.14	1.40	7.24	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1377	2000019	61	2018-10-02	593.90	1.38	7.26	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1378	2000019	62	2018-10-03	586.64	1.36	7.28	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1379	2000019	63	2018-10-04	579.37	1.34	7.29	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1380	2000019	64	2018-10-05	572.07	1.33	7.31	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1381	2000019	65	2018-10-06	564.76	1.31	7.33	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1382	2000019	66	2018-10-09	557.44	1.29	7.34	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1383	2000019	67	2018-10-10	550.10	1.28	7.36	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1384	2000019	68	2018-10-11	542.74	1.26	7.38	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1385	2000019	69	2018-10-12	535.36	1.24	7.39	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1386	2000019	70	2018-10-13	527.96	1.23	7.41	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1387	2000019	71	2018-10-15	520.55	1.21	7.43	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1388	2000019	72	2018-10-16	513.12	1.19	7.45	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1389	2000019	73	2018-10-17	505.68	1.17	7.46	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1390	2000019	74	2018-10-18	498.21	1.16	7.48	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1391	2000019	75	2018-10-19	490.73	1.14	7.50	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1392	2000019	76	2018-10-20	483.24	1.12	7.52	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1393	2000019	77	2018-10-22	475.72	1.10	7.53	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1394	2000019	78	2018-10-23	468.19	1.09	7.55	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1395	2000019	79	2018-10-24	460.64	1.07	7.57	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1396	2000019	80	2018-10-25	453.07	1.05	7.59	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1397	2000019	81	2018-10-26	445.48	1.03	7.60	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1398	2000019	82	2018-10-27	437.88	1.02	7.62	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1399	2000019	83	2018-10-29	430.26	1.00	7.64	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1400	2000019	84	2018-10-30	422.62	0.98	7.66	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1401	2000019	85	2018-10-31	414.97	0.96	7.67	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1402	2000019	86	2018-11-02	407.29	0.95	7.69	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1403	2000019	87	2018-11-03	399.60	0.93	7.71	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1404	2000019	88	2018-11-05	391.89	0.91	7.73	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1405	2000019	89	2018-11-06	384.16	0.89	7.75	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1406	2000019	90	2018-11-07	376.42	0.87	7.76	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1407	2000019	91	2018-11-08	368.65	0.86	7.78	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1408	2000019	92	2018-11-09	360.87	0.84	7.80	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1409	2000019	93	2018-11-10	353.07	0.82	7.82	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1410	2000019	94	2018-11-12	345.26	0.80	7.84	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1411	2000019	95	2018-11-13	337.42	0.78	7.85	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1412	2000019	96	2018-11-14	329.57	0.77	7.87	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1413	2000019	97	2018-11-15	321.69	0.75	7.89	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1414	2000019	98	2018-11-16	313.80	0.73	7.91	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1415	2000019	99	2018-11-17	305.90	0.71	7.93	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1416	2000019	100	2018-11-19	297.97	0.69	7.95	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1417	2000019	101	2018-11-20	290.02	0.67	7.96	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1418	2000019	102	2018-11-21	282.06	0.65	7.98	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1419	2000019	103	2018-11-22	274.08	0.64	8.00	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1420	2000019	104	2018-11-23	266.08	0.62	8.02	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1421	2000019	105	2018-11-24	258.06	0.60	8.04	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1422	2000019	106	2018-11-26	250.02	0.58	8.06	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1423	2000019	107	2018-11-27	241.96	0.56	8.08	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1424	2000019	108	2018-11-28	233.89	0.54	8.09	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1425	2000019	109	2018-11-29	225.79	0.52	8.11	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1426	2000019	110	2018-11-30	217.68	0.51	8.13	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1427	2000019	111	2018-12-01	209.55	0.49	8.15	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1428	2000019	112	2018-12-03	201.40	0.47	8.17	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1429	2000019	113	2018-12-04	193.23	0.45	8.19	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1430	2000019	114	2018-12-05	185.04	0.43	8.21	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1431	2000019	115	2018-12-06	176.83	0.41	8.23	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1432	2000019	116	2018-12-07	168.60	0.39	8.25	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1433	2000019	117	2018-12-09	160.36	0.37	8.26	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1434	2000019	118	2018-12-10	152.09	0.35	8.28	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1435	2000019	119	2018-12-11	143.81	0.33	8.30	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1436	2000019	120	2018-12-12	135.51	0.31	8.32	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1437	2000019	121	2018-12-13	127.18	0.30	8.34	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1438	2000019	122	2018-12-14	118.84	0.28	8.36	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1439	2000019	123	2018-12-15	110.48	0.26	8.38	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1440	2000019	124	2018-12-17	102.10	0.24	8.40	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1441	2000019	125	2018-12-18	93.70	0.22	8.42	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1442	2000019	126	2018-12-19	85.28	0.20	8.44	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1443	2000019	127	2018-12-20	76.84	0.18	8.46	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1444	2000019	128	2018-12-21	68.38	0.16	8.48	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1445	2000019	129	2018-12-22	59.90	0.14	8.50	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1446	2000019	130	2018-12-24	51.40	0.12	8.52	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1447	2000019	131	2018-12-26	42.89	0.10	8.54	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1448	2000019	132	2018-12-27	34.35	0.08	8.56	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1449	2000019	133	2018-12-28	25.79	0.06	8.58	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1450	2000019	134	2018-12-29	17.21	0.04	8.60	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1451	2000019	135	2018-12-31	8.62	0.02	8.62	0.37	0.40	9.41	\N	\N	PENDIENTE	1
1452	2000020	1	2018-07-23	1000.00	2.32	11.24	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1453	2000020	2	2018-07-24	988.76	2.30	11.26	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1454	2000020	3	2018-07-25	977.50	2.27	11.29	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1455	2000020	4	2018-07-26	966.21	2.24	11.31	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1456	2000020	5	2018-07-27	954.90	2.22	11.34	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1457	2000020	6	2018-07-30	943.56	2.19	11.37	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1458	2000020	7	2018-07-31	932.19	2.16	11.39	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1459	2000020	8	2018-08-01	920.80	2.14	11.42	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1460	2000020	9	2018-08-02	909.38	2.11	11.45	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1461	2000020	10	2018-08-03	897.94	2.08	11.47	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1462	2000020	11	2018-08-04	886.46	2.06	11.50	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1463	2000020	12	2018-08-06	874.96	2.03	11.53	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1464	2000020	13	2018-08-07	863.44	2.00	11.55	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1465	2000020	14	2018-08-08	851.89	1.98	11.58	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1466	2000020	15	2018-08-09	840.31	1.95	11.61	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1467	2000020	16	2018-08-10	828.70	1.92	11.63	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1468	2000020	17	2018-08-11	817.07	1.90	11.66	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1469	2000020	18	2018-08-13	805.41	1.87	11.69	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1470	2000020	19	2018-08-14	793.72	1.84	11.71	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1471	2000020	20	2018-08-15	782.00	1.82	11.74	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1472	2000020	21	2018-08-16	770.26	1.79	11.77	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1473	2000020	22	2018-08-17	758.49	1.76	11.80	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1474	2000020	23	2018-08-18	746.70	1.73	11.82	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1475	2000020	24	2018-08-20	734.87	1.71	11.85	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1476	2000020	25	2018-08-21	723.02	1.68	11.88	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1477	2000020	26	2018-08-22	711.14	1.65	11.91	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1478	2000020	27	2018-08-23	699.24	1.62	11.93	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1479	2000020	28	2018-08-24	687.30	1.60	11.96	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1480	2000020	29	2018-08-25	675.34	1.57	11.99	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1481	2000020	30	2018-08-27	663.35	1.54	12.02	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1482	2000020	31	2018-08-28	651.34	1.51	12.04	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1483	2000020	32	2018-08-29	639.29	1.48	12.07	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1484	2000020	33	2018-08-31	627.22	1.46	12.10	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1485	2000020	34	2018-09-01	615.12	1.43	12.13	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1486	2000020	35	2018-09-03	602.99	1.40	12.16	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1487	2000020	36	2018-09-04	590.83	1.37	12.19	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1488	2000020	37	2018-09-05	578.65	1.34	12.21	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1489	2000020	38	2018-09-06	566.43	1.31	12.24	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1490	2000020	39	2018-09-07	554.19	1.29	12.27	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1491	2000020	40	2018-09-08	541.92	1.26	12.30	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1492	2000020	41	2018-09-10	529.62	1.23	12.33	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1493	2000020	42	2018-09-11	517.29	1.20	12.36	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1494	2000020	43	2018-09-12	504.94	1.17	12.38	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1495	2000020	44	2018-09-13	492.55	1.14	12.41	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1496	2000020	45	2018-09-14	480.14	1.11	12.44	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1497	2000020	46	2018-09-15	467.70	1.09	12.47	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1498	2000020	47	2018-09-17	455.22	1.06	12.50	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1499	2000020	48	2018-09-18	442.72	1.03	12.53	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1500	2000020	49	2018-09-19	430.19	1.00	12.56	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1501	2000020	50	2018-09-20	417.64	0.97	12.59	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1502	2000020	51	2018-09-21	405.05	0.94	12.62	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1503	2000020	52	2018-09-22	392.43	0.91	12.65	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1504	2000020	53	2018-09-24	379.79	0.88	12.68	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1505	2000020	54	2018-09-25	367.11	0.85	12.70	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1506	2000020	55	2018-09-26	354.41	0.82	12.73	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1507	2000020	56	2018-09-27	341.67	0.79	12.76	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1508	2000020	57	2018-09-28	328.91	0.76	12.79	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1509	2000020	58	2018-09-29	316.11	0.73	12.82	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1510	2000020	59	2018-10-01	303.29	0.70	12.85	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1511	2000020	60	2018-10-02	290.44	0.67	12.88	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1512	2000020	61	2018-10-03	277.56	0.64	12.91	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1513	2000020	62	2018-10-04	264.64	0.61	12.94	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1514	2000020	63	2018-10-05	251.70	0.58	12.97	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1515	2000020	64	2018-10-06	238.73	0.55	13.00	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1516	2000020	65	2018-10-09	225.72	0.52	13.03	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1517	2000020	66	2018-10-10	212.69	0.49	13.06	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1518	2000020	67	2018-10-11	199.63	0.46	13.09	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1519	2000020	68	2018-10-12	186.53	0.43	13.12	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1520	2000020	69	2018-10-13	173.41	0.40	13.15	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1521	2000020	70	2018-10-15	160.26	0.37	13.19	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1522	2000020	71	2018-10-16	147.07	0.34	13.22	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1523	2000020	72	2018-10-17	133.86	0.31	13.25	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1524	2000020	73	2018-10-18	120.61	0.28	13.28	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1525	2000020	74	2018-10-19	107.33	0.25	13.31	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1526	2000020	75	2018-10-20	94.02	0.22	13.34	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1527	2000020	76	2018-10-22	80.69	0.19	13.37	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1528	2000020	77	2018-10-23	67.32	0.16	13.40	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1529	2000020	78	2018-10-24	53.91	0.13	13.43	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1530	2000020	79	2018-10-25	40.48	0.09	13.46	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1531	2000020	80	2018-10-26	27.02	0.06	13.49	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1532	2000020	81	2018-10-27	13.53	0.03	13.53	0.37	0.40	14.33	\N	\N	PENDIENTE	1
1533	2000021	1	2018-07-30	2000.00	32.50	85.43	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1534	2000021	2	2018-08-06	1914.57	31.11	86.82	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1535	2000021	3	2018-08-13	1827.75	29.70	88.23	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1536	2000021	4	2018-08-20	1739.52	28.27	89.66	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1537	2000021	5	2018-08-27	1649.85	26.81	91.12	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1538	2000021	6	2018-09-03	1558.73	25.33	92.60	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1539	2000021	7	2018-09-10	1466.13	23.82	94.11	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1540	2000021	8	2018-09-17	1372.02	22.30	95.64	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1541	2000021	9	2018-09-24	1276.38	20.74	97.19	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1542	2000021	10	2018-10-01	1179.19	19.16	98.77	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1543	2000021	11	2018-10-09	1080.42	17.56	100.38	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1544	2000021	12	2018-10-16	980.05	15.93	102.01	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1545	2000021	13	2018-10-23	878.04	14.27	103.66	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1546	2000021	14	2018-10-30	774.38	12.58	105.35	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1547	2000021	15	2018-11-06	669.03	10.87	107.06	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1548	2000021	16	2018-11-13	561.97	9.13	108.80	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1549	2000021	17	2018-11-20	453.17	7.36	110.57	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1550	2000021	18	2018-11-27	342.60	5.57	112.36	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1551	2000021	19	2018-12-04	230.24	3.74	114.19	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1552	2000021	20	2018-12-11	116.05	1.89	116.05	2.50	2.50	122.93	\N	\N	PENDIENTE	1
1585	20000022	1	2018-07-31	1000.00	15.00	55.77	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1586	20000022	2	2018-08-07	944.23	14.16	56.60	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1587	20000022	3	2018-08-14	887.63	13.31	57.45	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1588	20000022	4	2018-08-21	830.18	12.45	58.31	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1589	20000022	5	2018-08-28	771.87	11.58	59.19	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1590	20000022	6	2018-09-04	712.68	10.69	60.07	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1591	20000022	7	2018-09-11	652.61	9.79	60.98	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1592	20000022	8	2018-09-18	591.63	8.87	61.89	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1593	20000022	9	2018-09-25	529.74	7.95	62.82	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1594	20000022	10	2018-10-02	466.92	7.00	63.76	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1595	20000022	11	2018-10-09	403.16	6.05	64.72	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1596	20000022	12	2018-10-16	338.44	5.08	65.69	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1597	20000022	13	2018-10-23	272.76	4.09	66.67	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1598	20000022	14	2018-10-30	206.08	3.09	67.67	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1599	20000022	15	2018-11-06	138.41	2.08	68.69	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1600	20000022	16	2018-11-13	69.72	1.05	69.72	2.50	2.50	75.77	\N	\N	PENDIENTE	1
1601	20000056	1	2018-08-24	2500.00	37.50	191.70	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1602	20000056	2	2018-09-24	2308.30	34.62	194.58	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1603	20000056	3	2018-10-24	2113.72	31.71	197.49	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1604	20000056	4	2018-11-24	1916.23	28.74	200.46	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1605	20000056	5	2018-12-24	1715.77	25.74	203.46	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1606	20000056	6	2019-01-24	1512.31	22.68	206.52	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1607	20000056	7	2019-02-24	1305.80	19.59	209.61	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1608	20000056	8	2019-03-24	1096.18	16.44	212.76	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1609	20000056	9	2019-04-24	883.42	13.25	215.95	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1610	20000056	10	2019-05-24	667.48	10.01	219.19	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1611	20000056	11	2019-06-24	448.29	6.72	222.48	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1612	20000056	12	2019-07-24	225.81	3.39	225.81	10.00	10.00	249.20	\N	\N	PENDIENTE	1
1613	20000057	1	2018-08-24	3000.00	45.00	230.04	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1614	20000057	2	2018-09-24	2769.96	41.55	233.49	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1615	20000057	3	2018-10-24	2536.47	38.05	236.99	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1616	20000057	4	2018-11-24	2299.48	34.49	240.55	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1617	20000057	5	2018-12-24	2058.93	30.88	244.16	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1618	20000057	6	2019-01-24	1814.77	27.22	247.82	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1619	20000057	7	2019-02-24	1566.95	23.50	251.54	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1620	20000057	8	2019-03-24	1315.42	19.73	255.31	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1621	20000057	9	2019-04-24	1060.11	15.90	259.14	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1622	20000057	10	2019-05-24	800.97	12.01	263.03	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1623	20000057	11	2019-06-24	537.95	8.07	266.97	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1624	20000057	12	2019-07-24	270.98	4.06	270.98	10.00	10.00	295.04	\N	\N	PENDIENTE	1
1625	20000058	1	2018-07-26	1000.00	2.68	11.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1626	20000058	2	2018-07-27	988.93	2.65	11.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1627	20000058	3	2018-07-30	977.83	2.62	11.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1628	20000058	4	2018-07-31	966.70	2.59	11.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1629	20000058	5	2018-08-01	955.54	2.56	11.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1630	20000058	6	2018-08-02	944.35	2.53	11.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1631	20000058	7	2018-08-03	933.13	2.50	11.25	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1632	20000058	8	2018-08-04	921.88	2.47	11.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1633	20000058	9	2018-08-06	910.60	2.44	11.31	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1634	20000058	10	2018-08-07	899.28	2.41	11.34	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1635	20000058	11	2018-08-08	887.94	2.38	11.37	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1636	20000058	12	2018-08-09	876.57	2.35	11.40	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1637	20000058	13	2018-08-10	865.17	2.32	11.43	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1745	20000059	40	2018-09-12	547.29	1.56	12.28	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1746	20000059	41	2018-09-13	535.01	1.53	12.32	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1747	20000059	42	2018-09-14	522.69	1.49	12.35	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1748	20000059	43	2018-09-15	510.34	1.46	12.39	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1749	20000059	44	2018-09-17	497.95	1.42	12.42	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1750	20000059	45	2018-09-18	485.53	1.39	12.46	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1751	20000059	46	2018-09-19	473.07	1.35	12.50	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1752	20000059	47	2018-09-20	460.57	1.32	12.53	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1753	20000059	48	2018-09-21	448.04	1.28	12.57	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1754	20000059	49	2018-09-22	435.47	1.24	12.60	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1755	20000059	50	2018-09-24	422.87	1.21	12.64	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1756	20000059	51	2018-09-25	410.23	1.17	12.67	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1757	20000059	52	2018-09-26	397.56	1.14	12.71	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1758	20000059	53	2018-09-27	384.85	1.10	12.75	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1759	20000059	54	2018-09-28	372.10	1.06	12.78	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1760	20000059	55	2018-09-29	359.31	1.03	12.82	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1761	20000059	56	2018-10-01	346.49	0.99	12.86	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1762	20000059	57	2018-10-02	333.64	0.95	12.89	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1763	20000059	58	2018-10-03	320.74	0.92	12.93	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1764	20000059	59	2018-10-04	307.81	0.88	12.97	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1765	20000059	60	2018-10-05	294.85	0.84	13.00	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1766	20000059	61	2018-10-06	281.84	0.81	13.04	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1767	20000059	62	2018-10-09	268.80	0.77	13.08	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1768	20000059	63	2018-10-10	255.72	0.73	13.12	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1769	20000059	64	2018-10-11	242.61	0.69	13.15	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1770	20000059	65	2018-10-12	229.45	0.66	13.19	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1771	20000059	66	2018-10-13	216.26	0.62	13.23	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1772	20000059	67	2018-10-15	203.03	0.58	13.27	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1773	20000059	68	2018-10-16	189.76	0.54	13.30	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1774	20000059	69	2018-10-17	176.46	0.50	13.34	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1775	20000059	70	2018-10-18	163.12	0.47	13.38	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1776	20000059	71	2018-10-19	149.74	0.43	13.42	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1777	20000059	72	2018-10-20	136.32	0.39	13.46	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1778	20000059	73	2018-10-22	122.86	0.35	13.50	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1779	20000059	74	2018-10-23	109.36	0.31	13.53	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1780	20000059	75	2018-10-24	95.83	0.27	13.57	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1781	20000059	76	2018-10-25	82.26	0.24	13.61	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1782	20000059	77	2018-10-26	68.64	0.20	13.65	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1783	20000059	78	2018-10-27	54.99	0.16	13.69	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1784	20000059	79	2018-10-29	41.30	0.12	13.73	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1785	20000059	80	2018-10-30	27.58	0.08	13.77	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1786	20000059	81	2018-10-31	13.81	0.04	13.81	0.37	0.40	14.62	\N	\N	PENDIENTE	1
1787	20000060	1	2018-07-26	1000.00	2.68	11.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1788	20000060	2	2018-07-27	988.93	2.65	11.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1789	20000060	3	2018-07-30	977.83	2.62	11.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1790	20000060	4	2018-07-31	966.70	2.59	11.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1791	20000060	5	2018-08-01	955.54	2.56	11.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1792	20000060	6	2018-08-02	944.35	2.53	11.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1793	20000060	7	2018-08-03	933.13	2.50	11.25	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1794	20000060	8	2018-08-04	921.88	2.47	11.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1795	20000060	9	2018-08-06	910.60	2.44	11.31	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1796	20000060	10	2018-08-07	899.28	2.41	11.34	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1797	20000060	11	2018-08-08	887.94	2.38	11.37	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1798	20000060	12	2018-08-09	876.57	2.35	11.40	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1799	20000060	13	2018-08-10	865.17	2.32	11.43	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1800	20000060	14	2018-08-11	853.74	2.29	11.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1801	20000060	15	2018-08-13	842.27	2.26	11.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1802	20000060	16	2018-08-14	830.78	2.23	11.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1803	20000060	17	2018-08-15	819.26	2.19	11.56	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1804	20000060	18	2018-08-16	807.70	2.16	11.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1805	20000060	19	2018-08-17	796.11	2.13	11.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1806	20000060	20	2018-08-18	784.50	2.10	11.65	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1807	20000060	21	2018-08-20	772.85	2.07	11.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1808	20000060	22	2018-08-21	761.17	2.04	11.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1809	20000060	23	2018-08-22	749.46	2.01	11.74	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1810	20000060	24	2018-08-23	737.72	1.98	11.77	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1811	20000060	25	2018-08-24	725.94	1.94	11.81	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1812	20000060	26	2018-08-25	714.14	1.91	11.84	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1813	20000060	27	2018-08-27	702.30	1.88	11.87	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1814	20000060	28	2018-08-28	690.43	1.85	11.90	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1815	20000060	29	2018-08-29	678.53	1.82	11.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1816	20000060	30	2018-08-31	666.60	1.79	11.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1817	20000060	31	2018-09-01	654.63	1.75	12.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1818	20000060	32	2018-09-03	642.64	1.72	12.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1819	20000060	33	2018-09-04	630.61	1.69	12.06	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1820	20000060	34	2018-09-05	618.55	1.66	12.09	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1821	20000060	35	2018-09-06	606.46	1.62	12.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1822	20000060	36	2018-09-07	594.33	1.59	12.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1823	20000060	37	2018-09-08	582.17	1.56	12.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1824	20000060	38	2018-09-10	569.98	1.53	12.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1825	20000060	39	2018-09-11	557.76	1.49	12.26	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1826	20000060	40	2018-09-12	545.50	1.46	12.29	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1827	20000060	41	2018-09-13	533.21	1.43	12.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1828	20000060	42	2018-09-14	520.89	1.40	12.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1829	20000060	43	2018-09-15	508.54	1.36	12.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1830	20000060	44	2018-09-17	496.15	1.33	12.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1831	20000060	45	2018-09-18	483.73	1.30	12.45	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1832	20000060	46	2018-09-19	471.28	1.26	12.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1833	20000060	47	2018-09-20	458.79	1.23	12.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1834	20000060	48	2018-09-21	446.27	1.20	12.55	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1835	20000060	49	2018-09-22	433.71	1.16	12.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1836	20000060	50	2018-09-24	421.12	1.13	12.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1837	20000060	51	2018-09-25	408.50	1.09	12.66	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1838	20000060	52	2018-09-26	395.85	1.06	12.69	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1839	20000060	53	2018-09-27	383.16	1.03	12.72	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1840	20000060	54	2018-09-28	370.43	0.99	12.76	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1841	20000060	55	2018-09-29	357.68	0.96	12.79	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1842	20000060	56	2018-10-01	344.89	0.92	12.83	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1843	20000060	57	2018-10-02	332.06	0.89	12.86	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1844	20000060	58	2018-10-03	319.20	0.85	12.89	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1845	20000060	59	2018-10-04	306.30	0.82	12.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1846	20000060	60	2018-10-05	293.37	0.79	12.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1847	20000060	61	2018-10-06	280.41	0.75	13.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1848	20000060	62	2018-10-09	267.41	0.72	13.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1849	20000060	63	2018-10-10	254.38	0.68	13.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1850	20000060	64	2018-10-11	241.31	0.65	13.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1851	20000060	65	2018-10-12	228.21	0.61	13.14	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1852	20000060	66	2018-10-13	215.07	0.58	13.17	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1853	20000060	67	2018-10-15	201.89	0.54	13.21	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1854	20000060	68	2018-10-16	188.68	0.51	13.24	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1855	20000060	69	2018-10-17	175.44	0.47	13.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1856	20000060	70	2018-10-18	162.16	0.43	13.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1857	20000060	71	2018-10-19	148.85	0.40	13.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1858	20000060	72	2018-10-20	135.49	0.36	13.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1859	20000060	73	2018-10-22	122.11	0.33	13.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1860	20000060	74	2018-10-23	108.68	0.29	13.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1861	20000060	75	2018-10-24	95.23	0.26	13.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1862	20000060	76	2018-10-25	81.73	0.22	13.53	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1863	20000060	77	2018-10-26	68.20	0.18	13.57	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1864	20000060	78	2018-10-27	54.63	0.15	13.60	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1865	20000060	79	2018-10-29	41.03	0.11	13.64	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1866	20000060	80	2018-10-30	27.39	0.07	13.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1867	20000060	81	2018-10-31	13.71	0.04	13.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1868	20000061	1	2018-07-26	1000.00	2.68	11.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1869	20000061	2	2018-07-27	988.93	2.65	11.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1870	20000061	3	2018-07-30	977.83	2.62	11.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1871	20000061	4	2018-07-31	966.70	2.59	11.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1872	20000061	5	2018-08-01	955.54	2.56	11.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1873	20000061	6	2018-08-02	944.35	2.53	11.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1874	20000061	7	2018-08-03	933.13	2.50	11.25	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1875	20000061	8	2018-08-04	921.88	2.47	11.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1876	20000061	9	2018-08-06	910.60	2.44	11.31	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1877	20000061	10	2018-08-07	899.28	2.41	11.34	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1878	20000061	11	2018-08-08	887.94	2.38	11.37	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1879	20000061	12	2018-08-09	876.57	2.35	11.40	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1880	20000061	13	2018-08-10	865.17	2.32	11.43	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1881	20000061	14	2018-08-11	853.74	2.29	11.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1882	20000061	15	2018-08-13	842.27	2.26	11.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1883	20000061	16	2018-08-14	830.78	2.23	11.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1884	20000061	17	2018-08-15	819.26	2.19	11.56	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1885	20000061	18	2018-08-16	807.70	2.16	11.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1886	20000061	19	2018-08-17	796.11	2.13	11.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1887	20000061	20	2018-08-18	784.50	2.10	11.65	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1888	20000061	21	2018-08-20	772.85	2.07	11.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1889	20000061	22	2018-08-21	761.17	2.04	11.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1890	20000061	23	2018-08-22	749.46	2.01	11.74	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1891	20000061	24	2018-08-23	737.72	1.98	11.77	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1892	20000061	25	2018-08-24	725.94	1.94	11.81	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1893	20000061	26	2018-08-25	714.14	1.91	11.84	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1894	20000061	27	2018-08-27	702.30	1.88	11.87	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1895	20000061	28	2018-08-28	690.43	1.85	11.90	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1896	20000061	29	2018-08-29	678.53	1.82	11.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1897	20000061	30	2018-08-31	666.60	1.79	11.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1898	20000061	31	2018-09-01	654.63	1.75	12.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1899	20000061	32	2018-09-03	642.64	1.72	12.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1900	20000061	33	2018-09-04	630.61	1.69	12.06	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1901	20000061	34	2018-09-05	618.55	1.66	12.09	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1902	20000061	35	2018-09-06	606.46	1.62	12.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1903	20000061	36	2018-09-07	594.33	1.59	12.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1904	20000061	37	2018-09-08	582.17	1.56	12.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1905	20000061	38	2018-09-10	569.98	1.53	12.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1906	20000061	39	2018-09-11	557.76	1.49	12.26	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1907	20000061	40	2018-09-12	545.50	1.46	12.29	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1908	20000061	41	2018-09-13	533.21	1.43	12.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1909	20000061	42	2018-09-14	520.89	1.40	12.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1910	20000061	43	2018-09-15	508.54	1.36	12.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1911	20000061	44	2018-09-17	496.15	1.33	12.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1912	20000061	45	2018-09-18	483.73	1.30	12.45	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1913	20000061	46	2018-09-19	471.28	1.26	12.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1914	20000061	47	2018-09-20	458.79	1.23	12.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1915	20000061	48	2018-09-21	446.27	1.20	12.55	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1916	20000061	49	2018-09-22	433.71	1.16	12.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1917	20000061	50	2018-09-24	421.12	1.13	12.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1918	20000061	51	2018-09-25	408.50	1.09	12.66	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1919	20000061	52	2018-09-26	395.85	1.06	12.69	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1920	20000061	53	2018-09-27	383.16	1.03	12.72	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1921	20000061	54	2018-09-28	370.43	0.99	12.76	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1922	20000061	55	2018-09-29	357.68	0.96	12.79	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1923	20000061	56	2018-10-01	344.89	0.92	12.83	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1924	20000061	57	2018-10-02	332.06	0.89	12.86	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1925	20000061	58	2018-10-03	319.20	0.85	12.89	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1926	20000061	59	2018-10-04	306.30	0.82	12.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1927	20000061	60	2018-10-05	293.37	0.79	12.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1928	20000061	61	2018-10-06	280.41	0.75	13.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1929	20000061	62	2018-10-09	267.41	0.72	13.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1930	20000061	63	2018-10-10	254.38	0.68	13.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1931	20000061	64	2018-10-11	241.31	0.65	13.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1932	20000061	65	2018-10-12	228.21	0.61	13.14	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1933	20000061	66	2018-10-13	215.07	0.58	13.17	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1934	20000061	67	2018-10-15	201.89	0.54	13.21	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1935	20000061	68	2018-10-16	188.68	0.51	13.24	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1936	20000061	69	2018-10-17	175.44	0.47	13.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1937	20000061	70	2018-10-18	162.16	0.43	13.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1938	20000061	71	2018-10-19	148.85	0.40	13.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1939	20000061	72	2018-10-20	135.49	0.36	13.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1940	20000061	73	2018-10-22	122.11	0.33	13.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1941	20000061	74	2018-10-23	108.68	0.29	13.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1942	20000061	75	2018-10-24	95.23	0.26	13.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1943	20000061	76	2018-10-25	81.73	0.22	13.53	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1944	20000061	77	2018-10-26	68.20	0.18	13.57	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1945	20000061	78	2018-10-27	54.63	0.15	13.60	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1946	20000061	79	2018-10-29	41.03	0.11	13.64	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1947	20000061	80	2018-10-30	27.39	0.07	13.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
1948	20000061	81	2018-10-31	13.71	0.04	13.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2057	20000063	1	2018-07-26	1000.00	2.50	8.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2058	20000063	2	2018-07-27	991.92	2.48	8.10	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2059	20000063	3	2018-07-30	983.83	2.46	8.12	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2060	20000063	4	2018-07-31	975.71	2.44	8.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2061	20000063	5	2018-08-01	967.57	2.42	8.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2062	20000063	6	2018-08-02	959.41	2.40	8.18	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2063	20000063	7	2018-08-03	951.23	2.38	8.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2064	20000063	8	2018-08-04	943.04	2.36	8.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2065	20000063	9	2018-08-06	934.82	2.34	8.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2066	20000063	10	2018-08-07	926.58	2.32	8.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2067	20000063	11	2018-08-08	918.32	2.30	8.28	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2068	20000063	12	2018-08-09	910.03	2.28	8.30	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2069	20000063	13	2018-08-10	901.73	2.25	8.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2070	20000063	14	2018-08-11	893.41	2.23	8.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2071	20000063	15	2018-08-13	885.07	2.21	8.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2072	20000063	16	2018-08-14	876.70	2.19	8.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2073	20000063	17	2018-08-15	868.32	2.17	8.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2074	20000063	18	2018-08-16	859.91	2.15	8.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2075	20000063	19	2018-08-17	851.48	2.13	8.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2076	20000063	20	2018-08-18	843.04	2.11	8.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2077	20000063	21	2018-08-20	834.57	2.09	8.49	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2078	20000063	22	2018-08-21	826.08	2.07	8.51	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2079	20000063	23	2018-08-22	817.56	2.04	8.53	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2080	20000063	24	2018-08-23	809.03	2.02	8.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2081	20000063	25	2018-08-24	800.48	2.00	8.58	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2082	20000063	26	2018-08-25	791.90	1.98	8.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2083	20000063	27	2018-08-27	783.30	1.96	8.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2084	20000063	28	2018-08-28	774.69	1.94	8.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2085	20000063	29	2018-08-29	766.04	1.92	8.66	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2086	20000063	30	2018-08-31	757.38	1.89	8.68	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2087	20000063	31	2018-09-01	748.70	1.87	8.71	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2088	20000063	32	2018-09-03	739.99	1.85	8.73	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2089	20000063	33	2018-09-04	731.27	1.83	8.75	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2090	20000063	34	2018-09-05	722.52	1.81	8.77	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2091	20000063	35	2018-09-06	713.75	1.78	8.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2092	20000063	36	2018-09-07	704.96	1.76	8.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2093	20000063	37	2018-09-08	696.14	1.74	8.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2094	20000063	38	2018-09-10	687.30	1.72	8.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2095	20000063	39	2018-09-11	678.45	1.70	8.88	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2096	20000063	40	2018-09-12	669.56	1.67	8.90	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2097	20000063	41	2018-09-13	660.66	1.65	8.93	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2098	20000063	42	2018-09-14	651.74	1.63	8.95	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2099	20000063	43	2018-09-15	642.79	1.61	8.97	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2100	20000063	44	2018-09-17	633.82	1.58	8.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2101	20000063	45	2018-09-18	624.83	1.56	9.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2102	20000063	46	2018-09-19	615.81	1.54	9.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2103	20000063	47	2018-09-20	606.77	1.52	9.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2104	20000063	48	2018-09-21	597.71	1.49	9.08	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2105	20000063	49	2018-09-22	588.63	1.47	9.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2106	20000063	50	2018-09-24	579.53	1.45	9.13	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2107	20000063	51	2018-09-25	570.40	1.43	9.15	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2108	20000063	52	2018-09-26	561.25	1.40	9.17	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2109	20000063	53	2018-09-27	552.07	1.38	9.20	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2110	20000063	54	2018-09-28	542.88	1.36	9.22	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2111	20000063	55	2018-09-29	533.66	1.33	9.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2112	20000063	56	2018-10-01	524.41	1.31	9.27	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2113	20000063	57	2018-10-02	515.15	1.29	9.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2114	20000063	58	2018-10-03	505.86	1.26	9.31	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2115	20000063	59	2018-10-04	496.55	1.24	9.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2116	20000063	60	2018-10-05	487.21	1.22	9.36	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2117	20000063	61	2018-10-06	477.85	1.19	9.38	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2118	20000063	62	2018-10-09	468.47	1.17	9.41	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2119	20000063	63	2018-10-10	459.06	1.15	9.43	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2120	20000063	64	2018-10-11	449.64	1.12	9.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2121	20000063	65	2018-10-12	440.18	1.10	9.48	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2122	20000063	66	2018-10-13	430.71	1.08	9.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2123	20000063	67	2018-10-15	421.21	1.05	9.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2124	20000063	68	2018-10-16	411.68	1.03	9.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2125	20000063	69	2018-10-17	402.13	1.01	9.57	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2126	20000063	70	2018-10-18	392.56	0.98	9.60	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2127	20000063	71	2018-10-19	382.97	0.96	9.62	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2128	20000063	72	2018-10-20	373.35	0.93	9.64	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2129	20000063	73	2018-10-22	363.70	0.91	9.67	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2130	20000063	74	2018-10-23	354.04	0.89	9.69	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2131	20000063	75	2018-10-24	344.34	0.86	9.72	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2132	20000063	76	2018-10-25	334.63	0.84	9.74	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2133	20000063	77	2018-10-26	324.89	0.81	9.76	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2134	20000063	78	2018-10-27	315.12	0.79	9.79	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2135	20000063	79	2018-10-29	305.33	0.76	9.81	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2136	20000063	80	2018-10-30	295.52	0.74	9.84	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2137	20000063	81	2018-10-31	285.68	0.71	9.86	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2138	20000063	82	2018-11-02	275.82	0.69	9.89	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2139	20000063	83	2018-11-03	265.93	0.66	9.91	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2140	20000063	84	2018-11-05	256.02	0.64	9.94	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2141	20000063	85	2018-11-06	246.08	0.62	9.96	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2142	20000063	86	2018-11-07	236.12	0.59	9.99	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2143	20000063	87	2018-11-08	226.13	0.57	10.01	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2144	20000063	88	2018-11-09	216.12	0.54	10.04	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2145	20000063	89	2018-11-10	206.09	0.52	10.06	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2146	20000063	90	2018-11-12	196.02	0.49	10.09	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2147	20000063	91	2018-11-13	185.94	0.46	10.11	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2148	20000063	92	2018-11-14	175.83	0.44	10.14	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2149	20000063	93	2018-11-15	165.69	0.41	10.16	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2150	20000063	94	2018-11-16	155.53	0.39	10.19	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2151	20000063	95	2018-11-17	145.34	0.36	10.21	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2152	20000063	96	2018-11-19	135.12	0.34	10.24	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2153	20000063	97	2018-11-20	124.88	0.31	10.26	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2154	20000063	98	2018-11-21	114.62	0.29	10.29	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2155	20000063	99	2018-11-22	104.33	0.26	10.32	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2156	20000063	100	2018-11-23	94.01	0.24	10.34	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2157	20000063	101	2018-11-24	83.67	0.21	10.37	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2158	20000063	102	2018-11-26	73.30	0.18	10.39	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2159	20000063	103	2018-11-27	62.91	0.16	10.42	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2160	20000063	104	2018-11-28	52.49	0.13	10.45	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2161	20000063	105	2018-11-29	42.04	0.11	10.47	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2162	20000063	106	2018-11-30	31.57	0.08	10.50	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2163	20000063	107	2018-12-01	21.07	0.05	10.52	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2164	20000063	108	2018-12-03	10.55	0.03	10.55	0.37	0.40	11.35	\N	\N	PENDIENTE	1
2165	20000062	1	2018-07-27	500.00	1.07	4.12	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2166	20000062	2	2018-07-30	495.88	1.06	4.13	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2167	20000062	3	2018-07-31	491.75	1.05	4.14	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2168	20000062	4	2018-08-01	487.62	1.04	4.15	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2169	20000062	5	2018-08-02	483.47	1.04	4.15	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2170	20000062	6	2018-08-03	479.31	1.03	4.16	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2171	20000062	7	2018-08-06	475.15	1.02	4.17	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2172	20000062	8	2018-08-07	470.98	1.01	4.18	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2173	20000062	9	2018-08-08	466.80	1.00	4.19	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2174	20000062	10	2018-08-09	462.61	0.99	4.20	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2175	20000062	11	2018-08-10	458.41	0.98	4.21	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2176	20000062	12	2018-08-13	454.20	0.97	4.22	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2177	20000062	13	2018-08-14	449.98	0.96	4.23	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2178	20000062	14	2018-08-15	445.75	0.96	4.24	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2179	20000062	15	2018-08-16	441.52	0.95	4.24	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2180	20000062	16	2018-08-17	437.27	0.94	4.25	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2181	20000062	17	2018-08-20	433.02	0.93	4.26	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2182	20000062	18	2018-08-21	428.76	0.92	4.27	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2183	20000062	19	2018-08-22	424.48	0.91	4.28	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2184	20000062	20	2018-08-23	420.20	0.90	4.29	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2185	20000062	21	2018-08-24	415.91	0.89	4.30	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2186	20000062	22	2018-08-27	411.61	0.88	4.31	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2187	20000062	23	2018-08-28	407.30	0.87	4.32	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2188	20000062	24	2018-08-29	402.98	0.86	4.33	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2189	20000062	25	2018-08-31	398.66	0.85	4.34	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2190	20000062	26	2018-09-03	394.32	0.84	4.35	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2191	20000062	27	2018-09-04	389.97	0.84	4.36	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2192	20000062	28	2018-09-05	385.62	0.83	4.36	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2193	20000062	29	2018-09-06	381.25	0.82	4.37	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2194	20000062	30	2018-09-07	376.88	0.81	4.38	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2195	20000062	31	2018-09-10	372.50	0.80	4.39	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2196	20000062	32	2018-09-11	368.10	0.79	4.40	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2197	20000062	33	2018-09-12	363.70	0.78	4.41	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2198	20000062	34	2018-09-13	359.29	0.77	4.42	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2199	20000062	35	2018-09-14	354.87	0.76	4.43	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2200	20000062	36	2018-09-17	350.44	0.75	4.44	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2201	20000062	37	2018-09-18	346.00	0.74	4.45	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2202	20000062	38	2018-09-19	341.55	0.73	4.46	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2203	20000062	39	2018-09-20	337.09	0.72	4.47	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2204	20000062	40	2018-09-21	332.62	0.71	4.48	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2205	20000062	41	2018-09-24	328.14	0.70	4.49	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2206	20000062	42	2018-09-25	323.66	0.69	4.50	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2207	20000062	43	2018-09-26	319.16	0.68	4.51	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2208	20000062	44	2018-09-27	314.65	0.67	4.52	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2209	20000062	45	2018-09-28	310.14	0.66	4.53	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2210	20000062	46	2018-10-01	305.61	0.65	4.54	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2211	20000062	47	2018-10-02	301.07	0.65	4.55	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2212	20000062	48	2018-10-03	296.53	0.64	4.56	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2213	20000062	49	2018-10-04	291.97	0.63	4.57	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2214	20000062	50	2018-10-05	287.41	0.62	4.58	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2215	20000062	51	2018-10-09	282.83	0.61	4.58	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2216	20000062	52	2018-10-10	278.25	0.60	4.59	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2217	20000062	53	2018-10-11	273.65	0.59	4.60	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2218	20000062	54	2018-10-12	269.05	0.58	4.61	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2219	20000062	55	2018-10-15	264.43	0.57	4.62	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2220	20000062	56	2018-10-16	259.81	0.56	4.63	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2221	20000062	57	2018-10-17	255.17	0.55	4.64	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2222	20000062	58	2018-10-18	250.53	0.54	4.65	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2223	20000062	59	2018-10-19	245.88	0.53	4.66	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2224	20000062	60	2018-10-22	241.21	0.52	4.67	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2225	20000062	61	2018-10-23	236.54	0.51	4.68	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2226	20000062	62	2018-10-24	231.85	0.50	4.69	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2227	20000062	63	2018-10-25	227.16	0.49	4.70	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2228	20000062	64	2018-10-26	222.46	0.48	4.71	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2229	20000062	65	2018-10-29	217.74	0.47	4.72	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2230	20000062	66	2018-10-30	213.02	0.46	4.73	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2231	20000062	67	2018-10-31	208.28	0.45	4.74	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2232	20000062	68	2018-11-02	203.54	0.44	4.75	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2233	20000062	69	2018-11-05	198.78	0.43	4.76	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2234	20000062	70	2018-11-06	194.02	0.42	4.78	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2235	20000062	71	2018-11-07	189.24	0.41	4.79	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2236	20000062	72	2018-11-08	184.46	0.40	4.80	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2237	20000062	73	2018-11-09	179.66	0.38	4.81	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2238	20000062	74	2018-11-12	174.86	0.37	4.82	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2239	20000062	75	2018-11-13	170.04	0.36	4.83	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2240	20000062	76	2018-11-14	165.21	0.35	4.84	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2241	20000062	77	2018-11-15	160.38	0.34	4.85	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2242	20000062	78	2018-11-16	155.53	0.33	4.86	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2243	20000062	79	2018-11-19	150.67	0.32	4.87	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2244	20000062	80	2018-11-20	145.80	0.31	4.88	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2245	20000062	81	2018-11-21	140.92	0.30	4.89	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2246	20000062	82	2018-11-22	136.04	0.29	4.90	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2247	20000062	83	2018-11-23	131.14	0.28	4.91	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2248	20000062	84	2018-11-26	126.23	0.27	4.92	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2249	20000062	85	2018-11-27	121.31	0.26	4.93	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2250	20000062	86	2018-11-28	116.38	0.25	4.94	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2251	20000062	87	2018-11-29	111.43	0.24	4.95	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2252	20000062	88	2018-11-30	106.48	0.23	4.96	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2253	20000062	89	2018-12-03	101.52	0.22	4.97	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2254	20000062	90	2018-12-04	96.55	0.21	4.98	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2255	20000062	91	2018-12-05	91.56	0.20	4.99	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2256	20000062	92	2018-12-06	86.57	0.19	5.01	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2257	20000062	93	2018-12-07	81.56	0.17	5.02	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2258	20000062	94	2018-12-10	76.55	0.16	5.03	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2259	20000062	95	2018-12-11	71.52	0.15	5.04	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2260	20000062	96	2018-12-12	66.48	0.14	5.05	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2261	20000062	97	2018-12-13	61.43	0.13	5.06	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2262	20000062	98	2018-12-14	56.37	0.12	5.07	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2263	20000062	99	2018-12-17	51.30	0.11	5.08	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2264	20000062	100	2018-12-18	46.22	0.10	5.09	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2265	20000062	101	2018-12-19	41.13	0.09	5.10	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2266	20000062	102	2018-12-20	36.03	0.08	5.11	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2267	20000062	103	2018-12-21	30.91	0.07	5.12	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2268	20000062	104	2018-12-24	25.79	0.06	5.14	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2269	20000062	105	2018-12-26	20.65	0.04	5.15	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2270	20000062	106	2018-12-27	15.51	0.03	5.16	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2271	20000062	107	2018-12-28	10.35	0.02	5.17	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2272	20000062	108	2018-12-31	5.18	0.01	5.18	0.37	0.40	5.96	\N	\N	PENDIENTE	1
2273	2000013	1	2018-07-27	600.00	1.61	6.64	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2274	2000013	2	2018-07-30	593.36	1.59	6.66	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2275	2000013	3	2018-07-31	586.70	1.57	6.68	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2276	2000013	4	2018-08-01	580.02	1.55	6.70	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2277	2000013	5	2018-08-02	573.32	1.54	6.71	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2278	2000013	6	2018-08-03	566.61	1.52	6.73	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2279	2000013	7	2018-08-04	559.88	1.50	6.75	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2280	2000013	8	2018-08-06	553.13	1.48	6.77	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2281	2000013	9	2018-08-07	546.36	1.46	6.79	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2282	2000013	10	2018-08-08	539.57	1.45	6.80	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2283	2000013	11	2018-08-09	532.77	1.43	6.82	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2284	2000013	12	2018-08-10	525.94	1.41	6.84	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2285	2000013	13	2018-08-11	519.10	1.39	6.86	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2286	2000013	14	2018-08-13	512.24	1.37	6.88	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2287	2000013	15	2018-08-14	505.36	1.35	6.90	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2288	2000013	16	2018-08-15	498.47	1.34	6.91	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2289	2000013	17	2018-08-16	491.55	1.32	6.93	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2290	2000013	18	2018-08-17	484.62	1.30	6.95	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2291	2000013	19	2018-08-18	477.67	1.28	6.97	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2292	2000013	20	2018-08-20	470.70	1.26	6.99	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2293	2000013	21	2018-08-21	463.71	1.24	7.01	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2294	2000013	22	2018-08-22	456.70	1.22	7.03	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2295	2000013	23	2018-08-23	449.67	1.20	7.05	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2296	2000013	24	2018-08-24	442.63	1.19	7.06	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2297	2000013	25	2018-08-25	435.57	1.17	7.08	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2298	2000013	26	2018-08-27	428.48	1.15	7.10	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2299	2000013	27	2018-08-28	421.38	1.13	7.12	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2300	2000013	28	2018-08-29	414.26	1.11	7.14	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2301	2000013	29	2018-08-31	407.12	1.09	7.16	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2302	2000013	30	2018-09-01	399.96	1.07	7.18	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2303	2000013	31	2018-09-03	392.78	1.05	7.20	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2304	2000013	32	2018-09-04	385.58	1.03	7.22	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2305	2000013	33	2018-09-05	378.37	1.01	7.24	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2306	2000013	34	2018-09-06	371.13	0.99	7.26	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2307	2000013	35	2018-09-07	363.87	0.97	7.28	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2308	2000013	36	2018-09-08	356.60	0.96	7.29	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2309	2000013	37	2018-09-10	349.30	0.94	7.31	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2310	2000013	38	2018-09-11	341.99	0.92	7.33	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2311	2000013	39	2018-09-12	334.66	0.90	7.35	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2312	2000013	40	2018-09-13	327.30	0.88	7.37	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2313	2000013	41	2018-09-14	319.93	0.86	7.39	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2314	2000013	42	2018-09-15	312.54	0.84	7.41	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2315	2000013	43	2018-09-17	305.12	0.82	7.43	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2316	2000013	44	2018-09-18	297.69	0.80	7.45	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2317	2000013	45	2018-09-19	290.24	0.78	7.47	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2318	2000013	46	2018-09-20	282.77	0.76	7.49	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2319	2000013	47	2018-09-21	275.27	0.74	7.51	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2320	2000013	48	2018-09-22	267.76	0.72	7.53	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2321	2000013	49	2018-09-24	260.23	0.70	7.55	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2322	2000013	50	2018-09-25	252.67	0.68	7.57	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2323	2000013	51	2018-09-26	245.10	0.66	7.59	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2324	2000013	52	2018-09-27	237.51	0.64	7.61	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2325	2000013	53	2018-09-28	229.89	0.62	7.63	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2326	2000013	54	2018-09-29	222.26	0.60	7.65	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2327	2000013	55	2018-10-01	214.61	0.57	7.68	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2328	2000013	56	2018-10-02	206.93	0.55	7.70	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2329	2000013	57	2018-10-03	199.24	0.53	7.72	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2330	2000013	58	2018-10-04	191.52	0.51	7.74	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2331	2000013	59	2018-10-05	183.78	0.49	7.76	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2332	2000013	60	2018-10-06	176.02	0.47	7.78	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2333	2000013	61	2018-10-09	168.25	0.45	7.80	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2334	2000013	62	2018-10-10	160.45	0.43	7.82	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2335	2000013	63	2018-10-11	152.63	0.41	7.84	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2336	2000013	64	2018-10-12	144.79	0.39	7.86	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2337	2000013	65	2018-10-13	136.92	0.37	7.88	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2338	2000013	66	2018-10-15	129.04	0.35	7.90	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2339	2000013	67	2018-10-16	121.14	0.32	7.93	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2340	2000013	68	2018-10-17	113.21	0.30	7.95	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2341	2000013	69	2018-10-18	105.26	0.28	7.97	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2342	2000013	70	2018-10-19	97.30	0.26	7.99	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2343	2000013	71	2018-10-20	89.31	0.24	8.01	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2344	2000013	72	2018-10-22	81.30	0.22	8.03	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2345	2000013	73	2018-10-23	73.26	0.20	8.05	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2346	2000013	74	2018-10-24	65.21	0.17	8.08	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2347	2000013	75	2018-10-25	57.14	0.15	8.10	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2348	2000013	76	2018-10-26	49.04	0.13	8.12	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2349	2000013	77	2018-10-27	40.92	0.11	8.14	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2350	2000013	78	2018-10-29	32.78	0.09	8.16	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2351	2000013	79	2018-10-30	24.62	0.07	8.18	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2352	2000013	80	2018-10-31	16.43	0.04	8.21	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2353	2000013	81	2018-11-02	8.23	0.02	8.23	0.37	0.40	9.02	\N	\N	PENDIENTE	1
2354	20000064	1	2018-07-30	500.00	1.34	5.54	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2355	20000064	2	2018-07-31	494.46	1.32	5.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2356	20000064	3	2018-08-01	488.91	1.31	5.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2357	20000064	4	2018-08-02	483.35	1.29	5.58	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2358	20000064	5	2018-08-03	477.77	1.28	5.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2359	20000064	6	2018-08-04	472.17	1.26	5.61	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2360	20000064	7	2018-08-06	466.56	1.25	5.63	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2361	20000064	8	2018-08-07	460.94	1.23	5.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2362	20000064	9	2018-08-08	455.30	1.22	5.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2363	20000064	10	2018-08-09	449.64	1.20	5.67	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2364	20000064	11	2018-08-10	443.97	1.19	5.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2365	20000064	12	2018-08-11	438.29	1.17	5.70	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2366	20000064	13	2018-08-13	432.59	1.16	5.72	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2367	20000064	14	2018-08-14	426.87	1.14	5.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2368	20000064	15	2018-08-15	421.14	1.13	5.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2369	20000064	16	2018-08-16	415.39	1.11	5.76	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2370	20000064	17	2018-08-17	409.63	1.10	5.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2371	20000064	18	2018-08-18	403.85	1.08	5.79	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2372	20000064	19	2018-08-20	398.06	1.07	5.81	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2373	20000064	20	2018-08-21	392.25	1.05	5.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2374	20000064	21	2018-08-22	386.42	1.04	5.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2375	20000064	22	2018-08-23	380.58	1.02	5.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2376	20000064	23	2018-08-24	374.73	1.00	5.87	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2377	20000064	24	2018-08-25	368.86	0.99	5.89	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2378	20000064	25	2018-08-27	362.97	0.97	5.90	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2379	20000064	26	2018-08-28	357.07	0.96	5.92	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2380	20000064	27	2018-08-29	351.15	0.94	5.93	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2381	20000064	28	2018-08-31	345.22	0.92	5.95	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2382	20000064	29	2018-09-01	339.27	0.91	5.97	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2383	20000064	30	2018-09-03	333.30	0.89	5.98	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2384	20000064	31	2018-09-04	327.32	0.88	6.00	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2385	20000064	32	2018-09-05	321.32	0.86	6.01	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2386	20000064	33	2018-09-06	315.30	0.84	6.03	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2387	20000064	34	2018-09-07	309.27	0.83	6.05	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2388	20000064	35	2018-09-08	303.23	0.81	6.06	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2389	20000064	36	2018-09-10	297.17	0.80	6.08	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2390	20000064	37	2018-09-11	291.09	0.78	6.10	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2391	20000064	38	2018-09-12	284.99	0.76	6.11	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2392	20000064	39	2018-09-13	278.88	0.75	6.13	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2393	20000064	40	2018-09-14	272.75	0.73	6.14	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2394	20000064	41	2018-09-15	266.61	0.71	6.16	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2395	20000064	42	2018-09-17	260.45	0.70	6.18	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2396	20000064	43	2018-09-18	254.27	0.68	6.19	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2397	20000064	44	2018-09-19	248.08	0.66	6.21	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2398	20000064	45	2018-09-20	241.86	0.65	6.23	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2399	20000064	46	2018-09-21	235.64	0.63	6.24	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2400	20000064	47	2018-09-22	229.39	0.61	6.26	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2401	20000064	48	2018-09-24	223.13	0.60	6.28	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2402	20000064	49	2018-09-25	216.86	0.58	6.29	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2403	20000064	50	2018-09-26	210.56	0.56	6.31	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2404	20000064	51	2018-09-27	204.25	0.55	6.33	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2405	20000064	52	2018-09-28	197.92	0.53	6.34	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2406	20000064	53	2018-09-29	191.58	0.51	6.36	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2407	20000064	54	2018-10-01	185.22	0.50	6.38	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2408	20000064	55	2018-10-02	178.84	0.48	6.40	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2409	20000064	56	2018-10-03	172.44	0.46	6.41	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2410	20000064	57	2018-10-04	166.03	0.44	6.43	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2411	20000064	58	2018-10-05	159.60	0.43	6.45	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2412	20000064	59	2018-10-06	153.15	0.41	6.46	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2413	20000064	60	2018-10-09	146.69	0.39	6.48	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2414	20000064	61	2018-10-10	140.21	0.38	6.50	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2415	20000064	62	2018-10-11	133.71	0.36	6.52	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2416	20000064	63	2018-10-12	127.19	0.34	6.53	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2417	20000064	64	2018-10-13	120.65	0.32	6.55	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2418	20000064	65	2018-10-15	114.10	0.31	6.57	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2419	20000064	66	2018-10-16	107.53	0.29	6.59	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2420	20000064	67	2018-10-17	100.95	0.27	6.60	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2421	20000064	68	2018-10-18	94.34	0.25	6.62	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2422	20000064	69	2018-10-19	87.72	0.23	6.64	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2423	20000064	70	2018-10-20	81.08	0.22	6.66	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2424	20000064	71	2018-10-22	74.42	0.20	6.68	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2425	20000064	72	2018-10-23	67.75	0.18	6.69	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2426	20000064	73	2018-10-24	61.05	0.16	6.71	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2427	20000064	74	2018-10-25	54.34	0.15	6.73	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2428	20000064	75	2018-10-26	47.61	0.13	6.75	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2429	20000064	76	2018-10-27	40.87	0.11	6.77	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2430	20000064	77	2018-10-29	34.10	0.09	6.78	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2431	20000064	78	2018-10-30	27.32	0.07	6.80	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2432	20000064	79	2018-10-31	20.51	0.05	6.82	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2433	20000064	80	2018-11-02	13.69	0.04	6.84	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2434	20000064	81	2018-11-03	6.86	0.02	6.86	0.37	0.40	7.65	\N	\N	PENDIENTE	1
2435	20000065	1	2018-08-03	500.00	14.38	56.48	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2436	20000065	2	2018-08-10	443.52	12.75	58.10	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2437	20000065	3	2018-08-17	385.42	11.08	59.77	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2438	20000065	4	2018-08-24	325.65	9.36	61.49	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2439	20000065	5	2018-08-31	264.16	7.59	63.26	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2440	20000065	6	2018-09-07	200.90	5.78	65.08	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2441	20000065	7	2018-09-14	135.82	3.90	66.95	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2442	20000065	8	2018-09-21	68.87	1.98	68.87	2.50	2.50	75.85	\N	\N	PENDIENTE	1
2443	20000066	1	2018-08-06	300.00	5.63	22.53	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2444	20000066	2	2018-08-13	277.47	5.20	22.95	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2445	20000066	3	2018-08-20	254.53	4.77	23.38	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2446	20000066	4	2018-08-27	231.15	4.33	23.82	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2447	20000066	5	2018-09-03	207.33	3.89	24.26	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2448	20000066	6	2018-09-10	183.07	3.43	24.72	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2449	20000066	7	2018-09-17	158.35	2.97	25.18	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2450	20000066	8	2018-09-24	133.17	2.50	25.65	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2451	20000066	9	2018-10-01	107.52	2.02	26.13	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2452	20000066	10	2018-10-09	81.38	1.53	26.62	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2453	20000066	11	2018-10-16	54.76	1.03	27.12	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2454	20000066	12	2018-10-23	27.63	0.52	27.63	2.50	2.50	33.15	\N	\N	PENDIENTE	1
2455	20000067	1	2018-08-02	1000.00	2.18	5.15	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2456	20000067	2	2018-08-03	994.85	2.17	5.17	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2457	20000067	3	2018-08-06	989.68	2.16	5.18	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2458	20000067	4	2018-08-07	984.50	2.14	5.19	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2459	20000067	5	2018-08-08	979.32	2.13	5.20	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2460	20000067	6	2018-08-09	974.12	2.12	5.21	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2461	20000067	7	2018-08-10	968.91	2.11	5.22	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2462	20000067	8	2018-08-13	963.68	2.10	5.23	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2463	20000067	9	2018-08-14	958.45	2.09	5.24	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2464	20000067	10	2018-08-15	953.21	2.08	5.26	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2465	20000067	11	2018-08-16	947.95	2.07	5.27	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2466	20000067	12	2018-08-17	942.68	2.05	5.28	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2467	20000067	13	2018-08-20	937.40	2.04	5.29	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2468	20000067	14	2018-08-21	932.11	2.03	5.30	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2469	20000067	15	2018-08-22	926.81	2.02	5.31	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2470	20000067	16	2018-08-23	921.50	2.01	5.33	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2471	20000067	17	2018-08-24	916.17	2.00	5.34	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2472	20000067	18	2018-08-27	910.84	1.98	5.35	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2473	20000067	19	2018-08-28	905.49	1.97	5.36	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2474	20000067	20	2018-08-29	900.13	1.96	5.37	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2475	20000067	21	2018-08-31	894.76	1.95	5.38	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2476	20000067	22	2018-09-03	889.37	1.94	5.40	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2477	20000067	23	2018-09-04	883.98	1.93	5.41	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2478	20000067	24	2018-09-05	878.57	1.91	5.42	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2479	20000067	25	2018-09-06	873.15	1.90	5.43	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2480	20000067	26	2018-09-07	867.72	1.89	5.44	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2481	20000067	27	2018-09-10	862.28	1.88	5.45	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2482	20000067	28	2018-09-11	856.82	1.87	5.47	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2483	20000067	29	2018-09-12	851.36	1.85	5.48	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2484	20000067	30	2018-09-13	845.88	1.84	5.49	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2485	20000067	31	2018-09-14	840.39	1.83	5.50	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2486	20000067	32	2018-09-17	834.89	1.82	5.51	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2487	20000067	33	2018-09-18	829.37	1.81	5.53	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2488	20000067	34	2018-09-19	823.85	1.79	5.54	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2489	20000067	35	2018-09-20	818.31	1.78	5.55	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2490	20000067	36	2018-09-21	812.76	1.77	5.56	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2491	20000067	37	2018-09-24	807.20	1.76	5.57	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2492	20000067	38	2018-09-25	801.62	1.75	5.59	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2493	20000067	39	2018-09-26	796.04	1.73	5.60	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2494	20000067	40	2018-09-27	790.44	1.72	5.61	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2495	20000067	41	2018-09-28	784.83	1.71	5.62	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2496	20000067	42	2018-10-01	779.21	1.70	5.64	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2497	20000067	43	2018-10-02	773.57	1.69	5.65	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2498	20000067	44	2018-10-03	767.92	1.67	5.66	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2499	20000067	45	2018-10-04	762.26	1.66	5.67	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2500	20000067	46	2018-10-05	756.59	1.65	5.68	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2501	20000067	47	2018-10-09	750.91	1.64	5.70	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2502	20000067	48	2018-10-10	745.21	1.62	5.71	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2503	20000067	49	2018-10-11	739.50	1.61	5.72	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2504	20000067	50	2018-10-12	733.78	1.60	5.73	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2505	20000067	51	2018-10-15	728.05	1.59	5.75	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2506	20000067	52	2018-10-16	722.30	1.57	5.76	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2507	20000067	53	2018-10-17	716.54	1.56	5.77	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2508	20000067	54	2018-10-18	710.77	1.55	5.78	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2509	20000067	55	2018-10-19	704.98	1.54	5.80	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2510	20000067	56	2018-10-22	699.19	1.52	5.81	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2511	20000067	57	2018-10-23	693.38	1.51	5.82	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2512	20000067	58	2018-10-24	687.56	1.50	5.83	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2513	20000067	59	2018-10-25	681.72	1.49	5.85	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2514	20000067	60	2018-10-26	675.87	1.47	5.86	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2515	20000067	61	2018-10-29	670.01	1.46	5.87	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2516	20000067	62	2018-10-30	664.14	1.45	5.89	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2517	20000067	63	2018-10-31	658.25	1.43	5.90	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2518	20000067	64	2018-11-02	652.36	1.42	5.91	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2519	20000067	65	2018-11-05	646.44	1.41	5.92	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2520	20000067	66	2018-11-06	640.52	1.40	5.94	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2521	20000067	67	2018-11-07	634.58	1.38	5.95	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2522	20000067	68	2018-11-08	628.63	1.37	5.96	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2523	20000067	69	2018-11-09	622.67	1.36	5.98	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2524	20000067	70	2018-11-12	616.69	1.34	5.99	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2525	20000067	71	2018-11-13	610.70	1.33	6.00	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2526	20000067	72	2018-11-14	604.70	1.32	6.02	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2527	20000067	73	2018-11-15	598.69	1.30	6.03	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2528	20000067	74	2018-11-16	592.66	1.29	6.04	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2529	20000067	75	2018-11-19	586.62	1.28	6.05	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2530	20000067	76	2018-11-20	580.56	1.26	6.07	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2531	20000067	77	2018-11-21	574.49	1.25	6.08	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2532	20000067	78	2018-11-22	568.41	1.24	6.09	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2533	20000067	79	2018-11-23	562.32	1.23	6.11	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2534	20000067	80	2018-11-26	556.21	1.21	6.12	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2535	20000067	81	2018-11-27	550.09	1.20	6.13	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2536	20000067	82	2018-11-28	543.95	1.19	6.15	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2537	20000067	83	2018-11-29	537.81	1.17	6.16	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2538	20000067	84	2018-11-30	531.65	1.16	6.17	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2539	20000067	85	2018-12-03	525.47	1.14	6.19	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2540	20000067	86	2018-12-04	519.28	1.13	6.20	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2541	20000067	87	2018-12-05	513.08	1.12	6.21	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2542	20000067	88	2018-12-06	506.87	1.10	6.23	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2543	20000067	89	2018-12-07	500.64	1.09	6.24	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2544	20000067	90	2018-12-10	494.40	1.08	6.26	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2545	20000067	91	2018-12-11	488.14	1.06	6.27	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2546	20000067	92	2018-12-12	481.87	1.05	6.28	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2547	20000067	93	2018-12-13	475.59	1.04	6.30	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2548	20000067	94	2018-12-14	469.29	1.02	6.31	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2549	20000067	95	2018-12-17	462.98	1.01	6.32	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2550	20000067	96	2018-12-18	456.66	0.99	6.34	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2551	20000067	97	2018-12-19	450.32	0.98	6.35	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2552	20000067	98	2018-12-20	443.97	0.97	6.37	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2553	20000067	99	2018-12-21	437.60	0.95	6.38	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2554	20000067	100	2018-12-24	431.22	0.94	6.39	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2555	20000067	101	2018-12-26	424.83	0.93	6.41	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2556	20000067	102	2018-12-27	418.42	0.91	6.42	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2557	20000067	103	2018-12-28	412.00	0.90	6.44	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2558	20000067	104	2018-12-31	405.57	0.88	6.45	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2559	20000067	105	2019-01-02	399.12	0.87	6.46	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2560	20000067	106	2019-01-03	392.65	0.86	6.48	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2561	20000067	107	2019-01-04	386.18	0.84	6.49	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2562	20000067	108	2019-01-07	379.69	0.83	6.51	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2563	20000067	109	2019-01-08	373.18	0.81	6.52	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2564	20000067	110	2019-01-09	366.66	0.80	6.53	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2565	20000067	111	2019-01-10	360.13	0.78	6.55	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2566	20000067	112	2019-01-11	353.58	0.77	6.56	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2567	20000067	113	2019-01-14	347.02	0.76	6.58	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2568	20000067	114	2019-01-15	340.44	0.74	6.59	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2569	20000067	115	2019-01-16	333.85	0.73	6.61	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2570	20000067	116	2019-01-17	327.24	0.71	6.62	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2571	20000067	117	2019-01-18	320.62	0.70	6.63	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2572	20000067	118	2019-01-21	313.99	0.68	6.65	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2573	20000067	119	2019-01-22	307.34	0.67	6.66	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2574	20000067	120	2019-01-23	300.68	0.66	6.68	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2575	20000067	121	2019-01-24	294.00	0.64	6.69	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2576	20000067	122	2019-01-25	287.31	0.63	6.71	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2577	20000067	123	2019-01-28	280.60	0.61	6.72	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2578	20000067	124	2019-01-29	273.88	0.60	6.74	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2579	20000067	125	2019-01-30	267.14	0.58	6.75	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2580	20000067	126	2019-01-31	260.39	0.57	6.77	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2581	20000067	127	2019-02-01	253.63	0.55	6.78	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2582	20000067	128	2019-02-04	246.85	0.54	6.79	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2583	20000067	129	2019-02-05	240.05	0.52	6.81	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2584	20000067	130	2019-02-06	233.24	0.51	6.82	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2585	20000067	131	2019-02-07	226.42	0.49	6.84	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2586	20000067	132	2019-02-08	219.58	0.48	6.85	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2587	20000067	133	2019-02-11	212.72	0.46	6.87	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2588	20000067	134	2019-02-12	205.85	0.45	6.88	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2589	20000067	135	2019-02-13	198.97	0.43	6.90	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2590	20000067	136	2019-02-14	192.07	0.42	6.91	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2591	20000067	137	2019-02-15	185.16	0.40	6.93	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2592	20000067	138	2019-02-18	178.23	0.39	6.94	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2593	20000067	139	2019-02-19	171.28	0.37	6.96	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2594	20000067	140	2019-02-20	164.32	0.36	6.97	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2595	20000067	141	2019-02-21	157.35	0.34	6.99	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2596	20000067	142	2019-02-22	150.36	0.33	7.01	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2597	20000067	143	2019-02-25	143.35	0.31	7.02	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2598	20000067	144	2019-02-26	136.33	0.30	7.04	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2599	20000067	145	2019-02-27	129.30	0.28	7.05	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2600	20000067	146	2019-02-28	122.25	0.27	7.07	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2601	20000067	147	2019-03-01	115.18	0.25	7.08	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2602	20000067	148	2019-03-04	108.10	0.24	7.10	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2603	20000067	149	2019-03-05	101.00	0.22	7.11	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2604	20000067	150	2019-03-06	93.89	0.20	7.13	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2605	20000067	151	2019-03-07	86.76	0.19	7.14	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2606	20000067	152	2019-03-08	79.62	0.17	7.16	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2607	20000067	153	2019-03-11	72.46	0.16	7.17	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2608	20000067	154	2019-03-12	65.28	0.14	7.19	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2609	20000067	155	2019-03-13	58.09	0.13	7.21	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2610	20000067	156	2019-03-14	50.88	0.11	7.22	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2611	20000067	157	2019-03-15	43.66	0.10	7.24	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2612	20000067	158	2019-03-18	36.43	0.08	7.25	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2613	20000067	159	2019-03-19	29.17	0.06	7.27	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2614	20000067	160	2019-03-20	21.90	0.05	7.29	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2615	20000067	161	2019-03-21	14.62	0.03	7.30	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2616	20000067	162	2019-03-22	7.32	0.02	7.32	0.37	0.40	8.10	\N	\N	PENDIENTE	1
2617	20000068	1	2018-08-02	1900.00	4.55	21.28	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2618	20000068	2	2018-08-03	1878.72	4.50	21.34	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2619	20000068	3	2018-08-06	1857.38	4.44	21.39	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2620	20000068	4	2018-08-07	1835.99	4.39	21.44	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2621	20000068	5	2018-08-08	1814.55	4.34	21.49	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2622	20000068	6	2018-08-09	1793.06	4.29	21.54	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2623	20000068	7	2018-08-10	1771.52	4.24	21.59	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2624	20000068	8	2018-08-13	1749.93	4.19	21.64	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2625	20000068	9	2018-08-14	1728.29	4.14	21.70	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2626	20000068	10	2018-08-15	1706.59	4.08	21.75	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2627	20000068	11	2018-08-16	1684.84	4.03	21.80	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2628	20000068	12	2018-08-17	1663.04	3.98	21.85	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2629	20000068	13	2018-08-20	1641.19	3.93	21.90	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2630	20000068	14	2018-08-21	1619.29	3.87	21.96	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2631	20000068	15	2018-08-22	1597.33	3.82	22.01	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2632	20000068	16	2018-08-23	1575.32	3.77	22.06	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2633	20000068	17	2018-08-24	1553.26	3.72	22.11	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2634	20000068	18	2018-08-27	1531.15	3.66	22.17	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2635	20000068	19	2018-08-28	1508.98	3.61	22.22	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2636	20000068	20	2018-08-29	1486.76	3.56	22.27	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2637	20000068	21	2018-08-31	1464.48	3.50	22.33	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2638	20000068	22	2018-09-03	1442.16	3.45	22.38	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2639	20000068	23	2018-09-04	1419.78	3.40	22.43	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2640	20000068	24	2018-09-05	1397.34	3.34	22.49	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2641	20000068	25	2018-09-06	1374.85	3.29	22.54	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2642	20000068	26	2018-09-07	1352.31	3.24	22.60	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2643	20000068	27	2018-09-10	1329.72	3.18	22.65	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2644	20000068	28	2018-09-11	1307.07	3.13	22.70	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2645	20000068	29	2018-09-12	1284.36	3.07	22.76	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2646	20000068	30	2018-09-13	1261.61	3.02	22.81	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2647	20000068	31	2018-09-14	1238.79	2.96	22.87	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2648	20000068	32	2018-09-17	1215.93	2.91	22.92	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2649	20000068	33	2018-09-18	1193.01	2.85	22.98	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2650	20000068	34	2018-09-19	1170.03	2.80	23.03	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2651	20000068	35	2018-09-20	1147.00	2.74	23.09	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2652	20000068	36	2018-09-21	1123.91	2.69	23.14	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2653	20000068	37	2018-09-24	1100.77	2.63	23.20	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2654	20000068	38	2018-09-25	1077.57	2.58	23.25	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2655	20000068	39	2018-09-26	1054.32	2.52	23.31	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2656	20000068	40	2018-09-27	1031.01	2.47	23.36	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2657	20000068	41	2018-09-28	1007.64	2.41	23.42	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2658	20000068	42	2018-10-01	984.22	2.36	23.48	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2659	20000068	43	2018-10-02	960.75	2.30	23.53	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2660	20000068	44	2018-10-03	937.22	2.24	23.59	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2661	20000068	45	2018-10-04	913.63	2.19	23.65	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2662	20000068	46	2018-10-05	889.98	2.13	23.70	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2663	20000068	47	2018-10-09	866.28	2.07	23.76	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2664	20000068	48	2018-10-10	842.52	2.02	23.82	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2665	20000068	49	2018-10-11	818.71	1.96	23.87	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2666	20000068	50	2018-10-12	794.83	1.90	23.93	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2667	20000068	51	2018-10-15	770.90	1.84	23.99	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2668	20000068	52	2018-10-16	746.92	1.79	24.04	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2669	20000068	53	2018-10-17	722.87	1.73	24.10	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2670	20000068	54	2018-10-18	698.77	1.67	24.16	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2671	20000068	55	2018-10-19	674.61	1.61	24.22	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2672	20000068	56	2018-10-22	650.40	1.56	24.28	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2673	20000068	57	2018-10-23	626.12	1.50	24.33	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2674	20000068	58	2018-10-24	601.79	1.44	24.39	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2675	20000068	59	2018-10-25	577.40	1.38	24.45	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2676	20000068	60	2018-10-26	552.95	1.32	24.51	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2677	20000068	61	2018-10-29	528.44	1.26	24.57	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2678	20000068	62	2018-10-30	503.87	1.21	24.63	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2679	20000068	63	2018-10-31	479.25	1.15	24.68	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2680	20000068	64	2018-11-02	454.56	1.09	24.74	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2681	20000068	65	2018-11-05	429.82	1.03	24.80	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2682	20000068	66	2018-11-06	405.01	0.97	24.86	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2683	20000068	67	2018-11-07	380.15	0.91	24.92	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2684	20000068	68	2018-11-08	355.23	0.85	24.98	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2685	20000068	69	2018-11-09	330.25	0.79	25.04	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2686	20000068	70	2018-11-12	305.21	0.73	25.10	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2687	20000068	71	2018-11-13	280.11	0.67	25.16	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2688	20000068	72	2018-11-14	254.95	0.61	25.22	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2689	20000068	73	2018-11-15	229.72	0.55	25.28	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2690	20000068	74	2018-11-16	204.44	0.49	25.34	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2691	20000068	75	2018-11-19	179.10	0.43	25.40	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2692	20000068	76	2018-11-20	153.70	0.37	25.46	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2693	20000068	77	2018-11-21	128.23	0.31	25.52	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2694	20000068	78	2018-11-22	102.71	0.25	25.59	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2695	20000068	79	2018-11-23	77.12	0.18	25.65	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2696	20000068	80	2018-11-26	51.48	0.12	25.71	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2697	20000068	81	2018-11-27	25.77	0.06	25.77	0.37	0.40	26.60	\N	\N	PENDIENTE	1
2698	20000069	1	2018-08-02	1000.00	2.68	11.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2699	20000069	2	2018-08-03	988.93	2.65	11.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2700	20000069	3	2018-08-06	977.83	2.62	11.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2701	20000069	4	2018-08-07	966.70	2.59	11.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2702	20000069	5	2018-08-08	955.54	2.56	11.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2703	20000069	6	2018-08-09	944.35	2.53	11.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2704	20000069	7	2018-08-10	933.13	2.50	11.25	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2705	20000069	8	2018-08-13	921.88	2.47	11.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2706	20000069	9	2018-08-14	910.60	2.44	11.31	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2707	20000069	10	2018-08-15	899.28	2.41	11.34	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2708	20000069	11	2018-08-16	887.94	2.38	11.37	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2709	20000069	12	2018-08-17	876.57	2.35	11.40	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2710	20000069	13	2018-08-20	865.17	2.32	11.43	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2711	20000069	14	2018-08-21	853.74	2.29	11.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2712	20000069	15	2018-08-22	842.27	2.26	11.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2713	20000069	16	2018-08-23	830.78	2.23	11.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2714	20000069	17	2018-08-24	819.26	2.19	11.56	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2715	20000069	18	2018-08-27	807.70	2.16	11.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2716	20000069	19	2018-08-28	796.11	2.13	11.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2717	20000069	20	2018-08-29	784.50	2.10	11.65	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2718	20000069	21	2018-08-31	772.85	2.07	11.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2719	20000069	22	2018-09-03	761.17	2.04	11.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2720	20000069	23	2018-09-04	749.46	2.01	11.74	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2721	20000069	24	2018-09-05	737.72	1.98	11.77	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2722	20000069	25	2018-09-06	725.94	1.94	11.81	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2723	20000069	26	2018-09-07	714.14	1.91	11.84	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2724	20000069	27	2018-09-10	702.30	1.88	11.87	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2725	20000069	28	2018-09-11	690.43	1.85	11.90	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2726	20000069	29	2018-09-12	678.53	1.82	11.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2727	20000069	30	2018-09-13	666.60	1.79	11.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2728	20000069	31	2018-09-14	654.63	1.75	12.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2729	20000069	32	2018-09-17	642.64	1.72	12.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2730	20000069	33	2018-09-18	630.61	1.69	12.06	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2731	20000069	34	2018-09-19	618.55	1.66	12.09	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2732	20000069	35	2018-09-20	606.46	1.62	12.13	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2733	20000069	36	2018-09-21	594.33	1.59	12.16	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2734	20000069	37	2018-09-24	582.17	1.56	12.19	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2735	20000069	38	2018-09-25	569.98	1.53	12.22	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2736	20000069	39	2018-09-26	557.76	1.49	12.26	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2737	20000069	40	2018-09-27	545.50	1.46	12.29	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2738	20000069	41	2018-09-28	533.21	1.43	12.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2739	20000069	42	2018-10-01	520.89	1.40	12.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2740	20000069	43	2018-10-02	508.54	1.36	12.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2741	20000069	44	2018-10-03	496.15	1.33	12.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2742	20000069	45	2018-10-04	483.73	1.30	12.45	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2743	20000069	46	2018-10-05	471.28	1.26	12.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2744	20000069	47	2018-10-09	458.79	1.23	12.52	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2745	20000069	48	2018-10-10	446.27	1.20	12.55	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2746	20000069	49	2018-10-11	433.71	1.16	12.59	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2747	20000069	50	2018-10-12	421.12	1.13	12.62	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2748	20000069	51	2018-10-15	408.50	1.09	12.66	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2749	20000069	52	2018-10-16	395.85	1.06	12.69	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2750	20000069	53	2018-10-17	383.16	1.03	12.72	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2751	20000069	54	2018-10-18	370.43	0.99	12.76	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2752	20000069	55	2018-10-19	357.68	0.96	12.79	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2753	20000069	56	2018-10-22	344.89	0.92	12.83	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2754	20000069	57	2018-10-23	332.06	0.89	12.86	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2755	20000069	58	2018-10-24	319.20	0.85	12.89	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2756	20000069	59	2018-10-25	306.30	0.82	12.93	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2757	20000069	60	2018-10-26	293.37	0.79	12.96	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2758	20000069	61	2018-10-29	280.41	0.75	13.00	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2759	20000069	62	2018-10-30	267.41	0.72	13.03	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2760	20000069	63	2018-10-31	254.38	0.68	13.07	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2761	20000069	64	2018-11-02	241.31	0.65	13.10	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2762	20000069	65	2018-11-05	228.21	0.61	13.14	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2763	20000069	66	2018-11-06	215.07	0.58	13.17	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2764	20000069	67	2018-11-07	201.89	0.54	13.21	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2765	20000069	68	2018-11-08	188.68	0.51	13.24	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2766	20000069	69	2018-11-09	175.44	0.47	13.28	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2767	20000069	70	2018-11-12	162.16	0.43	13.32	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2768	20000069	71	2018-11-13	148.85	0.40	13.35	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2769	20000069	72	2018-11-14	135.49	0.36	13.39	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2770	20000069	73	2018-11-15	122.11	0.33	13.42	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2771	20000069	74	2018-11-16	108.68	0.29	13.46	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2772	20000069	75	2018-11-19	95.23	0.26	13.49	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2773	20000069	76	2018-11-20	81.73	0.22	13.53	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2774	20000069	77	2018-11-21	68.20	0.18	13.57	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2775	20000069	78	2018-11-22	54.63	0.15	13.60	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2776	20000069	79	2018-11-23	41.03	0.11	13.64	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2777	20000069	80	2018-11-26	27.39	0.07	13.68	0.37	0.40	14.52	\N	\N	PENDIENTE	1
2778	20000069	81	2018-11-27	13.71	0.04	13.71	0.37	0.40	14.52	\N	\N	PENDIENTE	1
\.


--
-- Name: tcuotas_idcuota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tcuotas_idcuota_seq', 2778, true);


--
-- Data for Name: tferiado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tferiado (idferiado, dia, fecha) FROM stdin;
1	FIESTAS PATRIAS	2018-07-28
2	FIESTAS PATRIAS	2018-07-29
3	SANTA ROSA DE LIMA	2018-08-30
4	COMBATE DE ANGAMOS	2018-10-08
5	TODOS LOS SANTOS	2018-11-01
6	DIA DE SICUANI	2018-11-04
7	VIRGEN INMACULADA	2018-12-08
8	NAVIDAD	2018-12-25
9	AñO NUEVO	2019-01-01
10	SEMANA SANTA	2019-04-18
11	SEMANA SANTA	2019-04-19
12	DIA DEL TRABAJADOR	2019-05-01
\.


--
-- Name: tferiado_idferiado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tferiado_idferiado_seq', 12, true);


--
-- Data for Name: tmovimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmovimiento (idmovimiento, idcaja, tipomov, socio, cuenta, descripcion, numeromov, moneda, monto, fechamov, horamov, pago, conciliado, dmora, vmora, usuario, sucursal, saldo, ncuota, fechaprog, fcierre) FROM stdin;
1	3	P	9	2000002	 PAGADIARIO 2	1	SOL	-300	2018-07-22	17:09:53	PUNTUAL	NO	\N	\N	1	1	\N	\N	\N	\N
2	7	P	7	2000003	 CAPITAL DE TRABAJO 3	2	SOL	-800	2018-07-22	17:13:33	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
3	7	P	9	2000002	 PAGADIARIO 2	3	SOL	-300	2018-07-19	14:58:13	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
4	7	P	7	2000003	 CAPITAL DE TRABAJO 3	4	SOL	-800	2018-07-19	15:03:25	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
5	7	P	45	2000004	 PAGADIARIO 3	5	SOL	-500	2018-07-19	15:05:51	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
6	7	P	53	2000005	 PAGADIARIO 6	6	SOL	-1000	2018-07-19	15:06:38	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
7	7	P	15	2000006	 PAGADIARIO 1	7	SOL	-300	2018-07-20	17:41:01	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
8	7	P	41	2000007	 PAGADIARIO 4	8	SOL	-1000	2018-07-20	17:45:21	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
9	7	P	59	2000008	 PAGADIARIO 3	9	SOL	-500	2018-07-20	17:45:49	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
10	7	P	60	2000009	 PAGADIARIO 6	10	SOL	-1000	2018-07-20	17:46:19	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
11	7	P	42	2000010	 PAGADIARIO 4	11	SOL	-2000	2018-07-20	17:46:38	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
12	7	P	51	20000022	 PAGADIARIO 4	12	SOL	-1000	2018-07-20	17:54:41	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
13	7	P	64	2000012	 PAGADIARIO 3	13	SOL	-500	2018-07-20	18:11:42	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
14	7	P	55	2000014	 PAGADIARIO 6	14	SOL	-3000	2018-07-20	18:12:40	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
15	7	P	67	2000015	 PAGADIARIO 2	15	SOL	-500	2018-07-20	18:15:00	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
16	7	P	66	2000016	 PAGADIARIO 3	16	SOL	-500	2018-07-20	18:15:36	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
17	7	P	70	2000017	 PAGADIARIO 5	17	SOL	-3000	2018-07-20	18:16:26	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
18	7	P	57	2000018	 PAGADIARIO 6	18	SOL	-1500	2018-07-20	18:17:11	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
19	7	P	72	2000019	 PAGADIARIO 5	19	SOL	-1000	2018-07-20	18:17:38	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
20	7	P	50	2000020	 PAGADIARIO 3	20	SOL	-1000	2018-07-21	17:41:11	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
21	7	P	74	2000021	 PAGADIARIO 5	21	SOL	-2000	2018-07-21	18:04:39	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
34	7	A	104	44179973	AFILIACION	22	SOL	10	2018-07-24	19:11:41	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
35	7	P	104	20000022	 PAGADIARIO 4	23	SOL	-1000	2018-07-24	19:15:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
36	7	A	108	47135377	AFILIACION	24	SOL	7.50	2018-07-24	19:27:23	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
37	7	A	106	76465317	AFILIACION	25	SOL	7.5	2018-07-24	19:27:31	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
38	7	P	108	20000056	 CAPITAL DE TRABAJO 12	26	SOL	-2500	2018-07-24	19:29:28	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
39	7	P	106	20000057	 CAPITAL DE TRABAJO 12	27	SOL	-3000	2018-07-24	19:32:37	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
40	7	A	89	41256966	AFILIACION	26	SOL	7.50	2018-07-25	17:57:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
41	7	P	89	20000058	 PAGADIARIO 3	28	SOL	-1000	2018-07-25	18:04:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
42	7	A	114	48643147	AFILIACION	27	SOL	10	2018-07-25	18:09:56	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
43	7	P	114	20000059	 PAGADIARIO 3	29	SOL	-1000	2018-07-25	18:11:53	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
44	7	A	13	44025662	AFILIACION	28	SOL	7.50	2018-07-25	18:16:27	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
45	7	A	115	46285479	AFILIACION	29	SOL	7.50	2018-07-25	18:17:34	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
46	7	P	115	20000060	 PAGADIARIO 3	30	SOL	-1000	2018-07-25	18:27:13	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
47	7	P	13	20000061	 PAGADIARIO 3	31	SOL	-1000	2018-07-25	18:30:40	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
48	7	A	113	42890373	AFILIACION	30	SOL	7.50	2018-07-25	18:47:17	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
50	7	A	118	24695758	AFILIACION	31	SOL	7.50	2018-07-25	19:04:36	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
51	7	A	119	48501349	AFILIACION	32	SOL	7.50	2018-07-25	19:04:43	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
52	7	P	118	20000063	 PAGADIARIO 4	33	SOL	-1000	2018-07-25	19:06:40	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
53	7	P	113	20000062	 PAGADIARIO 4	34	SOL	-500	2018-07-26	16:18:53	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
54	7	P	55	2000013	 PAGADIARIO 3	35	SOL	-600	2018-07-26	16:25:35	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
55	7	A	133	24668102	AFILIACION	33	SOL	7.50	2018-07-27	11:59:47	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
56	7	A	80	48261987	AFILIACION	34	SOL	7.50	2018-07-27	12:00:58	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
57	7	A	81	44880524	AFILIACION	35	SOL	7.50	2018-07-27	12:01:15	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
58	7	A	107	24706883	AFILIACION	36	SOL	7.50	2018-07-27	12:01:39	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
59	7	A	132	47852194	AFILIACION	37	SOL	7.50	2018-07-27	12:04:43	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
60	7	A	131	44606099	AFILIACION	38	SOL	7.50	2018-07-27	16:26:08	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
61	7	P	131	20000064	 PAGADIARIO 3	36	SOL	-500	2018-07-27	16:29:31	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
62	7	A	135	24702713	AFILIACION	39	SOL	7.50	2018-07-27	16:56:10	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
63	7	P	135	20000065	 PAGADIARIO 2	37	SOL	-500	2018-07-27	17:03:29	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
64	7	A	61	72938356	AFILIACION	40	SOL	7.50	2018-07-27	19:10:52	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
65	7	A	91	41953868	AFILIACION	41	SOL	7.50	2018-07-27	19:11:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
66	7	A	77	24668949	AFILIACION	42	SOL	7.50	2018-07-27	19:11:51	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
67	7	A	79	41114458	AFILIACION	43	SOL	7.50	2018-07-27	19:12:02	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
68	7	A	82	24714127	AFILIACION	44	SOL	7.50	2018-07-27	19:12:11	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
69	7	A	92	24704723	AFILIACION	45	SOL	7.50	2018-07-27	19:12:20	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
70	7	A	94	73822181	AFILIACION	46	SOL	7.50	2018-07-27	19:12:36	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
71	7	A	93	44283935	AFILIACION	47	SOL	7.50	2018-07-27	19:12:46	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
72	7	A	136	76246680	AFILIACION	48	SOL	7.50	2018-07-27	19:13:03	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
73	7	A	116	24712302	AFILIACION	49	SOL	7.50	2018-07-27	19:13:13	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
74	7	A	127	47317784	AFILIACION	50	SOL	7.50	2018-07-27	19:13:28	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
75	7	A	44	47947802	AFILIACION	51	SOL	7.5	2018-07-27	19:15:45	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
76	7	A	37	41005541	AFILIACION	52	SOL	7.5	2018-07-27	19:15:59	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
77	7	A	38	24714737	AFILIACION	53	SOL	7.5	2018-07-27	19:16:21	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
78	7	A	36	24718768	AFILIACION	54	SOL	7.5	2018-07-27	19:16:35	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
79	7	A	33	24660475	AFILIACION	55	SOL	7.5	2018-07-27	19:16:47	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
80	7	A	34	40460365	AFILIACION	56	SOL	7.5	2018-07-27	19:16:59	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
81	7	A	35	24665055	AFILIACION	57	SOL	7.5	2018-07-27	19:17:13	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
82	7	A	62	76172928	AFILIACION	58	SOL	7.5	2018-07-27	19:17:35	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
83	7	A	68	24670691	AFILIACION	59	SOL	7.5	2018-07-27	19:17:44	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
84	7	A	78	24668933	AFILIACION	60	SOL	7.5	2018-07-27	19:17:56	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
85	7	A	111	24703192	AFILIACION	61	SOL	7.5	2018-07-27	19:18:36	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
86	7	A	112	46931886	AFILIACION	62	SOL	7.5	2018-07-27	19:18:43	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
87	7	A	43	47912861	AFILIACION	63	SOL	7.50	2018-07-27	19:37:48	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
88	7	A	124	46807362	AFILIACION	64	SOL	7.50	2018-07-27	19:43:55	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
89	7	A	125	90198730	AFILIACION	65	SOL	5.00	2018-07-27	19:44:02	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
90	7	A	109	24713257	AFILIACION	66	SOL	7.50	2018-07-27	19:44:10	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
91	7	A	134	24707120	AFILIACION	67	SOL	7.50	2018-07-27	19:44:22	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
92	7	A	110	48108674	AFILIACION	68	SOL	7.50	2018-07-27	19:45:54	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
93	7	A	130	47837297	AFILIACION	69	SOL	7.5	2018-07-27	19:54:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
94	7	A	128	41791663	AFILIACION	70	SOL	7.50	2018-07-27	19:55:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
95	7	A	30	63268958	AFILIACION	71	SOL	5	2018-07-27	19:56:22	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
96	7	A	49	73905845	AFILIACION	72	SOL	7.50	2018-07-27	19:56:29	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
97	7	A	86	42676158	AFILIACION	73	SOL	7.50	2018-07-27	19:57:25	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
98	7	A	101	24704469	AFILIACION	74	SOL	7.50	2018-07-27	19:57:35	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
99	7	A	85	40702990	AFILIACION	75	SOL	7.50	2018-07-27	19:58:01	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
100	7	A	102	24701250	AFILIACION	76	SOL	7.50	2018-07-27	19:58:21	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
101	7	A	103	24711985	AFILIACION	77	SOL	7.50	2018-07-27	19:58:30	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
102	7	A	105	47868379	AFILIACION	78	SOL	7.50	2018-07-27	19:58:40	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
103	7	A	117	73951259	AFILIACION	79	SOL	7.50	2018-07-27	19:58:48	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
104	7	A	121	29695532	AFILIACION	80	SOL	7.50	2018-07-27	19:59:07	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
105	7	A	122	46029515	AFILIACION	81	SOL	7.50	2018-07-27	19:59:15	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
106	7	A	137	47213559	AFILIACION	82	SOL	7.50	2018-07-27	19:59:23	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
107	7	A	52	.7958304	AFILIACION	83	SOL	5.00	2018-07-27	20:14:55	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
108	7	A	63	24706918	AFILIACION	84	SOL	7.50	2018-07-27	20:15:54	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
109	7	A	84	80265304	AFILIACION	85	SOL	7.5	2018-07-27	20:16:23	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
110	7	A	98	40531610	AFILIACION	86	SOL	7.50	2018-07-27	20:16:44	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
111	7	A	99	79329785	AFILIACION	87	SOL	5.00	2018-07-27	20:16:55	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
112	7	A	97	24672332	AFILIACION	88	SOL	7.50	2018-07-27	20:17:05	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
113	7	A	129	24580878	AFILIACION	89	SOL	7.50	2018-07-27	20:17:16	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
114	7	A	138	78445271	AFILIACION	90	SOL	5.00	2018-07-27	20:17:46	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
115	7	A	120	60958552	AFILIACION	91	SOL	7.50	2018-07-27	20:17:55	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
116	7	A	65	24669661	AFILIACION	92	SOL	7.50	2018-07-27	20:19:55	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
117	7	A	83	24715752	AFILIACION	93	SOL	7.5	2018-07-27	20:20:08	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
118	7	A	10	80263894	AFILIACION	94	SOL	7.50	2018-07-30	10:13:01	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
119	7	A	87	47126847	AFILIACION	95	SOL	7.50	2018-07-30	10:13:30	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
120	7	A	56	79953457	AFILIACION	96	SOL	5.00	2018-07-30	10:13:40	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
121	7	A	95	80554316	AFILIACION	97	SOL	7.50	2018-07-30	10:13:50	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
122	7	A	54	76077137	AFILIACION	98	SOL	7.50	2018-07-30	10:14:02	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
123	7	A	140	47838320	AFILIACION	99	SOL	7.5	2018-07-30	10:47:27	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
124	7	P	140	20000066	 PAGADIARIO 3	38	SOL	-300	2018-07-30	10:48:31	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
125	7	H	1	30000001	PLAZO FIJO 12	100	SOL	1000	2018-07-30	12:13:24	PUNTUAL	NO	\N	\N	2	1	\N	\N	\N	\N
126	36	P	148	20000067	 PAGADIARIO 6	39	SOL	-1000	2018-08-01	17:49:01	PUNTUAL	NO	\N	\N	4	1	\N	\N	\N	\N
127	36	P	149	20000068	 PAGADIARIO 3	40	SOL	-1900	2018-08-01	17:57:13	PUNTUAL	NO	\N	\N	4	1	\N	\N	\N	\N
128	36	P	86	20000069	 PAGADIARIO 3	41	SOL	-1000	2018-08-01	19:07:23	PUNTUAL	NO	\N	\N	4	1	\N	\N	\N	\N
\.


--
-- Name: tmovimiento_idmovimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmovimiento_idmovimiento_seq', 128, true);


--
-- Data for Name: tprestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tprestamo (idprestamo, idsocio, nprestamo, descripcion, tcuotas, mcuota, monto, plazo, comision, aporte, tea, tem, mora, tipopago, fprestamo, ftermino, fecpago, condicion, garantia, analista, recaudador, estado, aprobado, usuario, sucursal) FROM stdin;
11	51	2000011	PAGADIARIO 4	108	11.35	1000	4	10	0.40	125.22	7	0.59	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A VIERNES	NUEVO	SIN GARANTIA	17	7	EN PROCESO	SI	2	1
12	64	2000012	 PAGADIARIO 3	81	7.65	500	3	10	0.40	138.18	7.5	0.6	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
14	55	2000014	 PAGADIARIO 6	162	22.71	3000	6	10	0.40	101.22	6	0.60	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	5	10	EN PROCESO	SI	2	1
15	67	2000015	 PAGADIARIO 2	8	75.85	500	2	10	2.50	269.23	11.5	0.61	CUOTA FIJA	2018-07-20	2018-07-20	SEMANAL	NUEVO	SIN GARANTIA	11	11	EN PROCESO	SI	2	1
2	9	2000002	 PAGADIARIO 2	54	6.98	300	2	10	0.40	269.23	11.5	0.61	CUOTA FIJA	2018-07-19	2018-07-19	LUNES A VIERNES	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
3	7	2000003	 CAPITAL DE TRABAJO 3	3	305.55	800	3	10	10	51.11	3.5	0.6	CUOTA FIJA	2018-07-19	2018-07-19	MENSUAL	NUEVO	SIN GARANTIA	17	12	EN PROCESO	SI	2	1
4	45	2000004	 PAGADIARIO 3	81	7.65	500	3	10	0.40	138.18	7.5	0.6	CUOTA FIJA	2018-07-19	2018-07-19	LUNES A VIERNES	NUEVO	SIN GARANTIA	16	14	EN PROCESO	SI	2	1
5	53	2000005	 PAGADIARIO 6	24	55.65	1000	6	10	2.50	112.91	6.5	0.60	CUOTA FIJA	2018-07-19	2018-07-19	SEMANAL	NUEVO	SIN GARANTIA	14	11	EN PROCESO	SI	2	1
6	15	2000006	 PAGADIARIO 1	27	12.66	300	1	8	0.40	435.03	15	0.64	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	11	EN PROCESO	SI	2	1
7	41	2000007	 PAGADIARIO 4	108	11.35	1000	4	10	0.40	125.22	7	0.59	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
8	59	2000008	 PAGADIARIO 3	81	7.65	500	3	10	0.40	138.18	7.5	0.6	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A VIERNES	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
9	60	2000009	 PAGADIARIO 6	162	8.08	1000	6	10	0.40	101.22	6	0.60	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
10	42	2000010	 PAGADIARIO 4	108	21.92	2000	4	10	0.40	125.22	7	0.59	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
59	114	20000059	 PAGADIARIO 3	81	14.62	1000	3	10	0.40	151.82	8	0.90	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
16	66	2000016	 PAGADIARIO 3	12	51.92	500	3	10	2.50	138.18	7.5	0.6	CUOTA FIJA	2018-07-20	2018-07-20	SEMANAL	NUEVO	SIN GARANTIA	11	11	EN PROCESO	SI	2	1
17	70	2000017	 PAGADIARIO 5	135	26.68	3000	5	10	0.40	112.91	6.5	0.58	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
18	57	2000018	 PAGADIARIO 6	162	11.74	1500	6	10	0.40	101.22	6	0.60	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
19	72	2000019	 PAGADIARIO 5	135	9.41	1000	5	10	0.40	112.91	6.5	0.58	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
20	50	2000020	 PAGADIARIO 3	81	14.33	1000	3	10	0.40	112.91	6.5	0.6	CUOTA FIJA	2018-07-21	2018-07-21	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	7	EN PROCESO	SI	2	1
1	1	2000001	 PAGADIARIO 6	162	15.60	2000	6	10	0.40	112.91	6.5	0.60	CUOTA FIJA	2018-07-18	2018-07-18	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	9	EN ESPERA	NO	2	1
21	74	2000021	 PAGADIARIO 5	20	122.93	2000	5	10	2.50	112.91	6.5	0.58	CUOTA FIJA	2018-07-21	2018-07-21	SEMANAL	NUEVO	SIN GARANTIA	17	7	EN PROCESO	SI	2	1
55	104	20000022	 PAGADIARIO 4	16	75.77	1000	4	10	2.50	101.22	6	0.80	CUOTA FIJA	2018-07-24	2018-07-24	SEMANAL	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
56	108	20000056	 CAPITAL DE TRABAJO 12	12	249.20	2500	12	10	10.00	19.56	1.5	0.55	CUOTA FIJA	2018-07-24	2018-07-24	MENSUAL	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
57	106	20000057	 CAPITAL DE TRABAJO 12	12	295.04	3000	12	10	10.00	19.56	1.5	0.55	CUOTA FIJA	2018-07-24	2018-07-24	MENSUAL	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	2	1
58	89	20000058	 PAGADIARIO 3	81	14.52	1000	3	10	0.40	138.18	7.5	0.90	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A SÁBADO	NUEVO	SIN GARANTIA	17	10	EN PROCESO	SI	2	1
60	115	20000060	 PAGADIARIO 3	81	14.52	1000	3	10	0.40	138.18	7.5	0.90	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	10	EN PROCESO	SI	2	1
61	13	20000061	 PAGADIARIO 3	81	14.52	1000	3	10	0.40	138.18	7.5	0.90	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A SÁBADO	NUEVO	SIN GARANTIA	5	10	EN PROCESO	SI	2	1
65	135	20000065	 PAGADIARIO 2	8	75.85	500	2	10	2.50	269.23	11.5	1.5	CUOTA FIJA	2018-07-27	2018-07-27	SEMANAL	NUEVO	SIN GARANTIA	11	11	EN PROCESO	SI	2	1
63	118	20000063	 PAGADIARIO 4	108	11.35	1000	4	10	0.40	125.22	7	0.80	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A SÁBADO	NUEVO	SIN GARANTIA	11	11	EN PROCESO	SI	2	1
62	113	20000062	 PAGADIARIO 4	108	5.96	500	4	10	0.40	101.22	6	0.80	CUOTA FIJA	2018-07-25	2018-07-25	LUNES A VIERNES	NUEVO	SIN GARANTIA	16	9	EN PROCESO	SI	2	1
13	55	2000013	 PAGADIARIO 3	81	9.02	600	3	10	0.40	138.18	7.5	0.6	CUOTA FIJA	2018-07-20	2018-07-20	LUNES A SÁBADO	NUEVO	SIN GARANTIA	5	10	EN PROCESO	SI	2	1
64	131	20000064	 PAGADIARIO 3	81	7.65	500	3	10	0.40	138.18	7.5	0.90	CUOTA FIJA	2018-07-27	2018-07-27	LUNES A SÁBADO	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
66	140	20000066	 PAGADIARIO 3	12	33.15	300	3	10	2.50	138.18	7.5	0.90	CUOTA FIJA	2018-07-30	2018-07-30	SEMANAL	NUEVO	SIN GARANTIA	16	16	EN PROCESO	SI	2	1
67	148	20000067	 PAGADIARIO 6	162	8.10	1000.00	6	10	0.40	103.51	6.10	0.60	CUOTA FIJA	2018-08-01	2018-08-01	LUNES A VIERNES	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	4	1
68	149	20000068	 PAGADIARIO 3	81	26.60	1900.00	3	10	0.40	117.76	6.70	0.90	CUOTA FIJA	2018-08-01	2018-08-01	LUNES A VIERNES	NUEVO	SIN GARANTIA	17	17	EN PROCESO	SI	4	1
69	86	20000069	 PAGADIARIO 3	81	14.52	1000.00	3	10	0.40	138.18	7.5	0.90	CUOTA FIJA	2018-08-01	2018-08-01	LUNES A VIERNES	NUEVO	SIN GARANTIA	5	7	EN PROCESO	SI	4	1
\.


--
-- Name: tprestamo_idprestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tprestamo_idprestamo_seq', 69, true);


--
-- Data for Name: trecaudar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trecaudar (idrecaudar, idcaja, idpromotor, frecaudacion, hrecaudacion, total, usuario, sucursal) FROM stdin;
\.


--
-- Name: trecaudar_idrecaudar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trecaudar_idrecaudar_seq', 1, false);


--
-- Data for Name: tsocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tsocio (idsocio, tipodoc, numerodoc, apaterno, amaterno, nombres, numhijos, ecivil, sexo, fnacimiento, tcelular, temergencia, email, ocupacion, departamento, provincia, distrito, direccion, referencia, tvivienda, mconstruccion, utrabajo, rtrabajo, cdni, capaterno, camaterno, cnombres, analista, mafiliacion, afiliado, sucursal, usuario, fregistro) FROM stdin;
1	DNI	80610338	BURGA	HUAMAN	CARLOS VLADIMIR	2	SOLTERO	MASCULINO	1979-03-13	935357233	084211602	CARLIT.OV_5@HOTMAIL.COM	GERENTE COMERCIAL	CUSCO	CANCHIS	SICUANI	JR. ANDRES A. CACERES N° 257 - 259	DOS CUADRAS DE LOZA M. PRADO	FAMILIAR	NOBLE	AV. MANUEL C. ZEVALLOS N° 444	COSTADO DE TELESUP					2	10	SI	1	2	2018-07-17 18:42:41
27	DNI	76416160	HUAMAN	PALOMINO	ADRIAN	0	SOLTERO	MASCULINO	1995-09-24	924876160			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	JR. ALI GUILLEN N°216	DETRÁS DEL COLEGIO JAPAM	FAMILIAR	NOBLE							13	7.50	SI	1	13	2018-07-18 18:35:07
25	DNI	90255976	PINO	CALLO	EMILY ARIANA	0	SOLTERO	FEMENINO	2017-06-05	935447708			DOCTORA 	CUSCO	CANCHIS	SICUANI	JR CONDORHUARACA 	CAPILLA DE PAMPACUCHO	FAMILIAR	MATERIAL NOBLE	PUESTO DE SALUD COMBAPATA	PUESTO DE SALUD COMBAPATA					1	5.00	SI	1	14	2018-07-18 18:16:23
2	DNI	48056630	CANSAYA	AVENDAñO	ELVIS JUNIOR	0	SOLTERO	MASCULINO	1993-11-19	935443737			MOTOTAXISTA	CUSCO	CANCHIS	SICUANI	PROLONGACIÓN UYURMIRI	POSTA PAMPA PHALLA	FAMILIAR	ADOBE							13	7.50	SI	1	13	2018-07-17 18:52:04
17	DNI	72742712	SOLIS	NAVARRO	FRAN FROILAN	0	SOLTERO	MASCULINO	1993-05-08	945040834			CHEF	CUSCO	CANCHIS	SICUANI	AV. CESAR ALVAREZ  S/N	COSTADO TERMINAL CARROS AMARILLOS	PROPIO	NOBLE	AV. CESAR ALVAREZ S/N	REST. EL CARAJO					9	7.50	SI	1	9	2018-07-18 16:32:00
20	DNI	24701509	ALVAREZ	MERMA 	FRANCISCA	4	SOLTERO	FEMENINO	1968-08-26	974414768			COMERCIANTE	CUSCO	CANCHIS	SICUANI	BARRIO CALVARIO JR. HIPOLITO UNANUE S/N	MAS ARRIBA DE LA CAPILLA	PROPIO		MERCADO CENTRAL	VENTA DE PAPA					9	7.50	SI	1	9	2018-07-18 16:58:59
21	DNI	10644489	ROJAS 	GUILLEN	CARLOS	1	CASADO	MASCULINO	1974-06-02	974749469			COMERCIANTE	CUSCO	CHANCHIS	SICUANI	JR. PUMACAHUA S/N	COSTADO DE LA EX COMISARIA	PROPIO		MERCADO CENTRAL	VENTA DE CONDIMENTOS ( EL CHE CARLITOS)					9	7.50	SI	1	9	2018-07-18 17:02:43
18	DNI	24667533	NAVARRO	CHOQUEHUANCA	BARBARA	6	VIUDO	FEMENINO	1958-12-04	984515306			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. SOL N°544	FRENTE AL ESTADIO BOMBONERA 	PROPIO		MERCADO BOMBONERA	VENTA DE BISUTERIA					9	7.50	SI	1	9	2018-07-18 16:46:49
22	DNI	24570572	IMATA	HANCO	FELICIA	2	SOLTERO	FEMENINO	1975-05-21	930132991			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PROLONGACION  WIRACOCHA	EN LA PISTA	PROPIO	NOBLE	TERMINAL DE CARROS AMARILLOS	VENTA DE COMIDA EN EL INTERIOR DEL TERMINAL					9	7.50	SI	1	9	2018-07-18 17:06:49
19	DNI	24711386	NAVARRO 	LIMA 	LEANDRA NANCY	1	SOLTERO	FEMENINO	1972-03-13	990847628			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR. MELGAR N°212	FRENTE A LA CAPILLA DEL CARMEN	ALQUILER	NOBLE	MERCADO CENTRAL	VENTA DE VERDURA					9	7.50	SI	1	9	2018-07-18 16:51:02
23	DNI	24668521	DOMINGUES 	DEMOS	GEORGINA	2	SOLTERO	FEMENINO	1965-02-03	984936144			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. UNION N°158	COSTADO DE UN INTERNET	PROPIO	NOBLE	MERCADO CENTRAL	VENTA DE VERDURA					9	7.50	SI	1	9	2018-07-18 17:11:18
12	DNI	47730538	RABANAL	GRANADA	LIAM ALEXANDER	0	SOLTERO	MASCULINO	2017-08-02	925480465			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	BOMBONERA	BOMBONERA	PROPIO	ADOBE	MERCADO LA BOMBONERA	BOMBONERA					11	5	SI	1	11	2018-07-18 13:59:07
26	DNI	46821395	PACCO	SENCIA	WILLIAMS	0	SOLTERO	MASCULINO	1992-01-09	949329051			ADONTOLOGO	CUSCO	CANCHIS	SICUANI	JIRON VIGIL N°259	AL COSTADO DEL MERCADO CENTRAL	PROPIO	NOBLE	MANUEL CALLO ZEVALLOS	MANUEL CALLO ZEVALLOS					11	10	SI	1	11	2018-07-18 18:17:35
15	DNI	24666114	DE QUISPE	ZEVALLOS	MARINA	1	SOLTERO	FEMENINO	1965-05-10	931032643			COMERCIANTE	CUSCO	CANCHIS	SICUNI	MERCADO CENTRAL	MERCADO CENTRAL SECCION DE COMIDA	PROPIO	ADOBE	MERCADO CENTRAL SECCION COMIDA	MERCADO CENTRAL SECCION COMIDA					11	10	SI	1	11	2018-07-18 16:09:51
16	DNI	29536427	QUISPE	VILCA 	BEATRIZ	3	SOLTERO	FEMENINO	1967-12-28	928026709			COMERCIANTE	CUSCO	CANCHIS	SICUANI	SAN ANDRES	CERCA AL MERCADILLO	PROPIO	ADOBE	CESAR VALLEJO	CERCA ALA LINEA FEREA					6	7.50	SI	1	6	2018-07-18 16:18:53
4	DNI	48261694	ANDRADE	CONDORI	HECTOR ANDRES	0	SOLTERO	MASCULINO	1993-09-30	930209770			MOTOTAXISTA	CUSCO	CANCHIS	SICUANI	JIRÓN MACHUPICCHU	AV. SI	ALQUILER	ADOBE							13	7.50	SI	1	13	2018-07-17 18:56:19
7	DNI	75789417	MAMANI	CONDORI	PORFIRIA	0	SOLTERO	FEMENINO	1998-08-05	930940709			VENDEDORA DE FARMACOS	CUSCO	CANCHIS	SICUANI	CALLE LOS RETAMALES LT B7	ULTIMA CUADRA DE LA AV. AREQUIPA SAN ANDRES	FAMILIAR	ADOBE	MANUEL CALLO ZEVALLOS N°401						12	10.00	SI	1	12	2018-07-17 19:02:39
5	DNI	45025114	SULLCA	QUIñONES	REBECA	2	SOLTERO	FEMENINO	1986-07-04	949453928			COMERCIANTE	CUSCO	CANCHIS	SICUANI	CIRCUMVALACION TORCOMA	COMISARIA TORCCOMA	PROPIO	NOBLE	JR JULIO C TELLO	CERCA AL COLEGIO JAPAM	84303596	HUALLPA	TTUPA	BALVINO	6	7.50	SI	1	6	2018-07-17 18:56:42
28	DNI	24660291	PILCO 	GOMEZ	RAUL	0	CASADO	MASCULINO	1965-04-06	978620762			CONTADOR	CUSCO	CANCHIS	SICUANI	AV. SAN FELIPE N° 150	FISCALIA	PROPIO	NOMBLE	PUENTE POSTENSADO	DEBAJO DEL PUENTE POSTENSADO					12	7.50	SI	1	12	2018-07-18 19:13:15
6	DNI	76327634	PUMA	QUISPE	EDDY GALFORD	0	SOLTERO	MASCULINO	1998-09-02	929288455			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	JR CALCA N°136	A  LA RECTA  DEL JARDIN  REBEQUITA VILLA	PROPIO	ADOBE	 MERCADO CENTRAL  SECCION JUGOS	MERCADO CENTRAL SECCION JUGOS					16	7.50	SI	1	16	2018-07-17 19:00:39
29	DNI	24661574	NOA	MACHACA	ENRIQUETA	3	SOLTERO	FEMENINO	1966-07-15	967760098			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV SAN FELIPE 728	CASA DE DOS PISOS PUERTA DE METAL	PROPIO	RUSTICO	PSJ MARISCAL CASTILLA	ESQUINA CON EL PARQUE CECILIA TUPAC AMARU					17	7.5	SI	1	17	2018-07-19 09:45:02
8	DNI	24713651	CALLO	QUISPE 	ROSA	1	SOLTERO	FEMENINO	1975-08-31	985268217			COMERCIANTE 	CUSCO	CANCHIS 	SICUANI	JR CONDORHUARACA 	COSTADO DE LA CAPILLA DE PAMPACUCHO 	FAMILIAR	MATERIAL NOBLE 	MERCADO CENTRAL 	VENTA DE VERDURA 					14	10	SI	1	14	2018-07-17 19:10:03
11	DNI	31530654	CHAPARRO 	PEREZ	EDILVERTA 	2	SOLTERO	FEMENINO	1966-05-09	935103900			COMERCIANTE	CUSCO	CANCHIS 	SICUANI	ALFONSO UGARTE 	ALFONSO UGARTE 	PROPIO	MATERIAL NOBLE 	MERCADO CENTRAL 	VENTA DE COMIDAS 					14	7.50	SI	1	14	2018-07-18 13:28:40
24	DNI	44390070	SONCCO 	LOPEZ	MILETH 	0	SOLTERO	FEMENINO	2014-07-13	957112600			COMERCIANTE 	CUSCO	CANCHIS	SICUANI	AV. LOS ROSALES 	SAN FELIPE 	PROPIO	MATERIAL NOBLE 	MERCADO CENTRAL 	MERCADO CENTRAL 	44390070	FLOREZ	CARITA 	LUZ MARINA 	1	5.00	SI	1	14	2018-07-18 18:09:55
13	DNI	44025662	PEñA	YUCRA	INES	1	SOLTERO	FEMENINO	1983-08-30	984557423			COMERCIANTE	CUSCO	CANCHIS	SICUANI	CALLE RICARDO PALMA N °311	POR EL PARQUE ROZASPAPA	PROPIO		M TECHO OBRERO (CACHINA	VENTA DE CELURALES					1	7.50	SI	1	5	2018-07-18 13:59:50
14	DNI	48949477	LABRA	PHUTURI	YESENIA	0	SOLTERO	FEMENINO	1996-08-22	56678			COMERCIANTE	CUSCO	CANCHIS 	SICUANI	C. DE COLLANA	POR EL DESCANASO	FAMILIAR	ADOBE	M TECHO OBREO	VENTA DE CELURARES					5	7.50	NO	1	5	2018-07-18 14:04:09
10	DNI	80263894	LOPEZ 	SURCO	HUGO	0	SOLTERO	MASCULINO	1974-12-31	930868489			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PSJ. PANAMERICANA N|258 L.B	POR EL COLEGIO ALBANO	ALQUILER	NOBLE	M:TECHO OBREO	SECCION CACHINA					5	7.50	SI	1	5	2018-07-18 13:27:44
3	DNI	24667379	QUISPE	MAMANI	ROSARIO	5	SOLTERO	FEMENINO	1955-10-07	929288455			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR CALCA N°138	ALA RECTA DEL  JARDIN  REBEQUITA VILLA	PROPIO	ADOBE	MERCADO CENTRAL SECCION JUGOS	MERCADO CENTRAL 					16	7.50	SI	1	16	2018-07-17 18:54:52
31	DNI	44879104	PIZARRO	FLORES	GLEENT FIDEL	0	SOLTERO	MASCULINO	1987-07-06	930372186			TRANSPORTISTA	CUSCO	CANCHIS	SICUANI	CARLOS MARC	CARLOS MARC	PROPIO	MATERIAL NOBLE	PARADERO JULIACA	TRANSPORTISTA					18	7.5	NO	1	18	2018-07-19 09:46:23
32	DNI	46615851	CHUQUITAYPE 	PUMA 	IRVING	0	SOLTERO	MASCULINO	1990-10-04	941000451			TRANSPORTISTA 	CUSCO	CANCHIS	SICUANI 	CARLOS MARX 	CARLOS MARX	PROPIO	MATERIAL NOBLE 	CONDUCTOR 	CONDUCTOR					18	7.50	NO	1	18	2018-07-19 09:57:23
39	DNI	24700239	CCUNO	TINTAYA	DOMINGA	4	CASADO	FEMENINO	1966-05-12	910643066			COMERCIANTE	CUSCO	CANCHIS	SICUANI	MERCADO BOMBONERA 	ESQUINA DEL MERCADO BOMBONERA	PROPIO	NOBLE	MERCADO BOMBONERA SECCION FRUTAS	BOMBONERA SECCION FRUTAS					11	7.50	SI	1	11	2018-07-19 17:28:43
9	DNI	25196892	PUMA 	RODRIGUEZ	SEBASTIANA	3	SOLTERO	FEMENINO	1970-01-20	973247962			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. MANUEL CALLO ZEVALLOS N°516	A UNA  CUADRA DEL HOSPITAL 	PROPIO	ADOBE	MERCADO CENTRAL  SECCION COMIDAS	MERCADO CENTRAL SECCION COMIDAS					16	7.50	SI	1	16	2018-07-17 19:11:17
40	DNI	48188780	ESPIRILLA 	QUISPE	YUDITH	1	SOLTERO	FEMENINO	1994-05-20	945966364			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. REAL 149	FRENTE A UNA TIENDA	PROPIO	NOBLE	MERCADO CENTRAL	SECCION PAPA (VENTA DE FRUTA)					9	7.50	NO	1	9	2018-07-19 17:54:22
45	DNI	48189069	NAKANO	VILCA	KANDY TORIBIA	1	SOLTERO	FEMENINO	1993-12-07	940802256			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR PUMACAHUA N°119	AL  FRENTE DELA  DISCOTECA  CAFETA	ALQUILER	ADOBE	JR PUMACAHUA N°119	JR PUMACAHUA N°119					16	7.50	SI	1	16	2018-07-19 18:25:51
46	DNI	72486986	SICOS	HUARANCA	JULLIAM ROSS	0	SOLTERO	MASCULINO	1992-04-28	940802256			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR PUMACAHUA N°119	JR PUMACAHUA N°119	ALQUILER	ADOBE	JR PUMACAHUA N°119	JR PUMACAHUA N°119					16	7.50	SI	1	16	2018-07-19 18:30:04
48	DNI	24668443	CHARA 	QUISPE 	PAULINA 	2	SOLTERO	FEMENINO	1985-05-25	976875445			COMERCIANTE 	CUSCO 	CANCHIS 	SICUANI 	JR PUMACAHUA INTERIOR 	JR PUMACAHUA 	PROPIO	MATERIAL NOBLE 	MERCADO CENTRAL 	MERCADO CENTRAL					14	7.50	SI	1	14	2018-07-19 18:56:03
47	DNI	48850498	JOYARSE 	LOPEZ	MARIA CONSUELO 	3	SOLTERO	FEMENINO	1986-02-22	917928086			COMERCIANTE 	CUSCO	CANCHIS	SICUANI	SAN ISIDRO 	SAN ISIDRO 	ALQUILER	MATERTIAL NOBLE 	MERCADO CENTRAL 	MERCADO CENTRAL 					14	7.50	SI	1	14	2018-07-19 18:50:47
53	DNI	24708858	MENDOZA 	HUARAYA	CASIMIRO	1	SOLTERO	MASCULINO	1974-03-04	984454061			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON QUILLABAMBA S/N	ESPALDAR DEL  JARDIN REBECA VILLA	ALQUILER	RUSTICO	JIRON QUILLABAMBA S/N	JIRON QUILLABAMBA S/N					11	10.00	SI	1	11	2018-07-19 19:16:42
43	DNI	47912861	JARA	NAVARRO	GUADALUPE	1	SOLTERO	FEMENINO	1993-08-14	984006037			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR. CALVARIO 220	FRENTE A LA CAPILLA CALVARIO	PROPIO	NOBLE	JR. TACNA CON ESQ DE BOLOGNESI	TIENDA DE CELULARES					9	7.50	SI	1	9	2018-07-19 18:03:58
57	DNI	41031580	CONDORI	CCOA 	CLOTILDE 	0	SOLTERO	FEMENINO	1981-10-04	958405969			COMERCIANTE 	CUSCO	CANCHIS	SICUANI 	SAN ANDRES 	SAN ANDRES 	PROPIO	ATERIAL NOBLE 	MERCADO SAN ANDRES 	SAN ANDRES 					3	7.5	SI	1	14	2018-07-19 19:36:33
58	DNI	28850498	OYARCE	LOPEZ	MARIA CONSUELO 	3	SOLTERO	FEMENINO	1983-02-22	917928086			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PSJ NICOLAS DEL PIEROLA 	SAN ISIDRO 	ALQUILER	MERIAL NOBLE	MERCADO CENTRAL 	MERCADO CENTRAL AL FRENTE DE CAJA HUANCAYO 					3	7.50	NO	1	14	2018-07-20 10:05:08
42	DNI	48301908	MAMANI	MUCHICA	LIZBETH FLORENCIA	2	SOLTERO	FEMENINO	1994-04-01	984565701			TECNICO EN CONTABILIDAD	CUSCO	CANCHIS	SICUANI	AV. AREQUIPA 740	COLOSO CANCHINO	FAMILIAR	NOBLE	AV. AREQUIPA 740	COLOSO CANCHINO					17	7.5	SI	1	17	2018-07-19 18:02:43
55	DNI	46634664	JARA 	JALANOCA	ROSALIA	0	SOLTERO	MASCULINO	1990-06-26	930868489			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV . JAPAM	POR EL BARRIO MIRAFLORES	ALQUILER	ADOBE	M. TECHO OBREO 	M .TECHO OBREO (CACHINA9					5	7.50	SI	1	5	2018-07-19 19:29:06
50	DNI	80357356	SULLCA	TORRES	HERMELINDA	0	SOLTERO	MASCULINO	1978-09-18	972476200			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV.REPUBLICA DEL PERU	TERCERA CUADRA DE LA 6 DE JULIO	PROPIO	ADOBE	TERCERA CUADRA DE LA 6 DE JULIO	EMPORIA Y VENTA DE ANTICUCHO					7	7.50	SI	1	7	2018-07-19 18:59:36
33	DNI	24660475	QUISPE	MORA	JULIO EDMUNDO	3	CASADO	MASCULINO	1962-12-27	944263605			COMERCIANTE	CUSCO	CANCHIS	SICUANI	URBANISACION MANZANARES	JULIO OCHOA	PROPIO	NOBLE	MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-19 12:51:57
36	DNI	24718768	QUISPE	YUCRA	TEODORA ELIZABET	2	CASADO	FEMENINO	1973-11-09	951454762			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON SANTA ANA #240	PAMPACUCHO	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					3	7.5	SI	1	21	2018-07-19 13:05:23
35	DNI	24665055	QUISPE	YUCRA	PRUDENCIA	2	CASADO	FEMENINO	1964-10-28	974895105			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	AVENIDA REAL #327	PUENTE CAMELLO	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-19 12:59:15
37	DNI	41005541	DAVILA	ALVAREZ	HILDA	2	CASADO	FEMENINO	1980-11-09	950358885			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON VIGIL #222	MERCADO CENTRAL	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-19 13:11:02
44	DNI	47947802	TACURI	CHAPARRO	CHRISTIAN	0	SOLTERO	MASCULINO	1993-08-30	965300267			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON ALFONSO UGARTE #460	PAMPACUCHO	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-19 18:07:54
38	DNI	24714737	CONDORI	NINA	VILMA	2	CASADO	FEMENINO	1976-05-10	976461579			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	AVENIDA SAN FELIPE #613	FIZCALIA	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-19 13:14:24
34	DNI	40460365	AñAMURO	CONDORI	SORAIDA	4	CASADO	FEMENINO	1967-12-15	926591012			COMERCIANTE	CUSCO	CANCHIS	SICUANI	VIGIL CON MELGAR #100	FLORERIA	PROPIO	NOBLE	JR VIGIL	FLORERIA					21	7.5	SI	1	21	2018-07-19 12:56:04
30	DNI	63268958	HUAYTA	CCASA	FLOR BRIGIDA	0	SOLTERO	FEMENINO	2011-10-11	950720294			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	URB.6 DE JULIO D-6	ENTRADA GRIFO SANTA MONICA	ANTICRESIS	RUSTICO			47437601	CCASA	CONDORI	MARIA LOURDES	7	5	SI	1	7	2018-07-19 09:45:19
54	DNI	76077137	CRUZ	CRUZ	NOHEMI	0	SOLTERO	FEMENINO	1996-11-26	967003007			COSTURERA	CUSCO	CANCHIS	SICUANI	PJE JOSE MAO 362 SAN FELIPE	AV. SAN FELIPE	PROPIO	ADOBE	JR . 2 DE MAYO	JR. 2 DE MAYO					5	7.50	SI	1	5	2018-07-19 19:25:23
49	DNI	73905845	HUANCASH	TINTAYA	MARIA MERCEDES	1	SOLTERO	FEMENINO	1997-01-27	926597316			COMERCIANTE	CUSCO	CANCHIS	SICUANI	URB.6 DE JULIO	ENTRADA GRIFO SANTA MONICA	PROPIO	ADOBE	TIENDA ABARROTES	ENTRADA GRIFO SANTA MONICA	73905839	ARQUE	HUANCO	JEFFERSON	7	7.50	SI	1	7	2018-07-19 18:56:46
52	DNI	.7958304	ACHAHUANCO	SULLCA	THIAGO SEBASTIAN	0	SOLTERO	MASCULINO	2016-03-22	9255872			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	JR CANCHIS	CERCA A PANAMERICANA	PROPIO	RUSTICO	JR CANCHIS	CERCA ALA PANAMERICANA	60958553	SULLCA	QUIñONES	EDUARDA	6	5.00	SI	1	6	2018-07-19 19:13:08
56	DNI	79953457	ALANOCA 	JARA	JACOB JEREMI	0	SOLTERO	MASCULINO	2016-11-23	021754728			COMERCIANTE	CUSCO	CANCHIS	SICUNAI	JR PIURA N°450	POR EL PAMPACUCHO	FAMILIAR	ADOBE	M TECHO OBRERO	M .TECHO OBREO (CACHINA)	46634664	JARA 	JALANOCA	ROSALIA	3	5.00	SI	1	5	2018-07-19 19:33:17
41	DNI	73868622	CCASSA	CCALA	YOSELINE	1	SOLTERO	FEMENINO	1994-04-23	927296626			COMERCIENTE	CUSCO	CANCHIS	SICUANI	AV. TUPAC AMARU 231	CASA DE DOS PISOS REVESTIDO CON YESO	FAMILIAR	RUSTICO	AV. CARRION 217	VENTA DE SALCHIPOLLOS					17	7.5	SI	1	17	2018-07-19 17:57:23
60	DNI	10661045	BERNACHEA	VILLANUEVA	MOISES VICENTE	2	SOLTERO	MASCULINO	1975-09-27	972443973			MECANICO	CUSCO	CANCHIS	SICUANI	PRO MANUEL CALLO ZEVALLOS	CASA DE 4 PISOS MATERIAL NOBLE	ALQUILER	NOBLE 	PRO MANUEL CALLO ZEVALLOS	CASA DE 4 PISOS MATERIAL NOBLE					17	7.5	SI	1	17	2018-07-20 11:20:37
70	DNI	24664942	LOVON	RAMOS	CALIXTO HERNAN	3	SOLTERO	MASCULINO	1965-10-14	954327367			COCINERO	CUSCO	CANCHIS	SICUANI	JR PUMACAHUA 617	DOS PISOS	PROPIO	NOBLE 	JR JULIO C TELLO 322	COLEGIO JAPAM					17	7.5	SI	1	17	2018-07-20 18:45:32
59	DNI	24715089	CASTROMONTE	RODRIGUEZ	TORIBIA JUSTINA	2	CASADO	FEMENINO	1962-04-27	949064012			ENFERMERA TECNICA	CUSCO	CANCHIS	SICUANI	PRO MANUEL CALLO ZEVALLOS	CASA DE 4 PISOS MATERIAL NOBLE	PROPIO	NOBLE	HOSPITAL SICUANI	HOSPITAL SICUANI					17	7.5	SI	1	17	2018-07-20 11:13:36
51	DNI	41879914	CATATA	CCANSAYA	ADELA	2	SOLTERO	FEMENINO	1987-04-24	974053695			COMERCIANTE	CUSCO	CANCHIS	SICUANI	ASOC.MARIA CONCEPCION	ENTRADA PRIMERA CUADRA GRIFO SANTA MONICA	ALQUILER	ADOBE	AV.SICUNI	 OVALO DE AV.SICUANI VENTA DE COMIDA					7	7.50	SI	1	7	2018-07-19 19:03:51
64	DNI	24674719	MOGROVEJO	HACHA	ISABEL	3	SOLTERO	FEMENINO	1964-11-06	965766151			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	JR SANTANDER 	ALA RECTA DE  HANAQ PACHA 	ALQUILER	ADOBE	MERCADO CENTRAL 	MERCADO CENTRAL  FRENTE A  CAJA  HUANCAYO					16	7.50	SI	1	16	2018-07-20 16:32:16
66	DNI	24704870	CONDORI	CCASA	ESTHER	3	SOLTERO	FEMENINO	1971-06-28	959847856			TRABAJADORA	CUSCO	CANCHIS	SICUANI	JIRON VIGIL N°257	AL LADO DEL MERCADO CENTRAL	FAMILIAR	RUSTICO	JIRON VIGIL 257	JIRON VIGIL 257					11	7.50	SI	1	11	2018-07-20 18:01:35
67	DNI	47773416	MAMANI	CONDORI	MISHAEL SHARON	1	SOLTERO	FEMENINO	1992-04-22	957843337			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. LACUSTRE S/N	AV LACUSTRE S/N	PROPIO	RUSTICO	AV. LACUSTRE S/N	AV LACUSTRE S/N					11	7.50	SI	1	11	2018-07-20 18:05:58
73	DNI	46257153	QUISPE	SALVIA	DAVID	0	SOLTERO	MASCULINO	1990-02-01	986168406			ATENCIÓN DE INTERNET	CUSCO	CANCHIS	SICUANI	AV. CENTENARIO	FRENTE DE LA CAJA CUSCO	PROPIO	NOBLE							12	7.50	SI	1	12	2018-07-20 19:09:48
69	DNI	48405984	QUISPE	ARCE	RONALD ELEO	0	SOLTERO	MASCULINO	1994-07-29	956321656			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	CALLE ÁLAMOS S/N	CALLE ALAMOS	ALQUILER								10	7.50	NO	1	10	2018-07-20 18:28:30
72	DNI	24674689	SILVA	CHAMPI	WILLIAMS	2	SOLTERO	MASCULINO	1965-03-10	935113942			MOTOTAXISTA	CUSCO	CANCHIS	SICUANI	LUIS BELTRAN GONZALES	HOSPITAL SICUANI	FAMILIAR	RUSTICO	LUIS BELTRAN GONZALES	HOSPITAL SICUANI					17	10	SI	1	17	2018-07-20 19:07:32
71	DNI	02402781	CHAMBI	COLQUE	MAGDA MALOVA	3	SOLTERO	FEMENINO	1962-11-12	954327367			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR ABRAHAM VALDELOMAR 133	CASA DE DOS PISOS	PROPIO	NOBLE	JR JULIO C TELLO 322	COLEGIO JAPAM					17	7.5	SI	1	17	2018-07-20 18:48:13
74	DNI	24801522	SILLOCCA	DENOS	PASTORA	0	SOLTERO	FEMENINO	1966-01-24	928095935			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AS.FE Y ESPERANZA  C-5	EN LA AS.FE Y ESPERANZA	PROPIO	BLOQUETAS	MERCADO CENTRAL	VENTA DE FRUTAS					7	7.50	SI	1	7	2018-07-21 10:23:36
75	DNI	23919912	HUAMAN	PALOMINO	MARIA AMPARO	1	CASADO	FEMENINO	1972-03-12	974675253			VENTA DE ABARROTES	CUSCO	CANCHIS	SICUANI	JR. ALI GUILLEN N°216	ATRÁS DEL COLEGIO JAPAM	FAMILIAR	NOBLE							13	7.50	SI	1	13	2018-07-21 12:38:53
76	DNI	48217499	HALANOCCA	CHURATA	LUZGAYDA	0	SOLTERO	FEMENINO	1994-02-28	914109996			ATIENDE INTERNET	CUSCO	CANCHIS	SICUANI	AV. AREQUIPA N°165	FRENTE DE LA UNSAAC	FAMILIAR	NOBLE							12	7.50	SI	1	12	2018-07-21 12:53:35
61	DNI	72938356	ZAMBRANO	HUARANCA	GUADALUPE	1	SOLTERO	FEMENINO	1994-02-12	954276416			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRÓN MELGAR	MERCADO CENTRAL	PROPIO	ADOBE	MERCADO CENTRAL	MERCADO CENTRAL					20	7.50	SI	1	20	2018-07-20 13:30:31
87	DNI	47126847	LAGOS	CRUZ	MARUJA	2	SOLTERO	FEMENINO	1976-08-23	928197543			COMERCIANTE	CUSCO	CANCHIS	SICUNAI	PSJ.ARRIBA PERU N°	POR LA LOZA 4 DE NOVIEMBRE	FAMILIAR	NOBLE	ESQUINA PUENTE CAMELLO	POR EL ISP REGIONAL					5	7.50	SI	1	5	2018-07-23 19:11:41
81	DNI	44880524	HUAMANI	MUñOZ	ROBERTO	0	SOLTERO	MASCULINO	1979-05-13	953829272			CONDUCTOR	CUSCO	CANCHIS	SICUANI	JOSE CARLOS MARIATEGUI S/N	JOSE CARLOS MARIATEGUI	PROPIO	NOBLE	PARADERO INTERDISTRITAL	PARADERO INTERDISTRITAL					11	7.50	SI	1	11	2018-07-23 16:19:00
77	DNI	24668949	CASTILLO	DE DAVILA	MARÍA CONCEPCIÓN	3	CASADO	FEMENINO	1952-12-08	983861290			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRÓN SANTIAGO	PAMPACUCHO	PROPIO	NOBLE	MERCADO CENTRAL 	MERCADO CENTRAL					20	7.50	SI	1	20	2018-07-21 13:15:24
79	DNI	41114458	ACHATA	MONTESINOS	YOLA DOMINGA	4	CASADO	FEMENINO	1981-11-15	974900015			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	JIRÓN HUAYNA CCAPAC	ESTADIO TUPAC AMARU	PROPIO	ADOBE	MERCADO BOMBONERA	MERCADO BOMBONERA					20	7.50	SI	1	20	2018-07-23 12:44:49
82	DNI	24714127	CABRERA 	CHILO	MARIA CARMEN	4	SOLTERO	FEMENINO	1976-01-28	983773458			AMA DE CASA	CUSCO	CANCHOS	SICUANI	AV. REAL	PUENTE CAMELLO	ALQUILER	ADOBE	AV.REAL	PUENTE CAMELLO					20	7.50	SI	1	20	2018-07-23 17:48:31
62	DNI	76172928	ASCUE	PEREZ	SHARMELY DEL PILAR	0	SOLTERO	FEMENINO	2001-05-16	950358885			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON CONDORHUARACA #306	PAMPACUCHO	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-20 13:42:58
68	DNI	24670691	DAVILA	ALVAREZ	CELIA	3	CASADO	FEMENINO	1964-04-05	957512258			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	CALLE VENEZUELA S/N	URBANISACION MANZANARES	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-20 18:16:33
86	DNI	42676158	MAMANI	QUISPE	KATUSCA	1	SOLTERO	FEMENINO	1984-08-22	910526711			NEGOCIANTE	CUSCO	CANCHIS	SICUANI	URB. 6 DE JULIO A - 11	ESQUINA 6 DE JULIO CON SANTA ANA	PROPIO	ADOBE	URB. 6 DE JULIO A - 11	EN UNA ESQUINA PICANTERIA					3	7.50	SI	1	7	2018-07-23 18:33:22
85	DNI	40702990	MONTAñO	GUTIERREZ	YOVANA	2	SOLTERO	FEMENINO	1979-12-04	961311305			NEGOCIO	CUSCO	CANCHIS	SICUANI	URB. 6 DE JULIO	PRIMERA CUADRA DE 6 JULIO	FAMILIAR	ADOBE	PAMPA  ANZA	VENTA DE CUYES  VENTA DE LECHE					7	7.50	SI	1	7	2018-07-23 18:30:09
63	DNI	24706918	MAMANI	CALLE	JULIA	1	CASADO	FEMENINO	1970-03-11	969826692			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR CANCHIS	AL FINAL DE JR CANCHIS	PROPIO	RUSTICO	BOMBONERA	MERCADO DE GRANOS					6	7.50	SI	1	6	2018-07-20 16:25:07
84	DNI	80265304	JORDAN	MACHACA	IRMA	3	CASADO	FEMENINO	1971-09-11	964871634			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PASAJE SAN CRISTOBAL	MANUEL PRADO	ALQUILER	RUSTICO	PUENTE POSTENSADO						6	7.5	SI	1	6	2018-07-23 18:13:18
83	DNI	24715752	ATAUCHI	AUCAHUAQUI	CLAUDIA SARA	2	SOLTERO	FEMENINO	1976-12-10	24715752	952379437		COMERCIANTE	CUSCO	CACHIS	SICUANI	JR CANCHIS	EVENTOS SOLIS	PROPIO	NOBLE	MERCADO BOMBONERA	MATES MEDICINALES					6	7.5	SI	1	6	2018-07-23 18:06:29
65	DNI	24669661	MONTOYA	HUILLCA	MARIA	3	CASADO	FEMENINO	1959-09-04	984006967			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PASAJE VICTORIA	DETRAS DEL HOSPITAL	PROPIO	RUSTICO	MANUEL C ZEBALLOS						6	7.50	SI	1	6	2018-07-20 16:46:44
100	DNI	63802998	ATIQUIPA	LOPINTA	MELANY SILVANA	1	SOLTERO	FEMENINO	2011-08-12	946744539			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	JESUS  GAONA  N° S/N	AL COSTADO DEL PENAL	ALQUILER	ADOBE	PUENTE  POSTENSADO	PUENTE  POSTENSADO					16	5	SI	1	16	2018-07-24 18:55:55
104	DNI	44179973	LIMA	TTITO	LISBETH	2	SOLTERO	FEMENINO	0003-08-19	931132878			NEGOCIANTE	CUSCO	CANCHIS	SICUANI	JIRON JUNIN 113	DOS PISOS	PROPIO	RUSTICO	BARRIO SAN ISIDRO	BARRIO SAN ISIDRO					17	10	SI	1	17	2018-07-24 19:07:09
108	DNI	47135377	SOTO	GARCIA	JHON BENI	2	SOLTERO	MASCULINO	1992-07-08	935459600			ANALISTA DE CREDITOS	CUSCO	CANCHIS	SICUANI	AV CENTENARIO S/N	CASA  DE  2 PISOS	FAMILIAR	ADOBE	MANUEL  CALLO ZEVALLOS 	COOPERATIVA INTEGRA					16	7.50	SI	1	16	2018-07-24 19:26:26
106	DNI	76465317	VALERIANO	PUMA	JUAN CARLOS	0	SOLTERO	MASCULINO	1995-04-18	980276437			ANALISTA DE CREDITOS	CUSCO	CANCHIS	SICUANI	JULIO OCHOA 	CASA DE DOS PISOS 	FAMILIAR	RUSTICO	AV MANUEL CALLO ZEVALLOS	COOPERATIVA INTEGRA					17	7.5	SI	1	17	2018-07-24 19:24:12
114	DNI	48643147	LOVON	CHAMBI	KATHERINE ASTRID	1	SOLTERO	FEMENINO	1989-09-28	916725243			ENFERMERA TECNICO	CUSCO	CANCHIS	SICUANI	DOS DE MAYO 326	DOS DE MAYO 326	ALQUILER	RUSTICO	DOS DE MAYO 326	BOTICA SAN MARTIN DE PORRES					17	10	SI	1	17	2018-07-25 18:01:50
112	DNI	46931886	CONDORI	QUISPE	HILDA	2	CASADO	FEMENINO	1990-06-13	913919066			COMERCIANTE	CUSCO	CANCHIS	SICUANI	COMUNIDAD DE CHUMO	CHUMO	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-25 12:25:16
89	DNI	41256966	QUISPE	MAMANI	MARGOT	1	SOLTERO	FEMENINO	1962-05-01	944153032			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR.11 DE MARZO N°146	POR LA AV.PROGRESO	FAMILIAR	ADOBE	MALECON TECHO OBRERO	CACHINA					5	7.50	SI	1	5	2018-07-23 19:19:40
115	DNI	46286479	BEGAZO	MAMANI	VERONICA	2	SOLTERO	FEMENINO	1987-06-06	910451191			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PJE TINTA N°116	FRENTE AL COLEGIO PUMACAHUA	ALQUILER	ADOBE	AV MANUEL CALLO ZEVALLOS	AV MANUEL CALLO ZEVALLOS					5	7.50	SI	1	5	2018-07-25 18:12:52
107	DNI	24706883	CONDORI	CCASA	SIMEONA	2	SOLTERO	FEMENINO	1973-04-21	953772693			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	JIRON VIGIL N°257	AL COSTADO DEL MERCADO CENTRAL	PROPIO	RUSTICO	MARISCAL CASTILLA 	MARISCAL CASTILLA					11	7.50	SI	1	11	2018-07-24 19:26:16
91	DNI	41953868	MINAYA	CHAUCA	HILARIA	3	SOLTERO	FEMENINO	1983-02-03	983861290			COMERCIANTE	CUSCO	CANCHIS 	SICUANI	COMUNIDAD DE CHUMO	COMUNIDAD DE CHUMO	PROPIO	ADOBE	AV. GRAU	PLAZA DE ARMAS					20	7.50	SI	1	20	2018-07-24 12:20:49
92	DNI	24704723	QUILLCA	CATUNTA	MAGDALENA	3	SOLTERO	FEMENINO	1972-07-25	973529148			COMERCIANTE	CUSCO	CANCHIS 	SICUANI	JIRÓN. TTITO COSñIPATA	AV. UNGRIA	PROPIO	ADOBE	BOMBONERA	MERCADO BOMBONERA					20	7.50	SI	1	20	2018-07-24 12:26:33
94	DNI	73822181	QUISPE	CARLO	BETZABEL JAQLYN	0	SOLTERO	FEMENINO	1999-07-15	916113125			COMERCIANTE	CUSCO 	CANCHIS 	SICUANI	JIRÓN WIRACOCHA S/N	JIRÓN WIRACOCHA	PROPIO	ADOBE	AV. AREQUIPA	AV. .AREQUIPA					20	7.50	SI	1	20	2018-07-24 18:11:43
93	DNI	44283935	ALVAREZ 	MACEDO	KATHERINE EDITH	2	SOLTERO	FEMENINO	1987-03-21	932001916			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV.SICUANI	ESQUINA DE COLEGIO  PITAGORAS	ALQUILER		JULIO OCHOA	COLEGIO EMBLEMÁTICO MATEO PUMACHUA					20	7.50	SI	1	20	2018-07-24 18:05:53
116	DNI	24712302	MERMA 	CRUZ	MARLENY	3	SOLTERO	FEMENINO	1975-01-30	983861290			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	COMUNIDAD DE CHUMO	COMUNIDAD CHUMO	PROPIO	ADOBE	URBANIZACIÓN SAN ISIDRO	URBANIZACIÓN SAN ISIDRO					20	7.50	SI	1	20	2018-07-25 18:25:27
78	DNI	24668933	QUISPE	RAMOS	TORIBIA	3	VIUDO	FEMENINO	1961-03-16	984531051			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AVENIDA CLORINDA MATO #613	PUENTE CAMELLO	PROPIO	NOBLE	MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-23 11:40:08
111	DNI	24703192	APAZA	QUISPE	GENORIA	0	SOLTERO	FEMENINO	1959-09-19	989525027			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON BOLIVAR #404	MERCADO CENTRAL	PROPIO		MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	SI	1	21	2018-07-25 12:21:43
109	DNI	24713257	TTICA	YUCRA	VILMA	2	CASADO	FEMENINO	1975-10-10	974747754			AMA DE CASA	CUSCO	CANCHIS	SICUANI	CALLE HUAMANGA	HABITAD	PROPIO	NOBLE							13	7.50	SI	1	13	2018-07-24 20:20:39
110	DNI	48108674	BUSTAMANTE 	MAMANI	BRIGIDA	0	SOLTERO	FEMENINO	1992-12-11	982387200			DUEÑA DE UN RESTAURANTE	CUSCO	CANCHIS	SICUANI	AV. AREQUIPA N°1201	RESTAURANTE LANGUEÑITO	FAMILIAR	NOBLE							12	7.50	SI	1	12	2018-07-24 20:24:01
101	DNI	24704469	MUÑOZ	ALVARADO	DANIELA	1	SOLTERO	FEMENINO	1971-01-23	973267015			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PROLG.MANUEL CALLO CEBALLOS	CERCA A LA ORILLA DEL RIO 	ALQUILER	ADOBE	AV.SICUANI	OVALO DE AV.SICUANI					7	7.50	SI	1	7	2018-07-24 19:00:21
102	DNI	24701250	QUISPE	CORAHUA	VICTORIANO TEODORO	3	SOLTERO	MASCULINO	1968-04-01	965901534			COMERCIANTE	CUSCO	CANCHIS	SICUANI	ASOC.MARIA CONCEPCION CISNEROS	ENTRADA GRIFO SANTA MONICA	PROPIO	ADOBE	VENTA DE CHICHA	AVALO DE AV.SICUANI					7	7.50	SI	1	7	2018-07-24 19:02:51
103	DNI	24711985	NOA	MAMANI	CERAFINO	0	SOLTERO	MASCULINO	1974-08-26	967016776			CARPINTERO	CUSCO	CANCHIS	SICUANI	JR:BRASIL S/N	ENTRADA DE LA 6 DE JULIO	PROPIO	ADOBE	JR:BRASIL S/N	ENTRADA DE LA 6 DE JULIO					7	7.50	SI	1	7	2018-07-24 19:06:30
105	DNI	47868379	COLLANTES	CALLO	YENNI	2	SOLTERO	FEMENINO	1984-01-11	963405168			AMA DE CASA	CUSCO	CANCHIS	SICUANI	AV.JULIO OCHOA S/N	ANTIGUO COLEGIO SICUANI	ALQUILER	CONCRETO	AV:JULIO OCHOA S/N	ANTIGUO COLEGIO SICUANI					7	7.50	SI	1	7	2018-07-24 19:10:09
98	DNI	40531610	HUILLCA 	CONDORI	HERNESTINA	1	SOLTERO	FEMENINO	1980-04-29	928696987			COMERCIANTE	CUSCO	CANCHIS	SICUANI	CALLE PANAMERICANA	CERCA AL FINAL	PROPIO	RUSTICO	AV GRAU	VENTA DE PAPA RELLENA					6	7.50	SI	1	6	2018-07-24 18:42:42
99	DNI	79329785	YAURI	CAHUANA	AARON MISAEL	0	SOLTERO	MASCULINO	2015-10-07	982052232			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	JR MALECON CUSCO	CERCA AL PUENTE POSTENSADO	ALQUILER	NOBLE	MALECON CUSCO	SEÑOR DE LOS TEMBLORES	48617984	CAHUANA 	CONDORI	IRMA	6	5.00	SI	1	6	2018-07-24 18:51:14
97	DNI	24672332	CCALLO	QUISPE	CASIANO	7	SOLTERO	MASCULINO	1995-08-05	927062080			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	AV JULIO OCHOA	CERCA AL COLEGIO	PROPIO	RUSTICO	RICARDO PALMA	VENTA DE QUINUA					6	7.50	SI	1	6	2018-07-24 18:30:35
95	DNI	80554316	COAGUILA	CHURA	JORGE	2	SOLTERO	MASCULINO	1970-08-15	941653328			COMERCIANTE	CUSCO	CANCHIS	SICUANI	URB. SAN ISIDRO N° 145	EN LA MISMA UBR. SAN ISIDRO	FAMILIAR	ADOBE	MERCADIO LA BOMBONERA	VENTA DE LINTERNAS					5	7.50	SI	1	16	2018-07-24 18:18:39
96	DNI	48565433	LOPINTA	DIAZ	NAYDA	1	SOLTERO	FEMENINO	1993-07-25	946744539			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JESUS GAONA  N° S/N	DETRAS DEL PENAL	ALQUILER	ADOBE	PUENTE POSTENSADO	PUENTE POSTENSADO					16	7.50	SI	1	16	2018-07-24 18:20:55
90	DNI	44751085	VALERIANO	PUMA	HUGO	1	SOLTERO	MASCULINO	1987-08-22	996127914			ANALISTA 	CUSCO	CANCHIS	SICUANI	PROLONG:JULIO OCHOA 	A UNA CUADRA DE MISQUIRI	FAMILIAR	ADOBE	BANCO AZTECA 	BANCO  AZTECA					16	7.50	SI	1	16	2018-07-23 19:37:08
88	DNI	24677365	ENRIQUEZ	MESTAS	LUCILA	3	VIUDO	FEMENINO	1954-12-16	943577686			COMERCIANTE	CUSCO	CANCHIS	SICUANI	PARADERO INTER DISTRITAL	CASA DE DOS PISOS MATERIAL NOBLE	ALQUILER	NOBLE	PARADERO INTER DISTRITAL	PARADERO INTER DISTRITAL					17	7.5	SI	1	17	2018-07-23 19:15:57
113	DNI	42890373	CCANSAYA	HILAQUITA	MAUDI	2	SOLTERO	FEMENINO	1985-01-06	916672666			COMERCIANTE	CUSCO	CANCHIS	SICUANI	ALTO   MISQUIRI	SAN FELIPE 	FAMILIAR	ADOBE	MERCADO  CENTRAL	 MERCADO   VENTA DE  MENESTRAS 					16	7.50	SI	1	16	2018-07-25 17:55:55
135	DNI	24702713	ESPINOZA	RIVERA	WALTER	0	SOLTERO	MASCULINO	1968-11-04	935202682			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON CANCHIS-629	JIRON CANCHIS-629	PROPIO		JIRON CANCHIS-629	JIRON CANCHIS-629					11	7.50	SI	1	11	2018-07-27 16:53:56
118	DNI	24695758	VELASQUEZ	SULLCA	JUAN	0	SOLTERO	MASCULINO	1967-08-21	957707916			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JIRON VIGIL N°257	JIRON VIGIL N°257	PROPIO		MARISCAL CASTILLA	MARISCAL CASTILLA					11	7.50	SI	1	11	2018-07-25 19:01:51
119	DNI	48501349	VELASQUEZ	CONDORI	NANSHYA	0	SOLTERO	FEMENINO	1993-12-15	925480465			PROMOTORA	CUSCO	CANCHIS	SICUANI	JIRON VIGIL 257	JIRON VIGIL 257	PROPIO	RUSTICO	MANUEL CALLO ZEVALLOS	MANUEL CALLO ZEVALLOS					11	7.50	SI	1	11	2018-07-25 19:03:45
123	DNI	42890379	CCANSAYA	HILAQUITA	MAUDI	2	SOLTERO	FEMENINO	1985-01-01	916672666			COMERCIANTE	CUSCO	CANCHIS	SICUANI	SAN FELIPE ALTO MISQUIRI	AV SAN FELIPE	FAMILIAR	ADOBE	MERCADO CENTRAL	MERCADO  SECCION  VENTA MENESTRAS					16	7.50	NO	1	16	2018-07-25 19:50:48
130	DNI	47837297	SOTO	RAMOS	DINA	0	SOLTERO	FEMENINO	1991-08-04	925925169	930372186		PROFESORA	CUSCO	CANCHIS	SICUANI	ELECTRO	INSTITUTO VILCANOTA	PROPIO		DOCENTE						18	7.5	SI	1	20	2018-07-26 19:05:40
128	DNI	41791663	LACUTA	SULLCA	MARISOL	1	SOLTERO	FEMENINO	1983-05-29	921800295			PROFESORA	CUSCO 	CANCHISI	SICUANI	HUITA SENCCA	A LADO DE LA CAPILLA	PROPIO	ADOBE	DOCENTE	COLEGIO 					18	7.50	SI	1	20	2018-07-26 18:57:36
133	DNI	24668102	FLORES	LOPINTA	SIMONA	0	SOLTERO	FEMENINO	1962-09-28	939726296			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	MANUEL CALLO ZEVALLOS 227	MANUEL CALLO ZEVALLOS 227	FAMILIAR	RUSTICO	MANUEL CALLO ZEVALLOS 227	MANUEL CALLO ZEVALLOS 227					11	7.50	SI	1	11	2018-07-27 11:52:02
80	DNI	48261987	SURCO	GUTIERREZ	JUAN DIEGO	0	SOLTERO	MASCULINO	1992-12-14	925807930			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	MARISCAL N°217	JIRON MARISCAL CASTILLA	FAMILIAR	RUSTICO	AVENIDA MARISCAL CASTILLA	AVENIDA MARISCAL CASTILLA					11	7.50	SI	1	11	2018-07-23 16:11:43
132	DNI	47852194	ALATA 	CHOQUE	JULIO CESAR	0	SOLTERO	MASCULINO	1991-11-02	929985030			SERENAZGO	CUSCO	CANCHIS	SICUANI	ASOCIACION WARARI	ASOC. WARARI	PROPIO	RUSTICO	BASE DE SERENAZGO	BASE DE SERENAZGO					11	7.50	SI	1	11	2018-07-27 11:43:09
131	DNI	44606099	PALOMINO	SURCO 	CELIA	3	SOLTERO	FEMENINO	1982-01-28	914165633			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR:MELGAR  S/N	ALA RECTA DE  JARDIN REBEQUITA  VILLA	PROPIO	ADOBE	MERCADO CENTRAL	CENTRAL SECCION PAPAS					16	7.50	SI	1	16	2018-07-27 10:42:38
120	DNI	60958552	SULLCA	QUIñONES	KATIA NASTIA	1	SOLTERO	FEMENINO	1997-08-11	930452864			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	CIRCUMVALACION TORCOMA	CERCA ALA COMISARIA	ALQUILER	RUSTICO	MERCADO BOMBONERA						6	7.50	SI	1	6	2018-07-25 19:20:21
136	DNI	76246680	MOSCOSO 	MOLE	KATHERINE PAOLA	0	SOLTERO	FEMENINO	1994-11-09	927424839			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	JIRÓN BOLÍVAR	MERCADO CENTRTAL	PROPIO		MERCADO CENTRAL SICUANI	MERCADO CENTRAL					20	7.50	SI	1	20	2018-07-27 18:30:37
127	DNI	47317784	HUAMAN 	HUAQUISTO	JAIME EDGAR	0	CASADO	MASCULINO	1991-08-10	974961745			PROVEEDOR 	CUSCO 	CANCHIS	SICUANI	BAQUIJANO CARRILLO S/N	AV. SAN FELIPE	ALQUILER	ADOBE	SICUANI	SICUANI					20	7.50	SI	1	20	2018-07-26 18:41:39
139	DNI	44359845	RIOS	CHOQUETOCRO	JULIO CESAR	0	SOLTERO	MASCULINO	1987-07-14	929390929			CONDUCTOR	CUSCO	CANCHIS	SICUANI	AV AREQUIPA	CARLOS MARC	PROPIO		PARADERO JULIACA ASTRAN 	AV AREQUIPA ALTURA DEL GRIFO VILCANOTA					18	7.5	NO	1	18	2018-07-27 19:29:53
124	DNI	46807362	TURPO	PUMA	JUAN VICTOR	0	SOLTERO	MASCULINO	1990-02-20	930338423			CHOFER	CUSCO	CANCHIS	SICUANI	JR. CONDORHUARACA N°123	SALESIANO	FAMILIAR	NOBLE							13	7.50	SI	1	13	2018-07-26 16:08:24
125	DNI	90198730	CCANSAYA	VARGAS	GAEL BRYHAN	0	SOLTERO	MASCULINO	2017-04-19	914075407			HIJO DE LA SEñORA VENDEDORA 	CUSCO	CANCHIS	SICUANI	AV. AREQUIPA	AL FRENTE DEL PARADERO DE HERCA	FAMILIAR	NOBLE							13	5.00	SI	1	13	2018-07-26 16:15:08
134	DNI	24707120	SAMATA	BACA	JOSE LUIS	2	SOLTERO	MASCULINO	1972-08-19	970567476			CONTADOR 	CUSCO	CANCHIS	SICUANI	AV. CESAR VALLEJO N°216	UGEL CANCHIS- PATRIMONIO	FAMILIAR	NOBLE							13	7.50	SI	1	13	2018-07-27 16:14:41
117	DNI	73951259	CCASA	CONDORI	NELY ROSAYDA	0	SOLTERO	FEMENINO	1998-04-13	974590654			NEGOCIO	CUSCO	CANCHIS	SICUANI	ALTO MISQUIRI	ALTO MISQUIRI	ALQUILER	CONCRETO	DISTINTO LUGARES	DISTINTOS LUGARES					7	7.50	SI	1	7	2018-07-25 18:47:46
122	DNI	46029515	MIRANDA	VELASQUEZ	GLADYS ANTONIA	1	SOLTERO	FEMENINO	1989-09-01	982073763			ANALISTA DE CREDITOS	CUSCO	CANCHIS	SICUANI	AL COSTADO DE PARQUE ROSASPATA	AL COSTADO DEL PARQUE ROSASPATA	ALQUILER	CONCRETO	AV.CENTENARIO	CAJA CUSCO					7	7.50	SI	1	7	2018-07-25 19:32:41
121	DNI	29695532	TOMAYCONSA	INJILTUPA	HERNESTINA	3	SOLTERO	FEMENINO	1976-11-11	921268235			COMERCIANTE	CUSCO	CANCHIS	SICUANI	BAJO MISQUIRI	JR:VENEZUELA S/N	PROPIO		MERCADO CENTRAL	VENTA DE CABEZA Y PANZA					7	7.50	SI	1	7	2018-07-25 19:28:46
137	DNI	47213559	CCOPA	CRUZ	AMELIA	2	SOLTERO	FEMENINO	1990-12-19	928095945			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV CONFEDERACION S/N	AV CONFEDERACION SN	PROPIO	RUSTICO	AV CONFEDERACION	VENTA DE ANTICUCHO					7	7.50	SI	1	7	2018-07-27 19:05:17
129	DNI	24580878	TECSI	QUISPE	JUANA	2	SOLTERO	FEMENINO	1967-03-27	984562589			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR INANBARI	CERCA ALA TIENDA CASERITA	PROPIO	NOBLE	MANUEL C ZEBALLOS	RESTAURAN RANCHO					6	7.50	SI	1	6	2018-07-26 19:03:09
138	DNI	78445271	CARBAJAL	CCOPA	JHASMIN ALICIA	0	SOLTERO	MASCULINO	2013-12-04	928095945			ESTUDIANTE	CUSCO	CANCHIS	SICUANI	AV CONFEDERACION	AV SICUANI	PROPIO	RUSTICO	AV SICUANI		47213559	CCOPA	CRUZ	AMELIA	6	5.00	SI	1	6	2018-07-27 19:26:24
140	DNI	47838320	BOLIVAR	MAMANI	LUIS ALBERTO	0	SOLTERO	MASCULINO	1992-12-20	963415322			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR. ALFONSO UGARTE 448	DETRAS DE LA CAC INTEGRA ASOCIADOS	ALQUILER	ADOBE	MISMO DOMICILIO	MISMO DOMICILIO					16	7.5	SI	1	2	2018-07-30 10:47:18
141	DNI	24663659	PALOMINO 	HANCO	JUAN	2	SOLTERO	MASCULINO	1953-01-31	937590192			GANADERO	CUSCO	CANCHIS	SICUANI	AV. UNION N°158	COSTADO  DE UN INTERNET	PROPIO	NOBLE	MERCADO CENTRAL	SECCION VERDURAS					9	7.50	NO	1	9	2018-07-31 09:52:18
142	DNI	42149866	LEON 	TAIRO	LUDEK	2	SOLTERO	MASCULINO	1983-11-06	957726559			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. CENTENARIO N° 705	EN LA PISTA	PROPIO	NOBLE	DEBAJO DEL PUENTE PAYASO	AL COSTADO DE LA CEVICHERIA NORTEÑITA					9	7.50	NO	1	9	2018-07-31 10:03:26
143	DNI	23977626	CALLAPIñA	PUCHORI	HILDA	1	SOLTERO	FEMENINO	41974-07-09	930868489			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR EMILIO MERCADO N° 109	POR LA EL JR.UNION MIRAFLORES	PROPIO		M. TECHO OBRERO CACHINA	VENTA DE CELULARES					5	7.50	NO	1	5	2018-07-31 16:44:12
144	DNI	79713672	APAZA	CALLAPIÑA	ZAHORI MILET	0	SOLTERO	FEMENINO	2016-06-12	930868489			COMERCIANTE	CUSCO	SICUANI	CANCHIS	JR.EMILIO MERCACO N°109	UNA CUANDOD	ALQUILER	ABOBE			23977626	CALLAPIÑA	PUCHORI	HILDA	5	5.00	NO	1	5	2018-07-31 16:48:41
145	DNI	47126112	PADILLA	ALCCA	CARMELI	1	SOLTERO	FEMENINO	1990-06-12	957049427			COMERCIANTE	CUSCO	CANQUIS	SICUANI	ALTO PAMPACUCHO	PAMPACUCHO	PROPIO	NOBLE	MERCADO CENTRAL	MERCADO CENTRAL					21	7.5	NO	1	21	2018-07-31 17:53:10
146	DNI	73535103	QUISPE	MAQQUE	RUTH EBELIN	0	SOLTERO	FEMENINO	1998-03-25	921802501			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	SAN FELIPE	A UNA CUADRA DEL COLISEO SAN FELIPE	FAMILIAR	ADOBE	ESQUINA SAN FELIPE CON JULIO OCHOA	ESQUINA SAN FELIPE CON JULIO OCHOA					16	7.50	NO	1	16	2018-07-31 19:26:26
126	DNI	46672854	BLANCO	AÑAMURO	YHON ALBERT	0	SOLTERO	MASCULINO	1990-06-28	910471005			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR  MELGAR 	FLORERIA	ALQUILER	RUSTICO	JR MELGAR CON JR VIGIL	FLORERIA					17	7.5	SI	1	17	2018-07-26 18:29:34
147	DNI	46538168	PRADO	QUISPE	ANA CATERIN	0	SOLTERO	FEMENINO	1990-08-01	951163050			COMERCAINTE	CUSCO	CANCHIS	SICUANI	BOMBONERA	MERCADO DE LA BOMBONERA	FAMILIAR	RUSTICO	BOMBONERA	SECCION DE ZAPATOS					17	7.50	NO	1	17	2018-07-31 20:24:24
148	DNI	24718437	VILLA	SARA	JESUSA	3	SOLTERO	FEMENINO	1975-01-01	940073380			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR DOS DE MAYO 841	ALTURA DE LA PLASOLETA JORGE CHAVEZ	PROPIO	RUSTICO	MERCADO CENTRAL	MERCADO CENTRAL					17	7.50	SI	1	17	2018-07-31 20:28:00
149	DNI	09666731	LUJAN	ORE	SAMUEL	0	SOLTERO	MASCULINO	1973-02-21	964175012			COMERCIANTE	CUSCO	CANCHIS	SICUANI	C. ALVARES S/N	CASA DE 4 PISOS 	ALQUILER	NOBLE	C ALVARES S/N	CASA DE 4 PISOS 					17	10	SI	1	17	2018-08-01 17:31:42
150	DNI	24714529	ESPINOSA	SUAREZ	JUSTA	4	SOLTERO	FEMENINO	1966-08-19	913746390			COMERCIANTE	CUSCO	CANCHIS	SICUANI	COMUNIDAD HUITACA	POR TRAPICHE	PROPIO	RUSTICO	MERCADO CENTRAL	VENTA DE FLORES					6	7.50	NO	1	6	2018-08-01 18:06:02
151	DNI	41698656	CCALLO	HUARAKA	MARCIANA	4	SOLTERO	FEMENINO	1982-12-29	953787137			COMERCIANTE	CUSCO 	CANCHIS	SICUANI	DIEGO CECILIA TUPAC AMAURU	AV. UNGRIA	PROPIO	ADOBE	BOMBONERA	AL COSTADO DE ESSALUD (SEGURO)					20	7.50	NO	1	20	2018-08-01 18:14:47
152	DNI	24675879	CCARITA	QUISPE	ALEJANDRA	0	SOLTERO	FEMENINO	1960-04-24	000000000			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV.SICUANI S/N	POR EL COLEGIO PITAGFORAS	PROPIO	ADOBE	MERCADO BOMBONERA			ARMANDO 	HALANOCCA	GREGORIO	7	7.50	NO	1	7	2018-08-01 18:15:10
153	DNI	24709544	CHOQUEHUANCA	BELTRAN	FRANCISCA	1	SOLTERO	FEMENINO	1971-01-23	946669882			COMERCIANTE	CUSCO	CANCHIS	SICUANI	JR:ATAHUALLPA S/N	ANTES DE LLEGAR AL MERCADO CENTRAL	ALQUILER	MATERIAL NOBLE	JR:ATAHUALLPA S/N	ANTES DE LLEGAR AL MERCADO CENTRAL					7	7.50	NO	1	7	2018-08-01 18:18:24
154	DNI	40104434	TINTAYA	HUARSAYA	CARMEN ROSA	3	SOLTERO	FEMENINO	1979-02-09	931753759			NEGOCIO	CUSCO	CANCHIS	SICUANI	AV.CONFEDERACION S/N	AL FRENTE DEL GRIFO SANTA MONICA	ALQUILER	CONCRETO	AV.CONFEDERACION S/N	AL FRENTE DEL GRIFO SANTA MONICA		JOSE LUIS	RAMOS	TINTAYA	7	7.50	NO	1	7	2018-08-01 18:21:56
155	DNI	45916215	CORAHUA	PAUCAR	YOVANA	2	SOLTERO	FEMENINO	1989-08-25	961154075			COMERCIANTE DE CARNE	CUSCO	CANCHIS	SICUANI	JR. ROSENDO ZEVALLOS	A LA DERECHA DE LA CAPILLA PAMPACUCHO	FAMILIAR	NOBLE							12	7.50	NO	1	12	2018-08-01 19:37:23
156	DNI	24586398	CONDORI	MAMANI	TORIBIA	4	SOLTERO	FEMENINO	1976-04-16	944064177			VENTA DE EMOLIENTE	CUSCO	CANCHIS	SICUANI	JR. SUCUTANI S/N	AV. AREQUIPA - IGLESIA MORMONES	PROPIO	NOBLE	AV. AREQUIPA	IGLESIA MORMONES					12	7.50	NO	1	12	2018-08-01 19:41:04
157	DNI	76405657	QUISPE	FLORES	MARICHUZ	0	SOLTERO	FEMENINO	1996-04-18	925281082			COMERCIANTE	CUSCO	CANCHIS	SICUANI	AV. CONFEDERACIÓN N°424	A LADO DEL HOTEL RESTAURANT WILCAMAYU	FAMILIAR	NOBLE	AL FRENTE DE LA AGENCIA ELECTRO 	AL FRENTE DE LA AGENCIA ELECTRO 					13	7.50	NO	1	13	2018-08-01 19:47:39
158	DNI	24667055	CHOQUE	QUISPE	JOSEFA	3	SOLTERO	FEMENINO	1963-03-19	990074481			VENTA DE CUELLITOS	CUSCO	CANCHIS	SICUANI	CIRO ALEGRIA N°342	AV. AREQUIPA	PROPIO	NOBLE	AV. AREQUIPA	A LADO DE LA IGLESIA MORMON					13	7.50	NO	1	13	2018-08-01 19:51:32
\.


--
-- Name: tsocio_idsocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tsocio_idsocio_seq', 158, true);


--
-- Data for Name: tsucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tsucursal (idsucursal, descripcion, direccion, departamento, provincia, distrito) FROM stdin;
1	AGENCIA SICUANI	AV. MANUEL CALLO ZEVALLOS 444	CUSCO	CANCHIS	SICUANI
\.


--
-- Name: tsucursal_idsucursal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tsucursal_idsucursal_seq', 1, true);


--
-- Data for Name: ttipoahorro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttipoahorro (idtipoahorro, descripcion, plazo, tem, moneda, montomin, montomax, sucursal) FROM stdin;
1	PLAZO FIJO	12	8.5	SOL	300	200000	1
2	PLAZO FIJO	18	14	SOL	300	200000	1
\.


--
-- Name: ttipoahorro_idtipoahorro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ttipoahorro_idtipoahorro_seq', 33, true);


--
-- Data for Name: ttipomov; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttipomov (idtipomov, descripcion, detalle, sucursal) FROM stdin;
1	AFILIACION	A	1
2	AHORRO	H	1
3	PRESTAMO	P	1
4	DEPOSITAR	D	1
5	RETIRO	R	1
6	PAGO CUOTA	C	1
7	ING. EFECTIVO	E	1
8	SAL. EFECTIVO	S	1
\.


--
-- Name: ttipomov_idtipomov_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ttipomov_idtipomov_seq', 8, true);


--
-- Data for Name: ttipoprestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttipoprestamo (idtipoprestamo, descripcion, plazo, tem, moneda, comision, mora, montomin, montomax, sucursal) FROM stdin;
1	PAGADIARIO	6	6	SOL	10	0.60	200	20000	\N
2	PAGADIARIO	5	6.5	SOL	10	0.70	200	20000	\N
3	PAGADIARIO	4	7	SOL	10	0.80	200	20000	\N
4	PAGADIARIO	3	7.5	SOL	10	0.90	200	20000	\N
5	PAGADIARIO	2	11.5	SOL	10	1.5	200	20000	\N
6	PAGADIARIO	1	13.5	SOL	8	3	200	20000	\N
7	CAPITAL DE TRABAJO	12	2.8	SOL	10	0.55	300	100000	\N
8	CAPITAL DE TRABAJO	3	4	SOL	10	0.85	300	100000	\N
9	CAPITAL DE TRABAJO	6	3.5	SOL	10	0.5	300	100000	1
10	CONVENIO	2	14	SOL	6	4	450	1000	1
\.


--
-- Name: ttipoprestamo_idtipoprestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ttipoprestamo_idtipoprestamo_seq', 10, true);


--
-- Data for Name: ttipotrabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttipotrabajador (idtipotrabajador, descripcion) FROM stdin;
1	ADMINISTRADOR DE SISTEMAS
2	ADMINISTRADOR DE OFICINA
3	ANALISTA
4	AUXILIAR DE OPERACIONES
5	CAJERO
6	CONTADOR
7	GESTOR DE RECUPERACIONES
8	JEFE DE AHORROS
9	JEFE DE CREDITOS
10	JEFE DE OPERACIONES
11	JEFE DE UNIDAD DE COMBRANZAS
12	PROMOTOR DE AHORRO Y CREDITOS
\.


--
-- Name: ttipotrabajador_idtipotrabajador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ttipotrabajador_idtipotrabajador_seq', 12, true);


--
-- Data for Name: ttrabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ttrabajador (idtrabajador, dni, apaterno, amaterno, nombres, celular, tipotrabajador, sucursal, fregistro) FROM stdin;
3	41633402	GAMARRA	ALVAREZ	WENNER VIDAL	951654764	2	1	2018-07-15 23:18:11
6	60958553	SULLCA	QUIñONES	EDUARDA	925805872	12	1	2018-07-16 19:54:56
7	47437601	CCASA	CONDORI	MARIA LOURDES	950720294	12	1	2018-07-16 19:56:44
9	48898704	VASQUEZ	NAVARRO	ERIKA	941902226	12	1	2018-07-16 20:01:49
10	47863484	SANCHEZ	VARGAS	WENDY MAYUNI	910999808	12	1	2018-07-16 20:08:04
11	48501349	VELASQUEZ	CONDORI	NANSHYA MOREEN	925480465	12	1	2018-07-16 20:11:26
12	76132405	MAMANI	CONDORI	NADIA KELINA	930716908	12	1	2018-07-16 20:12:29
13	75984218	CANSAYA	AVENDAñO	MISHELL JAKELINE	928026955	12	1	2018-07-16 20:14:09
14	70371886	DIAZ	CALLO	CARMEN CECILIA	957112600	12	1	2018-07-16 20:17:08
18	44775034	SOTO	RAMOS	MIRIAM	930372186	12	1	2018-07-17 09:54:30
19	47883388	GAMARRA	ALVAREZ	IDALUZ	957751763	4	1	2018-07-17 10:16:41
2	80610338	BURGA	HUAMAN	CARLOS VLADIMIR	935357233	2	1	2018-07-15 23:17:13
20	77035641	SOTO	TORRES	YONATHAN	983861290	12	1	2018-07-19 10:18:59
21	76421833	TACURI	CHAPARRO	PAUL SEBASTIAN	950358885	12	1	2018-07-19 10:57:32
8	48344634	HUALLA	HUAYNASI	MARIA DEL CARMEN	973630980	5	1	2018-07-16 19:59:02
16	76465317	VALERIANO	PUMA	JUAN CARLOS	980276437	12	1	2018-07-17 09:52:38
17	47135377	SOTO	GARCIA	JHON BENI	935459600	12	1	2018-07-17 09:53:19
1	40700920	FARFAN	GAVANCHO	DAYVIS VICTOR	951680606	1	1	\N
4	40233436	LUNA	AVILES	GEORGINA	987250897	10	1	2018-07-16 01:12:17
5	47795562	MENDOZA	APÁZA	JOEL	930868489	12	1	2018-07-16 01:14:38
22	48434940	MAMANI	GERUNDAS	JESSICA	989277960	11	1	2018-07-19 11:00:25
\.


--
-- Name: ttrabajador_idtrabajador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ttrabajador_idtrabajador_seq', 22, true);


--
-- Data for Name: tusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tusuario (idusuario, usuario, contrasena, clave, idtrabajador) FROM stdin;
1	Dayvis	$2y$10$zXZSoaAJBN1qRvuaamukG.mOQvnOluOIxM.2H91WvZSjnofUrN1pG	zXZSoaAJBN1qRvuaamukGH	1
2	CBURGA01	$2y$10$B8EOXpR5aqvOw2B1bwwc7..r0crAvUZqpWVCVan1MsmbLFPh76qAO	B8EOXpR5aqvOw2B1bwwc7H	2
3	VGAMARRA01	$2y$10$17ommcu8qHz44NWZMOaR.uEVR6MbPD0/cSBXOPC1NIPcPIziVBoxC	17ommcu8qHz44NWZMOaR.4	3
4	JMENDOZA01	$2y$10$YnsPNvC3mfBFD/QUp3Ooxe2qBi8yvhFi5bczBYyakMFXvJYwMlgLG	YnsPNvC3mfBFD/QUp3Ooxt	5
5	GLUNA01	$2y$10$grKRQD/FpNYWuj93wKKJl.8m8fvcHbTRqxEX6tA0H9kaUs/Lz5t3G	grKRQD/FpNYWuj93wKKJlA	4
6	MHUALLA01	$2y$10$ukFMoSlxZ041LtkDq93kbOUKQT3Vkm5pzk2OYgbfozIh0nENoFXRe	ukFMoSlxZ041LtkDq93kbQ	8
7	MCANSAYA01	$2y$10$iqAxT6VQbm.LVdlNYL.vI.ztNdwnKraHcc7bfbcTpd.hSo7zh3rn2	iqAxT6VQbm.LVdlNYL.vIG	13
9	NMAMANI01	$2y$10$Grzq5Tod31XHGIp5zZBt0ezR4vJdZxMRbDQokWMeLIFeYmu8dTive	Grzq5Tod31XHGIp5zZBt0o	12
10	EVASQUEZ01	$2y$10$hclHPwEuaH014hBPKvbqgeZ/QqWcUwJilLEp4ZMBWM76ZzcaFCUg6	hclHPwEuaH014hBPKvbqgq	9
11	LCCASA01	$2y$10$rNqqJoN.y.uHaF.6fzHW5u6hL5P.OTk1uG8HC6dfU/aciKomB.BxW	rNqqJoN.y.uHaF.6fzHW5x	7
12	JSOTO01	$2y$10$oHJHNJFNnMt/I6I7N4bgGu2jrhKjxT6l1Dzske/aKvHwiqkis/.4S	oHJHNJFNnMt/I6I7N4bgG3	17
13	ESULLCA01	$2y$10$pcaDh6gwV15Fpq6pY/WDA.CgdZpR3HgHR5roxBaxS070cycymP6f6	pcaDh6gwV15Fpq6pY/WDAN	6
14	MSOTO01	$2y$10$E0DWLb/HaEsWhmuMw.jNauKjcNoZKw4UpaMYw0/hyTJTFSXFsvV1G	E0DWLb/HaEsWhmuMw.jNav	18
15	IALVAREZ	$2y$10$MtpR35msZcUs61yAWbmrbOp883vsILVufKTjhQbChLT5b6zPt9Fcm	MtpR35msZcUs61yAWbmrbU	19
16	NVELASQUEZ01	$2y$10$F8IFyCod2mEMcrZAdZmdWOm5I8D.bJ4HjZzI.rlausoXl1g5gXIB.	F8IFyCod2mEMcrZAdZmdWQ	11
17	JVALERIANO01	$2y$10$ltfSdnEpRlKEOnsrue7gjuEHOzq5hozeKjEaRKTr.h9S5834OVmC2	ltfSdnEpRlKEOnsrue7gj1	16
18	CDIAZ01	$2y$10$6O.1130VgtpXP.zaCl7N6uetC5vJK9qGeB8hf2bM8XFXUafFTJLnO	6O.1130VgtpXP.zaCl7N6v	14
8	WSANCHEZ	$2y$10$wVaRJBHZPAF9Gf3NrrJm9eQu12AusxeCjBW3XwRVwHJekBvbKc2oa	wVaRJBHZPAF9Gf3NrrJm9t	10
20	PTACURI01	$2y$10$BrC.KVe0qZZWgtTKV3BqgudzGGBZOHYYvddby00cSqifJIhymiKym	BrC.KVe0qZZWgtTKV3Bqg4	21
19	YSOTO01 	$2y$10$p8I.WwzwU9EMypYbyy2AnOS7FnmjBBSzSYatbHLAJIB58SqSjzMh2	p8I.WwzwU9EMypYbyy2AnU	20
21	JMAMANI01	$2y$10$/0vU.jpV4KEmn71QBc4ohuHYpGpoCUU1CXuR7ef3ghXXqFek2BuTS	/0vU.jpV4KEmn71QBc4oh9	22
\.


--
-- Name: tusuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tusuario_idusuario_seq', 21, true);


--
-- Name: tahorro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tahorro
    ADD CONSTRAINT tahorro_pkey PRIMARY KEY (idahorro);


--
-- Name: tcaja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcaja
    ADD CONSTRAINT tcaja_pkey PRIMARY KEY (idcaja);


--
-- Name: tcuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tcuotas
    ADD CONSTRAINT tcuotas_pkey PRIMARY KEY (idcuota);


--
-- Name: tferiado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tferiado
    ADD CONSTRAINT tferiado_pkey PRIMARY KEY (idferiado);


--
-- Name: tmovimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmovimiento
    ADD CONSTRAINT tmovimiento_pkey PRIMARY KEY (idmovimiento);


--
-- Name: tprestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tprestamo
    ADD CONSTRAINT tprestamo_pkey PRIMARY KEY (idprestamo);


--
-- Name: trecaudar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trecaudar
    ADD CONSTRAINT trecaudar_pkey PRIMARY KEY (idrecaudar);


--
-- Name: tsocio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tsocio
    ADD CONSTRAINT tsocio_pkey PRIMARY KEY (numerodoc);


--
-- Name: tsucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tsucursal
    ADD CONSTRAINT tsucursal_pkey PRIMARY KEY (idsucursal);


--
-- Name: ttipoahorro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipoahorro
    ADD CONSTRAINT ttipoahorro_pkey PRIMARY KEY (idtipoahorro);


--
-- Name: ttipomov_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipomov
    ADD CONSTRAINT ttipomov_pkey PRIMARY KEY (idtipomov);


--
-- Name: ttipoprestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipoprestamo
    ADD CONSTRAINT ttipoprestamo_pkey PRIMARY KEY (idtipoprestamo);


--
-- Name: ttipotrabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttipotrabajador
    ADD CONSTRAINT ttipotrabajador_pkey PRIMARY KEY (idtipotrabajador);


--
-- Name: ttrabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ttrabajador
    ADD CONSTRAINT ttrabajador_pkey PRIMARY KEY (idtrabajador);


--
-- Name: tusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tusuario
    ADD CONSTRAINT tusuario_pkey PRIMARY KEY (idusuario);


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

