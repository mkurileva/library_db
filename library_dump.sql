--
-- PostgreSQL database dump
--

\restrict kBq2KDdGa36QKK9ZU7g3SCh42VCmBgCzIJrKqlasbDYSbBrleqrwN1tqwPEdAb4

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-07 18:31:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 232 (class 1259 OID 16465)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    isbn character varying NOT NULL,
    title character varying NOT NULL,
    author character varying NOT NULL,
    publisher character varying NOT NULL,
    year integer NOT NULL,
    genre character varying NOT NULL
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16464)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.book_id_seq OWNER TO postgres;

--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 231
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- TOC entry 222 (class 1259 OID 16396)
-- Name: bookcopies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookcopies (
    id integer NOT NULL,
    inventory_number character varying(50),
    status character varying(50),
    location character varying(100),
    book_id integer
);


ALTER TABLE public.bookcopies OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16395)
-- Name: bookcopies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookcopies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookcopies_id_seq OWNER TO postgres;

--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 221
-- Name: bookcopies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookcopies_id_seq OWNED BY public.bookcopies.id;


--
-- TOC entry 238 (class 1259 OID 16512)
-- Name: bookcopy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookcopy (
    id integer NOT NULL,
    inventory_number character varying NOT NULL,
    status character varying NOT NULL,
    location character varying NOT NULL,
    book_id integer
);


ALTER TABLE public.bookcopy OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16511)
-- Name: bookcopy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookcopy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookcopy_id_seq OWNER TO postgres;

--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 237
-- Name: bookcopy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookcopy_id_seq OWNED BY public.bookcopy.id;


--
-- TOC entry 220 (class 1259 OID 16386)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id integer NOT NULL,
    isbn character varying(50),
    title character varying(200),
    author character varying(200),
    publisher character varying(200),
    year integer,
    genre character varying(100)
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16385)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 240 (class 1259 OID 16530)
-- Name: borrowing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowing (
    id integer NOT NULL,
    issue_date date NOT NULL,
    planned_return_date date NOT NULL,
    actual_return_date date,
    reader_id integer,
    book_copy_id integer,
    librarian_id integer
);


ALTER TABLE public.borrowing OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16529)
-- Name: borrowing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrowing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.borrowing_id_seq OWNER TO postgres;

--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 239
-- Name: borrowing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrowing_id_seq OWNED BY public.borrowing.id;


--
-- TOC entry 228 (class 1259 OID 16429)
-- Name: borrowings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowings (
    id integer NOT NULL,
    issue_date date,
    planned_return_date date,
    actual_return_date date,
    reader_id integer,
    book_copy_id integer,
    librarian_id integer
);


ALTER TABLE public.borrowings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16428)
-- Name: borrowings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrowings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.borrowings_id_seq OWNER TO postgres;

--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 227
-- Name: borrowings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrowings_id_seq OWNED BY public.borrowings.id;


--
-- TOC entry 242 (class 1259 OID 16559)
-- Name: fine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fine (
    id integer NOT NULL,
    amount double precision NOT NULL,
    reason character varying NOT NULL,
    status character varying NOT NULL,
    borrowing_id integer
);


ALTER TABLE public.fine OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16558)
-- Name: fine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fine_id_seq OWNER TO postgres;

--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 241
-- Name: fine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fine_id_seq OWNED BY public.fine.id;


--
-- TOC entry 230 (class 1259 OID 16452)
-- Name: fines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fines (
    id integer NOT NULL,
    amount numeric(10,2),
    reason character varying(200),
    status character varying(50),
    borrowing_id integer
);


ALTER TABLE public.fines OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16451)
-- Name: fines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fines_id_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 229
-- Name: fines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fines_id_seq OWNED BY public.fines.id;


--
-- TOC entry 236 (class 1259 OID 16497)
-- Name: librarian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.librarian (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    "position" character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.librarian OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16496)
-- Name: librarian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.librarian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.librarian_id_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 235
-- Name: librarian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.librarian_id_seq OWNED BY public.librarian.id;


--
-- TOC entry 226 (class 1259 OID 16419)
-- Name: librarians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.librarians (
    id integer NOT NULL,
    full_name character varying(200),
    "position" character varying(100),
    login character varying(100),
    password character varying(100),
    status character varying(50)
);


ALTER TABLE public.librarians OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16418)
-- Name: librarians_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.librarians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.librarians_id_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 225
-- Name: librarians_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.librarians_id_seq OWNED BY public.librarians.id;


--
-- TOC entry 234 (class 1259 OID 16481)
-- Name: reader; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    address character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    registration_date date NOT NULL,
    status character varying NOT NULL
);


ALTER TABLE public.reader OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16480)
-- Name: reader_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reader_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reader_id_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 233
-- Name: reader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reader_id_seq OWNED BY public.reader.id;


--
-- TOC entry 224 (class 1259 OID 16409)
-- Name: readers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readers (
    id integer NOT NULL,
    full_name character varying(200),
    address character varying(200),
    phone character varying(50),
    email character varying(100),
    registration_date date,
    status character varying(50)
);


ALTER TABLE public.readers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16408)
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.readers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.readers_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 223
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
-- TOC entry 4917 (class 2604 OID 16468)
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16399)
-- Name: bookcopies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopies ALTER COLUMN id SET DEFAULT nextval('public.bookcopies_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 16515)
-- Name: bookcopy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy ALTER COLUMN id SET DEFAULT nextval('public.bookcopy_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16389)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16533)
-- Name: borrowing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing ALTER COLUMN id SET DEFAULT nextval('public.borrowing_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16432)
-- Name: borrowings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings ALTER COLUMN id SET DEFAULT nextval('public.borrowings_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 16562)
-- Name: fine id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine ALTER COLUMN id SET DEFAULT nextval('public.fine_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16455)
-- Name: fines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fines ALTER COLUMN id SET DEFAULT nextval('public.fines_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 16500)
-- Name: librarian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarian ALTER COLUMN id SET DEFAULT nextval('public.librarian_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16422)
-- Name: librarians id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarians ALTER COLUMN id SET DEFAULT nextval('public.librarians_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 16484)
-- Name: reader id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader ALTER COLUMN id SET DEFAULT nextval('public.reader_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16412)
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- TOC entry 5117 (class 0 OID 16465)
-- Dependencies: 232
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (id, isbn, title, author, publisher, year, genre) FROM stdin;
1	978-5-17-133928-5	Мастер и Маргарита	Михаил Булгаков	АСТ	2020	Роман
2	978-5-389-07484-1	Преступление и наказание	Фёдор Достоевский	Азбука	2018	Классика
3	978-5-389-18073-3	1984	Джордж Оруэлл	Азбука-Аттикус	2019	Антиутопия
\.


--
-- TOC entry 5107 (class 0 OID 16396)
-- Dependencies: 222
-- Data for Name: bookcopies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookcopies (id, inventory_number, status, location, book_id) FROM stdin;
\.


--
-- TOC entry 5123 (class 0 OID 16512)
-- Dependencies: 238
-- Data for Name: bookcopy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookcopy (id, inventory_number, status, location, book_id) FROM stdin;
1	INV-001	в наличии	Зал 1, полка 3	1
2	INV-002	в наличии	Зал 1, полка 3	1
3	INV-003	выдана	Зал 2, полка 1	2
4	INV-004	в наличии	Зал 3, полка 5	3
\.


--
-- TOC entry 5105 (class 0 OID 16386)
-- Dependencies: 220
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, isbn, title, author, publisher, year, genre) FROM stdin;
\.


--
-- TOC entry 5125 (class 0 OID 16530)
-- Dependencies: 240
-- Data for Name: borrowing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrowing (id, issue_date, planned_return_date, actual_return_date, reader_id, book_copy_id, librarian_id) FROM stdin;
1	2024-10-15	2024-11-01	2024-10-28	1	3	1
2	2024-11-02	2024-11-20	\N	2	2	2
\.


--
-- TOC entry 5113 (class 0 OID 16429)
-- Dependencies: 228
-- Data for Name: borrowings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrowings (id, issue_date, planned_return_date, actual_return_date, reader_id, book_copy_id, librarian_id) FROM stdin;
\.


--
-- TOC entry 5127 (class 0 OID 16559)
-- Dependencies: 242
-- Data for Name: fine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fine (id, amount, reason, status, borrowing_id) FROM stdin;
1	150	просрочка возврата	оплачен	1
2	300	порча книги	не оплачен	2
\.


--
-- TOC entry 5115 (class 0 OID 16452)
-- Dependencies: 230
-- Data for Name: fines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fines (id, amount, reason, status, borrowing_id) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 16497)
-- Dependencies: 236
-- Data for Name: librarian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.librarian (id, full_name, "position", login, password, status) FROM stdin;
1	Смирнова Ольга Викторовна	главный библиотекарь	smirnova	12345	активен
2	Кузнецов Андрей Михайлович	ассистент	kuznetsov	password	активен
\.


--
-- TOC entry 5111 (class 0 OID 16419)
-- Dependencies: 226
-- Data for Name: librarians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.librarians (id, full_name, "position", login, password, status) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 16481)
-- Dependencies: 234
-- Data for Name: reader; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader (id, full_name, address, phone, email, registration_date, status) FROM stdin;
1	Иванов Иван Иванович	г. Москва, ул. Ленина, 5	+79995553311	ivanov@mail.ru	2024-09-15	активен
2	Петрова Анна Сергеевна	г. Москва, ул. Чехова, 12	+79997774422	petrova@mail.ru	2024-10-01	активен
3	Сидоров Алексей Павлович	г. Москва, пр-т Мира, 45	+79990001234	sidorov@mail.ru	2024-10-20	не активен
\.


--
-- TOC entry 5109 (class 0 OID 16409)
-- Dependencies: 224
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.readers (id, full_name, address, phone, email, registration_date, status) FROM stdin;
\.


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 231
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 3, true);


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 221
-- Name: bookcopies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookcopies_id_seq', 1, false);


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 237
-- Name: bookcopy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookcopy_id_seq', 4, true);


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 1, false);


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 239
-- Name: borrowing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.borrowing_id_seq', 2, true);


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 227
-- Name: borrowings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.borrowings_id_seq', 1, false);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 241
-- Name: fine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fine_id_seq', 2, true);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 229
-- Name: fines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fines_id_seq', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 235
-- Name: librarian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.librarian_id_seq', 2, true);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 225
-- Name: librarians_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.librarians_id_seq', 1, false);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 233
-- Name: reader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reader_id_seq', 3, true);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 223
-- Name: readers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.readers_id_seq', 1, false);


--
-- TOC entry 4936 (class 2606 OID 16479)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 16402)
-- Name: bookcopies bookcopies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopies
    ADD CONSTRAINT bookcopies_pkey PRIMARY KEY (id);


--
-- TOC entry 4942 (class 2606 OID 16523)
-- Name: bookcopy bookcopy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy
    ADD CONSTRAINT bookcopy_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 16394)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 16539)
-- Name: borrowing borrowing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 16435)
-- Name: borrowings borrowings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_pkey PRIMARY KEY (id);


--
-- TOC entry 4946 (class 2606 OID 16570)
-- Name: fine fine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 16458)
-- Name: fines fines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_pkey PRIMARY KEY (id);


--
-- TOC entry 4940 (class 2606 OID 16510)
-- Name: librarian librarian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarian
    ADD CONSTRAINT librarian_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 16427)
-- Name: librarians librarians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarians
    ADD CONSTRAINT librarians_pkey PRIMARY KEY (id);


--
-- TOC entry 4938 (class 2606 OID 16495)
-- Name: reader reader_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 16417)
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 16403)
-- Name: bookcopies bookcopies_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopies
    ADD CONSTRAINT bookcopies_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 4952 (class 2606 OID 16524)
-- Name: bookcopy bookcopy_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookcopy
    ADD CONSTRAINT bookcopy_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- TOC entry 4953 (class 2606 OID 16545)
-- Name: borrowing borrowing_book_copy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_book_copy_id_fkey FOREIGN KEY (book_copy_id) REFERENCES public.bookcopy(id);


--
-- TOC entry 4954 (class 2606 OID 16550)
-- Name: borrowing borrowing_librarian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_librarian_id_fkey FOREIGN KEY (librarian_id) REFERENCES public.librarian(id);


--
-- TOC entry 4955 (class 2606 OID 16540)
-- Name: borrowing borrowing_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowing
    ADD CONSTRAINT borrowing_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.reader(id);


--
-- TOC entry 4948 (class 2606 OID 16441)
-- Name: borrowings borrowings_book_copy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_book_copy_id_fkey FOREIGN KEY (book_copy_id) REFERENCES public.bookcopies(id);


--
-- TOC entry 4949 (class 2606 OID 16446)
-- Name: borrowings borrowings_librarian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_librarian_id_fkey FOREIGN KEY (librarian_id) REFERENCES public.librarians(id);


--
-- TOC entry 4950 (class 2606 OID 16436)
-- Name: borrowings borrowings_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowings
    ADD CONSTRAINT borrowings_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES public.readers(id);


--
-- TOC entry 4956 (class 2606 OID 16571)
-- Name: fine fine_borrowing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fine
    ADD CONSTRAINT fine_borrowing_id_fkey FOREIGN KEY (borrowing_id) REFERENCES public.borrowing(id);


--
-- TOC entry 4951 (class 2606 OID 16459)
-- Name: fines fines_borrowing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_borrowing_id_fkey FOREIGN KEY (borrowing_id) REFERENCES public.borrowings(id);


-- Completed on 2025-11-07 18:31:26

--
-- PostgreSQL database dump complete
--

\unrestrict kBq2KDdGa36QKK9ZU7g3SCh42VCmBgCzIJrKqlasbDYSbBrleqrwN1tqwPEdAb4

