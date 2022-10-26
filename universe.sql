--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    types character varying(30),
    diamater numeric,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    number_of_star numeric,
    number_of_black_hole integer DEFAULT 1,
    designation character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    planet_types character varying(20),
    age_in_millions_of_years numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    description text,
    is_multiple boolean DEFAULT false NOT NULL,
    number_of_pairs integer DEFAULT 0,
    number_of_planets integer DEFAULT 0
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'halley', 'the most famous one', '', 11, 1);
INSERT INTO public.comet VALUES (2, 'shoemaker-levy 9', 'Smash into Jupiter', '', NULL, 1);
INSERT INTO public.comet VALUES (3, 'oumuama', 'Flat comet', '', NULL, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'milky way', 'Our galaxy', 'spiral', 100000000000000000, 100000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'andromeda', 'the galaxy next door', 'spiral', 1000000000000000000, 1000000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 4150', 'An elliptical galaxy', 'elliptical', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 4151', 'An elliptical galaxy', 'elliptical', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 4152', 'An elliptical galaxy', 'elliptical', NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 4153', 'An elliptical galaxy', 'elliptical', NULL, 1, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'moon', 4540000000000, 'Our moon', false, true, 384000, 1);
INSERT INTO public.moon VALUES (3, 'phobos', NULL, 'One of the Mars moon', false, true, NULL, 2);
INSERT INTO public.moon VALUES (4, 'deimos', NULL, 'One of the Mars moon', false, true, NULL, 2);
INSERT INTO public.moon VALUES (6, 'io', NULL, 'Know for its volcanoes', false, false, NULL, 3);
INSERT INTO public.moon VALUES (7, 'europe', NULL, 'Known for its oceans', false, false, NULL, 3);
INSERT INTO public.moon VALUES (8, 'ganymede', NULL, '', false, true, NULL, 3);
INSERT INTO public.moon VALUES (9, 'callisto', NULL, '', false, true, NULL, 3);
INSERT INTO public.moon VALUES (10, 'almathea', NULL, '', false, true, NULL, 3);
INSERT INTO public.moon VALUES (11, 'titan', NULL, 'Maybe a future living moon', false, true, NULL, 4);
INSERT INTO public.moon VALUES (12, 'enceladus', NULL, 'Rippled moon', false, true, NULL, 4);
INSERT INTO public.moon VALUES (13, 'mimas', NULL, 'giant impact crater', false, true, NULL, 4);
INSERT INTO public.moon VALUES (14, 'Dione', NULL, '', false, true, NULL, 4);
INSERT INTO public.moon VALUES (15, 'Iapetus', NULL, '', false, true, NULL, 4);
INSERT INTO public.moon VALUES (16, 'thetys', NULL, '', false, true, NULL, 4);
INSERT INTO public.moon VALUES (17, 'hyperion', NULL, '', false, true, NULL, 4);
INSERT INTO public.moon VALUES (18, 'miranda', NULL, '', false, true, NULL, 5);
INSERT INTO public.moon VALUES (19, 'titania', NULL, '', false, true, NULL, 5);
INSERT INTO public.moon VALUES (20, 'oberon', NULL, '', false, true, NULL, 5);
INSERT INTO public.moon VALUES (21, 'triton', NULL, '', false, true, NULL, 8);
INSERT INTO public.moon VALUES (22, 'charon', NULL, '', false, true, NULL, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our planet', true, false, 'terrestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet', false, true, 'terrestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar system', false, false, 'gas giant', 4540000000000, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Prominent ring system', false, false, 'gas giant', 4540000000000, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Axis of rotation', false, false, 'gas giant', 4540000000000, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'Earth sibling', false, true, 'terrestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (8, 'Nepture', 'Last planet in the Solar system', false, true, 'gas giant', 4540000000000, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'first planet', false, true, 'terrestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'First dwarf planet', false, true, 'tellestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', '', false, true, 'tellestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (11, 'Eris', '', false, true, 'tellestrial', 4540000000000, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', '', false, true, 'tellestrial', 4540000000000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 2, 'Our star', false, 0, 7);
INSERT INTO public.star VALUES (2, 'alpha centauri', 2, 'The nearest stars', true, 3, 1);
INSERT INTO public.star VALUES (4, 'rigel', 2, 'Rigel is a blue supergeant', true, 3, 0);
INSERT INTO public.star VALUES (5, 'vega', 2, 'The brightest star in the constallation of Lyra', false, 0, 0);
INSERT INTO public.star VALUES (6, 'betelgeuse', 2, 'A red supergriant', false, 0, 0);
INSERT INTO public.star VALUES (7, 'antares', 2, 'The brightest star in the constellation of Scorpius', false, 0, 0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_designation_key UNIQUE (designation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet constraint_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraint_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star foreign_key_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT foreign_key_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

