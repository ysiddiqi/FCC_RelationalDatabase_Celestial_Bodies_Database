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

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    apartment_magnitude numeric(4,2),
    distance_from_earth numeric(5,2),
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    age numeric,
    earth_radius numeric(7,6),
    earth_mass numeric(7,6),
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    has_life boolean,
    age numeric,
    earth_radius numeric(7,3),
    earth_mass numeric(7,3),
    mean_temp_cels integer,
    planet_type_id integer,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_star_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    age numeric,
    solar_radius numeric(5,2),
    solar_mass numeric(5,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.50, 0.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Messier 87', 8.60, 16.40, 2);
INSERT INTO public.galaxy VALUES (3, 'Messier 31', 3.40, 0.77, 1);
INSERT INTO public.galaxy VALUES (4, 'Centaurs A', 6.84, 4.20, 2);
INSERT INTO public.galaxy VALUES (5, 'Small Magnetic Cloud', 2.70, 0.06, 3);
INSERT INTO public.galaxy VALUES (6, 'Small Scalutor Galaxy', 7.20, 3.70, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral Galaxies', 'They look like giant pinweel');
INSERT INTO public.galaxy_type VALUES (2, 'Eliptical Galaxies', 'Their shape look like ellipses');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular Galaxies', 'They look like irregular shapes');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon oNE', 1, 450000000, 0.233000, 0.220000, true);
INSERT INTO public.moon VALUES (2, 'Moon Two', 2, 460000000, 0.443000, 0.320000, true);
INSERT INTO public.moon VALUES (3, 'Moon Three', 3, 470000000, 0.453000, 0.340000, true);
INSERT INTO public.moon VALUES (4, 'Moon Four', 4, 770000000, 0.353000, 0.360000, true);
INSERT INTO public.moon VALUES (5, 'Moon Five', 5, 760000000, 0.354000, 0.390000, true);
INSERT INTO public.moon VALUES (6, 'Moon Six', 6, 761000000, 0.354100, 0.393000, true);
INSERT INTO public.moon VALUES (7, 'Moon Seven', 7, 73000000, 0.354200, 0.392000, true);
INSERT INTO public.moon VALUES (8, 'Moon Eight', 7, 73500000, 0.354800, 0.302000, true);
INSERT INTO public.moon VALUES (9, 'Moon Nine', 9, 93500000, 0.654800, 0.372000, true);
INSERT INTO public.moon VALUES (10, 'Moon Ten', 10, 43500000, 0.954800, 0.382000, true);
INSERT INTO public.moon VALUES (11, 'Moon Eleven', 11, 42300000, 0.954400, 0.377200, true);
INSERT INTO public.moon VALUES (12, 'Moon Twelve', 12, 42300000, 0.954400, 0.377200, true);
INSERT INTO public.moon VALUES (13, 'Moon Thirteen', 13, 42300000, 0.954400, 0.377200, true);
INSERT INTO public.moon VALUES (14, 'Moon Fourteen', 14, 42300000, 0.954400, 0.377200, true);
INSERT INTO public.moon VALUES (15, 'Moon Fifteen', 15, 6700000, 0.456700, 0.567700, false);
INSERT INTO public.moon VALUES (16, 'Moon Sixteen', 16, 6700000, 0.456700, 0.567700, false);
INSERT INTO public.moon VALUES (17, 'Moon Seventeen', 17, 6700000, 0.456700, 0.567700, true);
INSERT INTO public.moon VALUES (18, 'Moon Eighteen', 18, 6700000, 0.456700, 0.567700, true);
INSERT INTO public.moon VALUES (19, 'Moon Nineteen', 19, 6700000, 0.456700, 0.567700, true);
INSERT INTO public.moon VALUES (20, 'Moon Twenty', 20, 6700000, 0.456700, 0.567700, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 4560000, 1.000, 1.000, 14, 2, true);
INSERT INTO public.planet VALUES (2, 'Venus', 2, true, 4560000, 1.000, 1.000, 14, 3, true);
INSERT INTO public.planet VALUES (3, 'Marse', 3, true, 565000, 1.000, 1.000, 14, 4, true);
INSERT INTO public.planet VALUES (4, 'Mercury', 4, true, 565000, 1.000, 1.000, 14, 4, true);
INSERT INTO public.planet VALUES (5, 'Jupitor', 5, true, 675000, 1.000, 1.000, 14, 5, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 6, true, 675000, 1.000, 1.000, 14, 5, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, true, 675000, 1.000, 1.000, 14, 5, true);
INSERT INTO public.planet VALUES (8, 'Pluto', 8, true, 765000, 1.000, 1.000, 14, 6, true);
INSERT INTO public.planet VALUES (9, 'Canceric', 9, true, 876000, 1.000, 1.000, 14, 6, true);
INSERT INTO public.planet VALUES (10, 'GJ', 9, true, 876000, 1.000, 1.000, 14, 6, true);
INSERT INTO public.planet VALUES (11, 'Ceres', 9, true, 876000, 1.000, 1.000, 14, 6, true);
INSERT INTO public.planet VALUES (12, 'New Planet', 9, true, 876000, 1.000, 1.000, 14, 6, true);
INSERT INTO public.planet VALUES (13, 'Saturn', 9, true, 876000, 1.000, 1.000, 14, 6, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4670000, 1.00, 1.000);
INSERT INTO public.star VALUES (2, 'Alpha', 2, 676000, 1.00, 1.000);
INSERT INTO public.star VALUES (3, 'Gama', 3, 676000, 1.00, 1.000);
INSERT INTO public.star VALUES (4, 'Siris', 4, 676000, 1.00, 1.000);
INSERT INTO public.star VALUES (5, 'Espian', 5, 676000, 1.00, 1.000);
INSERT INTO public.star VALUES (6, 'Maiden', 6, 676000, 1.00, 1.000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 6, true);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy galxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galxy_name_key UNIQUE (name);


--
-- Name: galaxy galxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: planet planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_key PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey UNIQUE (name);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- PostgreSQL database dump complete
--

