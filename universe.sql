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
    name character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    constellation character varying(30),
    distance_mly integer,
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text,
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
    name character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    has_life boolean NOT NULL,
    description text,
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
-- Name: small_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.small_bodies (
    small_bodies_id integer NOT NULL,
    name character varying(30),
    type character varying(20) NOT NULL
);


ALTER TABLE public.small_bodies OWNER TO freecodecamp;

--
-- Name: small_bodies_small_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.small_bodies_small_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.small_bodies_small_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: small_bodies_small_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.small_bodies_small_bodies_id_seq OWNED BY public.small_bodies.small_bodies_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    magnitude numeric(4,2) NOT NULL,
    distance_parsec numeric,
    description text,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: small_bodies small_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies ALTER COLUMN small_bodies_id SET DEFAULT nextval('public.small_bodies_small_bodies_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Sagittarius', NULL, 'The galaxy that includes our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Andromeda', 2, 'The closest galaxy to Milky Way galaxy');
INSERT INTO public.galaxy VALUES (3, 'Eye of Sauron', 'Spiral', 'Canes Venatici', 51, 'It is one of the nearest galaxies to Earth to contain an active supermassive black hole');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Starburst', 'Ursa Major', 11, 'Appears similar in shape to a cigar');
INSERT INTO public.galaxy VALUES (5, 'Little Sombrero', 'Spiral', 'Pegasus', 40, NULL);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 'Irregular', 'Cetus', 3, 'Located on the outer edges of the local group, does not show evidence of interaction');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 'Our only natural satellite', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', false, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', false, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', true, 'The most vucanically active body in the solar system', 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, 'Best place to look for life', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Adrastea', false, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Callisto', false, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Ersa', false, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', false, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Titan', true, 'It has a earthlike cycle of liquids flowing', 6);
INSERT INTO public.moon VALUES (12, 'Atlas', false, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Dione', false, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Epimetheus', false, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', false, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', false, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', false, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Titania', false, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', false, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Triton', false, 'Its surface is made of nitrogen ice', 8);
INSERT INTO public.moon VALUES (21, 'Proteus', false, NULL, 8);
INSERT INTO public.moon VALUES (22, 'Larissa', false, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 'The smallest planet of the solar system and also the closest to the sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 'The hottest planet int he solar system', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 'Our home', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 'Dusty, cold, desert world with a very thin atmosphere', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 'The Great red spot is a storm bigger than earth', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 'Adorned with a dazzling, complex system of icy rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Neptune-like', false, 'Rotates at nearly 90 degree from the plane of its orbit', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune-like', false, 'Dark, cold and whipped by supersonic winds', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', false, 'Once considered the ninth planet', 1);
INSERT INTO public.planet VALUES (10, 'GJ15AB', 'Super-Earth', false, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, '55Cancri-e', 'Super-Earth', false, 'Exoplanet', 4);
INSERT INTO public.planet VALUES (12, 'Corot7-b', 'Super-Earth', false, 'Exoplanet', 3);


--
-- Data for Name: small_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.small_bodies VALUES (1, 'Bennu', 'Asteroid');
INSERT INTO public.small_bodies VALUES (2, 'Ida', 'Asteroid');
INSERT INTO public.small_bodies VALUES (3, 'Vesta', 'Asteroid');
INSERT INTO public.small_bodies VALUES (4, 'Hartley 2', 'Comet');
INSERT INTO public.small_bodies VALUES (5, 'Halley', 'Comet');
INSERT INTO public.small_bodies VALUES (6, 'Oumuamua', 'Comet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 4.83, 0.0001, 'The star at the center of the Solar System', 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Binary', 2.06, 29.7400, 'The brightest star in the constellation of Andromeda', 2);
INSERT INTO public.star VALUES (3, 'Enif', 'Red Supergiant', 2.38, 211.4165, 'The brightest star in the constellation of Pegasus', 1);
INSERT INTO public.star VALUES (4, 'Markab', 'Subgiant', 2.49, 4.8831, 'The third brightest star in the constellation of Pegasus', 3);
INSERT INTO public.star VALUES (5, 'Mirach', 'Red Giant', 2.07, 60.5327, 'Beta Andromedae', 2);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Red Supergiant', 0.45, 152.6718, 'Orion Constellation', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: small_bodies_small_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.small_bodies_small_bodies_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: small_bodies name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: small_bodies small_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.small_bodies
    ADD CONSTRAINT small_bodies_pkey PRIMARY KEY (small_bodies_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

