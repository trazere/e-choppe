--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: item_family; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_family (
    id integer NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(4096),
    color character(6)
);


--
-- Name: item_family_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_family_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_family_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_family_id OWNED BY public.item_family.id;


--
-- Name: sale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sale (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL
);


--
-- Name: sale_entry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sale_entry (
    id integer NOT NULL,
    sale integer NOT NULL,
    family integer NOT NULL,
    items integer,
    weight integer,
    price integer
);


--
-- Name: sale_entry_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_entry_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_entry_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_entry_id OWNED BY public.sale_entry.id;


--
-- Name: sale_id; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_id
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_id; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_id OWNED BY public.sale.id;


--
-- Name: item_family id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_family ALTER COLUMN id SET DEFAULT nextval('public.item_family_id'::regclass);


--
-- Name: sale id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id'::regclass);


--
-- Name: sale_entry id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_entry ALTER COLUMN id SET DEFAULT nextval('public.sale_entry_id'::regclass);


--
-- Name: item_family item_family_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_family
    ADD CONSTRAINT item_family_pkey PRIMARY KEY (id);


--
-- Name: sale_entry sale_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_entry
    ADD CONSTRAINT sale_entry_pkey PRIMARY KEY (id);


--
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- Name: sale_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sale_date ON public.sale USING btree (date);


--
-- Name: sale_entry_sale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sale_entry_sale ON public.sale_entry USING btree (sale);


--
-- Name: sale_entry sale_entry_family_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_entry
    ADD CONSTRAINT sale_entry_family_fkey FOREIGN KEY (family) REFERENCES public.item_family(id);


--
-- Name: sale_entry sale_entry_sale_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_entry
    ADD CONSTRAINT sale_entry_sale_fkey FOREIGN KEY (sale) REFERENCES public.sale(id);


--
-- PostgreSQL database dump complete
--

