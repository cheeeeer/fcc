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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_discovered integer,
    mass integer,
    human_touched boolean,
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: mandatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mandatory (
    mandatory_id integer NOT NULL,
    numb numeric(2,1) NOT NULL,
    name character varying(50)
);


ALTER TABLE public.mandatory OWNER TO freecodecamp;

--
-- Name: mandatory_its_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mandatory_its_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mandatory_its_id_seq OWNER TO freecodecamp;

--
-- Name: mandatory_its_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mandatory_its_id_seq OWNED BY public.mandatory.mandatory_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_discovered integer,
    mass integer,
    human_touched boolean,
    distance_from_earth integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_discovered integer,
    mass integer,
    human_touched boolean,
    distance_from_earth integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_discovered integer,
    mass integer,
    human_touched boolean,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mandatory mandatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mandatory ALTER COLUMN mandatory_id SET DEFAULT nextval('public.mandatory_its_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 1, true, 25800, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 964, 1, false, 2500000, NULL);
INSERT INTO public.galaxy VALUES (3, 'LMC', 1503, 10, false, 158000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 1774, 50, false, 11500000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Tadpole Galaxy', 1982, 0, false, 420000000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 1950, 12, false, 600000000, NULL);


--
-- Data for Name: mandatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mandatory VALUES (1, 3.1, NULL);
INSERT INTO public.mandatory VALUES (2, 4.5, NULL);
INSERT INTO public.mandatory VALUES (3, 4.4, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', NULL, NULL, true, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, false, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Titan', NULL, NULL, true, NULL, 6);
INSERT INTO public.moon VALUES (4, 'Charon', NULL, NULL, false, NULL, 9);
INSERT INTO public.moon VALUES (5, 'Buce', NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Craig', NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Pluto Secret Moon', NULL, NULL, true, NULL, 9);
INSERT INTO public.moon VALUES (8, 'The Marsio', NULL, NULL, true, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Your Mum', NULL, NULL, true, NULL, 3);
INSERT INTO public.moon VALUES (10, 'mercury 2', NULL, NULL, true, NULL, 1);
INSERT INTO public.moon VALUES (11, 'I have been here in real life', NULL, NULL, true, NULL, 10);
INSERT INTO public.moon VALUES (12, 'one of them that is not titan', NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES (13, 'too many moons', NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES (14, 'does venus have a moon', NULL, NULL, false, NULL, 2);
INSERT INTO public.moon VALUES (15, 'Buce', NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Craig', NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Pluto Secret Moon', NULL, NULL, true, NULL, 9);
INSERT INTO public.moon VALUES (18, 'The Marsio', NULL, NULL, true, NULL, 4);
INSERT INTO public.moon VALUES (19, 'Your Mum', NULL, NULL, true, NULL, 3);
INSERT INTO public.moon VALUES (20, 'mercury 2', NULL, NULL, true, NULL, 1);
INSERT INTO public.moon VALUES (21, 'I have been here in real life', NULL, NULL, true, NULL, 10);
INSERT INTO public.moon VALUES (22, 'one of them that is not titan', NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES (23, 'too many moons', NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES (24, 'does venus have a moon', NULL, NULL, false, NULL, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1610, 2, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 32, true, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 3, true, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 1, true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 10, false, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 6, true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 41, 5, false, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 91, 4, false, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 49, 0, false, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Joey', 2025, 3, false, 341, 2);
INSERT INTO public.planet VALUES (11, 'Smith-Prime', 2095, 4, true, 19, 2);
INSERT INTO public.planet VALUES (12, 'Josh 2B', 4912, 4, true, 12930, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', NULL, 2, false, 29000, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri AB', 1603, 1, false, 4, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 169, 5, false, 447, 1);
INSERT INTO public.star VALUES (4, 'RS Puppis', NULL, 9, false, 6000, 1);
INSERT INTO public.star VALUES (5, 'Gamma Eridani', 1960, 3, false, 203, 1);
INSERT INTO public.star VALUES (6, 'Mintaka', NULL, 2, false, 1200, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: mandatory_its_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mandatory_its_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mandatory mandatory_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mandatory
    ADD CONSTRAINT mandatory_name_key UNIQUE (name);


--
-- Name: mandatory mandatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mandatory
    ADD CONSTRAINT mandatory_pkey PRIMARY KEY (mandatory_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: mandatory numb; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mandatory
    ADD CONSTRAINT numb UNIQUE (numb);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


