--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: categorie_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorie_product (
    id integer NOT NULL,
    "categorieId" integer NOT NULL,
    "productsId" integer NOT NULL
);


--
-- Name: categorie_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categorie_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categorie_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categorie_product_id_seq OWNED BY public.categorie_product.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    type text NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    photo text NOT NULL,
    "productId" integer
);


--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    "userId" integer,
    status boolean DEFAULT true
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL,
    cpf text NOT NULL,
    password text NOT NULL
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
-- Name: categorie_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie_product ALTER COLUMN id SET DEFAULT nextval('public.categorie_product_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categorie_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorie_product VALUES (1, 13, 39);
INSERT INTO public.categorie_product VALUES (2, 16, 41);
INSERT INTO public.categorie_product VALUES (3, 16, 42);
INSERT INTO public.categorie_product VALUES (5, 17, 44);
INSERT INTO public.categorie_product VALUES (8, 16, 56);
INSERT INTO public.categorie_product VALUES (9, 14, 57);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (13, 'eletrodoméstico');
INSERT INTO public.categories VALUES (14, 'eletronicos');
INSERT INTO public.categories VALUES (15, 'moveis');
INSERT INTO public.categories VALUES (16, 'roupa');
INSERT INTO public.categories VALUES (17, 'variados');
INSERT INTO public.categories VALUES (18, 'eletrodoméstico');
INSERT INTO public.categories VALUES (19, 'eletronicos');
INSERT INTO public.categories VALUES (20, 'moveis');
INSERT INTO public.categories VALUES (21, 'roupa');
INSERT INTO public.categories VALUES (22, 'variados');


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.photos VALUES (9, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ3OjWXiDa5i0KndvVYeP3GQiaJRuvrlyuuXNuAWAz4qYX9a8uDAiHaB6rhNjnlp_4YrHliRu0FaBdFeAJUpSCodupVaVdsg6uTqk9l1vfW&usqp=CAE', 44);
INSERT INTO public.photos VALUES (11, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSZqPms2rMHzpsdSPpgV2fhj5bLtlPYiWxjJZDcvC_e7occm2sNQRtvG5tkeeKeXlxUuhlQ9ploIpNODjRFWpPM6ITo0ofqeh1znGNVlpbkHUzR6w2nAelS1g&usqp=CAE', 54);
INSERT INTO public.photos VALUES (12, 'https://a-static.mlcdn.com.br/450x450/blusa-t-shirt-feminina-brooklyn-gola-rasa-moda-jovem-filo-modas/rsmstore/a23a6fc0263c11ee93774201ac185049/846a6a6f9d5b04ebef376a3bd2c4767e.jpeg', 56);
INSERT INTO public.photos VALUES (13, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgZ8eev5g1ktUi_KfhdGM7dq159Lmke5YY9LFPbxBX-I2wYwKW0W6QuiSObWQkzaxJwak&usqp=CAU', 57);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (35, 'jaqueta narutinho', 'brusinha de sair ao estilo konoha', 5000, 4, true);
INSERT INTO public.products VALUES (36, 'jaqueta narutinho', 'brusinha de sair ao estilo konoha', 5000, 4, true);
INSERT INTO public.products VALUES (37, 'jaqueta narutinho', 'brusinha de sair ao estilo konoha', 5000, 4, true);
INSERT INTO public.products VALUES (38, 'cafeteira legal', 'faz cafezinho quentinho', 12000, 4, true);
INSERT INTO public.products VALUES (39, 'air fryer', 'tudo fritinho sem oleo', 22000, 4, true);
INSERT INTO public.products VALUES (40, 'air fryer', 'tudo fritinho sem oleo', 22000, 4, true);
INSERT INTO public.products VALUES (41, 'blusinha da shein', 'quentinha e de sair', 5000, 4, true);
INSERT INTO public.products VALUES (42, 'blusinha da shein 2', 'quentinha e de sair', 5000, 4, false);
INSERT INTO public.products VALUES (44, 'Caneca do narutinho', 'Caneca pra tomar um cafezinho gostoso', 3000, 4, true);
INSERT INTO public.products VALUES (45, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (46, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (47, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (48, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (49, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (50, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (51, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (52, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (53, 'Outra canequinha', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (54, 'Outra canequinha 2', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (55, 'Outra canequinha 2', 'pra tomar cházinho', 3000, 4, true);
INSERT INTO public.products VALUES (56, 'Blusinha', 'Essa blusinha ti deixa chique para sair bunito!', 2000, 13, true);
INSERT INTO public.products VALUES (57, 'Celular', 'Iphone semi-novo, caiu só 4 vezes ', 120000, 13, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'd40bb5e8-99f1-4303-b9d2-3a9925090894', 4);
INSERT INTO public.sessions VALUES (2, '8b4be042-97e8-416a-ae31-5d6f9549dd47', 7);
INSERT INTO public.sessions VALUES (3, 'b3c1036e-478f-4e82-ae48-537735bbe3c1', 7);
INSERT INTO public.sessions VALUES (4, 'ebd593dd-12bb-4dc3-9c85-e93dd8e8a2f5', 4);
INSERT INTO public.sessions VALUES (5, '77121d80-704c-4a3e-833f-cae9837a5919', 4);
INSERT INTO public.sessions VALUES (6, '89569e0b-4f3e-451e-ab44-9b93f3c04225', 7);
INSERT INTO public.sessions VALUES (7, '258ec462-a08f-4fce-aa69-4b7f0cd03b25', 4);
INSERT INTO public.sessions VALUES (8, 'fb82c916-336c-43c8-a32c-8954fcab02ea', 4);
INSERT INTO public.sessions VALUES (9, 'd191a35f-def9-419e-b863-9fef340b2979', 4);
INSERT INTO public.sessions VALUES (10, '9ff54cb3-992d-496d-8c56-dc13714446c7', 4);
INSERT INTO public.sessions VALUES (11, 'a2bc53a8-2601-4bc8-8b74-c3b6af5c29ce', 4);
INSERT INTO public.sessions VALUES (12, 'b0c22385-4aff-4dc4-bb9e-21bb0b5f2aec', 13);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Siclano', 'siclano@siclano.com', '19900000001', '01102203344', '$2b$10$3vUC4.U13b9qK4kAX0ZUj.Q9Fx3PGeg6OSLD38IrRRhzIMpdOdLym');
INSERT INTO public.users VALUES (4, 'Fulana', 'fulana@fulana.com', '19900000000', '01102203342', '$2b$10$Pz0JTqaXSyf/w8T2HBb4wOz7DlEWagD3rfjeBrn9P/21ZvSE8M2/6');
INSERT INTO public.users VALUES (5, 'Camila', 'camila@camila.com', '1901010101', '22122122111', '$2b$10$nMhSW4rp2B3A4ufaZc.gwevVw0dRXDjMh435HO5JMZ2V9OSDqKmRe');
INSERT INTO public.users VALUES (7, 'mayla', 'mayla@auau.com', '1901010101', '22122122112', '$2b$10$6c3DXGbz3xPf9661TAwCi.KgGxPoEOOpwaSbDsITXSBPwTn3SDYmO');
INSERT INTO public.users VALUES (12, 'joaozinho', 'joao@joao.com', '1901010101', '22122122113', '$2b$10$jccjU9d5qsajcWZGGyv/DO8OS1A3gJrsgIaQ3NQaBwbFylL.gdRAO');
INSERT INTO public.users VALUES (13, 'lele', 'lele@lele.com', '2222222222', '12312312311', '$2b$10$RySAkJ8D80CKSDvUDOGU4eXtTVOJfVVRPjmRdIPFKWYViiRb9lrTe');


--
-- Name: categorie_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categorie_product_id_seq', 9, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 22, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.photos_id_seq', 13, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 57, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: categorie_product categorie_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie_product
    ADD CONSTRAINT categorie_product_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: photos photos_photo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_photo_key UNIQUE (photo);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


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
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


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
-- Name: categorie_product categorie_product_categorieId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie_product
    ADD CONSTRAINT "categorie_product_categorieId_fkey" FOREIGN KEY ("categorieId") REFERENCES public.categories(id);


--
-- Name: categorie_product categorie_product_productsId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorie_product
    ADD CONSTRAINT "categorie_product_productsId_fkey" FOREIGN KEY ("productsId") REFERENCES public.products(id);


--
-- Name: photos photos_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photos_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id);


--
-- Name: products products_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

