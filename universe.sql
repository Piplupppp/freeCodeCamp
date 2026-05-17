--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(10),
    hemisphere character varying(20),
    brightest_star character varying(50),
    star_count integer,
    right_ascension_decimal_hours numeric,
    declination_decimal_grades numeric,
    has_messier_objects boolean NOT NULL,
    is_seasonal boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    class character varying(20),
    major_axis_arcmin numeric,
    minor_axis_arcmin numeric,
    distance_from_earth numeric,
    redshift numeric,
    total_mass numeric,
    visible_naked_eye boolean NOT NULL,
    has_black_hole boolean NOT NULL,
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
    name character varying(50) NOT NULL,
    planet_id integer,
    radius_km integer,
    orbital_period_days numeric,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    age_million_years integer,
    surface_type character varying(50)
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
    star_id integer,
    orbital_period_days numeric,
    rotation_period_hours numeric,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL,
    type character varying(20),
    age_million_years integer
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
    temperature_kelvin integer,
    solar_masses_mass numeric,
    age_million_years integer,
    luminosity_class character varying(20),
    spectral_class character varying(5),
    is_main_sequence boolean NOT NULL,
    is_bianry boolean NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Both', 'Rigel', 81, 5.5, 5.0, true, true);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Northern', 'Alioth', 93, 11.0, 55.0, true, false);
INSERT INTO public.constellation VALUES (3, 'Ursa Minor', 'UMi', 'Northern', 'Polaris', 20, 15.0, 75.0, false, false);
INSERT INTO public.constellation VALUES (4, 'Scorpius', 'Sco', 'Southern', 'Antares', 47, 16.5, -30.0, true, true);
INSERT INTO public.constellation VALUES (5, 'Gemini', 'Gem', 'Northern', 'Pollux', 70, 7.0, 22.0, true, true);
INSERT INTO public.constellation VALUES (6, 'Andromeda', 'And', 'Northern', 'Alpheratz', 65, 0.8, 38.0, true, true);
INSERT INTO public.constellation VALUES (7, 'Cassiopeia', 'Cas', 'Northern', 'Schedar', 53, 1.0, 60.0, true, false);
INSERT INTO public.constellation VALUES (8, 'Triangulum', 'Tri', 'Northern', 'Mothallah', 25, 2.0, 31.0, true, true);
INSERT INTO public.constellation VALUES (9, 'Auriga', 'Aur', 'Northern', 'Capella', 68, 6.0, 42.0, true, true);
INSERT INTO public.constellation VALUES (10, 'Leo', 'Leo', 'Northern', 'Regulus', 92, 10.5, 15.0, true, true);
INSERT INTO public.constellation VALUES (11, 'Cygnus', 'Cyg', 'Northern', 'Deneb', 80, 20.5, 44.0, true, true);
INSERT INTO public.constellation VALUES (12, 'Lyra', 'Lyr', 'Northern', 'Vega', 22, 18.8, 36.0, true, true);
INSERT INTO public.constellation VALUES (13, 'Perseus', 'Per', 'Northern', 'Mirfak', 58, 3.5, 45.0, true, true);
INSERT INTO public.constellation VALUES (14, 'Bootes', 'Boo', 'Northern', 'Arcturus', 90, 14.7, 31.0, false, true);
INSERT INTO public.constellation VALUES (15, 'Virgo', 'Vir', 'Both', 'Spica', 96, 13.4, -4.0, true, true);
INSERT INTO public.constellation VALUES (16, 'Aquila', 'Aql', 'Both', 'Altair', 70, 19.7, 3.0, true, true);
INSERT INTO public.constellation VALUES (17, 'Sagittarius', 'Sgr', 'Southern', 'Kaus Australis', 80, 19.0, -25.0, true, true);
INSERT INTO public.constellation VALUES (18, 'Taurus', 'Tau', 'Northern', 'Aldebaran', 98, 4.7, 15.0, true, true);
INSERT INTO public.constellation VALUES (19, 'Pegasus', 'Peg', 'Northern', 'Enif', 88, 22.7, 19.0, true, true);
INSERT INTO public.constellation VALUES (20, 'Hercules', 'Her', 'Northern', 'Kornephoros', 113, 17.4, 27.0, true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 100000, 0, 0, 1040000000000, true, true, 'Our home galaxy, a barred spiral containing over 200 billion stars');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 190, 60, 2540000, -0.001, 1000000000000, true, true, 'Nearest large galaxy to the Milky Way, on collision course with us in 4.5 billion years');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 73, 45, 3000000, 0.002, 50000000000, true, false, 'Third largest galaxy in the Local Group, rich in star-forming regions');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 650, 550, 163000, 0.001, 138000000000, true, true, 'Largest satellite galaxy of the Milky Way, visible from the southern hemisphere');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 320, 185, 200000, 0.001, 7000000000, true, false, 'Smaller companion to the Large Magellanic Cloud, orbiting the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Elliptical', 9, 4, 31000000, 0.004, 15500000000000, false, true, 'Stunning edge-on spiral resembling a sombrero hat, with a prominent dust lane');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Spiral', 11, 7, 23000000, 0.002, 160000000000, false, true, 'Interacting spiral galaxy with a prominent companion, also known as M51');
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 'Spiral', 28, 26, 21000000, 0.002, 100000000000, false, true, 'Large face-on spiral galaxy in Triangulum, also known as M101');
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Elliptical', 25, 20, 13000000, 0.002, 1000000000000, false, true, 'Peculiar elliptical galaxy with a prominent radio jet from its active nucleus');
INSERT INTO public.galaxy VALUES (10, 'Bode', 'Spiral', 26, 14, 12000000, 0.001, 200000000000, false, true, 'Bright spiral galaxy in Ursa Major, also known as M81');
INSERT INTO public.galaxy VALUES (11, 'Sculptor', 'Spiral', 27, 6, 11400000, 0.001, 100000000000, false, false, 'Edge-on spiral galaxy with high star formation rate in Sculptor constellation');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.3, true, false, 4500, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.32, false, false, 4500, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.26, false, false, 4500, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, 1.77, true, true, 4500, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, 3.55, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.15, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.69, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, 15.95, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, 1.37, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, 0.94, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 764, 4.52, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561, 2.74, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 533, 1.89, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 236, 1.41, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 579, 2.52, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 585, 4.14, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (17, 'Titania', 7, 789, 8.71, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 761, 13.46, true, false, 4500, 'Icy');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353, 5.88, true, true, 4500, 'Icy');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170, 360.14, false, false, 4500, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 88.0, 1407.6, false, false, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 224.7, 5832.5, false, false, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365.25, 24.0, true, true, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 687.0, 24.6, false, true, 'Terrestrial', 4500);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4333.0, 9.9, false, false, 'Gas Giant', 4500);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10759.0, 10.7, false, false, 'Gas Giant', 4500);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30687.0, 17.2, false, false, 'Ice Giant', 4500);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60190.0, 16.1, false, false, 'Ice Giant', 4500);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 11.2, 268.8, false, true, 'Terrestrial', 4850);
INSERT INTO public.planet VALUES (10, 'Proxima c', 4, 1928.0, 46272.0, false, false, 'Super-Earth', 4850);
INSERT INTO public.planet VALUES (11, 'Fomalhaut b', 1, 872000.0, 0.0, false, false, 'Gas Giant', 440);
INSERT INTO public.planet VALUES (12, 'Vega b', 7, 2.43, 58.3, false, false, 'Gas Giant', 455);
INSERT INTO public.planet VALUES (13, '51 Pegasi b', 1, 4.23, 101.5, false, false, 'Hot Jupiter', 4000);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 1, 3.52, 84.5, false, false, 'Hot Jupiter', 3000);
INSERT INTO public.planet VALUES (15, 'Kepler-22b', 1, 289.9, 6957.6, false, true, 'Super-Earth', 4000);
INSERT INTO public.planet VALUES (16, 'Kepler-452b', 1, 384.8, 9235.2, false, true, 'Super-Earth', 6000);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1e', 1, 6.1, 146.4, false, true, 'Terrestrial', 8000);
INSERT INTO public.planet VALUES (18, 'HD 189733 b', 1, 2.22, 53.3, false, false, 'Hot Jupiter', 3000);
INSERT INTO public.planet VALUES (19, 'Kepler-16b', 1, 228.8, 5491.2, false, false, 'Gas Giant', 3000);
INSERT INTO public.planet VALUES (20, '55 Cancri e', 1, 0.74, 17.7, false, false, 'Super-Earth', 8000);
INSERT INTO public.planet VALUES (21, 'GJ 1214 b', 1, 1.58, 37.9, false, true, 'Super-Earth', 6000);
INSERT INTO public.planet VALUES (22, 'CoRoT-7b', 1, 0.85, 20.4, false, false, 'Terrestrial', 1500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 1.0, 4600, 'V', 'G', true, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 9940, 2.1, 230, 'V', 'A', true, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, 11.6, 8, 'I', 'M', false, false, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 3042, 0.12, 4850, 'V', 'M', true, false, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 12100, 21.0, 8, 'I', 'B', false, true, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 13800, 3.6, 60, 'IV', 'B', false, true, 2);
INSERT INTO public.star VALUES (7, 'Vega', 9602, 2.1, 455, 'V', 'A', true, false, 1);
INSERT INTO public.star VALUES (8, 'Antares', 3400, 12.4, 12, 'I', 'M', false, true, 1);
INSERT INTO public.star VALUES (9, 'Arcturus', 4286, 1.1, 7100, 'III', 'K', false, false, 1);
INSERT INTO public.star VALUES (10, 'Polaris', 6015, 5.4, 70, 'II', 'F', false, true, 1);
INSERT INTO public.star VALUES (11, 'Deneb', 8525, 19.0, 10, 'I', 'A', false, false, 1);
INSERT INTO public.star VALUES (12, 'Spica', 25300, 10.3, 12, 'V', 'B', true, true, 1);
INSERT INTO public.star VALUES (13, 'Capella', 4940, 2.6, 600, 'III', 'G', false, true, 1);
INSERT INTO public.star VALUES (14, 'Regulus', 11668, 3.8, 1000, 'V', 'B', true, false, 1);
INSERT INTO public.star VALUES (15, 'Aldebaran', 3900, 1.7, 6400, 'III', 'K', false, false, 1);
INSERT INTO public.star VALUES (16, 'Fomalhaut', 8590, 1.9, 440, 'V', 'A', true, false, 1);
INSERT INTO public.star VALUES (17, 'Altair', 7550, 1.8, 1200, 'V', 'A', true, false, 1);
INSERT INTO public.star VALUES (18, 'Pollux', 4865, 1.9, 7400, 'III', 'K', false, false, 1);
INSERT INTO public.star VALUES (19, 'Mirfak', 6350, 8.5, 40, 'I', 'F', false, false, 1);
INSERT INTO public.star VALUES (20, 'Schedar', 4530, 4.0, 220, 'II', 'K', false, false, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

