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

DROP DATABASE worldcup;
--
-- Name worldcup; Type DATABASE; Schema -; Owner freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

connect worldcup

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
-- Name games; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(25) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name games_game_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name games_game_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name teams; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name teams_team_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name teams_team_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name games game_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'regclass);


--
-- Name teams team_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'regclass);


--
-- Data for Name games; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.games VALUES (206, 2018, 'Final', 354, 355, 4, 2);
INSERT INTO public.games VALUES (207, 2018, 'Third Place', 356, 357, 2, 0);
INSERT INTO public.games VALUES (208, 2018, 'Semi-Final', 355, 357, 2, 1);
INSERT INTO public.games VALUES (209, 2018, 'Semi-Final', 354, 356, 1, 0);
INSERT INTO public.games VALUES (210, 2018, 'Quarter-Final', 355, 358, 3, 2);
INSERT INTO public.games VALUES (211, 2018, 'Quarter-Final', 357, 359, 2, 0);
INSERT INTO public.games VALUES (212, 2018, 'Quarter-Final', 356, 360, 2, 1);
INSERT INTO public.games VALUES (213, 2018, 'Quarter-Final', 354, 361, 2, 0);
INSERT INTO public.games VALUES (214, 2018, 'Eighth-Final', 357, 362, 2, 1);
INSERT INTO public.games VALUES (215, 2018, 'Eighth-Final', 359, 363, 1, 0);
INSERT INTO public.games VALUES (216, 2018, 'Eighth-Final', 356, 364, 3, 2);
INSERT INTO public.games VALUES (217, 2018, 'Eighth-Final', 360, 365, 2, 0);
INSERT INTO public.games VALUES (218, 2018, 'Eighth-Final', 355, 366, 2, 1);
INSERT INTO public.games VALUES (219, 2018, 'Eighth-Final', 358, 367, 2, 1);
INSERT INTO public.games VALUES (220, 2018, 'Eighth-Final', 361, 368, 2, 1);
INSERT INTO public.games VALUES (221, 2018, 'Eighth-Final', 354, 369, 4, 3);
INSERT INTO public.games VALUES (222, 2014, 'Final', 370, 369, 1, 0);
INSERT INTO public.games VALUES (223, 2014, 'Third Place', 371, 360, 3, 0);
INSERT INTO public.games VALUES (224, 2014, 'Semi-Final', 369, 371, 1, 0);
INSERT INTO public.games VALUES (225, 2014, 'Semi-Final', 370, 360, 7, 1);
INSERT INTO public.games VALUES (226, 2014, 'Quarter-Final', 371, 372, 1, 0);
INSERT INTO public.games VALUES (227, 2014, 'Quarter-Final', 369, 356, 1, 0);
INSERT INTO public.games VALUES (228, 2014, 'Quarter-Final', 360, 362, 2, 1);
INSERT INTO public.games VALUES (229, 2014, 'Quarter-Final', 370, 354, 1, 0);
INSERT INTO public.games VALUES (230, 2014, 'Eighth-Final', 360, 373, 2, 1);
INSERT INTO public.games VALUES (231, 2014, 'Eighth-Final', 362, 361, 2, 0);
INSERT INTO public.games VALUES (232, 2014, 'Eighth-Final', 354, 374, 2, 0);
INSERT INTO public.games VALUES (233, 2014, 'Eighth-Final', 370, 375, 2, 1);
INSERT INTO public.games VALUES (234, 2014, 'Eighth-Final', 371, 365, 2, 1);
INSERT INTO public.games VALUES (235, 2014, 'Eighth-Final', 372, 376, 2, 1);
INSERT INTO public.games VALUES (236, 2014, 'Eighth-Final', 369, 363, 1, 0);
INSERT INTO public.games VALUES (237, 2014, 'Eighth-Final', 356, 377, 2, 1);


--
-- Data for Name teams; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.teams VALUES (354, 'France');
INSERT INTO public.teams VALUES (355, 'Croatia');
INSERT INTO public.teams VALUES (356, 'Belgium');
INSERT INTO public.teams VALUES (357, 'England');
INSERT INTO public.teams VALUES (358, 'Russia');
INSERT INTO public.teams VALUES (359, 'Sweden');
INSERT INTO public.teams VALUES (360, 'Brazil');
INSERT INTO public.teams VALUES (361, 'Uruguay');
INSERT INTO public.teams VALUES (362, 'Colombia');
INSERT INTO public.teams VALUES (363, 'Switzerland');
INSERT INTO public.teams VALUES (364, 'Japan');
INSERT INTO public.teams VALUES (365, 'Mexico');
INSERT INTO public.teams VALUES (366, 'Denmark');
INSERT INTO public.teams VALUES (367, 'Spain');
INSERT INTO public.teams VALUES (368, 'Portugal');
INSERT INTO public.teams VALUES (369, 'Argentina');
INSERT INTO public.teams VALUES (370, 'Germany');
INSERT INTO public.teams VALUES (371, 'Netherlands');
INSERT INTO public.teams VALUES (372, 'Costa Rica');
INSERT INTO public.teams VALUES (373, 'Chile');
INSERT INTO public.teams VALUES (374, 'Nigeria');
INSERT INTO public.teams VALUES (375, 'Algeria');
INSERT INTO public.teams VALUES (376, 'Greece');
INSERT INTO public.teams VALUES (377, 'United States');


--
-- Name games_game_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 237, true);


--
-- Name teams_team_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 377, true);


--
-- Name games games_game_id_key; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_game_id_key UNIQUE (game_id);


--
-- Name games games_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name teams teams_name_key; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name teams teams_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name teams teams_team_id_key; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_id_key UNIQUE (team_id);


--
-- Name games fk_opponent; Type FK CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name games fk_winner; Type FK CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

