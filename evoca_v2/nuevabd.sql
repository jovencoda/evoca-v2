--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO root;

--
-- Name: core_attachment; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_attachment (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    url character varying(200) NOT NULL,
    "hashName" uuid NOT NULL,
    "isActive" boolean NOT NULL,
    attachment_type smallint NOT NULL,
    author_id integer NOT NULL,
    related_record_id uuid NOT NULL,
    CONSTRAINT core_attachment_attachment_type_check CHECK ((attachment_type >= 0))
);


ALTER TABLE public.core_attachment OWNER TO root;

--
-- Name: core_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_attachment_id_seq OWNER TO root;

--
-- Name: core_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_attachment_id_seq OWNED BY core_attachment.id;


--
-- Name: core_channel; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_channel (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    name character varying(255) NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    about text NOT NULL,
    "uniqueID" uuid NOT NULL,
    slug character varying(50),
    image character varying(100),
    "isActive" boolean NOT NULL,
    "defaultZoom" smallint NOT NULL,
    "mapCenterLocation" geometry(Point,4326),
    "maxZoom" smallint NOT NULL
);


ALTER TABLE public.core_channel OWNER TO root;

--
-- Name: core_channel_dimensions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_channel_dimensions (
    id integer NOT NULL,
    channel_id integer NOT NULL,
    dimension_id integer NOT NULL
);


ALTER TABLE public.core_channel_dimensions OWNER TO root;

--
-- Name: core_channel_dimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_channel_dimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_channel_dimensions_id_seq OWNER TO root;

--
-- Name: core_channel_dimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_channel_dimensions_id_seq OWNED BY core_channel_dimensions.id;


--
-- Name: core_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_channel_id_seq OWNER TO root;

--
-- Name: core_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_channel_id_seq OWNED BY core_channel.id;


--
-- Name: core_channeltype; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_channeltype (
    id integer NOT NULL
);


ALTER TABLE public.core_channeltype OWNER TO root;

--
-- Name: core_channelsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_channelsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_channelsettings_id_seq OWNER TO root;

--
-- Name: core_channelsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_channelsettings_id_seq OWNED BY core_channeltype.id;


--
-- Name: core_dimension; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_dimension (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(50),
    "uniqueID" uuid NOT NULL
);


ALTER TABLE public.core_dimension OWNER TO root;

--
-- Name: core_dimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_dimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_dimensions_id_seq OWNER TO root;

--
-- Name: core_dimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_dimensions_id_seq OWNED BY core_dimension.id;


--
-- Name: core_membership; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_membership (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    channel_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_membership OWNER TO root;

--
-- Name: core_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_membership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_membership_id_seq OWNER TO root;

--
-- Name: core_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_membership_id_seq OWNED BY core_membership.id;


--
-- Name: core_message; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_message (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    "uniqueID" uuid NOT NULL,
    "isCheck" boolean NOT NULL,
    body text NOT NULL,
    author_id integer NOT NULL,
    channel_id integer NOT NULL,
    record_id uuid NOT NULL
);


ALTER TABLE public.core_message OWNER TO root;

--
-- Name: core_profile; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_profile (
    id integer NOT NULL,
    birth_date date,
    user_id integer NOT NULL
);


ALTER TABLE public.core_profile OWNER TO root;

--
-- Name: core_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_profile_id_seq OWNER TO root;

--
-- Name: core_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_profile_id_seq OWNED BY core_profile.id;


--
-- Name: core_record; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_record (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    "uniqueID" uuid NOT NULL,
    location geometry(Point,4326) NOT NULL,
    country character varying(50) NOT NULL,
    description text NOT NULL,
    author_id integer NOT NULL,
    channel_id integer NOT NULL,
    city character varying(50) NOT NULL,
    region character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    neighborhood character varying(50) NOT NULL,
    postal_code character varying(50) NOT NULL,
    "isActive" boolean NOT NULL
);


ALTER TABLE public.core_record OWNER TO root;

--
-- Name: core_record_tags; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_record_tags (
    id integer NOT NULL,
    record_id uuid NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.core_record_tags OWNER TO root;

--
-- Name: core_record_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_record_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_record_tags_id_seq OWNER TO root;

--
-- Name: core_record_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_record_tags_id_seq OWNED BY core_record_tags.id;


--
-- Name: core_tag; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE core_tag (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    "uniqueID" uuid NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(50),
    "isActive" boolean NOT NULL,
    related_channel_id integer NOT NULL
);


ALTER TABLE public.core_tag OWNER TO root;

--
-- Name: core_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tag_id_seq OWNER TO root;

--
-- Name: core_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_tag_id_seq OWNED BY core_tag.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: mobile_audio; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE mobile_audio (
    id integer NOT NULL,
    channel character varying(255) NOT NULL,
    audio character varying(100) NOT NULL
);


ALTER TABLE public.mobile_audio OWNER TO root;

--
-- Name: mobile_audio_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE mobile_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobile_audio_id_seq OWNER TO root;

--
-- Name: mobile_audio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE mobile_audio_id_seq OWNED BY mobile_audio.id;


--
-- Name: mobile_imagen; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE mobile_imagen (
    id integer NOT NULL,
    channel character varying(255) NOT NULL,
    img character varying(100) NOT NULL
);


ALTER TABLE public.mobile_imagen OWNER TO root;

--
-- Name: mobile_imagen_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE mobile_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobile_imagen_id_seq OWNER TO root;

--
-- Name: mobile_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE mobile_imagen_id_seq OWNED BY mobile_imagen.id;


--
-- Name: world_veredascolombia; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE world_veredascolombia (
    id integer NOT NULL,
    dptompio character varying(5) NOT NULL,
    codigo_ver character varying(11) NOT NULL,
    nom_dep character varying(50) NOT NULL,
    nomb_mpio character varying(50) NOT NULL,
    nombre_ver character varying(50) NOT NULL,
    vigencia character varying(4) NOT NULL,
    fuente character varying(50) NOT NULL,
    descripcio character varying(50) NOT NULL,
    seudonimos character varying(250) NOT NULL,
    area_ha double precision NOT NULL,
    cod_dpto character varying(2) NOT NULL,
    shape_area double precision NOT NULL,
    shape_len double precision NOT NULL,
    geom geometry(MultiPolygon,3857) NOT NULL
);


ALTER TABLE public.world_veredascolombia OWNER TO root;

--
-- Name: world_veredascolombia_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE world_veredascolombia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.world_veredascolombia_id_seq OWNER TO root;

--
-- Name: world_veredascolombia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE world_veredascolombia_id_seq OWNED BY world_veredascolombia.id;


--
-- Name: world_worldborder; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE world_worldborder (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    area integer NOT NULL,
    pop2005 integer NOT NULL,
    fips character varying(2) NOT NULL,
    iso2 character varying(2) NOT NULL,
    iso3 character varying(3) NOT NULL,
    un integer NOT NULL,
    region integer NOT NULL,
    subregion integer NOT NULL,
    lon double precision NOT NULL,
    lat double precision NOT NULL,
    mpoly geometry(MultiPolygon,4326) NOT NULL
);


ALTER TABLE public.world_worldborder OWNER TO root;

--
-- Name: world_worldborder_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE world_worldborder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.world_worldborder_id_seq OWNER TO root;

--
-- Name: world_worldborder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE world_worldborder_id_seq OWNED BY world_worldborder.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_attachment ALTER COLUMN id SET DEFAULT nextval('core_attachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_channel ALTER COLUMN id SET DEFAULT nextval('core_channel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_channel_dimensions ALTER COLUMN id SET DEFAULT nextval('core_channel_dimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_channeltype ALTER COLUMN id SET DEFAULT nextval('core_channelsettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_dimension ALTER COLUMN id SET DEFAULT nextval('core_dimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_membership ALTER COLUMN id SET DEFAULT nextval('core_membership_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_profile ALTER COLUMN id SET DEFAULT nextval('core_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_record_tags ALTER COLUMN id SET DEFAULT nextval('core_record_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_tag ALTER COLUMN id SET DEFAULT nextval('core_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY mobile_audio ALTER COLUMN id SET DEFAULT nextval('mobile_audio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY mobile_imagen ALTER COLUMN id SET DEFAULT nextval('mobile_imagen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY world_veredascolombia ALTER COLUMN id SET DEFAULT nextval('world_veredascolombia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY world_worldborder ALTER COLUMN id SET DEFAULT nextval('world_worldborder_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Token	7	add_token
20	Can change Token	7	change_token
21	Can delete Token	7	delete_token
22	Can add attachment	8	add_attachment
23	Can change attachment	8	change_attachment
24	Can delete attachment	8	delete_attachment
25	Can add channel type	9	add_channeltype
26	Can change channel type	9	change_channeltype
27	Can delete channel type	9	delete_channeltype
28	Can add membership	10	add_membership
29	Can change membership	10	change_membership
30	Can delete membership	10	delete_membership
31	Can add tag	11	add_tag
32	Can change tag	11	change_tag
33	Can delete tag	11	delete_tag
34	Can add dimension	12	add_dimension
35	Can change dimension	12	change_dimension
36	Can delete dimension	12	delete_dimension
37	Can add record	13	add_record
38	Can change record	13	change_record
39	Can delete record	13	delete_record
40	Can add channel	14	add_channel
41	Can change channel	14	change_channel
42	Can delete channel	14	delete_channel
43	Can add world border	15	add_worldborder
44	Can change world border	15	change_worldborder
45	Can delete world border	15	delete_worldborder
46	Can add veredas colombia	16	add_veredascolombia
47	Can change veredas colombia	16	change_veredascolombia
48	Can delete veredas colombia	16	delete_veredascolombia
49	Can add message	17	add_message
50	Can change message	17	change_message
51	Can delete message	17	delete_message
52	Can add profile	18	add_profile
53	Can change profile	18	change_profile
54	Can delete profile	18	delete_profile
82	Can add audio	50	add_audio
83	Can change audio	50	change_audio
84	Can delete audio	50	delete_audio
85	Can add imagen	51	add_imagen
86	Can change imagen	51	change_imagen
87	Can delete imagen	51	delete_imagen
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 87, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$36000$dStTZfnb9L94$DH87tlzv0N/KAk1mwk6bmXAXdTIfqqxdZD0EZExJjJw=	\N	f	guatin				f	t	2017-09-03 16:41:49.758681+00
4	pbkdf2_sha256$36000$dZIEqYX7u1Hy$/C1VEbJ0Ago+90A2QUy7Tq1PdCiEHti252eYQcaeb5g=	\N	f	Prueba				f	t	2017-09-03 16:41:49.944783+00
5	pbkdf2_sha256$36000$4OqY5NbsBDbv$9BzclkwuzhdOhuD3T9HcfNNxiz5i8Yqr/pakQYqtQKQ=	\N	f	NLC				f	t	2017-09-03 16:41:54.207109+00
6	pbkdf2_sha256$36000$R9yYdBlPI2i5$OcmAU3dsAgSGoAcMVQv6X9QW7BL4ucxx4zubzFJYO7A=	\N	f	rivereo				f	t	2017-09-03 16:41:57.133934+00
7	pbkdf2_sha256$36000$caKOVGGC8Dcc$1nm9aEoJCFT3EmXxrBmpuDT8/mTODHuOJQq8TbX/q5Q=	\N	f	Natalia Perez				f	t	2017-09-03 16:41:57.309549+00
8	pbkdf2_sha256$36000$DaqoPUnbK0Fu$YLKzbCmcoMlt+n/0KqgLDGiPaECv1c4mv0qkhYhKRec=	\N	f	javi				f	t	2017-09-03 16:42:05.598179+00
9	pbkdf2_sha256$36000$I1R2dhOs4YxP$Aq+Ic4NhlXrKkSd15Bqj4Bn4SUb/+LqejqEH7x1xaKQ=	\N	f	dicox				f	t	2017-09-03 16:42:08.919817+00
10	pbkdf2_sha256$36000$MLLwiOsVpAIi$zFlZtoSyQQnINS/x8BupPaJlN2co2/kNvgSI9GbO13o=	\N	f	sarka				f	t	2017-09-03 16:42:11.94039+00
11	pbkdf2_sha256$36000$dXfUVZ5uRiR5$3wyj2PmxDD2jbkseASKETuH2q5lfPw6NVYvqgzAba3g=	\N	f	macastel				f	t	2017-09-03 16:42:19.87138+00
12	pbkdf2_sha256$36000$Xhh5rNVoxDtm$UNty/z7mn9Xob+JcAPj6pXjYUCqRBqa27/XR4kfzVLc=	\N	f	fercha				f	t	2017-09-03 16:42:23.786265+00
13	pbkdf2_sha256$36000$EKz78brBlKbk$VfiZvT6b6xd87UeQgBPR54qc2k+mkTRhHz+npyQgsAM=	\N	f	Monica				f	t	2017-09-03 16:42:31.839523+00
14	pbkdf2_sha256$36000$q78nVh7DSm09$8bisNGSWFvLypRicBfEGRG+gLJAZSq44aaQNngY5d3o=	\N	f	luz yanten 				f	t	2017-09-03 16:42:46.267956+00
15	pbkdf2_sha256$36000$Se5loQ4lwSe1$tDj3h43tUn68/v8PhmZYg9bO1hB7Ixj68yQraC3qvmE=	\N	f	claudia tabares				f	t	2017-09-03 16:42:46.438771+00
16	pbkdf2_sha256$36000$Ob5XU3nz1b3u$lLAYD7fxs060/b4VXQ2ywvETt/ZjfppF4pnhj7fZTgA=	\N	f	killa				f	t	2017-09-03 16:42:46.592401+00
17	pbkdf2_sha256$36000$aqsHuojvILOw$8cQPAnNLmM8AozkBAxD6PagYPOdIHAMsvx0S11xKKe8=	\N	f	Dicox				f	t	2017-09-03 16:42:51.153368+00
18	pbkdf2_sha256$36000$9zt0mkCSOB5E$4YYKbyKTgbCRnRCJtubwTm0Bi9eUsLBvyytf2QNwr6s=	\N	f	JM				f	t	2017-09-03 16:43:00.593983+00
19	pbkdf2_sha256$36000$ubSbfpeRdMfi$yPRih1MPj0w8fVeXVBW0wPd9AB9RjE59w5g0oJuoMPw=	\N	f	nlc				f	t	2017-09-03 16:43:02.477838+00
20	pbkdf2_sha256$36000$BJJ19Km778fc$ynty9/Z2PoiOHCTug3a9Xby5fFwfvMEIG2zv7z/1C8c=	\N	f	default				f	t	2017-09-03 16:43:04.580658+00
21	pbkdf2_sha256$36000$CnKMVpHGp2WZ$VRBV5Qnzl7MRaiBjKFPZJj9RSP3he6q8AXRCWdu/1lY=	\N	f	guatinnlc				f	t	2017-09-03 16:43:04.73579+00
22	pbkdf2_sha256$36000$1xwt6gBUGewQ$Inmd51AqVQSAQ38upR5KSZqqxeM6mMQOmXuh7sXPczg=	\N	f	garf				f	t	2017-09-03 16:43:06.517979+00
23	pbkdf2_sha256$36000$PLtxJ0XNjmAg$qxY5rpqciOKPm3USIApM5HzXjeJHOLVyh2naMMGafyw=	\N	f	DG				f	t	2017-09-03 16:43:41.295798+00
24	pbkdf2_sha256$36000$iT6tN5bOMROm$gYPti8zwtfpixxgg9Vw6xnXnJh1idSxd828WF56nxsM=	\N	f	evc				f	t	2017-09-03 16:43:48.091243+00
25	pbkdf2_sha256$36000$Xc5kWxzoclpF$nv+JzBy6wIHM/32Lw0c6Smv6qI79zsfxAwt6pB2eOfQ=	\N	f	prueba				f	t	2017-10-19 19:10:45.012431+00
26	pbkdf2_sha256$36000$RO9YZ8RgWTfN$63CfXowSD9kiOGKj4hS4q7ygqgZ+Z3YPADleWNauOEc=	\N	t	super				t	t	2018-02-25 20:07:41.936988+00
27	pbkdf2_sha256$36000$5lgPAQzkqjut$E5swY7CP3WrTmqcF7AsK6VZNoTxePGPzRKqjwi7ZaRs=	2018-03-04 16:10:29.079539+00	t	useradmin				t	t	2018-03-04 16:08:49.087911+00
1	pbkdf2_sha256$36000$wzLdaovp1nBv$TxOtEnozM8rNBbkmoGAZDAN0uIBE5t9D1B4SXb3/Ums=	2018-03-04 17:55:13.836726+00	t	root			myemail@test.com	t	t	2017-09-03 16:06:30.869798+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_id_seq', 27, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: root
--

COPY authtoken_token (key, created, user_id) FROM stdin;
e7b2a93667629827c4c3017af073a8ceec1afd71	2017-10-01 20:56:31.3164+00	1
\.


--
-- Data for Name: core_attachment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_attachment (id, created_at, updated_at, deleted_at, url, "hashName", "isActive", attachment_type, author_id, related_record_id) FROM stdin;
1	2017-09-03 16:41:51.576131+00	2017-09-03 16:41:51.576207+00	\N	/static/old_data/01/image/image9.jpg	e80efe98-61fa-4c0a-a753-89340fad0fa1	t	0	4	5de6531a-f00a-4f61-bb6d-06f95301e956
2	2017-09-03 16:41:51.583662+00	2017-09-03 16:41:51.583756+00	\N	/static/old_data/01/sound/sound10.mp3	ee9f683b-f763-4bbd-aade-b5ddf6083c8b	t	3	4	5de6531a-f00a-4f61-bb6d-06f95301e956
3	2017-09-03 16:41:52.799654+00	2017-09-03 16:41:52.79975+00	\N	/static/old_data/01/image/image11.jpg	57905ae0-e605-44a2-bf4c-de1fbfebc45d	t	0	4	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de
4	2017-09-03 16:41:52.805077+00	2017-09-03 16:41:52.80518+00	\N	/static/old_data/01/sound/sound12.mp3	3fde9627-a95c-4ae4-87b4-652a0d9b49b6	t	3	4	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de
5	2017-09-03 16:41:53.983318+00	2017-09-03 16:41:53.983449+00	\N	/static/old_data/01/image/image13.jpg	5488c4e4-5baf-4876-93c9-7f9c2b884329	t	0	4	e910f31d-5149-4560-a9d5-2c3da11c1076
6	2017-09-03 16:41:53.98894+00	2017-09-03 16:41:53.989253+00	\N	/static/old_data/01/sound/sound14.mp3	ef785f56-b02e-4ed1-b808-bd642a272216	t	3	4	e910f31d-5149-4560-a9d5-2c3da11c1076
7	2017-09-03 16:41:55.689555+00	2017-09-03 16:41:55.689682+00	\N	/static/old_data/01/sound/sound26.mp3	5170c999-5bba-4573-b8de-be4d6017e098	t	3	5	27bbd7c8-446b-45ad-b021-9c1f623aab3f
8	2017-09-03 16:41:55.694735+00	2017-09-03 16:41:55.694816+00	\N	/static/old_data/01/image/image25.jpg	4ebcb88a-eebf-4751-bd4d-38d71ecb5936	t	0	5	27bbd7c8-446b-45ad-b021-9c1f623aab3f
9	2017-09-03 16:41:56.879448+00	2017-09-03 16:41:56.879529+00	\N	/static/old_data/01/sound/sound28.mp3	de68a7f9-ee93-4752-bc16-1beeb4583265	t	3	5	c0470d33-114c-4dc6-859b-ff24fa01b318
10	2017-09-03 16:41:56.884238+00	2017-09-03 16:41:56.884316+00	\N	/static/old_data/01/image/image27.jpg	1074d516-45df-4503-9eff-ab5b1584532d	t	0	5	c0470d33-114c-4dc6-859b-ff24fa01b318
11	2017-09-03 16:41:58.759458+00	2017-09-03 16:41:58.759559+00	\N	/static/old_data/01/image/image33.jpg	56e8bacc-8771-4e61-b00a-d2254130d6b5	t	0	7	be855c1b-e359-4c6e-a658-bce6d38f6f2e
12	2017-09-03 16:41:58.764721+00	2017-09-03 16:41:58.764804+00	\N	/static/old_data/01/sound/sound34.mp3	09c95d2d-0eec-498f-aaa3-02a18da00116	t	3	7	be855c1b-e359-4c6e-a658-bce6d38f6f2e
13	2017-09-03 16:41:59.954564+00	2017-09-03 16:41:59.954652+00	\N	/static/old_data/01/image/image35.jpg	899e96ec-566c-432d-8c58-851a366c4941	t	0	7	03b9d474-8fb3-41f3-9de6-f1bdbd291fb0
14	2017-09-03 16:41:59.960507+00	2017-09-03 16:41:59.960639+00	\N	/static/old_data/01/sound/sound36.mp3	2c6c6a89-eef1-469d-b677-c601e77b77b3	t	3	7	03b9d474-8fb3-41f3-9de6-f1bdbd291fb0
15	2017-09-03 16:42:01.420528+00	2017-09-03 16:42:01.420614+00	\N	/static/old_data/01/image/image37.jpg	63112580-617d-4937-833a-6464532bd001	t	0	7	e68da43a-5818-42e3-8d15-1a0ab32d6f7f
16	2017-09-03 16:42:01.425804+00	2017-09-03 16:42:01.42589+00	\N	/static/old_data/01/sound/sound38.mp3	d270f05a-f5a2-44ef-a036-3740cbabbdd5	t	3	7	e68da43a-5818-42e3-8d15-1a0ab32d6f7f
17	2017-09-03 16:42:02.716969+00	2017-09-03 16:42:02.717051+00	\N	/static/old_data/01/image/image127.jpg	ffc66ce8-4aeb-4cfd-987c-f0a2725da664	t	0	3	28ac800f-8947-467a-ba94-9cb7059a7f5c
18	2017-09-03 16:42:02.722117+00	2017-09-03 16:42:02.722329+00	\N	/static/old_data/01/sound/sound128.mp3	f97191d7-a7f9-4720-b051-3b2341f143aa	t	3	3	28ac800f-8947-467a-ba94-9cb7059a7f5c
19	2017-09-03 16:42:04.177319+00	2017-09-03 16:42:04.177408+00	\N	/static/old_data/01/image/image1440183277.jpg	a1ed7e6b-8005-491e-a37d-1407e6826edd	t	0	5	0298545a-b981-49d0-a3a1-87f9282369d3
20	2017-09-03 16:42:04.184924+00	2017-09-03 16:42:04.185018+00	\N	/static/old_data/01/sound/sound50.mp3	b3de208c-6f19-4feb-b102-3bf078f8258d	t	3	5	0298545a-b981-49d0-a3a1-87f9282369d3
21	2017-09-03 16:42:05.377581+00	2017-09-03 16:42:05.377661+00	\N	/static/old_data/01/image/image51.jpg	0e392348-f262-4010-b8fa-a38875619857	t	0	5	e9993153-88fc-4b6d-8f98-82f1179a6f48
22	2017-09-03 16:42:05.383158+00	2017-09-03 16:42:05.383416+00	\N	/static/old_data/01/sound/sound52.mp3	be1cdead-853e-42f7-aef8-4e8c31521c16	t	3	5	e9993153-88fc-4b6d-8f98-82f1179a6f48
23	2017-09-03 16:42:07.121071+00	2017-09-03 16:42:07.121155+00	\N	/static/old_data/01/image/image1440183239.jpg	aacfdcfb-04ef-4bfd-b3a4-7a6af35fda73	t	0	8	0f826755-fd72-4bcf-9dcc-fde6c75fba40
24	2017-09-03 16:42:07.125981+00	2017-09-03 16:42:07.126058+00	\N	/static/old_data/01/sound/sound54.mp3	2860ff7b-6bbe-4aac-9257-42e20e6342b8	t	3	8	0f826755-fd72-4bcf-9dcc-fde6c75fba40
25	2017-09-03 16:42:08.711228+00	2017-09-03 16:42:08.711312+00	\N	/static/old_data/01/sound/sound126.mp3	e1c56d8e-e2d5-4ba7-8600-8774ff42aa47	t	3	3	aba05bd3-1be9-4c17-9977-54620f833123
26	2017-09-03 16:42:08.716247+00	2017-09-03 16:42:08.716325+00	\N	/static/old_data/01/image/image125.jpg	35bd99a1-33da-4897-a2bd-5c1de31b1f2f	t	0	3	aba05bd3-1be9-4c17-9977-54620f833123
27	2017-09-03 16:42:11.685266+00	2017-09-03 16:42:11.685358+00	\N	/static/old_data/01/image/image63.jpg	e4069bad-1261-4cd9-a3c1-90475df514f8	t	0	9	8089ca6f-7452-4f83-a8b3-9eccaf2474fc
28	2017-09-03 16:42:11.690371+00	2017-09-03 16:42:11.69048+00	\N	/static/old_data/01/sound/sound64.mp3	9aeb68cb-a911-4371-90c2-b4f78536e69a	t	3	9	8089ca6f-7452-4f83-a8b3-9eccaf2474fc
29	2017-09-03 16:42:14.317401+00	2017-09-03 16:42:14.317498+00	\N	/static/old_data/01/image/image65.jpg	d78fbe99-879c-4852-810e-18f86ecbb5c9	t	0	10	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277
30	2017-09-03 16:42:14.322152+00	2017-09-03 16:42:14.322297+00	\N	/static/old_data/01/sound/sound66.mp3	7774d697-bb42-498c-93cc-746c4abaa147	t	3	10	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277
31	2017-09-03 16:42:15.511893+00	2017-09-03 16:42:15.511976+00	\N	/static/old_data/01/image/image67.jpg	07c3d2d4-1dc8-4888-b4fe-cd13e18d0b60	t	0	10	0c770d71-3206-48f5-9857-8c09ee003fe6
32	2017-09-03 16:42:15.563035+00	2017-09-03 16:42:15.563486+00	\N	/static/old_data/01/sound/sound68.mp3	a656d98a-ef4e-486c-bf64-fc7f8cebb471	t	3	10	0c770d71-3206-48f5-9857-8c09ee003fe6
33	2017-09-03 16:42:16.983988+00	2017-09-03 16:42:16.984093+00	\N	/static/old_data/01/image/image69.jpg	d1fd4e45-3ea2-4b01-b72c-9df10c71ac7c	t	0	10	c169868d-8028-48ab-ac04-75d3ff1e6949
34	2017-09-03 16:42:16.992871+00	2017-09-03 16:42:16.992955+00	\N	/static/old_data/01/sound/sound70.mp3	f0dcb581-d8aa-457d-9c6a-5dfa46a43a1f	t	3	10	c169868d-8028-48ab-ac04-75d3ff1e6949
35	2017-09-03 16:42:18.3037+00	2017-09-03 16:42:18.303762+00	\N	/static/old_data/01/image/image71.jpg	56bebeb0-37aa-43be-8eea-c49ef8e7568a	t	0	10	d91c88de-c77b-485c-b290-aa72dc659a11
36	2017-09-03 16:42:18.309485+00	2017-09-03 16:42:18.309543+00	\N	/static/old_data/01/sound/sound72.mp3	52f88830-a9f7-476e-9a80-5c68fd87525f	t	3	10	d91c88de-c77b-485c-b290-aa72dc659a11
37	2017-09-03 16:42:19.620673+00	2017-09-03 16:42:19.620784+00	\N	/static/old_data/01/image/image73.jpg	3299dd1b-7369-4b84-8e33-0311d78e4284	t	0	10	88e07d66-17dd-43c8-a9ff-579ab19a294e
38	2017-09-03 16:42:19.628416+00	2017-09-03 16:42:19.628501+00	\N	/static/old_data/01/sound/sound74.mp3	e6f7b726-1960-4202-8268-e56326ddcddf	t	3	10	88e07d66-17dd-43c8-a9ff-579ab19a294e
39	2017-09-03 16:42:21.211814+00	2017-09-03 16:42:21.211987+00	\N	/static/old_data/01/image/image75.jpg	fce52981-7628-4507-a124-346a51af2249	t	0	11	1fde81af-408e-4b16-8100-70d5f5c37d23
40	2017-09-03 16:42:21.219677+00	2017-09-03 16:42:21.219781+00	\N	/static/old_data/01/sound/sound76.mp3	53f39a2c-f6b7-4987-96cd-f9ce6119564e	t	3	11	1fde81af-408e-4b16-8100-70d5f5c37d23
41	2017-09-03 16:42:23.532303+00	2017-09-03 16:42:23.532401+00	\N	/static/old_data/01/image/image77.jpg	bdae7b6f-6238-4c91-82c5-ff84f4a4fffc	t	0	11	791125da-a318-4bd3-b801-14b6b1d9d159
42	2017-09-03 16:42:23.539784+00	2017-09-03 16:42:23.539859+00	\N	/static/old_data/01/sound/sound78.mp3	e79bb29d-d904-4e2d-be22-351e7392a86d	t	3	11	791125da-a318-4bd3-b801-14b6b1d9d159
43	2017-09-03 16:42:24.969408+00	2017-09-03 16:42:24.969499+00	\N	/static/old_data/01/image/image79.jpg	3f695165-d2fe-46c4-b9b4-9c3bc99002c9	t	0	12	e07dca59-a780-4100-be3c-d4ad85b1ecea
44	2017-09-03 16:42:24.974592+00	2017-09-03 16:42:24.974732+00	\N	/static/old_data/01/sound/sound80.mp3	ae6d191e-797c-4a2e-9eda-7c6cfcb68742	t	3	12	e07dca59-a780-4100-be3c-d4ad85b1ecea
45	2017-09-03 16:42:26.134997+00	2017-09-03 16:42:26.135117+00	\N	/static/old_data/01/image/image81.jpg	e31a4df6-504d-49ce-afa7-828f2b18210e	t	0	12	fef9da49-c03f-41d4-86ff-bf13d46c1689
46	2017-09-03 16:42:26.142348+00	2017-09-03 16:42:26.142467+00	\N	/static/old_data/01/sound/sound82.mp3	22d1900a-8f51-4289-a0bd-13b962a55024	t	3	12	fef9da49-c03f-41d4-86ff-bf13d46c1689
47	2017-09-03 16:42:27.897708+00	2017-09-03 16:42:27.897786+00	\N	/static/old_data/01/image/image83.jpg	f302ea69-c00f-446a-9662-083ccde3ff41	t	0	12	293efedf-ad76-455a-83c1-615ab95c493f
48	2017-09-03 16:42:27.902339+00	2017-09-03 16:42:27.902429+00	\N	/static/old_data/01/sound/sound84.mp3	ca9cf2c0-5ba5-4885-be98-3bf287885a1e	t	3	12	293efedf-ad76-455a-83c1-615ab95c493f
49	2017-09-03 16:42:29.123227+00	2017-09-03 16:42:29.123305+00	\N	/static/old_data/01/image/image85.jpg	7b6db6d5-face-4d9e-b3e9-97339cd1e5fb	t	0	11	24fe3865-7b55-48ea-b3c9-f3802d5ad091
50	2017-09-03 16:42:29.131994+00	2017-09-03 16:42:29.132368+00	\N	/static/old_data/01/sound/sound86.mp3	0ac7d110-6904-4a43-b10a-5d68169c356b	t	3	11	24fe3865-7b55-48ea-b3c9-f3802d5ad091
51	2017-09-03 16:42:30.666867+00	2017-09-03 16:42:30.66697+00	\N	/static/old_data/01/image/image87.jpg	33f40d75-4c34-408c-8563-df92c7240a18	t	0	11	6ecf91d2-cca2-4ae1-8615-122cf97fada1
52	2017-09-03 16:42:30.67352+00	2017-09-03 16:42:30.673602+00	\N	/static/old_data/01/sound/sound88.mp3	05c8b867-b5e2-4677-bdf9-902c14521e2a	t	3	11	6ecf91d2-cca2-4ae1-8615-122cf97fada1
53	2017-09-03 16:42:31.629595+00	2017-09-03 16:42:31.629976+00	\N	/static/old_data/01/image/image89.jpg	820d38d3-256e-45c6-abc9-d909a2a1be80	t	0	11	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8
54	2017-09-03 16:42:31.638769+00	2017-09-03 16:42:31.63891+00	\N	/static/old_data/01/sound/sound90.mp3	7745e2ff-a382-4714-8ada-e51829d55ced	t	3	11	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8
55	2017-09-03 16:42:33.464255+00	2017-09-03 16:42:33.464339+00	\N	/static/old_data/01/image/image91.jpg	08d8d8b0-fd86-4fd1-8a64-30e44b1af2c6	t	0	13	cb0a1479-b7f9-42b5-a020-545f8482d4ec
56	2017-09-03 16:42:33.470349+00	2017-09-03 16:42:33.47046+00	\N	/static/old_data/01/sound/sound92.mp3	695e04aa-347b-4ad8-9e48-03b22487c02a	t	3	13	cb0a1479-b7f9-42b5-a020-545f8482d4ec
57	2017-09-03 16:42:34.803696+00	2017-09-03 16:42:34.803809+00	\N	/static/old_data/01/image/image93.jpg	194ea207-b784-433c-834b-e74ee0d0426b	t	0	13	16cb85f9-111e-416f-80ce-f454c94fc843
58	2017-09-03 16:42:34.808609+00	2017-09-03 16:42:34.808706+00	\N	/static/old_data/01/sound/sound94.mp3	2726a94d-8eee-4df6-ad68-867ddd5ac69d	t	3	13	16cb85f9-111e-416f-80ce-f454c94fc843
59	2017-09-03 16:42:35.837273+00	2017-09-03 16:42:35.837369+00	\N	/static/old_data/01/image/image95.jpg	ecd2ebb4-65c1-4e37-bf54-fddb07a4c962	t	0	13	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7
60	2017-09-03 16:42:35.844963+00	2017-09-03 16:42:35.84506+00	\N	/static/old_data/01/sound/sound96.mp3	5fff37b9-77f3-42a7-9480-22b23684d4ef	t	3	13	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7
61	2017-09-03 16:42:37.140661+00	2017-09-03 16:42:37.140801+00	\N	/static/old_data/01/image/image97.jpg	0f239a24-0308-4656-bf52-9d6a11e48052	t	0	11	5195e1c4-ec73-44c4-8e89-068dbd147959
62	2017-09-03 16:42:37.148063+00	2017-09-03 16:42:37.148164+00	\N	/static/old_data/01/sound/sound98.mp3	b808d419-f3b5-4c16-acc7-f1bf94cd6626	t	3	11	5195e1c4-ec73-44c4-8e89-068dbd147959
63	2017-09-03 16:42:38.952534+00	2017-09-03 16:42:38.952671+00	\N	/static/old_data/01/image/image99.jpg	c79f0036-924c-4cfc-a2f9-a79eb43d319a	t	0	11	897a09ed-756f-40b1-9da7-1ea63bc33933
64	2017-09-03 16:42:38.961136+00	2017-09-03 16:42:38.961209+00	\N	/static/old_data/01/sound/sound100.mp3	a973ed72-a751-44c7-9041-ad24a983560d	t	3	11	897a09ed-756f-40b1-9da7-1ea63bc33933
65	2017-09-03 16:42:40.013171+00	2017-09-03 16:42:40.013454+00	\N	/static/old_data/01/image/image101.jpg	c89d8846-d385-4db2-acec-9d3c21650213	t	0	11	5fae39a1-18d0-4759-a0ef-66347c2ffa6b
66	2017-09-03 16:42:40.022995+00	2017-09-03 16:42:40.02311+00	\N	/static/old_data/01/sound/sound102.mp3	b4a40b08-9bcd-4d55-bb8e-2ed85d00b523	t	3	11	5fae39a1-18d0-4759-a0ef-66347c2ffa6b
67	2017-09-03 16:42:41.112781+00	2017-09-03 16:42:41.112914+00	\N	/static/old_data/01/image/image103.jpg	3840e532-c23a-4840-b24e-2dde9061bdb7	t	0	11	d5d6ff8d-77f5-4c91-a0aa-55437de883d9
68	2017-09-03 16:42:41.122122+00	2017-09-03 16:42:41.122318+00	\N	/static/old_data/01/sound/sound104.mp3	a261cdd5-dec4-4aa7-a013-1bb928b1d6ae	t	3	11	d5d6ff8d-77f5-4c91-a0aa-55437de883d9
69	2017-09-03 16:42:42.197513+00	2017-09-03 16:42:42.197599+00	\N	/static/old_data/01/image/image107.jpg	9874abab-0655-486c-8c4a-160454103a9b	t	0	11	ebb297fd-898b-4649-b082-3eea6bb825a5
70	2017-09-03 16:42:42.208459+00	2017-09-03 16:42:42.208543+00	\N	/static/old_data/01/sound/sound108.mp3	f136dd77-4eba-4443-9915-216944cd3887	t	3	11	ebb297fd-898b-4649-b082-3eea6bb825a5
71	2017-09-03 16:42:43.53155+00	2017-09-03 16:42:43.531631+00	\N	/static/old_data/01/image/image109.jpg	8366eb1d-58ec-4309-9790-26c72ed836b2	t	0	11	51890721-49e9-48b4-80ad-343f69140618
72	2017-09-03 16:42:43.537978+00	2017-09-03 16:42:43.538102+00	\N	/static/old_data/01/sound/sound110.mp3	ae53e07d-784e-4c0a-b3cd-3317ee10faab	t	3	11	51890721-49e9-48b4-80ad-343f69140618
73	2017-09-03 16:42:44.783318+00	2017-09-03 16:42:44.783538+00	\N	/static/old_data/01/image/image113.jpg	20ef361b-a768-4a9d-8aa3-6b6027150602	t	0	6	d09dd013-a703-4dbc-a776-fa2759e72589
74	2017-09-03 16:42:44.789045+00	2017-09-03 16:42:44.789129+00	\N	/static/old_data/01/sound/sound114.mp3	226f520d-3d5b-433b-b195-1502a4b07f0b	t	3	6	d09dd013-a703-4dbc-a776-fa2759e72589
75	2017-09-03 16:42:46.078707+00	2017-09-03 16:42:46.078918+00	\N	/static/old_data/01/image/image115.jpg	ad9a8eaa-bb1e-4ddf-8b53-c08c06ed7c1f	t	0	6	ab0a53aa-f634-434e-b686-538bd95e54a3
76	2017-09-03 16:42:46.089411+00	2017-09-03 16:42:46.089549+00	\N	/static/old_data/01/sound/sound116.mp3	1ccb3e90-e787-4df2-af47-0db6176d8f0a	t	3	6	ab0a53aa-f634-434e-b686-538bd95e54a3
77	2017-09-03 16:42:47.983946+00	2017-09-03 16:42:47.984068+00	\N	/static/old_data/01/image/image151.jpg	9a70a0b7-36a1-43d4-afb9-d12a0ff11ae3	t	0	16	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44
78	2017-09-03 16:42:47.991834+00	2017-09-03 16:42:47.991918+00	\N	/static/old_data/01/sound/sound152.mp3	692597b2-7155-4970-b016-5e7e689811f7	t	3	16	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44
79	2017-09-03 16:42:49.524922+00	2017-09-03 16:42:49.524978+00	\N	/static/old_data/01/image/image153.jpg	7141f8a6-c7fb-4717-aab2-48dedc9d80ad	t	0	16	c7f0698d-6f00-4626-9ed2-76eebe405c7d
80	2017-09-03 16:42:49.528642+00	2017-09-03 16:42:49.528737+00	\N	/static/old_data/01/sound/sound154.mp3	fe985d53-0b2d-4867-8b7c-a428f65af425	t	3	16	c7f0698d-6f00-4626-9ed2-76eebe405c7d
81	2017-09-03 16:42:50.938651+00	2017-09-03 16:42:50.938732+00	\N	/static/old_data/01/image/image155.jpg	f0b9d05f-bd4a-43c2-8e9f-ce02be86f1ce	t	0	6	8183afe6-0446-48bb-9881-8b7de0b785f2
82	2017-09-03 16:42:50.943528+00	2017-09-03 16:42:50.943632+00	\N	/static/old_data/01/sound/sound156.mp3	32a51f23-6374-4ded-95df-c466c3811011	t	3	6	8183afe6-0446-48bb-9881-8b7de0b785f2
83	2017-09-03 16:42:52.903424+00	2017-09-03 16:42:52.903504+00	\N	/static/old_data/01/image/image157.jpg	a733b188-ca12-49d0-ac2f-bf4db72123fa	t	0	17	7f73586e-b532-4781-b28e-eb5f043c8542
84	2017-09-03 16:42:52.908939+00	2017-09-03 16:42:52.909018+00	\N	/static/old_data/01/sound/sound158.mp3	9e4f1020-76f3-4402-96d3-f5ecbcea7385	t	3	17	7f73586e-b532-4781-b28e-eb5f043c8542
85	2017-09-03 16:42:54.977363+00	2017-09-03 16:42:54.977478+00	\N	/static/old_data/01/image/image159.jpg	d30ee57d-1528-457a-9947-015c01873e9b	t	0	17	3b376d06-4a28-4ba2-8635-befda27568f5
86	2017-09-03 16:42:54.98406+00	2017-09-03 16:42:54.984145+00	\N	/static/old_data/01/sound/sound160.mp3	a707715c-d5fe-43d2-8b72-73fcbebcf669	t	3	17	3b376d06-4a28-4ba2-8635-befda27568f5
87	2017-09-03 16:42:56.173221+00	2017-09-03 16:42:56.1733+00	\N	/static/old_data/01/image/image161.jpg	45c1ca0c-c5ee-45e0-8d24-32f236b4696d	t	0	17	c489ef6d-a7f9-4ece-94a1-e8c89cea352f
88	2017-09-03 16:42:56.187263+00	2017-09-03 16:42:56.187367+00	\N	/static/old_data/01/sound/sound162.mp3	9a90c1de-c336-48d9-a430-a622706b02ec	t	3	17	c489ef6d-a7f9-4ece-94a1-e8c89cea352f
89	2017-09-03 16:42:57.463036+00	2017-09-03 16:42:57.46318+00	\N	/static/old_data/01/image/image163.jpg	9c057c82-b20f-4a9e-b5de-7bde12754cfb	t	0	17	8f5c53b2-fcb3-48b0-add5-046460f5fbb8
90	2017-09-03 16:42:57.469363+00	2017-09-03 16:42:57.469547+00	\N	/static/old_data/01/sound/sound164.mp3	8813f2d8-1820-4436-aa6b-e744c6c1622d	t	3	17	8f5c53b2-fcb3-48b0-add5-046460f5fbb8
91	2017-09-03 16:42:58.881034+00	2017-09-03 16:42:58.881137+00	\N	/static/old_data/01/image/image165.jpg	44e8657e-0f7b-4659-b2b3-c43dbc454621	t	0	17	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033
92	2017-09-03 16:42:58.888167+00	2017-09-03 16:42:58.888245+00	\N	/static/old_data/01/sound/sound166.mp3	3334fe02-ffb5-4c5f-9fd2-eded9a0897da	t	3	17	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033
93	2017-09-03 16:43:00.431982+00	2017-09-03 16:43:00.432035+00	\N	/static/old_data/01/image/image167.jpg	3df0c3c5-fa44-427e-8ba0-47bb9e3d47be	t	0	17	7f81eea4-8229-481c-86af-7b4de9ead9d7
94	2017-09-03 16:43:00.434297+00	2017-09-03 16:43:00.434365+00	\N	/static/old_data/01/sound/sound168.mp3	57cce0b0-9cd0-4f22-9380-d44a13b15de6	t	3	17	7f81eea4-8229-481c-86af-7b4de9ead9d7
95	2017-09-03 16:43:02.299293+00	2017-09-03 16:43:02.299423+00	\N	/static/old_data/01/sound/sound174.mp3	a0388a4b-c556-45c8-90f5-44f55cb44f41	t	3	18	f6f80395-759c-4d79-8c4c-9e7754b83de6
96	2017-09-03 16:43:04.295986+00	2017-09-03 16:43:04.296065+00	\N	/static/old_data/01/image/image171.jpg	b70e52ce-a17c-4671-a6c8-19b54c888578	t	0	19	5885ec1b-d3a4-4952-971c-04d9946f6cba
97	2017-09-03 16:43:04.300818+00	2017-09-03 16:43:04.300896+00	\N	/static/old_data/01/sound/sound172.mp3	2164d708-04c8-40d3-8e0d-ac835ed0c40b	t	3	19	5885ec1b-d3a4-4952-971c-04d9946f6cba
98	2017-09-03 16:43:06.298947+00	2017-09-03 16:43:06.299031+00	\N	/static/old_data/01/image/image263.jpg	214b79bb-399c-44cd-8e58-f37734391495	t	0	21	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2
99	2017-09-03 16:43:06.304805+00	2017-09-03 16:43:06.30489+00	\N	/static/old_data/01/sound/sound264.mp3	aaed9bcc-d686-4dbd-9cc2-51896b23df8d	t	3	21	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2
100	2017-09-03 16:43:07.948599+00	2017-09-03 16:43:07.948681+00	\N	/static/old_data/01/image/image265.jpg	e02901fe-bcca-4971-92fe-877d84f3fffb	t	0	22	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42
101	2017-09-03 16:43:07.953616+00	2017-09-03 16:43:07.953694+00	\N	/static/old_data/01/sound/sound266.mp3	9ede7277-c4cc-4234-8056-083481efbe69	t	3	22	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42
102	2017-09-03 16:43:08.916158+00	2017-09-03 16:43:08.916246+00	\N	/static/old_data/01/image/image267.jpg	e718fc9d-8055-4c0f-9e98-8675607e95e3	t	0	22	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a
103	2017-09-03 16:43:08.923395+00	2017-09-03 16:43:08.923531+00	\N	/static/old_data/01/sound/sound268.mp3	0185e94b-521f-457f-9d79-ec48be11190b	t	3	22	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a
104	2017-09-03 16:43:10.460337+00	2017-09-03 16:43:10.460387+00	\N	/static/old_data/01/image/image269.jpg	50f0a1ca-0f91-451e-8940-eeaf32bc46e8	t	0	22	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4
105	2017-09-03 16:43:10.463507+00	2017-09-03 16:43:10.463661+00	\N	/static/old_data/01/sound/sound270.mp3	a808894b-226f-44d7-8c2b-1fc9d59c7161	t	3	22	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4
106	2017-09-03 16:43:11.992323+00	2017-09-03 16:43:11.992404+00	\N	/static/old_data/01/image/image271.jpg	5e76d19e-cabc-4e5d-ab95-c75dd5e51f1c	t	0	22	0642a23d-912c-432d-bf24-91d5b303f7ab
107	2017-09-03 16:43:11.997171+00	2017-09-03 16:43:11.99725+00	\N	/static/old_data/01/sound/sound272.mp3	0a76494f-9fe4-443b-bb20-be690b940a11	t	3	22	0642a23d-912c-432d-bf24-91d5b303f7ab
108	2017-09-03 16:43:13.234412+00	2017-09-03 16:43:13.234514+00	\N	/static/old_data/01/image/image273.jpg	225845f3-6441-41ca-81fc-c8f7a39440b2	t	0	22	1caaaec8-bd13-46a0-8f90-7d018117238d
109	2017-09-03 16:43:13.240483+00	2017-09-03 16:43:13.240587+00	\N	/static/old_data/01/sound/sound274.mp3	42836815-daea-46ef-97a6-0fe8d3013cba	t	3	22	1caaaec8-bd13-46a0-8f90-7d018117238d
110	2017-09-03 16:43:14.446056+00	2017-09-03 16:43:14.446394+00	\N	/static/old_data/01/image/image275.jpg	7c4d319d-44f0-4579-996d-9f07e0960e12	t	0	22	55e235eb-7738-4f23-b802-056b0cc27ab0
111	2017-09-03 16:43:14.450463+00	2017-09-03 16:43:14.450525+00	\N	/static/old_data/01/sound/sound276.mp3	623d1df2-c4d1-49d7-ab81-ec92dea083dc	t	3	22	55e235eb-7738-4f23-b802-056b0cc27ab0
112	2017-09-03 16:43:15.613223+00	2017-09-03 16:43:15.613329+00	\N	/static/old_data/01/image/image277.jpg	cda30390-2b1e-405d-b000-103c7763e438	t	0	22	e2209156-8c6d-4b00-a105-6599f61034a2
113	2017-09-03 16:43:15.620032+00	2017-09-03 16:43:15.620114+00	\N	/static/old_data/01/sound/sound278.mp3	06a05c4c-2f83-4757-98aa-24db85dc2777	t	3	22	e2209156-8c6d-4b00-a105-6599f61034a2
114	2017-09-03 16:43:16.887685+00	2017-09-03 16:43:16.887848+00	\N	/static/old_data/01/image/image279.jpg	cda53bb3-0926-404b-bee5-6bc57e3826d8	t	0	22	d117527f-c4a8-4ec3-b151-7d2c287413f6
115	2017-09-03 16:43:16.893875+00	2017-09-03 16:43:16.894058+00	\N	/static/old_data/01/sound/sound280.mp3	fcc979ce-421e-43e4-87b2-0b8ab9f2d08b	t	3	22	d117527f-c4a8-4ec3-b151-7d2c287413f6
116	2017-09-03 16:43:18.462126+00	2017-09-03 16:43:18.462424+00	\N	/static/old_data/01/image/image281.jpg	9b58d9fa-a4d2-4f25-abe4-e41179ac8898	t	0	22	2aaf4790-0265-48fe-b7f3-f162281c6e22
117	2017-09-03 16:43:18.46755+00	2017-09-03 16:43:18.467645+00	\N	/static/old_data/01/sound/sound282.mp3	c3fe95ae-1e69-4f5b-80cc-38446f63a27b	t	3	22	2aaf4790-0265-48fe-b7f3-f162281c6e22
118	2017-09-03 16:43:19.822879+00	2017-09-03 16:43:19.822996+00	\N	/static/old_data/01/image/image283.jpg	82025dce-a77e-4cdd-8199-70ab56305340	t	0	22	b5d81b74-f199-49b9-ad64-47453c7d5097
119	2017-09-03 16:43:19.829579+00	2017-09-03 16:43:19.829724+00	\N	/static/old_data/01/sound/sound284.mp3	ee280b62-40b6-4571-b816-d2e90604b168	t	3	22	b5d81b74-f199-49b9-ad64-47453c7d5097
120	2017-09-03 16:43:21.295551+00	2017-09-03 16:43:21.295659+00	\N	/static/old_data/01/image/image285.jpg	9bfa9050-6e5f-4f42-84d8-d0076b5bdc32	t	0	22	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17
121	2017-09-03 16:43:21.301614+00	2017-09-03 16:43:21.301692+00	\N	/static/old_data/01/sound/sound286.mp3	fac4161b-3da2-4832-a907-2067f8bc9994	t	3	22	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17
122	2017-09-03 16:43:22.29178+00	2017-09-03 16:43:22.291862+00	\N	/static/old_data/01/image/image287.jpg	bf8842ef-aa0d-4d51-9dd9-126a35783dbb	t	0	22	3a1e07d5-b54c-4196-8fd4-5572ad20f975
123	2017-09-03 16:43:22.298552+00	2017-09-03 16:43:22.298642+00	\N	/static/old_data/01/sound/sound288.mp3	536a1852-2aa7-42cf-afd1-0e9c59e16a68	t	3	22	3a1e07d5-b54c-4196-8fd4-5572ad20f975
124	2017-09-03 16:43:23.583985+00	2017-09-03 16:43:23.584064+00	\N	/static/old_data/01/image/image289.jpg	02b1fc41-2976-4275-aa1e-f1a59f84037f	t	0	22	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd
125	2017-09-03 16:43:23.588839+00	2017-09-03 16:43:23.590081+00	\N	/static/old_data/01/sound/sound290.mp3	0bdbee4b-5719-44b4-8cb8-226a2ddc9de0	t	3	22	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd
126	2017-09-03 16:43:25.054182+00	2017-09-03 16:43:25.054478+00	\N	/static/old_data/01/image/image291.jpg	bfefb767-5892-48ce-8c6c-8015b8739344	t	0	22	21badbe7-7f70-4f5a-99e6-91a8f4c31c38
127	2017-09-03 16:43:25.06113+00	2017-09-03 16:43:25.061232+00	\N	/static/old_data/01/sound/sound292.mp3	2e2b8445-26bb-4f6a-83f1-d983ff1499e0	t	3	22	21badbe7-7f70-4f5a-99e6-91a8f4c31c38
128	2017-09-03 16:43:26.287772+00	2017-09-03 16:43:26.287868+00	\N	/static/old_data/01/image/image293.jpg	7fbea4f7-043a-4f5d-a199-aaf12f38b2d0	t	0	22	891c8841-8e6d-4167-8c99-e4b1358ae45b
129	2017-09-03 16:43:26.294188+00	2017-09-03 16:43:26.294382+00	\N	/static/old_data/01/sound/sound294.mp3	9a7e8875-262a-4171-97a0-1501ecdb586e	t	3	22	891c8841-8e6d-4167-8c99-e4b1358ae45b
130	2017-09-03 16:43:27.662502+00	2017-09-03 16:43:27.663476+00	\N	/static/old_data/01/image/image295.jpg	2aa89cc9-e72e-4005-9877-1319bba47180	t	0	22	db467ca8-b12b-4fa4-b836-8861ec78726b
131	2017-09-03 16:43:27.668652+00	2017-09-03 16:43:27.668741+00	\N	/static/old_data/01/sound/sound296.mp3	370bf062-1a93-4515-a410-5a78cffb34fa	t	3	22	db467ca8-b12b-4fa4-b836-8861ec78726b
132	2017-09-03 16:43:28.647863+00	2017-09-03 16:43:28.648278+00	\N	/static/old_data/01/image/image297.jpg	0dd3ac5c-809c-4473-9953-8703120436e8	t	0	22	808368b1-3295-48b5-8449-3f60c7a0322f
133	2017-09-03 16:43:28.655836+00	2017-09-03 16:43:28.656046+00	\N	/static/old_data/01/sound/sound298.mp3	fee3c63a-70c6-41c3-a71b-507667c940ce	t	3	22	808368b1-3295-48b5-8449-3f60c7a0322f
134	2017-09-03 16:43:29.916816+00	2017-09-03 16:43:29.916896+00	\N	/static/old_data/01/image/image299.jpg	c47c0bc4-d298-4f5c-852c-51464d6b9311	t	0	22	8cb3e148-af5e-419a-b3e7-d8ec93c6964c
135	2017-09-03 16:43:29.922789+00	2017-09-03 16:43:29.922888+00	\N	/static/old_data/01/sound/sound300.mp3	f16b9f58-7cae-4527-b0e9-6f97fed7ab10	t	3	22	8cb3e148-af5e-419a-b3e7-d8ec93c6964c
136	2017-09-03 16:43:30.979209+00	2017-09-03 16:43:30.979368+00	\N	/static/old_data/01/image/image301.jpg	ec1ff8b5-246f-4934-b9d9-385995936c5b	t	0	22	05877abf-72f5-463b-8546-feada547b3b6
137	2017-09-03 16:43:30.984207+00	2017-09-03 16:43:30.98429+00	\N	/static/old_data/01/sound/sound302.mp3	8f6e6b23-8afe-47b8-aa68-ca375269f63c	t	3	22	05877abf-72f5-463b-8546-feada547b3b6
138	2017-09-03 16:43:32.493201+00	2017-09-03 16:43:32.493318+00	\N	/static/old_data/01/image/image303.jpg	5763ac4e-ad32-4546-b738-ed9ebfb83a8b	t	0	22	988615e8-266c-424d-8428-7b07d9c00dfb
139	2017-09-03 16:43:32.515417+00	2017-09-03 16:43:32.515538+00	\N	/static/old_data/01/sound/sound304.mp3	7a140fea-c42f-46e6-b4f8-7aa127aae95e	t	3	22	988615e8-266c-424d-8428-7b07d9c00dfb
140	2017-09-03 16:43:33.478774+00	2017-09-03 16:43:33.478857+00	\N	/static/old_data/01/image/image305.jpg	f75a5792-78c2-482e-b639-2ab59630fbce	t	0	22	f3622115-2421-4667-a2bf-0621dd9e7868
141	2017-09-03 16:43:33.484167+00	2017-09-03 16:43:33.484246+00	\N	/static/old_data/01/sound/sound306.mp3	0060143a-b2b3-4061-8bd4-a3c75915e3c4	t	3	22	f3622115-2421-4667-a2bf-0621dd9e7868
142	2017-09-03 16:43:34.808796+00	2017-09-03 16:43:34.808874+00	\N	/static/old_data/01/image/image307.jpg	f06f53d8-c9c1-4a79-b172-2c9e7031d3e1	t	0	22	6c4403e5-7dad-4436-a241-0f5d826e8f66
143	2017-09-03 16:43:34.813604+00	2017-09-03 16:43:34.813682+00	\N	/static/old_data/01/sound/sound308.mp3	31778393-1daa-4fac-8984-c374c3351ef1	t	3	22	6c4403e5-7dad-4436-a241-0f5d826e8f66
144	2017-09-03 16:43:36.061175+00	2017-09-03 16:43:36.061255+00	\N	/static/old_data/01/image/image309.jpg	16daa24d-194c-44cc-ad50-646b1cb3bc90	t	0	22	441bef1f-b57a-44ad-a72b-529c4eca5343
145	2017-09-03 16:43:36.067019+00	2017-09-03 16:43:36.067142+00	\N	/static/old_data/01/sound/sound310.mp3	29af1ca0-d8d8-4b78-be93-c46e61802edd	t	3	22	441bef1f-b57a-44ad-a72b-529c4eca5343
146	2017-09-03 16:43:37.222405+00	2017-09-03 16:43:37.222509+00	\N	/static/old_data/01/image/image311.jpg	bad9436e-eb96-44c1-9c5a-89d6fff6a180	t	0	22	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2
147	2017-09-03 16:43:37.227997+00	2017-09-03 16:43:37.228162+00	\N	/static/old_data/01/sound/sound312.mp3	40185a86-d2c0-4246-a8c3-76ae49e9219c	t	3	22	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2
148	2017-09-03 16:43:38.50852+00	2017-09-03 16:43:38.508732+00	\N	/static/old_data/01/image/image313.jpg	55daee15-172f-45b0-bab8-476f87b03546	t	0	22	99070557-0762-4a9c-a532-dbd76092fb92
149	2017-09-03 16:43:38.514712+00	2017-09-03 16:43:38.514794+00	\N	/static/old_data/01/sound/sound314.mp3	dad1ac59-4115-4f44-972d-545db57deb69	t	3	22	99070557-0762-4a9c-a532-dbd76092fb92
150	2017-09-03 16:43:39.915589+00	2017-09-03 16:43:39.915725+00	\N	/static/old_data/01/image/image315.jpg	7ae0db1f-7229-4733-b569-02e911363b11	t	0	22	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b
151	2017-09-03 16:43:39.920809+00	2017-09-03 16:43:39.920894+00	\N	/static/old_data/01/sound/sound316.mp3	b73db093-7f90-450f-be35-e59666ec9331	t	3	22	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b
152	2017-09-03 16:43:41.07021+00	2017-09-03 16:43:41.070512+00	\N	/static/old_data/01/image/image317.jpg	45119a03-5981-4be2-9737-d0aadd304f5a	t	0	22	2b21808d-a76a-462e-874f-f8c85ce28d59
153	2017-09-03 16:43:41.075732+00	2017-09-03 16:43:41.075861+00	\N	/static/old_data/01/sound/sound318.mp3	50182a86-ebac-46f0-94d8-68a8af5d6da8	t	3	22	2b21808d-a76a-462e-874f-f8c85ce28d59
154	2017-09-03 16:43:42.440649+00	2017-09-03 16:43:42.440736+00	\N	/static/old_data/01/image/image319.jpg	b7dbb749-b821-4666-90cf-3555bea8f953	t	0	23	92b828c6-2f30-4f89-9a79-10fe1153fc57
155	2017-09-03 16:43:42.455707+00	2017-09-03 16:43:42.455791+00	\N	/static/old_data/01/sound/sound320.mp3	0780a6c9-25f7-4bf0-8448-0b7a0117e165	t	3	23	92b828c6-2f30-4f89-9a79-10fe1153fc57
156	2017-09-03 16:43:44.248528+00	2017-09-03 16:43:44.248694+00	\N	/static/old_data/01/image/image321.jpg	a3d272e8-f170-4542-99de-383a8cf56d30	t	0	23	35ab7320-99f5-4dec-8472-b78847210586
157	2017-09-03 16:43:44.25671+00	2017-09-03 16:43:44.256815+00	\N	/static/old_data/01/sound/sound322.mp3	634c8154-d781-45b2-bbe6-d99a76cf757f	t	3	23	35ab7320-99f5-4dec-8472-b78847210586
158	2017-09-03 16:43:45.441115+00	2017-09-03 16:43:45.44115+00	\N	/static/old_data/01/image/image323.jpg	347f362a-0dee-4222-a80b-e4fbe9ea51bd	t	0	23	7f8ef9d1-83ec-4da5-a301-c0689a1306fb
159	2017-09-03 16:43:45.445585+00	2017-09-03 16:43:45.44563+00	\N	/static/old_data/01/sound/sound324.mp3	c7fc3546-a6ce-4ccd-b97b-9c6d63bb732f	t	3	23	7f8ef9d1-83ec-4da5-a301-c0689a1306fb
160	2017-09-03 16:43:46.697692+00	2017-09-03 16:43:46.698414+00	\N	/static/old_data/01/image/image325.jpg	fc660b4a-b94b-4ba3-9303-e2d1bce196bc	t	0	23	92cc429a-1507-4853-8deb-45ddf1b7f6e0
161	2017-09-03 16:43:46.704935+00	2017-09-03 16:43:46.705028+00	\N	/static/old_data/01/sound/sound326.mp3	3e7e5260-bcd3-4f91-bbf2-a0bc71248545	t	3	23	92cc429a-1507-4853-8deb-45ddf1b7f6e0
162	2017-09-03 16:43:47.880517+00	2017-09-03 16:43:47.880613+00	\N	/static/old_data/01/image/image327.jpg	ec2aaceb-4554-4eca-9ecf-936a5735fe53	t	0	23	5abe7cf8-1fc5-4575-8efe-717a42330ef6
163	2017-09-03 16:43:47.885165+00	2017-09-03 16:43:47.88526+00	\N	/static/old_data/01/sound/sound328.mp3	fd855d93-c9a4-46cd-8c9d-fdf169831ccb	t	3	23	5abe7cf8-1fc5-4575-8efe-717a42330ef6
164	2017-09-03 16:43:49.595707+00	2017-09-03 16:43:49.595873+00	\N	/static/old_data/01/image/image329.jpg	c5cac627-6fc1-4486-a04b-bbd3bcf6308f	t	0	24	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef
165	2017-09-03 16:43:49.603791+00	2017-09-03 16:43:49.603873+00	\N	/static/old_data/01/sound/sound330.mp3	083d4624-197a-4747-a96f-16959429118b	t	3	24	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef
166	2017-09-03 16:43:51.568698+00	2017-09-03 16:43:51.568914+00	\N	/static/old_data/01/image/image331.jpg	89eb78c8-bef5-4c7e-a708-92e82ea843e1	t	0	24	e51069bc-fea6-4e64-a146-49f34227acd4
167	2017-09-03 16:43:51.576383+00	2017-09-03 16:43:51.576491+00	\N	/static/old_data/01/sound/sound332.mp3	218f58af-db6d-4621-85e4-aeb056c42423	t	3	24	e51069bc-fea6-4e64-a146-49f34227acd4
168	2017-09-03 16:43:52.720923+00	2017-09-03 16:43:52.720972+00	\N	/static/old_data/01/image/image333.jpg	b775b739-050f-40a3-9a17-e7eb41522159	t	0	24	53aab39e-eb91-4603-95db-21b654136b02
169	2017-09-03 16:43:52.728536+00	2017-09-03 16:43:52.728645+00	\N	/static/old_data/01/sound/sound334.mp3	51422ed3-0803-438e-a439-4abe51db9470	t	3	24	53aab39e-eb91-4603-95db-21b654136b02
170	2017-09-03 16:43:54.014443+00	2017-09-03 16:43:54.014862+00	\N	/static/old_data/01/image/image337.jpg	05c9157c-1d15-4c26-934d-ba8b9a60e6c1	t	0	18	b30f510d-09c6-48ec-a384-ca50ba5f8576
171	2017-09-03 16:43:54.020375+00	2017-09-03 16:43:54.020459+00	\N	/static/old_data/01/sound/sound338.mp3	e740c72b-329f-4e7b-9669-a3456c1baf48	t	3	18	b30f510d-09c6-48ec-a384-ca50ba5f8576
172	2017-09-03 16:43:55.322444+00	2017-09-03 16:43:55.322529+00	\N	/static/old_data/01/image/image339.jpg	1d237165-719d-4fd4-860d-7fa08db46d67	t	0	23	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d
173	2017-09-03 16:43:55.327219+00	2017-09-03 16:43:55.327303+00	\N	/static/old_data/01/sound/sound340.mp3	ac71c9dd-3c42-484a-ba2b-8ad436936e09	t	3	23	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d
174	2017-09-03 16:43:57.117468+00	2017-09-03 16:43:57.117552+00	\N	/static/old_data/01/image/image341.jpg	8bc9f56b-a904-4c92-accf-4b8ef3e5d914	t	0	23	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765
175	2017-09-03 16:43:57.123291+00	2017-09-03 16:43:57.123371+00	\N	/static/old_data/01/sound/sound342.mp3	8cdf03ce-ddc3-411b-956f-d7dd1fd18e3e	t	3	23	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765
176	2017-09-03 16:43:58.084558+00	2017-09-03 16:43:58.084701+00	\N	/static/old_data/01/image/image343.jpg	8c3e880f-d889-49c9-b015-808a42335f89	t	0	23	d3e8d445-806f-44b4-bb34-213be28414bc
177	2017-09-03 16:43:58.087444+00	2017-09-03 16:43:58.087486+00	\N	/static/old_data/01/sound/sound344.mp3	b7c72925-eefb-48c8-997c-1cbcda2eff7f	t	3	23	d3e8d445-806f-44b4-bb34-213be28414bc
178	2017-09-03 16:43:59.081079+00	2017-09-03 16:43:59.081241+00	\N	/static/old_data/01/image/image345.jpg	d777a6cf-7e6d-41e7-aee8-abfbed371c10	t	0	23	12fcb8be-40d6-4654-831a-68dd54566e3c
179	2017-09-03 16:43:59.088951+00	2017-09-03 16:43:59.089039+00	\N	/static/old_data/01/sound/sound346.mp3	c45213cd-672e-429a-a5b5-f7e9fcbef746	t	3	23	12fcb8be-40d6-4654-831a-68dd54566e3c
180	2017-09-03 16:44:00.412836+00	2017-09-03 16:44:00.412904+00	\N	/static/old_data/01/image/image347.jpg	ad18ee08-b4d5-4fbf-9588-2a8e4c9c4351	t	0	23	693272bb-61c5-4adb-81cc-9d7b7911235e
181	2017-09-03 16:44:00.420277+00	2017-09-03 16:44:00.420392+00	\N	/static/old_data/01/sound/sound348.mp3	af3f2d6f-1136-449e-9760-aa8b59cbf9f0	t	3	23	693272bb-61c5-4adb-81cc-9d7b7911235e
182	2017-09-03 16:44:01.460723+00	2017-09-03 16:44:01.460803+00	\N	/static/old_data/01/image/image349.jpg	f564e3b7-7960-4b6b-ab17-6419b09d2fe3	t	0	23	ca6995f9-b9ef-4717-88ec-7a6846dbe562
183	2017-09-03 16:44:01.466309+00	2017-09-03 16:44:01.46641+00	\N	/static/old_data/01/sound/sound350.mp3	5716ad0f-67f4-42f8-aeae-fe114d0cc268	t	3	23	ca6995f9-b9ef-4717-88ec-7a6846dbe562
184	2017-09-03 16:44:02.674109+00	2017-09-03 16:44:02.674384+00	\N	/static/old_data/01/image/image351.jpg	f4d3bcd2-cf89-497b-b1db-3ada1f435fb3	t	0	23	22ac0fb2-1b7b-4569-b6de-d7115bab36dc
185	2017-09-03 16:44:02.680441+00	2017-09-03 16:44:02.680534+00	\N	/static/old_data/01/sound/sound352.mp3	c8820a6e-e4b6-4a18-9fb0-20edbcc19974	t	3	23	22ac0fb2-1b7b-4569-b6de-d7115bab36dc
186	2017-09-03 16:44:03.98835+00	2017-09-03 16:44:03.988407+00	\N	/static/old_data/01/image/image353.jpg	fc35fbce-5735-45a6-9655-3bd946e925f3	t	0	23	8d964eff-16d6-4602-a7e5-3312da22a4c6
187	2017-09-03 16:44:03.993129+00	2017-09-03 16:44:03.993366+00	\N	/static/old_data/01/sound/sound354.mp3	7562e5b6-be28-4ab6-8225-06d24705edc2	t	3	23	8d964eff-16d6-4602-a7e5-3312da22a4c6
188	2017-09-03 16:44:05.466438+00	2017-09-03 16:44:05.466799+00	\N	/static/old_data/01/image/image355.jpg	a5839561-e2ce-4f11-a23e-bd108bba8a8a	t	0	23	9e36c157-f386-4b9a-825d-a3d125d0f56d
189	2017-09-03 16:44:05.472306+00	2017-09-03 16:44:05.472368+00	\N	/static/old_data/01/sound/sound356.mp3	68aa12a3-afba-49d4-bd15-9b97da6e14de	t	3	23	9e36c157-f386-4b9a-825d-a3d125d0f56d
190	2017-09-03 16:44:06.59449+00	2017-09-03 16:44:06.594592+00	\N	/static/old_data/01/image/image357.jpg	0f816da7-ee58-4abc-9475-5ba161111ec9	t	0	23	0f432223-f9dd-435c-8153-8d1c9b69f0f4
191	2017-09-03 16:44:06.599196+00	2017-09-03 16:44:06.599273+00	\N	/static/old_data/01/sound/sound358.mp3	301db22f-34a5-49c9-85bc-d47938655eb9	t	3	23	0f432223-f9dd-435c-8153-8d1c9b69f0f4
192	2017-09-03 16:44:08.731839+00	2017-09-03 16:44:08.73196+00	\N	/static/old_data/01/image/image359.jpg	d05789dd-d479-4684-b021-ab5ac60779c7	t	0	23	3ee41a2a-1e4d-4776-960b-643ca378f691
193	2017-09-03 16:44:08.737058+00	2017-09-03 16:44:08.737105+00	\N	/static/old_data/01/sound/sound360.mp3	61410d55-7e9c-49ba-a12d-349e4da1012f	t	3	23	3ee41a2a-1e4d-4776-960b-643ca378f691
194	2017-09-03 16:44:11.499519+00	2017-09-03 16:44:11.499685+00	\N	/static/old_data/01/image/image361.jpg	c49202be-9310-4cb4-93eb-0b789a527dc9	t	0	23	a8cc6e96-ebc2-4054-8d88-d49058fc6c26
195	2017-09-03 16:44:11.506614+00	2017-09-03 16:44:11.506709+00	\N	/static/old_data/01/sound/sound362.mp3	78b38a95-cd99-4eeb-aec3-80eb58afde28	t	3	23	a8cc6e96-ebc2-4054-8d88-d49058fc6c26
196	2017-09-03 16:44:12.724653+00	2017-09-03 16:44:12.724745+00	\N	/static/old_data/01/image/image363.jpg	9854647b-f9ca-49ef-86fe-ad2df30fdb5a	t	0	23	29c4885b-ddae-4807-b7d8-a1a9786a74cc
197	2017-09-03 16:44:12.732777+00	2017-09-03 16:44:12.732911+00	\N	/static/old_data/01/sound/sound364.mp3	97e9088c-7386-4817-9736-43d90b5239d4	t	3	23	29c4885b-ddae-4807-b7d8-a1a9786a74cc
198	2017-09-03 16:44:13.750286+00	2017-09-03 16:44:13.750369+00	\N	/static/old_data/01/image/image365.jpg	7bc457d1-278e-44b1-86b4-effb059cc3ed	t	0	23	60cabb20-2f6e-4bc3-9e30-ac786ed3125a
199	2017-09-03 16:44:13.753934+00	2017-09-03 16:44:13.753992+00	\N	/static/old_data/01/sound/sound366.mp3	15babda2-f0c4-4ed7-9785-34179bc6320e	t	3	23	60cabb20-2f6e-4bc3-9e30-ac786ed3125a
200	2017-09-03 16:44:14.799619+00	2017-09-03 16:44:14.79978+00	\N	/static/old_data/01/image/image367.jpg	279f1b0c-3115-4fb3-98bc-d1122b2119a4	t	0	23	dbf5dc2d-a084-4221-a421-b542d364fdf2
201	2017-09-03 16:44:14.8089+00	2017-09-03 16:44:14.808979+00	\N	/static/old_data/01/sound/sound368.mp3	9671bc9e-7c90-415b-874f-0b4e145d9cab	t	3	23	dbf5dc2d-a084-4221-a421-b542d364fdf2
202	2017-09-03 16:44:15.85964+00	2017-09-03 16:44:15.859725+00	\N	/static/old_data/01/image/image369.jpg	6d3f43d2-d5c7-42c0-add0-14c525e58466	t	0	23	3c1043ec-4b9e-4ca5-87ad-fadf34feb510
203	2017-09-03 16:44:15.863635+00	2017-09-03 16:44:15.863686+00	\N	/static/old_data/01/sound/sound370.mp3	bb7d99ad-0006-43ed-9dd5-7a7d003ba2b7	t	3	23	3c1043ec-4b9e-4ca5-87ad-fadf34feb510
204	2017-09-03 16:44:17.063437+00	2017-09-03 16:44:17.063497+00	\N	/static/old_data/01/image/image371.jpg	09f79305-d25e-4198-848a-1e9d0af8ab20	t	0	23	36112713-3f86-4839-81dd-995b059b7a90
205	2017-09-03 16:44:17.068473+00	2017-09-03 16:44:17.06856+00	\N	/static/old_data/01/sound/sound372.mp3	30b509ca-4391-4515-a468-bfac6d6b1787	t	3	23	36112713-3f86-4839-81dd-995b059b7a90
206	2017-09-03 16:44:18.863346+00	2017-09-03 16:44:18.863409+00	\N	/static/old_data/01/image/image373.jpg	1d2cc6bc-4743-4974-8a86-5c0c2454a2fe	t	0	23	0cd2b060-8090-497a-b4bc-108d85f2e6e7
207	2017-09-03 16:44:18.868888+00	2017-09-03 16:44:18.868951+00	\N	/static/old_data/01/sound/sound374.mp3	4f7ebd7e-4405-46a7-bba0-ac9d774f14d6	t	3	23	0cd2b060-8090-497a-b4bc-108d85f2e6e7
208	2017-09-03 16:44:19.787328+00	2017-09-03 16:44:19.787496+00	\N	/static/old_data/01/image/image375.jpg	b29ae9ef-5c3e-4658-b9e4-28836aabdb43	t	0	23	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263
209	2017-09-03 16:44:19.799926+00	2017-09-03 16:44:19.800309+00	\N	/static/old_data/01/sound/sound376.mp3	9b195633-b76b-4fb6-aac3-119ae95acf6f	t	3	23	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263
210	2017-09-03 16:44:21.355668+00	2017-09-03 16:44:21.355718+00	\N	/static/old_data/01/image/image377.jpg	7b95edfb-aa84-4ba1-9300-1d95db0d8ccf	t	0	23	6e83daff-cbfa-4073-aef9-139c4f50e21b
211	2017-09-03 16:44:21.358171+00	2017-09-03 16:44:21.358303+00	\N	/static/old_data/01/sound/sound378.mp3	1a07824f-cc37-4798-a8d2-0aee6baa52c5	t	3	23	6e83daff-cbfa-4073-aef9-139c4f50e21b
212	2017-09-03 16:44:22.510745+00	2017-09-03 16:44:22.510879+00	\N	/static/old_data/01/image/image379.jpg	22073f4f-93c0-4af3-864d-f60ac6b8e699	t	0	23	55ac60cb-3157-4787-a832-e43731155d0d
213	2017-09-03 16:44:22.521592+00	2017-09-03 16:44:22.521673+00	\N	/static/old_data/01/sound/sound380.mp3	fa1251e0-a88e-4b1d-ba66-4ba48a3b7359	t	3	23	55ac60cb-3157-4787-a832-e43731155d0d
214	2017-09-03 16:44:23.689259+00	2017-09-03 16:44:23.689339+00	\N	/static/old_data/01/image/image381.jpg	cd7f0679-738c-4c20-b001-a581b775e979	t	0	23	a1e40298-a772-4a39-b162-748b63f69a45
215	2017-09-03 16:44:23.695058+00	2017-09-03 16:44:23.695121+00	\N	/static/old_data/01/sound/sound382.mp3	fb0f4172-ce2d-426a-aaf1-8a0428462c85	t	3	23	a1e40298-a772-4a39-b162-748b63f69a45
216	2017-09-03 16:44:24.748702+00	2017-09-03 16:44:24.748793+00	\N	/static/old_data/01/image/image383.jpg	da97a78a-7963-4a6f-b3e7-3a11747a073c	t	0	23	96b0bb7a-af32-45e5-9db2-30caad5823bd
217	2017-09-03 16:44:24.755082+00	2017-09-03 16:44:24.755555+00	\N	/static/old_data/01/sound/sound384.mp3	46a000aa-5127-4e7b-9822-8c87053cee19	t	3	23	96b0bb7a-af32-45e5-9db2-30caad5823bd
218	2017-09-03 16:44:25.885958+00	2017-09-03 16:44:25.886094+00	\N	/static/old_data/01/image/image387.jpg	96d0a4d6-9c6d-46c5-aa4a-7305352ea4fa	t	0	23	c2a9d68b-e28e-4f73-bbe8-067459fb4919
219	2017-09-03 16:44:25.892185+00	2017-09-03 16:44:25.892274+00	\N	/static/old_data/01/sound/sound388.mp3	19d24ab4-e801-45b8-abbb-c902e82a5322	t	3	23	c2a9d68b-e28e-4f73-bbe8-067459fb4919
220	2017-09-03 16:44:26.961221+00	2017-09-03 16:44:26.961344+00	\N	/static/old_data/01/image/image389.jpg	98a181dc-d528-43cf-813c-d0110856e04b	t	0	23	dd045e20-ee07-4996-b2cd-5438231d2bc1
221	2017-09-03 16:44:26.973909+00	2017-09-03 16:44:26.973998+00	\N	/static/old_data/01/sound/sound390.mp3	783de8ec-2e25-4c3b-96a7-484ece5193c5	t	3	23	dd045e20-ee07-4996-b2cd-5438231d2bc1
222	2017-09-03 16:44:27.978989+00	2017-09-03 16:44:27.979075+00	\N	/static/old_data/01/image/image397.jpg	55bc487e-b32e-4fa3-93cf-59a355abe759	t	0	23	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac
223	2017-09-03 16:44:27.984012+00	2017-09-03 16:44:27.984129+00	\N	/static/old_data/01/sound/sound398.mp3	d936c661-49f6-4d49-914a-14d9b81e6f16	t	3	23	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac
224	2017-09-03 16:44:28.930944+00	2017-09-03 16:44:28.931103+00	\N	/static/old_data/01/image/image401.jpg	af55e157-6207-4e8c-825d-57f1047c959f	t	0	23	7708286b-1f1a-4793-8c87-bb7e977bb67a
225	2017-09-03 16:44:28.942358+00	2017-09-03 16:44:28.9425+00	\N	/static/old_data/01/sound/sound402.mp3	ea68bbfd-4459-4a5f-8bfa-be5ec3d8c001	t	3	23	7708286b-1f1a-4793-8c87-bb7e977bb67a
226	2017-09-03 16:44:30.097717+00	2017-09-03 16:44:30.097785+00	\N	/static/old_data/01/image/image404.jpg	07d18dae-5f35-4467-8cbb-139cb1974e49	t	0	23	9adf4924-7b39-4175-b55a-5bc5266ba171
227	2017-09-03 16:44:30.102554+00	2017-09-03 16:44:30.102863+00	\N	/static/old_data/01/sound/sound405.mp3	cdbedfa0-478d-4282-8b66-96e77c3f73be	t	3	23	9adf4924-7b39-4175-b55a-5bc5266ba171
228	2017-09-03 16:44:31.214037+00	2017-09-03 16:44:31.214119+00	\N	/static/old_data/01/image/image406.jpg	af9a2de8-b1e1-4e92-81d5-5348fe033c25	t	0	23	db40befc-e679-4bfa-a3c2-deaaa0f62038
229	2017-09-03 16:44:31.224437+00	2017-09-03 16:44:31.224535+00	\N	/static/old_data/01/sound/sound408.mp3	082d8735-2d37-4359-b241-af7be526323d	t	3	23	db40befc-e679-4bfa-a3c2-deaaa0f62038
230	2017-09-03 16:44:32.363979+00	2017-09-03 16:44:32.364061+00	\N	/static/old_data/01/image/image413.jpg	a2026d86-6f04-433c-8945-48f781cfeee8	t	0	23	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e
231	2017-09-03 16:44:32.376161+00	2017-09-03 16:44:32.376216+00	\N	/static/old_data/01/sound/sound414.mp3	272b4e44-0ec5-48d3-ae53-c46c543bf726	t	3	23	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e
232	2017-09-03 16:44:33.815223+00	2017-09-03 16:44:33.815279+00	\N	/static/old_data/01/image/image417.jpg	90ef532f-c774-4ce8-9d1a-e657c97305bb	t	0	23	3b256490-dc0a-4d67-bd83-d6de71a21b13
233	2017-09-03 16:44:33.819301+00	2017-09-03 16:44:33.819351+00	\N	/static/old_data/01/sound/sound419.mp3	27c3fa2f-13f1-4eee-b447-95e8f0e45cc6	t	3	23	3b256490-dc0a-4d67-bd83-d6de71a21b13
234	2017-09-03 16:44:34.863285+00	2017-09-03 16:44:34.863423+00	\N	/static/old_data/01/image/image422.jpg	9ff4616b-e972-49a5-890b-4dc72115a216	t	0	23	b6513d46-435a-4c10-8f5d-3aa09f8345a3
235	2017-09-03 16:44:34.868558+00	2017-09-03 16:44:34.86862+00	\N	/static/old_data/01/sound/sound423.mp3	c843d708-0d64-480c-a468-17479d05df6d	t	3	23	b6513d46-435a-4c10-8f5d-3aa09f8345a3
236	2017-09-03 16:44:35.937028+00	2017-09-03 16:44:35.93712+00	\N	/static/old_data/01/image/image427.jpg	ece29475-28a9-4390-9105-9fbc40f92808	t	0	23	73e2cd15-a248-42ec-a30b-b95193517ebd
237	2017-09-03 16:44:35.940494+00	2017-09-03 16:44:35.940554+00	\N	/static/old_data/01/sound/sound428.mp3	8cfbc6c4-6d1e-4f9f-9998-79511811d621	t	3	23	73e2cd15-a248-42ec-a30b-b95193517ebd
238	2017-09-03 16:44:37.832161+00	2017-09-03 16:44:37.832242+00	\N	/static/old_data/01/image/image434.jpg	19a21349-9543-4f90-a5ff-68b754ce4d71	t	0	23	ebd74927-47f7-407e-8a08-ba79086c7964
239	2017-09-03 16:44:37.837259+00	2017-09-03 16:44:37.837341+00	\N	/static/old_data/01/sound/sound435.mp3	5d94099e-24cd-4e10-bc3f-648687702093	t	3	23	ebd74927-47f7-407e-8a08-ba79086c7964
240	2017-09-03 16:44:39.20385+00	2017-09-03 16:44:39.203897+00	\N	/static/old_data/01/image/image541.jpg	f2ee273c-1641-471d-8219-f845a0cf365b	t	0	23	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c
241	2017-09-03 16:44:39.211665+00	2017-09-03 16:44:39.211723+00	\N	/static/old_data/01/sound/sound542.mp3	68d275e6-fbd7-4d14-a87a-2f5d517566e2	t	3	23	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c
242	2017-09-03 16:44:41.433775+00	2017-09-03 16:44:41.433853+00	\N	/static/old_data/01/image/image2691.jpg	fd42be54-adf4-4de4-b923-39ac86ea0c73	t	0	23	2c5bbc47-20e1-458a-9bb6-849000e29461
243	2017-09-03 16:44:41.440889+00	2017-09-03 16:44:41.440962+00	\N	/static/old_data/01/sound/sound2692.mp3	13006636-c6d1-4fce-9e59-624fce510edf	t	3	23	2c5bbc47-20e1-458a-9bb6-849000e29461
244	2017-09-03 16:44:43.59724+00	2017-09-03 16:44:43.597389+00	\N	/static/old_data/01/image/image2698.jpg	a99e22b2-18f4-496a-aaa5-619b1bb81c7c	t	0	18	c88fd697-a3bd-4579-89eb-bae3732b6b94
245	2017-09-03 16:44:43.611336+00	2017-09-03 16:44:43.61142+00	\N	/static/old_data/01/sound/sound2699.mp3	6ae2e028-4cda-4e72-8a82-1eaa774d6aaa	t	3	18	c88fd697-a3bd-4579-89eb-bae3732b6b94
246	2017-09-03 16:44:44.568665+00	2017-09-03 16:44:44.56883+00	\N	/static/old_data/01/image/image2833.jpg	dd986ca3-adb3-45fb-ad9e-c83829ad797d	t	0	23	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e
247	2017-09-03 16:44:44.572344+00	2017-09-03 16:44:44.572384+00	\N	/static/old_data/01/sound/sound2835.mp3	7e7e194b-c033-4056-b3a1-4ea8a6436723	t	3	23	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e
248	2017-09-03 16:44:46.208459+00	2017-09-03 16:44:46.208525+00	\N	/static/old_data/01/image/image2870.jpg	9db1b740-eba1-4731-b498-8fbc4aa1cfaa	t	0	23	d8d39c19-defb-485d-9385-f3640947205e
249	2017-09-03 16:44:46.212636+00	2017-09-03 16:44:46.212705+00	\N	/static/old_data/01/sound/sound2872.mp3	3f754dde-8e8e-44cf-aa19-3deb90306942	t	3	23	d8d39c19-defb-485d-9385-f3640947205e
250	2017-09-03 16:44:47.389726+00	2017-09-03 16:44:47.389812+00	\N	/static/old_data/01/image/image2918.jpg	74c6875a-2779-48e0-9093-6f6113728cf6	t	0	23	ddb95280-1666-4ef3-a832-3815dc09eca2
251	2017-09-03 16:44:47.404934+00	2017-09-03 16:44:47.405028+00	\N	/static/old_data/01/sound/sound2919.mp3	13522ae6-a63e-43b7-b2b8-dbeb3127814a	t	3	23	ddb95280-1666-4ef3-a832-3815dc09eca2
252	2017-09-03 16:44:50.753224+00	2017-09-03 16:44:50.75326+00	\N	/static/old_data/01/image/image2955.jpg	54f666dc-9759-4da7-8603-43dd712662d5	t	0	23	7498fa9d-0ca0-4f73-b56e-b04161c56f62
253	2017-09-03 16:44:50.755721+00	2017-09-03 16:44:50.755758+00	\N	/static/old_data/01/sound/sound2956.mp3	60c63d5d-12e6-46ba-82c1-123576b9f008	t	3	23	7498fa9d-0ca0-4f73-b56e-b04161c56f62
254	2017-09-03 16:44:54.6804+00	2017-09-03 16:44:54.680481+00	\N	/static/old_data/01/image/image2990.jpg	b87f89a9-0ea6-4a2b-9060-3e227190a8a4	t	0	23	d3268f98-f84d-44f4-801e-a025d0e75386
255	2017-09-03 16:44:54.685682+00	2017-09-03 16:44:54.686399+00	\N	/static/old_data/01/sound/sound2991.mp3	e931fe4b-863c-4e0d-8ad1-c532ded53c1d	t	3	23	d3268f98-f84d-44f4-801e-a025d0e75386
256	2017-09-03 16:44:58.402591+00	2017-09-03 16:44:58.402697+00	\N	/static/old_data/01/image/image3193.jpg	35cad542-041c-42d7-abdb-8c5fd5898773	t	0	23	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a
257	2017-09-03 16:44:58.406606+00	2017-09-03 16:44:58.407728+00	\N	/static/old_data/01/sound/sound3194.mp3	8ab72fc2-4704-409c-915d-357bc6059e84	t	3	23	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a
258	2017-09-03 16:45:02.210817+00	2017-09-03 16:45:02.210854+00	\N	/static/old_data/01/image/image7174.jpg	f5655079-3171-46ab-8248-ee010f44924d	t	0	24	b5f595f8-037a-452d-88a5-3d8f809ba762
259	2017-09-03 16:45:02.21325+00	2017-09-03 16:45:02.213287+00	\N	/static/old_data/01/sound/sound7175.mp3	4a837fe9-bd9b-486c-91e4-425ee35a6f64	t	3	24	b5f595f8-037a-452d-88a5-3d8f809ba762
260	2017-09-03 16:45:05.955369+00	2017-09-03 16:45:05.955405+00	\N	/static/old_data/01/image/image7176.jpg	c71b6c24-7e30-433c-988a-1e1c2e57d033	t	0	3	afe7877b-9e15-46c5-8b38-7650289af7ab
261	2017-09-03 16:45:05.957595+00	2017-09-03 16:45:05.957634+00	\N	/static/old_data/01/sound/sound7177.mp3	0becf2d6-205d-4d24-8c9d-8a601b05964c	t	3	3	afe7877b-9e15-46c5-8b38-7650289af7ab
\.


--
-- Name: core_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_attachment_id_seq', 261, true);


--
-- Data for Name: core_channel; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_channel (id, created_at, deleted_at, name, updated_at, about, "uniqueID", slug, image, "isActive", "defaultZoom", "mapCenterLocation", "maxZoom") FROM stdin;
1	2017-09-03 16:41:49.548173+00	\N	Proyecto Pance	2017-10-06 17:58:06.909309+00	Observatorio socio-ambiental de Pance.	7deb26cd-11e0-4127-9c78-310ea62917b2	proyecto-pance	static/img/img.jpg	t	13	0101000020E6100000C68D342B982553C0FD438388D7BA0A40	18
2	2017-11-30 14:53:13.661737+00	\N	Proyecto Serrin	2017-12-05 22:06:03.471883+00	Proyecto sobre Serrin.	04c48e33-d136-4c27-ad63-fc2cf7bdba6f	proyecto-serrin	static/img/back_jvOX7jh.jpg	t	13	0101000020E61000004FA3F4FFEB0053C0FD68BA3E52E71040	18
\.


--
-- Data for Name: core_channel_dimensions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_channel_dimensions (id, channel_id, dimension_id) FROM stdin;
\.


--
-- Name: core_channel_dimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_channel_dimensions_id_seq', 1, false);


--
-- Name: core_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_channel_id_seq', 34, true);


--
-- Name: core_channelsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_channelsettings_id_seq', 1, false);


--
-- Data for Name: core_channeltype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_channeltype (id) FROM stdin;
\.


--
-- Data for Name: core_dimension; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_dimension (id, name, slug, "uniqueID") FROM stdin;
\.


--
-- Name: core_dimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_dimensions_id_seq', 1, false);


--
-- Data for Name: core_membership; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_membership (id, created_at, updated_at, deleted_at, channel_id, user_id) FROM stdin;
\.


--
-- Name: core_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_membership_id_seq', 1, false);


--
-- Data for Name: core_message; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_message (created_at, updated_at, deleted_at, "uniqueID", "isCheck", body, author_id, channel_id, record_id) FROM stdin;
\.


--
-- Data for Name: core_profile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_profile (id, birth_date, user_id) FROM stdin;
1	\N	3
2	\N	4
3	\N	5
4	\N	6
5	\N	7
6	\N	8
7	\N	9
8	\N	10
9	\N	11
10	\N	12
11	\N	13
12	\N	14
13	\N	15
14	\N	16
15	\N	17
16	\N	18
17	\N	19
18	\N	20
19	\N	21
20	\N	22
21	\N	23
22	\N	24
2980	\N	27
23	\N	1
2829	\N	26
347	\N	25
\.


--
-- Name: core_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_profile_id_seq', 2980, true);


--
-- Data for Name: core_record; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_record (created_at, updated_at, deleted_at, "uniqueID", location, country, description, author_id, channel_id, city, region, address, neighborhood, postal_code, "isActive") FROM stdin;
2015-09-07 13:24:13+00	2017-10-20 14:28:54.789552+00	\N	28ac800f-8947-467a-ba94-9cb7059a7f5c	0101000020E61000008FE720D59D2753C08F009CF1909C0A40	Colombia	Limpieza de rìo Pance junto con fundaciòn de rehabilitaciòn.	3	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-07-07 14:53:17+00	2017-10-20 14:30:19.184741+00	\N	5de6531a-f00a-4f61-bb6d-06f95301e956	0101000020E610000049345B8C942553C0DC3F62CE46C10A40	Colombia	Espacio de formaciòn sobre mantenimiento ambiental del rìo Pance.	4	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-07-07 15:08:38+00	2017-10-20 14:31:39.776034+00	\N	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	0101000020E610000063C4186B922553C0DFA18F0C4CC10A40	Colombia	Espacio de explicaciòn manejo medioambiental Pance, a cargo de Javier Aguirre.	4	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-13 18:02:19+00	2017-10-20 14:34:05.385825+00	\N	0298545a-b981-49d0-a3a1-87f9282369d3	0101000020E6100000DB334B02D42553C0E371CC9F5CC00A40	Colombia	Imagen fuentes hidricas de la zona.	5	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-13 18:03:25+00	2017-10-20 14:36:49.503244+00	\N	e9993153-88fc-4b6d-8f98-82f1179a6f48	0101000020E610000073543541D42553C00E47ACC5A7C00A40	Colombia	Sobre la informaciòn mostrada en la plataforma web.	5	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine		760008	t
2015-08-11 14:43:42+00	2017-09-03 16:41:58.74517+00	\N	be855c1b-e359-4c6e-a658-bce6d38f6f2e	0101000020E61000005DC47762D62553C0A86A82A8FBC00A40	Colombia		7	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-11 15:08:10+00	2017-09-03 16:41:59.941969+00	\N	03b9d474-8fb3-41f3-9de6-f1bdbd291fb0	0101000020E61000006A8CD651D52553C04B6E2724ACC00A40	Colombia		7	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-11 16:27:38+00	2017-09-03 16:42:01.406436+00	\N	e68da43a-5818-42e3-8d15-1a0ab32d6f7f	0101000020E61000005BAE9137D32553C0CF344E3089C00A40	Colombia		7	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-07-30 10:53:46+00	2017-10-20 14:37:59.049923+00	\N	27bbd7c8-446b-45ad-b021-9c1f623aab3f	0101000020E61000000000001FD52553C0CC26CF7C76C00A40	Colombia	Taller sobre manejo medioambiental del rìo Pance.	5	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-07-30 10:55:26+00	2017-10-20 14:38:56.988175+00	\N	c0470d33-114c-4dc6-859b-ff24fa01b318	0101000020E6100000FFFF3F2AD52553C0E9BBDF776FC00A40	Colombia	Taller manejo medioambiental Pance.	5	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-30 06:26:32+00	2017-10-20 14:51:51.328675+00	\N	ab0a53aa-f634-434e-b686-538bd95e54a3	0101000020E6100000F46D9BBCDB2553C065AA09A2EEC30A40	Colombia	Problemática con turistas que desde las 5 de la mañana se encuentran haciendo ruido excesivo.  Todo con aval de la policía de parques naturales, pero todos parecen inconscientes sobre la demanda por ruido que tiene  el corregimiento.	6	1	Cali	Valle del Cauca	Chorro de Plata 		760008	t
2015-08-20 10:23:40+00	2017-10-05 20:15:55.306422+00	\N	8089ca6f-7452-4f83-a8b3-9eccaf2474fc	0101000020E61000003D86B4B3D52553C03C345B8C94C00A40	Colombia		9	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 10:19:42+00	2017-10-05 20:17:46.841362+00	\N	d91c88de-c77b-485c-b290-aa72dc659a11	0101000020E6100000BED6B811292653C06D49809A5AB60A40	Colombia		10	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 10:29:04+00	2017-10-05 20:18:46.867807+00	\N	88e07d66-17dd-43c8-a9ff-579ab19a294e	0101000020E6100000652127394D2653C0537CAB88ADB30A40	Colombia		10	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-08-23 12:13:26+00	2017-10-05 20:22:34.622186+00	\N	24fe3865-7b55-48ea-b3c9-f3802d5ad091	0101000020E6100000CBCB878D9F2853C0D94A9B97B0A30A40	Colombia	El turismo provoca un nivel de ruido muy alto en el sector.	11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 09:14:18+00	2017-10-05 20:18:33.875954+00	\N	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277	0101000020E610000024AAB706B62553C006E216063FC40A40	Colombia		10	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 09:50:50+00	2017-10-05 20:18:19.845729+00	\N	c169868d-8028-48ab-ac04-75d3ff1e6949	0101000020E6100000C996D220F22553C03643E21E4BBF0A40	Colombia		10	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 09:36:50+00	2017-10-05 20:18:56.983278+00	\N	0c770d71-3206-48f5-9857-8c09ee003fe6	0101000020E61000005B4DB17DDB2553C029DF0D7C1FC10A40	Colombia		10	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 11:34:18+00	2017-10-05 20:23:49.319385+00	\N	791125da-a318-4bd3-b801-14b6b1d9d159	0101000020E610000085AC6EF59C2853C0CC6E1AC8A0A00A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 12:27:26+00	2017-10-05 20:24:28.371687+00	\N	6ecf91d2-cca2-4ae1-8615-122cf97fada1	0101000020E61000002E0C7E08972853C0148733BF9AA30A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 11:50:13+00	2017-10-05 20:03:27.211506+00	\N	293efedf-ad76-455a-83c1-615ab95c493f	0101000020E61000005E3E6CFC9C2853C0640B0742B2A00A40	Colombia		12	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 11:37:12+00	2017-10-05 20:02:47.503044+00	\N	e07dca59-a780-4100-be3c-d4ad85b1ecea	0101000020E6100000BCED42739D2853C054AABF4B96A00A40	Colombia		12	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 11:30:51+00	2017-10-05 20:23:14.639763+00	\N	1fde81af-408e-4b16-8100-70d5f5c37d23	0101000020E6100000D2FBC6D79E2853C0CB7CE03D1AA10A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 12:28:50+00	2017-10-05 20:25:08.247316+00	\N	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8	0101000020E610000012FA86AF9C2853C031ADC8D5B5A30A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 13:03:16+00	2017-10-05 20:26:11.293771+00	\N	5195e1c4-ec73-44c4-8e89-068dbd147959	0101000020E61000009D432C75A32853C0D80596362FA10A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 12:52:06+00	2017-10-05 20:32:40.804236+00	\N	16cb85f9-111e-416f-80ce-f454c94fc843	0101000020E610000043A33B889D2853C0345658830AA10A40	Colombia		13	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-09-26 16:29:02+00	2017-10-05 20:33:29.551279+00	\N	c7f0698d-6f00-4626-9ed2-76eebe405c7d	0101000020E61000009ECDAACFD52553C069ABA5937FC00A40	Colombia		16	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-23 12:50:52+00	2017-10-05 20:32:30.422981+00	\N	cb0a1479-b7f9-42b5-a020-545f8482d4ec	0101000020E6100000A4EA31A49D2853C03692F0AAF4A00A40	Colombia		13	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 13:46:58+00	2017-10-05 20:26:54.52888+00	\N	897a09ed-756f-40b1-9da7-1ea63bc33933	0101000020E610000003299EA03A2953C0050EA14ACD9E0A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 13:55:53+00	2017-10-05 20:28:04.074342+00	\N	5fae39a1-18d0-4759-a0ef-66347c2ffa6b	0101000020E6100000518EDCAD3F2953C09D10607E949E0A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 13:56:31+00	2017-10-05 20:29:23.254505+00	\N	d5d6ff8d-77f5-4c91-a0aa-55437de883d9	0101000020E610000083379186402953C0F75E563B9D9E0A40	Colombia		11	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-23 14:49:56+00	2017-10-05 20:30:06.161717+00	\N	ebb297fd-898b-4649-b082-3eea6bb825a5	0101000020E61000007C697735662853C06868F0E4C0980A40	Colombia		11	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-08-23 15:03:12+00	2017-10-05 20:30:45.405101+00	\N	51890721-49e9-48b4-80ad-343f69140618	0101000020E6100000A13D7113C82653C082F8D2EE6AAC0A40	Colombia		11	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-08-23 12:54:50+00	2017-10-05 20:32:15.100909+00	\N	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7	0101000020E610000035D069039D2853C060573ECBF3A00A40	Colombia		13	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-08-20 10:15:49+00	2017-10-05 20:14:54.700212+00	\N	0f826755-fd72-4bcf-9dcc-fde6c75fba40	0101000020E61000004CDBBFB2D22553C088BD03299EC00A40	Colombia		8	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-11-19 11:16:16+00	2017-10-05 20:34:59.544961+00	\N	c489ef6d-a7f9-4ece-94a1-e8c89cea352f	0101000020E610000071E46EFDE12653C0EAD6A3703DAA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-09-26 16:28:24+00	2017-10-05 20:33:48.56412+00	\N	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44	0101000020E6100000E9061D87D42553C0E4E7305F5EC00A40	Colombia		16	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-11-19 10:42:58+00	2017-10-05 20:36:07.107836+00	\N	3b376d06-4a28-4ba2-8635-befda27568f5	0101000020E61000008D7F9F71E12653C026D96F0010AA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-11-19 10:39:00+00	2017-10-05 20:35:58.957817+00	\N	7f73586e-b532-4781-b28e-eb5f043c8542	0101000020E610000069A9BC1DE12653C0E824A78951AA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-08-23 11:38:40+00	2017-10-05 20:02:19.038712+00	\N	fef9da49-c03f-41d4-86ff-bf13d46c1689	0101000020E6100000BCED42739D2853C054AABF4B96A00A40	Colombia		12	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 15:24:28+00	2017-10-05 21:36:01.336273+00	\N	e51069bc-fea6-4e64-a146-49f34227acd4	0101000020E6100000BE77C1CDCF2153C05BDE12934A4B0A40	Colombia	Problemática de la contaminación del río Jamundi.	24	1	Cali	Valle del Cauca	Santander de Quilichao - Cali 		760030	t
2016-03-19 15:10:16+00	2017-10-05 21:36:11.613705+00	\N	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef	0101000020E61000003894B4F5E62153C0175E5B52C8680A40	Colombia		24	1	Cali	Valle del Cauca	Carrera 168 25146-25300	Cali	760030	t
2015-11-19 11:19:16+00	2017-10-05 20:35:22.415024+00	\N	8f5c53b2-fcb3-48b0-add5-046460f5fbb8	0101000020E6100000C1C073EFE12653C0E99A0B4953AA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 15:25:12+00	2017-10-05 21:36:31.753082+00	\N	53aab39e-eb91-4603-95db-21b654136b02	0101000020E6100000BE77C1CDCF2153C05BDE12934A4B0A40	Colombia		24	1	Cali	Valle del Cauca	Santander de Quilichao - Cali 		760030	t
2016-03-11 15:40:47+00	2017-10-05 20:37:16.12858+00	\N	f6f80395-759c-4d79-8c4c-9e7754b83de6	0101000020E6100000089F73D8792253C012DA9B8CE83E0B40	Colombia		18	1	Cali	Valle del Cauca	Calle 11a 562-56106	Cali	760033	t
2016-03-19 07:06:27+00	2017-10-05 21:39:18.95911+00	\N	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d	0101000020E61000007C02CD8CA32853C05791734972A40A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-14 10:02:35+00	2017-10-05 20:37:27.55371+00	\N	b30f510d-09c6-48ec-a384-ca50ba5f8576	0101000020E610000073942820522253C09A991C88769F0B40	Colombia		18	1	Cali	Valle del Cauca	Avenida 1 Norte 7 Norte1-7 Norte123	Cali	760045	t
2016-03-19 07:09:22+00	2017-10-05 21:40:36.843166+00	\N	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765	0101000020E6100000EAF57A39A42853C06372CC267EA40A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 06:47:33+00	2017-10-05 20:38:37.057345+00	\N	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2	0101000020E61000004E031914E02753C0637A884677900A40	Colombia		21	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 07:13:08+00	2017-10-05 21:41:44.734883+00	\N	d3e8d445-806f-44b4-bb34-213be28414bc	0101000020E6100000D76474DDA72853C06AE0CE4BE6A40A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:30:28+00	2017-10-05 20:42:13.302982+00	\N	0642a23d-912c-432d-bf24-91d5b303f7ab	0101000020E6100000AFD3484BE52853C05BA360B349AB0A40	Colombia	Tubería rota en el sector de la Castellana.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:20:08+00	2017-10-05 21:44:13.070102+00	\N	12fcb8be-40d6-4654-831a-68dd54566e3c	0101000020E61000001B301F7BC32853C0609002B817A80A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 07:33:54+00	2017-10-05 20:58:10.441899+00	\N	1caaaec8-bd13-46a0-8f90-7d018117238d	0101000020E6100000EB56CF49EF2853C07347BC4F68AC0A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 11:48:32+00	2017-10-05 22:43:34.826848+00	\N	92b828c6-2f30-4f89-9a79-10fe1153fc57	0101000020E610000061E8FED7A62653C02A11BA5EAD8D0A40	Colombia		23	1	Cali	Valle del Cauca	Pico de Aguila 		760008	t
2016-03-19 07:12:08+00	2017-10-05 20:44:24.856172+00	\N	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42	0101000020E610000049DA7A73A52853C075183E22A6A40A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 12:20:14+00	2017-10-05 22:43:49.045285+00	\N	35ab7320-99f5-4dec-8472-b78847210586	0101000020E6100000D84FEC8EB22553C068C601E130BE0A40	Colombia		23	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2016-03-19 07:19:51+00	2017-10-05 20:43:39.041043+00	\N	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a	0101000020E610000006944DB9C22853C09D52541016A80A40	Colombia		22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 12:22:10+00	2017-10-05 22:44:34.861749+00	\N	7f8ef9d1-83ec-4da5-a301-c0689a1306fb	0101000020E61000002E464AA0AE2553C012BA83D899C20A40	Colombia		23	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2016-03-19 07:24:41+00	2017-10-05 20:43:08.310774+00	\N	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4	0101000020E6100000E97270D6CD2853C096F4E31C62A90A40	Colombia		22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 14:37:29+00	2017-10-05 22:44:49.292202+00	\N	92cc429a-1507-4853-8deb-45ddf1b7f6e0	0101000020E61000009F4988DF3A2353C0AC005AE018AF0A40	Colombia		23	1	Cali	Valle del Cauca	Carrera 125 		760008	t
2016-03-19 07:41:08+00	2017-10-05 21:00:42.732347+00	\N	55e235eb-7738-4f23-b802-056b0cc27ab0	0101000020E610000029B66FDBE42853C0A8420C6122AB0A40	Colombia	Sobre el alcantarillado y consumo de aguas del sector de la Castellana.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 14:38:43+00	2017-10-05 22:45:02.48565+00	\N	5abe7cf8-1fc5-4575-8efe-717a42330ef6	0101000020E6100000AF3DB324402353C08F3A267830AF0A40	Colombia		23	1	Cali	Valle del Cauca	Carrera 125 		760008	t
2016-03-19 08:05:34+00	2017-10-05 21:05:09.590328+00	\N	d117527f-c4a8-4ec3-b151-7d2c287413f6	0101000020E6100000831FC2E59E2853C07C4AA8F3BBA30A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:09:14+00	2017-10-05 21:06:37.481183+00	\N	2aaf4790-0265-48fe-b7f3-f162281c6e22	0101000020E61000002DA02AB99D2853C0237216F6B4A30A40	Colombia	Sobre el turismo en Pance.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:19:02+00	2017-10-05 21:08:23.986256+00	\N	b5d81b74-f199-49b9-ad64-47453c7d5097	0101000020E6100000B0305719A02853C0164F33B755A30A40	Colombia	Ni el gobierno respeta el limite de las construcciones con el río.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:20:56+00	2017-10-05 21:09:25.125815+00	\N	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17	0101000020E610000066F7E461A12853C0A168DB43D5A20A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:23:39+00	2017-10-05 21:10:16.32589+00	\N	3a1e07d5-b54c-4196-8fd4-5572ad20f975	0101000020E610000010784D35A02853C0B625C79DD2A10A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:26:28+00	2017-10-05 21:10:53.637371+00	\N	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd	0101000020E61000009CBAF2599E2853C04FB4EDA16AA10A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:28:03+00	2017-10-05 21:11:41.90188+00	\N	21badbe7-7f70-4f5a-99e6-91a8f4c31c38	0101000020E6100000C8C014F89D2853C051F085C954A10A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:32:07+00	2017-10-05 21:13:21.163573+00	\N	891c8841-8e6d-4167-8c99-e4b1358ae45b	0101000020E6100000CFDA6D179A2853C0E95817B7D1A00A40	Colombia	Sobre la terminal de transporte.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:35:29+00	2017-10-05 21:17:22.026479+00	\N	808368b1-3295-48b5-8449-3f60c7a0322f	0101000020E610000022C65893942853C093841DD96FA00A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:43:30+00	2017-10-05 21:17:59.960354+00	\N	8cb3e148-af5e-419a-b3e7-d8ec93c6964c	0101000020E61000009766CDA28A2853C0B12688BA0FA00A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:51:48+00	2017-10-05 21:18:40.444821+00	\N	05877abf-72f5-463b-8546-feada547b3b6	0101000020E6100000CF29DB9A872853C087773DABDF9F0A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:53:43+00	2017-10-05 21:19:49.856499+00	\N	988615e8-266c-424d-8428-7b07d9c00dfb	0101000020E6100000965B5A0D892853C049631386EE9F0A40	Colombia	Sobre los ciclistas.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:21:44+00	2017-10-05 21:20:26.067215+00	\N	f3622115-2421-4667-a2bf-0621dd9e7868	0101000020E610000026ADE5BB812853C04CA1773DAB9F0A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:25:11+00	2017-10-05 21:23:46.590093+00	\N	6c4403e5-7dad-4436-a241-0f5d826e8f66	0101000020E6100000360D6450802853C02E057E678E9F0A40	Colombia	Problemática de acumulación de basuras debido a que los habitantes del sector las sacan en el momento inadecuado, provocando aparición de perros y mosquitos.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:26:39+00	2017-10-05 21:24:33.754855+00	\N	441bef1f-b57a-44ad-a72b-529c4eca5343	0101000020E6100000A59EF2D57B2853C0924885B185A00A40	Colombia		22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:49:22+00	2017-10-05 21:28:17.911023+00	\N	99070557-0762-4a9c-a532-dbd76092fb92	0101000020E6100000006A6AD95A2853C000C4EBFA059B0A40	Colombia	Sobre la institución educativa en Pance.	22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 10:31:24+00	2017-10-05 21:30:00.378911+00	\N	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b	0101000020E610000074F72673192853C01F417586BC980A40	Colombia	Ptar de tratamiento de aguas en Pance.	22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 10:33:50+00	2017-10-05 21:30:39.506215+00	\N	2b21808d-a76a-462e-874f-f8c85ce28d59	0101000020E6100000C051F2EA1C2853C039C3D32B65990A40	Colombia		22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-11-19 11:36:38+00	2017-10-05 20:38:00.455569+00	\N	5885ec1b-d3a4-4952-971c-04d9946f6cba	0101000020E610000019CDB72BE12653C02639D1AE42AA0A40	Colombia		19	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-11-19 11:21:34+00	2017-10-05 20:34:49.562358+00	\N	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033	0101000020E610000052A6AB4EE12653C0089DD7D825AA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2015-11-19 11:26:45+00	2017-10-05 20:35:48.411631+00	\N	7f81eea4-8229-481c-86af-7b4de9ead9d7	0101000020E610000069A9BC1DE12653C071ECB3DD17AA0A40	Colombia		17	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 07:27:31+00	2017-10-05 21:55:52.057208+00	\N	22ac0fb2-1b7b-4569-b6de-d7115bab36dc	0101000020E6100000A7AE3A7AD52853C04241461F77AA0A40	Colombia	Problemática nuevos asentamientos poblacionales.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:30:49+00	2017-10-05 21:57:06.319559+00	\N	8d964eff-16d6-4602-a7e5-3312da22a4c6	0101000020E6100000A90B800AEA2853C08E4F0F5D92AB0A40	Colombia	Problemática pavimentación de calle.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:38:34+00	2017-10-05 21:58:22.079175+00	\N	9e36c157-f386-4b9a-825d-a3d125d0f56d	0101000020E61000003A269C27E82853C05963FAD299AB0A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:53:12+00	2017-10-05 21:59:24.036112+00	\N	0f432223-f9dd-435c-8153-8d1c9b69f0f4	0101000020E610000007567A12BD2853C08DD30EA05BA70A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:00:24+00	2017-10-05 22:00:29.175668+00	\N	3ee41a2a-1e4d-4776-960b-643ca378f691	0101000020E6100000F58EE8D8A02853C07316EC8EDEA30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:00:24+00	2017-10-05 22:22:20.838094+00	\N	d3268f98-f84d-44f4-801e-a025d0e75386	0101000020E6100000F58EE8D8A02853C07316EC8EDEA30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:02:57+00	2017-10-05 22:24:27.663422+00	\N	29c4885b-ddae-4807-b7d8-a1a9786a74cc	0101000020E6100000CDB6E402A12853C01FD003E5D7A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:06:06+00	2017-10-05 22:25:22.756969+00	\N	60cabb20-2f6e-4bc3-9e30-ac786ed3125a	0101000020E61000002BA0504F9F2853C037EA4207B8A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:07:06+00	2017-10-05 22:25:53.690782+00	\N	dbf5dc2d-a084-4221-a421-b542d364fdf2	0101000020E61000002BA0504F9F2853C037EA4207B8A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:08:11+00	2017-10-05 22:26:22.684238+00	\N	3c1043ec-4b9e-4ca5-87ad-fadf34feb510	0101000020E6100000BEFCEB689E2853C05B3A0A29A2A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:09:24+00	2017-10-05 22:27:40.396095+00	\N	36112713-3f86-4839-81dd-995b059b7a90	0101000020E6100000BEFCEB689E2853C05B3A0A29A2A30A40	Colombia	Problemática vertimiento de aguas sucias.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:10:40+00	2017-10-05 22:28:59.778854+00	\N	0cd2b060-8090-497a-b4bc-108d85f2e6e7	0101000020E6100000C96141AB9D2853C00A38B5F9A0A30A40	Colombia	Problemática vertimiento de aguas sucias en el río.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:11:39+00	2017-10-05 22:30:20.072697+00	\N	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263	0101000020E6100000C96141AB9D2853C00A38B5F9A0A30A40	Colombia	Problemática de construcciones muy cercanas al rió. Los desechos son arrojados directamente al rió.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:16:38+00	2017-10-05 22:31:09.230061+00	\N	6e83daff-cbfa-4073-aef9-139c4f50e21b	0101000020E6100000053CBC299D2853C0BD1B21A8BFA30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:20:02+00	2017-10-05 22:31:41.155915+00	\N	55ac60cb-3157-4787-a832-e43731155d0d	0101000020E6100000980D11BB9F2853C0FE34F4891BA30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:21:57+00	2017-10-05 22:32:21.405079+00	\N	a1e40298-a772-4a39-b162-748b63f69a45	0101000020E61000000CA3A4B0A02853C0810D6F73B6A20A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:24:06+00	2017-10-05 22:33:06.169484+00	\N	96b0bb7a-af32-45e5-9db2-30caad5823bd	0101000020E610000013025E0B9F2853C01616B524D5A10A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:29:10+00	2017-10-05 22:33:46.429852+00	\N	c2a9d68b-e28e-4f73-bbe8-067459fb4919	0101000020E6100000FB0D4DB89B2853C05A4F520548A10A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:30:17+00	2017-10-05 22:34:24.424118+00	\N	dd045e20-ee07-4996-b2cd-5438231d2bc1	0101000020E6100000E50E72499B2853C0ED6F3966F2A00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:32:46+00	2017-10-05 22:34:55.76774+00	\N	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e	0101000020E6100000AF29253E962853C0BBE9E23E8BA00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:38:07+00	2017-10-05 22:36:05.607276+00	\N	7708286b-1f1a-4793-8c87-bb7e977bb67a	0101000020E610000092442732902853C0AC78AC9D51A00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:41:27+00	2017-10-05 22:38:13.392148+00	\N	db40befc-e679-4bfa-a3c2-deaaa0f62038	0101000020E6100000406E3B448E2853C0B13FC20F52A00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:51:14+00	2017-10-05 22:38:32.094867+00	\N	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c	0101000020E6100000543A719C882853C0CA90B8C7D29F0A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:54:32+00	2017-10-05 22:38:49.565685+00	\N	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e	0101000020E6100000F575A6F1872853C02BEBC7E4DC9F0A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:56:35+00	2017-10-05 22:39:31.919701+00	\N	3b256490-dc0a-4d67-bd83-d6de71a21b13	0101000020E6100000B7AB1DE6872853C023A12F7BE19F0A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:28:56+00	2017-10-05 22:40:14.770965+00	\N	b6513d46-435a-4c10-8f5d-3aa09f8345a3	0101000020E61000007EF5B86F752853C0959D7E5017A10A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 09:30:28+00	2017-10-05 22:40:53.559631+00	\N	73e2cd15-a248-42ec-a30b-b95193517ebd	0101000020E61000006D6F7508752853C0013B0D83BFA00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 10:31:17+00	2017-10-05 22:41:39.429458+00	\N	ebd74927-47f7-407e-8a08-ba79086c7964	0101000020E61000006BD8A5FC1A2853C050FEE119FA980A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 10:49:55+00	2017-10-05 22:42:19.231841+00	\N	2c5bbc47-20e1-458a-9bb6-849000e29461	0101000020E6100000E11D2AD7A52653C0436F57F9AFAD0A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 11:22:44+00	2017-10-05 22:43:20.936722+00	\N	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a	0101000020E6100000F93EC16A512653C06696470E43910A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-21 13:25:21+00	2017-10-05 21:36:21.063713+00	\N	b5f595f8-037a-452d-88a5-3d8f809ba762	0101000020E6100000C051F2EA1C2853C087F7688491910A40	Colombia		24	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 08:34:37+00	2017-10-05 21:16:01.805001+00	\N	db467ca8-b12b-4fa4-b836-8861ec78726b	0101000020E610000065DAFE95952853C0CD344E3089A00A40	Colombia	Problemática con la planta de tratamiento de aguas residuales.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 08:36:22+00	2017-10-05 22:35:31.415079+00	\N	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac	0101000020E610000057BE3EA5902853C0BFAFBECB56A00A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:21:58+00	2017-10-05 21:46:03.975576+00	\N	693272bb-61c5-4adb-81cc-9d7b7911235e	0101000020E610000056DA3563C92853C07DD5223F6EA90A40	Colombia	Pozos sépticos para el vertimiento de aguas sucias.	23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 08:01:37+00	2017-10-05 22:23:46.958118+00	\N	a8cc6e96-ebc2-4054-8d88-d49058fc6c26	0101000020E610000088A747E8A12853C0992089A8D3A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-19 07:21:58+00	2017-09-03 16:44:50.748251+00	\N	7498fa9d-0ca0-4f73-b56e-b04161c56f62	0101000020E610000057DA3563C92853C098D5223F6EA90A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 08:01:37+00	2017-10-05 22:23:17.879696+00	\N	ddb95280-1666-4ef3-a832-3815dc09eca2	0101000020E610000088A747E8A12853C0992089A8D3A30A40	Colombia		23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-06-15 14:34:29+00	2017-10-20 15:55:39.813006+00	\N	afe7877b-9e15-46c5-8b38-7650289af7ab	0101000020E6100000D0F247A7F32153C035F62B66BCB90A40	Colombia	Taller de manejo ambiental de la cuenca medio-baja del rìo Pance.	3	1	Cali	Valle del Cauca	Calle 18 122221-122405	Cali	760031	t
2016-03-19 07:20:08+00	2017-10-05 21:43:05.339267+00	\N	d8d39c19-defb-485d-9385-f3640947205e	0101000020E61000001B301F7BC32853C0609002B817A80A40	Colombia	Vertimiento de aguas sucias al río.	23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 07:25:23+00	2017-10-05 21:54:02.193407+00	\N	ca6995f9-b9ef-4717-88ec-7a6846dbe562	0101000020E61000004B7FFE94CD2853C0C121A98592A90A40	Colombia		23	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 09:41:41+00	2017-10-05 21:26:29.33362+00	\N	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2	0101000020E6100000A07926217E2853C059C45A7C0AA00A40	Colombia	Problemática con tubo de agua.	22	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2016-03-14 10:01:38+00	2017-10-05 20:37:07.554633+00	\N	c88fd697-a3bd-4579-89eb-bae3732b6b94	0101000020E610000073942820522253C09A991C88769F0B40	Colombia		18	1	Cali	Valle del Cauca	Avenida 1 Norte 7 Norte1-7 Norte123	Cali	760045	t
2016-03-19 07:47:48+00	2017-10-05 21:04:23.529646+00	\N	e2209156-8c6d-4b00-a105-6599f61034a2	0101000020E6100000E246A480C72853C003E8F692C6A80A40	Colombia	Sobre las peleas de gallos como actividad de Pance.	22	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
2016-03-19 08:39:47+00	2017-10-05 22:37:22.520115+00	\N	9adf4924-7b39-4175-b55a-5bc5266ba171	0101000020E610000092442732902853C0AC78AC9D51A00A40	Colombia	Problemática de casas que tienen tubos que envían las aguas sucias directo al rió.	23	1	Cali	Valle del Cauca	Vereda El pato 		760008	t
2015-09-07 11:00:27+00	2017-10-20 14:26:38.990293+00	\N	aba05bd3-1be9-4c17-9977-54620f833123	0101000020E6100000AB9509BFD42553C05D98545A6CC00A40	Colombia	Prueba de la plataforma web para el observatorio medioambiental del rìo Pance.	3	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine		760008	t
2015-07-07 15:36:38+00	2017-10-20 14:32:40.081064+00	\N	e910f31d-5149-4560-a9d5-2c3da11c1076	0101000020E61000007D6ABC74932553C02853A6AB4EC10A40	Colombia	Espacio discucciòn manejo medioambiental Pance.	4	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-09-20 16:08:08+00	2017-10-20 14:44:36.865617+00	\N	8183afe6-0446-48bb-9881-8b7de0b785f2	0101000020E6100000E1807018DF2553C0A835347872C00A40	Colombia	Problemática con turistas que no hacen caso por crecida en Avenida La Voragine, son las 4 de la tarde y ya paso la policia. Los turistas a pesar del peligro se quedan en el rìo y no hacen caso al llamado de los oficiales. Esperamos a ver que ocurre.	6	1	Cali	Valle del Cauca	Avenida Los Cerros Vía La Voragine 		760008	t
2015-08-24 09:03:54+00	2017-10-20 14:49:40.996085+00	\N	d09dd013-a703-4dbc-a776-fa2759e72589	0101000020E610000046004A56582553C0DDAB418510BD0A40	Colombia	Nos encontramos en la Vereda La Voragine, se pueden observar los residuos sólidos recogidos después de terminar la jornada de limpieza. Los residuos fueron recogidos por los habitantes de la comunidad e instituciones educativas que apoyaron la iniciativa.	6	1	Cali	Valle del Cauca	Unnamed Road 		760008	t
\.


--
-- Data for Name: core_record_tags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_record_tags (id, record_id, tag_id) FROM stdin;
1	fef9da49-c03f-41d4-86ff-bf13d46c1689	6
2	e07dca59-a780-4100-be3c-d4ad85b1ecea	6
3	293efedf-ad76-455a-83c1-615ab95c493f	6
4	e910f31d-5149-4560-a9d5-2c3da11c1076	6
5	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	6
6	5de6531a-f00a-4f61-bb6d-06f95301e956	6
7	e9993153-88fc-4b6d-8f98-82f1179a6f48	6
8	c0470d33-114c-4dc6-859b-ff24fa01b318	6
9	27bbd7c8-446b-45ad-b021-9c1f623aab3f	6
10	0298545a-b981-49d0-a3a1-87f9282369d3	6
11	afe7877b-9e15-46c5-8b38-7650289af7ab	6
12	aba05bd3-1be9-4c17-9977-54620f833123	6
13	28ac800f-8947-467a-ba94-9cb7059a7f5c	6
14	8183afe6-0446-48bb-9881-8b7de0b785f2	5
15	d09dd013-a703-4dbc-a776-fa2759e72589	6
16	ab0a53aa-f634-434e-b686-538bd95e54a3	1
17	0f826755-fd72-4bcf-9dcc-fde6c75fba40	6
18	8089ca6f-7452-4f83-a8b3-9eccaf2474fc	5
19	d91c88de-c77b-485c-b290-aa72dc659a11	6
20	c169868d-8028-48ab-ac04-75d3ff1e6949	6
21	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277	6
22	88e07d66-17dd-43c8-a9ff-579ab19a294e	6
23	0c770d71-3206-48f5-9857-8c09ee003fe6	6
24	24fe3865-7b55-48ea-b3c9-f3802d5ad091	1
25	24fe3865-7b55-48ea-b3c9-f3802d5ad091	5
26	1fde81af-408e-4b16-8100-70d5f5c37d23	6
27	791125da-a318-4bd3-b801-14b6b1d9d159	6
28	6ecf91d2-cca2-4ae1-8615-122cf97fada1	3
29	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8	1
30	5195e1c4-ec73-44c4-8e89-068dbd147959	5
31	897a09ed-756f-40b1-9da7-1ea63bc33933	5
32	5fae39a1-18d0-4759-a0ef-66347c2ffa6b	1
33	d5d6ff8d-77f5-4c91-a0aa-55437de883d9	1
34	ebb297fd-898b-4649-b082-3eea6bb825a5	5
35	51890721-49e9-48b4-80ad-343f69140618	2
36	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7	3
37	cb0a1479-b7f9-42b5-a020-545f8482d4ec	3
38	16cb85f9-111e-416f-80ce-f454c94fc843	3
39	c7f0698d-6f00-4626-9ed2-76eebe405c7d	6
40	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44	6
41	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033	6
42	c489ef6d-a7f9-4ece-94a1-e8c89cea352f	6
43	8f5c53b2-fcb3-48b0-add5-046460f5fbb8	6
44	7f81eea4-8229-481c-86af-7b4de9ead9d7	6
45	7f73586e-b532-4781-b28e-eb5f043c8542	6
46	3b376d06-4a28-4ba2-8635-befda27568f5	6
47	c88fd697-a3bd-4579-89eb-bae3732b6b94	3
48	f6f80395-759c-4d79-8c4c-9e7754b83de6	6
49	b30f510d-09c6-48ec-a384-ca50ba5f8576	6
50	5885ec1b-d3a4-4952-971c-04d9946f6cba	6
51	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2	6
52	0642a23d-912c-432d-bf24-91d5b303f7ab	1
53	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4	6
54	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a	6
55	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42	6
56	1caaaec8-bd13-46a0-8f90-7d018117238d	6
57	55e235eb-7738-4f23-b802-056b0cc27ab0	1
58	e2209156-8c6d-4b00-a105-6599f61034a2	6
59	d117527f-c4a8-4ec3-b151-7d2c287413f6	6
60	2aaf4790-0265-48fe-b7f3-f162281c6e22	6
61	b5d81b74-f199-49b9-ad64-47453c7d5097	1
62	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17	6
63	3a1e07d5-b54c-4196-8fd4-5572ad20f975	6
64	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd	6
65	21badbe7-7f70-4f5a-99e6-91a8f4c31c38	6
66	891c8841-8e6d-4167-8c99-e4b1358ae45b	6
67	db467ca8-b12b-4fa4-b836-8861ec78726b	1
68	808368b1-3295-48b5-8449-3f60c7a0322f	6
69	8cb3e148-af5e-419a-b3e7-d8ec93c6964c	6
70	05877abf-72f5-463b-8546-feada547b3b6	6
71	988615e8-266c-424d-8428-7b07d9c00dfb	6
72	f3622115-2421-4667-a2bf-0621dd9e7868	6
73	6c4403e5-7dad-4436-a241-0f5d826e8f66	3
74	441bef1f-b57a-44ad-a72b-529c4eca5343	6
75	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2	1
76	99070557-0762-4a9c-a532-dbd76092fb92	6
77	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b	6
78	2b21808d-a76a-462e-874f-f8c85ce28d59	6
79	e51069bc-fea6-4e64-a146-49f34227acd4	1
80	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef	6
81	b5f595f8-037a-452d-88a5-3d8f809ba762	6
82	53aab39e-eb91-4603-95db-21b654136b02	6
83	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d	6
84	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765	6
85	d3e8d445-806f-44b4-bb34-213be28414bc	6
86	d8d39c19-defb-485d-9385-f3640947205e	1
87	12fcb8be-40d6-4654-831a-68dd54566e3c	6
88	693272bb-61c5-4adb-81cc-9d7b7911235e	6
89	ca6995f9-b9ef-4717-88ec-7a6846dbe562	6
90	22ac0fb2-1b7b-4569-b6de-d7115bab36dc	4
91	8d964eff-16d6-4602-a7e5-3312da22a4c6	4
92	9e36c157-f386-4b9a-825d-a3d125d0f56d	6
93	0f432223-f9dd-435c-8153-8d1c9b69f0f4	6
94	3ee41a2a-1e4d-4776-960b-643ca378f691	6
95	d3268f98-f84d-44f4-801e-a025d0e75386	6
96	ddb95280-1666-4ef3-a832-3815dc09eca2	6
97	a8cc6e96-ebc2-4054-8d88-d49058fc6c26	6
98	29c4885b-ddae-4807-b7d8-a1a9786a74cc	6
99	60cabb20-2f6e-4bc3-9e30-ac786ed3125a	6
100	dbf5dc2d-a084-4221-a421-b542d364fdf2	6
101	3c1043ec-4b9e-4ca5-87ad-fadf34feb510	6
102	36112713-3f86-4839-81dd-995b059b7a90	1
103	0cd2b060-8090-497a-b4bc-108d85f2e6e7	1
104	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263	4
105	6e83daff-cbfa-4073-aef9-139c4f50e21b	6
106	55ac60cb-3157-4787-a832-e43731155d0d	6
107	a1e40298-a772-4a39-b162-748b63f69a45	6
108	96b0bb7a-af32-45e5-9db2-30caad5823bd	6
109	c2a9d68b-e28e-4f73-bbe8-067459fb4919	6
110	dd045e20-ee07-4996-b2cd-5438231d2bc1	6
111	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e	6
112	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac	6
113	7708286b-1f1a-4793-8c87-bb7e977bb67a	6
114	9adf4924-7b39-4175-b55a-5bc5266ba171	1
115	db40befc-e679-4bfa-a3c2-deaaa0f62038	6
116	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c	6
117	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e	6
118	3b256490-dc0a-4d67-bd83-d6de71a21b13	6
119	b6513d46-435a-4c10-8f5d-3aa09f8345a3	6
120	73e2cd15-a248-42ec-a30b-b95193517ebd	6
121	ebd74927-47f7-407e-8a08-ba79086c7964	6
122	2c5bbc47-20e1-458a-9bb6-849000e29461	6
123	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a	6
124	92b828c6-2f30-4f89-9a79-10fe1153fc57	6
125	35ab7320-99f5-4dec-8472-b78847210586	6
126	7f8ef9d1-83ec-4da5-a301-c0689a1306fb	6
127	92cc429a-1507-4853-8deb-45ddf1b7f6e0	6
128	5abe7cf8-1fc5-4575-8efe-717a42330ef6	6
\.


--
-- Name: core_record_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_record_tags_id_seq', 128, true);


--
-- Data for Name: core_tag; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_tag (id, created_at, updated_at, deleted_at, "uniqueID", name, slug, "isActive", related_channel_id) FROM stdin;
1	2017-10-05 19:44:54.090232+00	2017-10-05 19:44:54.090279+00	\N	917a8131-5e9b-4882-85ac-2e4ac4d3fc35	Problemáticas ciudadanas	problematicas-ciudadanas	t	1
2	2017-10-05 19:45:14.865337+00	2017-10-05 19:45:14.865385+00	\N	6cb110fd-d6ba-442f-b0ce-b7d1facd5010	Movilidad	movilidad	t	1
3	2017-10-05 19:45:27.505641+00	2017-10-05 19:45:27.505691+00	\N	2fa73fb5-995a-4766-abf3-72ecc1e6029f	Basura	basura	t	1
4	2017-10-05 19:45:47.774168+00	2017-10-05 19:45:47.77425+00	\N	df049de3-c78b-4d58-abfc-a47e716cab1f	Construcción	construccion	t	1
5	2017-10-05 19:46:05.937102+00	2017-10-05 19:46:05.93719+00	\N	6a9f1b0e-b383-4c29-851e-4eb2dc529fa0	Turismo	turismo	t	1
6	2017-10-05 19:46:34.20037+00	2017-10-05 19:46:34.200418+00	\N	a930856e-b75d-44b5-b720-58bd239be3c2	Acciones comunitarias	acciones-comunitarias	t	1
7	2017-11-30 19:40:17.352111+00	2017-11-30 19:40:17.353046+00	\N	443e8128-8dc8-471c-b721-e41f34eba5a9	Tierra	tierra	t	2
\.


--
-- Name: core_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_tag_id_seq', 7, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-10-01 20:56:31.317776+00	e7b2a93667629827c4c3017af073a8ceec1afd71	e7b2a93667629827c4c3017af073a8ceec1afd71	1	[{"added": {}}]	7	1
2	2017-10-01 20:56:55.863455+00	1	Proyecto Pance	2	[{"changed": {"fields": ["mapCenterLocation"]}}]	14	1
3	2017-10-05 19:44:54.113046+00	1	problematicas-ciudadanas	1	[{"added": {}}]	11	1
4	2017-10-05 19:45:14.867568+00	2	movilidad	1	[{"added": {}}]	11	1
5	2017-10-05 19:45:27.507847+00	3	basura	1	[{"added": {}}]	11	1
6	2017-10-05 19:45:47.776352+00	4	construccion	1	[{"added": {}}]	11	1
7	2017-10-05 19:46:05.940042+00	5	turismo	1	[{"added": {}}]	11	1
8	2017-10-05 19:46:34.202578+00	6	acciones-comunitarias	1	[{"added": {}}]	11	1
9	2017-10-05 20:02:19.170999+00	fef9da49-c03f-41d4-86ff-bf13d46c1689	fef9da49-c03f-41d4-86ff-bf13d46c1689	2	[{"changed": {"fields": ["address"]}}]	13	1
10	2017-10-05 20:02:47.5339+00	e07dca59-a780-4100-be3c-d4ad85b1ecea	e07dca59-a780-4100-be3c-d4ad85b1ecea	2	[{"changed": {"fields": ["address"]}}]	13	1
11	2017-10-05 20:03:27.247811+00	293efedf-ad76-455a-83c1-615ab95c493f	293efedf-ad76-455a-83c1-615ab95c493f	2	[{"changed": {"fields": ["address"]}}]	13	1
12	2017-10-05 20:05:12.878209+00	e910f31d-5149-4560-a9d5-2c3da11c1076	e910f31d-5149-4560-a9d5-2c3da11c1076	2	[{"changed": {"fields": ["address"]}}]	13	1
13	2017-10-05 20:05:23.622773+00	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	2	[{"changed": {"fields": ["address"]}}]	13	1
14	2017-10-05 20:05:32.959961+00	5de6531a-f00a-4f61-bb6d-06f95301e956	5de6531a-f00a-4f61-bb6d-06f95301e956	2	[{"changed": {"fields": ["address"]}}]	13	1
15	2017-10-05 20:07:00.641989+00	e9993153-88fc-4b6d-8f98-82f1179a6f48	e9993153-88fc-4b6d-8f98-82f1179a6f48	2	[{"changed": {"fields": ["address"]}}]	13	1
16	2017-10-05 20:07:11.490888+00	c0470d33-114c-4dc6-859b-ff24fa01b318	c0470d33-114c-4dc6-859b-ff24fa01b318	2	[{"changed": {"fields": ["address"]}}]	13	1
17	2017-10-05 20:07:22.337905+00	27bbd7c8-446b-45ad-b021-9c1f623aab3f	27bbd7c8-446b-45ad-b021-9c1f623aab3f	2	[{"changed": {"fields": ["address"]}}]	13	1
18	2017-10-05 20:07:30.332049+00	0298545a-b981-49d0-a3a1-87f9282369d3	0298545a-b981-49d0-a3a1-87f9282369d3	2	[{"changed": {"fields": ["address"]}}]	13	1
19	2017-10-05 20:09:55.955456+00	afe7877b-9e15-46c5-8b38-7650289af7ab	afe7877b-9e15-46c5-8b38-7650289af7ab	2	[]	13	1
20	2017-10-05 20:10:04.788851+00	aba05bd3-1be9-4c17-9977-54620f833123	aba05bd3-1be9-4c17-9977-54620f833123	2	[{"changed": {"fields": ["address"]}}]	13	1
21	2017-10-05 20:10:13.201792+00	28ac800f-8947-467a-ba94-9cb7059a7f5c	28ac800f-8947-467a-ba94-9cb7059a7f5c	2	[{"changed": {"fields": ["address"]}}]	13	1
22	2017-10-05 20:11:20.860637+00	8183afe6-0446-48bb-9881-8b7de0b785f2	8183afe6-0446-48bb-9881-8b7de0b785f2	2	[{"changed": {"fields": ["address"]}}]	13	1
23	2017-10-05 20:12:38.40028+00	d09dd013-a703-4dbc-a776-fa2759e72589	d09dd013-a703-4dbc-a776-fa2759e72589	2	[{"changed": {"fields": ["address"]}}]	13	1
24	2017-10-05 20:14:07.188067+00	ab0a53aa-f634-434e-b686-538bd95e54a3	ab0a53aa-f634-434e-b686-538bd95e54a3	2	[{"changed": {"fields": ["address"]}}]	13	1
25	2017-10-05 20:14:54.725877+00	0f826755-fd72-4bcf-9dcc-fde6c75fba40	0f826755-fd72-4bcf-9dcc-fde6c75fba40	2	[{"changed": {"fields": ["address"]}}]	13	1
26	2017-10-05 20:15:55.340375+00	8089ca6f-7452-4f83-a8b3-9eccaf2474fc	8089ca6f-7452-4f83-a8b3-9eccaf2474fc	2	[{"changed": {"fields": ["address"]}}]	13	1
27	2017-10-05 20:17:46.874238+00	d91c88de-c77b-485c-b290-aa72dc659a11	d91c88de-c77b-485c-b290-aa72dc659a11	2	[{"changed": {"fields": ["address"]}}]	13	1
28	2017-10-05 20:18:19.873393+00	c169868d-8028-48ab-ac04-75d3ff1e6949	c169868d-8028-48ab-ac04-75d3ff1e6949	2	[{"changed": {"fields": ["address"]}}]	13	1
29	2017-10-05 20:18:33.903276+00	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277	bcb80cb7-d2f0-4f2f-bd2f-59d1c5be3277	2	[{"changed": {"fields": ["address"]}}]	13	1
30	2017-10-05 20:18:46.892758+00	88e07d66-17dd-43c8-a9ff-579ab19a294e	88e07d66-17dd-43c8-a9ff-579ab19a294e	2	[{"changed": {"fields": ["address"]}}]	13	1
31	2017-10-05 20:18:57.01243+00	0c770d71-3206-48f5-9857-8c09ee003fe6	0c770d71-3206-48f5-9857-8c09ee003fe6	2	[{"changed": {"fields": ["address"]}}]	13	1
32	2017-10-05 20:22:34.654616+00	24fe3865-7b55-48ea-b3c9-f3802d5ad091	24fe3865-7b55-48ea-b3c9-f3802d5ad091	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
33	2017-10-05 20:23:14.676347+00	1fde81af-408e-4b16-8100-70d5f5c37d23	1fde81af-408e-4b16-8100-70d5f5c37d23	2	[{"changed": {"fields": ["address"]}}]	13	1
34	2017-10-05 20:23:49.349343+00	791125da-a318-4bd3-b801-14b6b1d9d159	791125da-a318-4bd3-b801-14b6b1d9d159	2	[{"changed": {"fields": ["address"]}}]	13	1
35	2017-10-05 20:24:28.403151+00	6ecf91d2-cca2-4ae1-8615-122cf97fada1	6ecf91d2-cca2-4ae1-8615-122cf97fada1	2	[{"changed": {"fields": ["address"]}}]	13	1
36	2017-10-05 20:25:08.28188+00	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8	824b2bf1-1a1d-4c1a-a89e-78aaa2ee59c8	2	[{"changed": {"fields": ["address"]}}]	13	1
37	2017-10-05 20:26:11.324597+00	5195e1c4-ec73-44c4-8e89-068dbd147959	5195e1c4-ec73-44c4-8e89-068dbd147959	2	[{"changed": {"fields": ["address"]}}]	13	1
38	2017-10-05 20:26:54.555661+00	897a09ed-756f-40b1-9da7-1ea63bc33933	897a09ed-756f-40b1-9da7-1ea63bc33933	2	[{"changed": {"fields": ["address"]}}]	13	1
39	2017-10-05 20:28:04.111875+00	5fae39a1-18d0-4759-a0ef-66347c2ffa6b	5fae39a1-18d0-4759-a0ef-66347c2ffa6b	2	[{"changed": {"fields": ["address"]}}]	13	1
40	2017-10-05 20:29:23.292582+00	d5d6ff8d-77f5-4c91-a0aa-55437de883d9	d5d6ff8d-77f5-4c91-a0aa-55437de883d9	2	[{"changed": {"fields": ["address"]}}]	13	1
41	2017-10-05 20:30:06.202084+00	ebb297fd-898b-4649-b082-3eea6bb825a5	ebb297fd-898b-4649-b082-3eea6bb825a5	2	[{"changed": {"fields": ["address"]}}]	13	1
42	2017-10-05 20:30:45.441361+00	51890721-49e9-48b4-80ad-343f69140618	51890721-49e9-48b4-80ad-343f69140618	2	[{"changed": {"fields": ["address"]}}]	13	1
43	2017-10-05 20:32:15.140723+00	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7	d0a7d7bb-a879-4ec9-98f9-29c0f87416c7	2	[{"changed": {"fields": ["address"]}}]	13	1
44	2017-10-05 20:32:30.463467+00	cb0a1479-b7f9-42b5-a020-545f8482d4ec	cb0a1479-b7f9-42b5-a020-545f8482d4ec	2	[{"changed": {"fields": ["address"]}}]	13	1
45	2017-10-05 20:32:40.829185+00	16cb85f9-111e-416f-80ce-f454c94fc843	16cb85f9-111e-416f-80ce-f454c94fc843	2	[{"changed": {"fields": ["address"]}}]	13	1
46	2017-10-05 20:33:29.583323+00	c7f0698d-6f00-4626-9ed2-76eebe405c7d	c7f0698d-6f00-4626-9ed2-76eebe405c7d	2	[{"changed": {"fields": ["address"]}}]	13	1
47	2017-10-05 20:33:48.59933+00	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44	b64cfbcd-5255-4480-b4d4-c7bcbbfdfb44	2	[{"changed": {"fields": ["address"]}}]	13	1
48	2017-10-05 20:34:49.588534+00	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033	e6c9dcbd-84d4-41ef-a2b8-7f3f88953033	2	[{"changed": {"fields": ["address"]}}]	13	1
49	2017-10-05 20:34:59.57052+00	c489ef6d-a7f9-4ece-94a1-e8c89cea352f	c489ef6d-a7f9-4ece-94a1-e8c89cea352f	2	[{"changed": {"fields": ["address"]}}]	13	1
50	2017-10-05 20:35:22.444897+00	8f5c53b2-fcb3-48b0-add5-046460f5fbb8	8f5c53b2-fcb3-48b0-add5-046460f5fbb8	2	[{"changed": {"fields": ["address"]}}]	13	1
51	2017-10-05 20:35:48.441996+00	7f81eea4-8229-481c-86af-7b4de9ead9d7	7f81eea4-8229-481c-86af-7b4de9ead9d7	2	[{"changed": {"fields": ["address"]}}]	13	1
52	2017-10-05 20:35:58.989922+00	7f73586e-b532-4781-b28e-eb5f043c8542	7f73586e-b532-4781-b28e-eb5f043c8542	2	[{"changed": {"fields": ["address"]}}]	13	1
53	2017-10-05 20:36:07.138438+00	3b376d06-4a28-4ba2-8635-befda27568f5	3b376d06-4a28-4ba2-8635-befda27568f5	2	[{"changed": {"fields": ["address"]}}]	13	1
54	2017-10-05 20:37:07.585308+00	c88fd697-a3bd-4579-89eb-bae3732b6b94	c88fd697-a3bd-4579-89eb-bae3732b6b94	2	[]	13	1
55	2017-10-05 20:37:16.155729+00	f6f80395-759c-4d79-8c4c-9e7754b83de6	f6f80395-759c-4d79-8c4c-9e7754b83de6	2	[]	13	1
56	2017-10-05 20:37:27.579833+00	b30f510d-09c6-48ec-a384-ca50ba5f8576	b30f510d-09c6-48ec-a384-ca50ba5f8576	2	[]	13	1
57	2017-10-05 20:38:00.50218+00	5885ec1b-d3a4-4952-971c-04d9946f6cba	5885ec1b-d3a4-4952-971c-04d9946f6cba	2	[{"changed": {"fields": ["address"]}}]	13	1
58	2017-10-05 20:38:37.08309+00	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2	701bc4e4-3866-4f73-9ee3-8bb225fdd3b2	2	[{"changed": {"fields": ["address"]}}]	13	1
59	2017-10-05 20:42:13.334482+00	0642a23d-912c-432d-bf24-91d5b303f7ab	0642a23d-912c-432d-bf24-91d5b303f7ab	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
60	2017-10-05 20:43:08.334858+00	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4	1584f1e9-87e8-49e5-b661-6fb0bf4a4bf4	2	[{"changed": {"fields": ["address"]}}]	13	1
61	2017-10-05 20:43:39.060606+00	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a	a26f14e8-dda3-47ba-84ab-9cf3cb66c59a	2	[{"changed": {"fields": ["address"]}}]	13	1
62	2017-10-05 20:44:24.880976+00	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42	ad14c14a-eb6f-4ee9-9fa0-d189d51eef42	2	[{"changed": {"fields": ["address"]}}]	13	1
63	2017-10-05 20:58:10.473924+00	1caaaec8-bd13-46a0-8f90-7d018117238d	1caaaec8-bd13-46a0-8f90-7d018117238d	2	[{"changed": {"fields": ["address"]}}]	13	1
64	2017-10-05 21:00:42.773678+00	55e235eb-7738-4f23-b802-056b0cc27ab0	55e235eb-7738-4f23-b802-056b0cc27ab0	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
65	2017-10-05 21:04:23.60803+00	e2209156-8c6d-4b00-a105-6599f61034a2	e2209156-8c6d-4b00-a105-6599f61034a2	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
66	2017-10-05 21:05:09.620972+00	d117527f-c4a8-4ec3-b151-7d2c287413f6	d117527f-c4a8-4ec3-b151-7d2c287413f6	2	[{"changed": {"fields": ["address"]}}]	13	1
67	2017-10-05 21:06:37.512203+00	2aaf4790-0265-48fe-b7f3-f162281c6e22	2aaf4790-0265-48fe-b7f3-f162281c6e22	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
68	2017-10-05 21:08:24.021317+00	b5d81b74-f199-49b9-ad64-47453c7d5097	b5d81b74-f199-49b9-ad64-47453c7d5097	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
69	2017-10-05 21:09:25.15998+00	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17	a96fcb4c-9d7e-4a61-8787-1f3cf69c1a17	2	[{"changed": {"fields": ["address"]}}]	13	1
70	2017-10-05 21:10:16.358459+00	3a1e07d5-b54c-4196-8fd4-5572ad20f975	3a1e07d5-b54c-4196-8fd4-5572ad20f975	2	[{"changed": {"fields": ["address"]}}]	13	1
71	2017-10-05 21:10:53.666074+00	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd	640aaca4-d34f-43fc-9dcb-90b97c4d3fcd	2	[{"changed": {"fields": ["address"]}}]	13	1
72	2017-10-05 21:11:41.93365+00	21badbe7-7f70-4f5a-99e6-91a8f4c31c38	21badbe7-7f70-4f5a-99e6-91a8f4c31c38	2	[{"changed": {"fields": ["address"]}}]	13	1
73	2017-10-05 21:13:21.203192+00	891c8841-8e6d-4167-8c99-e4b1358ae45b	891c8841-8e6d-4167-8c99-e4b1358ae45b	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
74	2017-10-05 21:16:01.847122+00	db467ca8-b12b-4fa4-b836-8861ec78726b	db467ca8-b12b-4fa4-b836-8861ec78726b	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
75	2017-10-05 21:17:22.049911+00	808368b1-3295-48b5-8449-3f60c7a0322f	808368b1-3295-48b5-8449-3f60c7a0322f	2	[{"changed": {"fields": ["address"]}}]	13	1
76	2017-10-05 21:17:59.982339+00	8cb3e148-af5e-419a-b3e7-d8ec93c6964c	8cb3e148-af5e-419a-b3e7-d8ec93c6964c	2	[{"changed": {"fields": ["address"]}}]	13	1
77	2017-10-05 21:18:40.481081+00	05877abf-72f5-463b-8546-feada547b3b6	05877abf-72f5-463b-8546-feada547b3b6	2	[{"changed": {"fields": ["address"]}}]	13	1
78	2017-10-05 21:19:49.895859+00	988615e8-266c-424d-8428-7b07d9c00dfb	988615e8-266c-424d-8428-7b07d9c00dfb	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
79	2017-10-05 21:20:26.088069+00	f3622115-2421-4667-a2bf-0621dd9e7868	f3622115-2421-4667-a2bf-0621dd9e7868	2	[{"changed": {"fields": ["address"]}}]	13	1
80	2017-10-05 21:23:46.608039+00	6c4403e5-7dad-4436-a241-0f5d826e8f66	6c4403e5-7dad-4436-a241-0f5d826e8f66	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
81	2017-10-05 21:24:33.777223+00	441bef1f-b57a-44ad-a72b-529c4eca5343	441bef1f-b57a-44ad-a72b-529c4eca5343	2	[{"changed": {"fields": ["address"]}}]	13	1
82	2017-10-05 21:26:29.364058+00	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2	0eee8bd1-fd8e-434f-92dc-55c1dd5f66f2	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
83	2017-10-05 21:28:17.934165+00	99070557-0762-4a9c-a532-dbd76092fb92	99070557-0762-4a9c-a532-dbd76092fb92	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
84	2017-10-05 21:30:00.410641+00	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b	dcea5875-c626-4ccc-a1c6-f19e1cc2af3b	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
85	2017-10-05 21:30:39.524335+00	2b21808d-a76a-462e-874f-f8c85ce28d59	2b21808d-a76a-462e-874f-f8c85ce28d59	2	[{"changed": {"fields": ["address"]}}]	13	1
86	2017-10-05 21:36:01.357779+00	e51069bc-fea6-4e64-a146-49f34227acd4	e51069bc-fea6-4e64-a146-49f34227acd4	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
87	2017-10-05 21:36:11.646566+00	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef	ec46e23d-aa7b-4dd2-a94c-ebf18f3904ef	2	[]	13	1
88	2017-10-05 21:36:21.092175+00	b5f595f8-037a-452d-88a5-3d8f809ba762	b5f595f8-037a-452d-88a5-3d8f809ba762	2	[{"changed": {"fields": ["address"]}}]	13	1
89	2017-10-05 21:36:31.788092+00	53aab39e-eb91-4603-95db-21b654136b02	53aab39e-eb91-4603-95db-21b654136b02	2	[{"changed": {"fields": ["address"]}}]	13	1
90	2017-10-05 21:39:18.982843+00	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d	798d2b2e-7539-4c98-8d42-ccf6cddc2f2d	2	[{"changed": {"fields": ["address"]}}]	13	1
91	2017-10-05 21:40:36.861908+00	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765	ddd6933c-f076-49f9-bdc8-5f8a9eb5f765	2	[{"changed": {"fields": ["address"]}}]	13	1
92	2017-10-05 21:41:44.771534+00	d3e8d445-806f-44b4-bb34-213be28414bc	d3e8d445-806f-44b4-bb34-213be28414bc	2	[{"changed": {"fields": ["address"]}}]	13	1
93	2017-10-05 21:43:05.371361+00	d8d39c19-defb-485d-9385-f3640947205e	d8d39c19-defb-485d-9385-f3640947205e	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
94	2017-10-05 21:44:13.089218+00	12fcb8be-40d6-4654-831a-68dd54566e3c	12fcb8be-40d6-4654-831a-68dd54566e3c	2	[{"changed": {"fields": ["address"]}}]	13	1
95	2017-10-05 21:46:04.007721+00	693272bb-61c5-4adb-81cc-9d7b7911235e	693272bb-61c5-4adb-81cc-9d7b7911235e	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
96	2017-10-05 21:54:02.212974+00	ca6995f9-b9ef-4717-88ec-7a6846dbe562	ca6995f9-b9ef-4717-88ec-7a6846dbe562	2	[{"changed": {"fields": ["address"]}}]	13	1
97	2017-10-05 21:55:52.089644+00	22ac0fb2-1b7b-4569-b6de-d7115bab36dc	22ac0fb2-1b7b-4569-b6de-d7115bab36dc	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
98	2017-10-05 21:57:06.342917+00	8d964eff-16d6-4602-a7e5-3312da22a4c6	8d964eff-16d6-4602-a7e5-3312da22a4c6	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
99	2017-10-05 21:58:22.098765+00	9e36c157-f386-4b9a-825d-a3d125d0f56d	9e36c157-f386-4b9a-825d-a3d125d0f56d	2	[{"changed": {"fields": ["address"]}}]	13	1
100	2017-10-05 21:59:24.060385+00	0f432223-f9dd-435c-8153-8d1c9b69f0f4	0f432223-f9dd-435c-8153-8d1c9b69f0f4	2	[{"changed": {"fields": ["address"]}}]	13	1
101	2017-10-05 22:00:29.196965+00	3ee41a2a-1e4d-4776-960b-643ca378f691	3ee41a2a-1e4d-4776-960b-643ca378f691	2	[{"changed": {"fields": ["address"]}}]	13	1
102	2017-10-05 22:22:20.8801+00	d3268f98-f84d-44f4-801e-a025d0e75386	d3268f98-f84d-44f4-801e-a025d0e75386	2	[{"changed": {"fields": ["address"]}}]	13	1
103	2017-10-05 22:23:17.905029+00	ddb95280-1666-4ef3-a832-3815dc09eca2	ddb95280-1666-4ef3-a832-3815dc09eca2	2	[{"changed": {"fields": ["address"]}}]	13	1
104	2017-10-05 22:23:47.013713+00	a8cc6e96-ebc2-4054-8d88-d49058fc6c26	a8cc6e96-ebc2-4054-8d88-d49058fc6c26	2	[{"changed": {"fields": ["address"]}}]	13	1
105	2017-10-05 22:24:27.687035+00	29c4885b-ddae-4807-b7d8-a1a9786a74cc	29c4885b-ddae-4807-b7d8-a1a9786a74cc	2	[{"changed": {"fields": ["address"]}}]	13	1
106	2017-10-05 22:25:22.798402+00	60cabb20-2f6e-4bc3-9e30-ac786ed3125a	60cabb20-2f6e-4bc3-9e30-ac786ed3125a	2	[{"changed": {"fields": ["address"]}}]	13	1
107	2017-10-05 22:25:53.727817+00	dbf5dc2d-a084-4221-a421-b542d364fdf2	dbf5dc2d-a084-4221-a421-b542d364fdf2	2	[{"changed": {"fields": ["address"]}}]	13	1
108	2017-10-05 22:26:22.719838+00	3c1043ec-4b9e-4ca5-87ad-fadf34feb510	3c1043ec-4b9e-4ca5-87ad-fadf34feb510	2	[{"changed": {"fields": ["address"]}}]	13	1
109	2017-10-05 22:27:40.42791+00	36112713-3f86-4839-81dd-995b059b7a90	36112713-3f86-4839-81dd-995b059b7a90	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
110	2017-10-05 22:28:59.820966+00	0cd2b060-8090-497a-b4bc-108d85f2e6e7	0cd2b060-8090-497a-b4bc-108d85f2e6e7	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
111	2017-10-05 22:30:20.108241+00	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263	5a2ed9ca-d4b1-4161-ab4a-c23c91b12263	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
112	2017-10-05 22:31:09.264407+00	6e83daff-cbfa-4073-aef9-139c4f50e21b	6e83daff-cbfa-4073-aef9-139c4f50e21b	2	[{"changed": {"fields": ["address"]}}]	13	1
113	2017-10-05 22:31:41.181726+00	55ac60cb-3157-4787-a832-e43731155d0d	55ac60cb-3157-4787-a832-e43731155d0d	2	[{"changed": {"fields": ["address"]}}]	13	1
114	2017-10-05 22:32:21.438907+00	a1e40298-a772-4a39-b162-748b63f69a45	a1e40298-a772-4a39-b162-748b63f69a45	2	[{"changed": {"fields": ["address"]}}]	13	1
115	2017-10-05 22:33:06.221377+00	96b0bb7a-af32-45e5-9db2-30caad5823bd	96b0bb7a-af32-45e5-9db2-30caad5823bd	2	[{"changed": {"fields": ["address"]}}]	13	1
116	2017-10-05 22:33:46.458667+00	c2a9d68b-e28e-4f73-bbe8-067459fb4919	c2a9d68b-e28e-4f73-bbe8-067459fb4919	2	[{"changed": {"fields": ["address"]}}]	13	1
117	2017-10-05 22:34:24.455504+00	dd045e20-ee07-4996-b2cd-5438231d2bc1	dd045e20-ee07-4996-b2cd-5438231d2bc1	2	[{"changed": {"fields": ["address"]}}]	13	1
118	2017-10-05 22:34:55.792723+00	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e	b3d16bdb-4789-4ea5-ae74-c721a82b8e1e	2	[{"changed": {"fields": ["address"]}}]	13	1
119	2017-10-05 22:35:31.445795+00	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac	e332e68c-2f99-4b5d-9a29-f60bde8dd4ac	2	[{"changed": {"fields": ["address"]}}]	13	1
120	2017-10-05 22:36:05.626894+00	7708286b-1f1a-4793-8c87-bb7e977bb67a	7708286b-1f1a-4793-8c87-bb7e977bb67a	2	[{"changed": {"fields": ["address"]}}]	13	1
121	2017-10-05 22:37:22.55128+00	9adf4924-7b39-4175-b55a-5bc5266ba171	9adf4924-7b39-4175-b55a-5bc5266ba171	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
122	2017-10-05 22:38:13.412885+00	db40befc-e679-4bfa-a3c2-deaaa0f62038	db40befc-e679-4bfa-a3c2-deaaa0f62038	2	[{"changed": {"fields": ["address"]}}]	13	1
123	2017-10-05 22:38:32.123462+00	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c	a0f7ea0c-3c6e-435d-88ff-1e3c6312d79c	2	[{"changed": {"fields": ["address"]}}]	13	1
124	2017-10-05 22:38:49.602308+00	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e	cc9d3ae2-a5c6-4775-8d1c-60589da4d71e	2	[{"changed": {"fields": ["address"]}}]	13	1
125	2017-10-05 22:39:31.954934+00	3b256490-dc0a-4d67-bd83-d6de71a21b13	3b256490-dc0a-4d67-bd83-d6de71a21b13	2	[{"changed": {"fields": ["address"]}}]	13	1
126	2017-10-05 22:40:14.809306+00	b6513d46-435a-4c10-8f5d-3aa09f8345a3	b6513d46-435a-4c10-8f5d-3aa09f8345a3	2	[{"changed": {"fields": ["address"]}}]	13	1
127	2017-10-05 22:40:53.60048+00	73e2cd15-a248-42ec-a30b-b95193517ebd	73e2cd15-a248-42ec-a30b-b95193517ebd	2	[{"changed": {"fields": ["address"]}}]	13	1
128	2017-10-05 22:41:39.469266+00	ebd74927-47f7-407e-8a08-ba79086c7964	ebd74927-47f7-407e-8a08-ba79086c7964	2	[{"changed": {"fields": ["address"]}}]	13	1
129	2017-10-05 22:42:19.273317+00	2c5bbc47-20e1-458a-9bb6-849000e29461	2c5bbc47-20e1-458a-9bb6-849000e29461	2	[{"changed": {"fields": ["address"]}}]	13	1
130	2017-10-05 22:43:20.967758+00	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a	946b616e-f17a-49ce-a2dd-8b2ec61c0e5a	2	[{"changed": {"fields": ["address"]}}]	13	1
131	2017-10-05 22:43:34.855937+00	92b828c6-2f30-4f89-9a79-10fe1153fc57	92b828c6-2f30-4f89-9a79-10fe1153fc57	2	[{"changed": {"fields": ["address"]}}]	13	1
132	2017-10-05 22:43:49.076263+00	35ab7320-99f5-4dec-8472-b78847210586	35ab7320-99f5-4dec-8472-b78847210586	2	[{"changed": {"fields": ["address"]}}]	13	1
133	2017-10-05 22:44:34.890151+00	7f8ef9d1-83ec-4da5-a301-c0689a1306fb	7f8ef9d1-83ec-4da5-a301-c0689a1306fb	2	[{"changed": {"fields": ["address"]}}]	13	1
134	2017-10-05 22:44:49.31208+00	92cc429a-1507-4853-8deb-45ddf1b7f6e0	92cc429a-1507-4853-8deb-45ddf1b7f6e0	2	[{"changed": {"fields": ["address"]}}]	13	1
135	2017-10-05 22:45:02.523049+00	5abe7cf8-1fc5-4575-8efe-717a42330ef6	5abe7cf8-1fc5-4575-8efe-717a42330ef6	2	[{"changed": {"fields": ["address"]}}]	13	1
136	2017-10-06 17:58:07.160708+00	1	Proyecto Pance	2	[{"changed": {"fields": ["about", "image"]}}]	14	1
137	2017-10-19 19:10:45.23469+00	25	prueba	1	[{"added": {}}]	4	1
138	2017-10-20 14:25:29.329198+00	afe7877b-9e15-46c5-8b38-7650289af7ab	afe7877b-9e15-46c5-8b38-7650289af7ab	2	[{"changed": {"fields": ["description"]}}]	13	1
139	2017-10-20 14:26:39.098071+00	aba05bd3-1be9-4c17-9977-54620f833123	aba05bd3-1be9-4c17-9977-54620f833123	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
140	2017-10-20 14:28:54.819639+00	28ac800f-8947-467a-ba94-9cb7059a7f5c	28ac800f-8947-467a-ba94-9cb7059a7f5c	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
141	2017-10-20 14:30:19.210307+00	5de6531a-f00a-4f61-bb6d-06f95301e956	5de6531a-f00a-4f61-bb6d-06f95301e956	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
142	2017-10-20 14:31:39.796587+00	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	9d6247f6-ea9c-446f-9c7b-2a6bda68c1de	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
143	2017-10-20 14:32:40.11441+00	e910f31d-5149-4560-a9d5-2c3da11c1076	e910f31d-5149-4560-a9d5-2c3da11c1076	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
144	2017-10-20 14:34:05.42068+00	0298545a-b981-49d0-a3a1-87f9282369d3	0298545a-b981-49d0-a3a1-87f9282369d3	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
145	2017-10-20 14:36:49.533236+00	e9993153-88fc-4b6d-8f98-82f1179a6f48	e9993153-88fc-4b6d-8f98-82f1179a6f48	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
146	2017-10-20 14:37:59.073331+00	27bbd7c8-446b-45ad-b021-9c1f623aab3f	27bbd7c8-446b-45ad-b021-9c1f623aab3f	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
147	2017-10-20 14:38:57.011745+00	c0470d33-114c-4dc6-859b-ff24fa01b318	c0470d33-114c-4dc6-859b-ff24fa01b318	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
148	2017-10-20 14:44:36.88847+00	8183afe6-0446-48bb-9881-8b7de0b785f2	8183afe6-0446-48bb-9881-8b7de0b785f2	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
149	2017-10-20 14:48:41.159949+00	d09dd013-a703-4dbc-a776-fa2759e72589	d09dd013-a703-4dbc-a776-fa2759e72589	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
150	2017-10-20 14:49:41.022105+00	d09dd013-a703-4dbc-a776-fa2759e72589	d09dd013-a703-4dbc-a776-fa2759e72589	2	[{"changed": {"fields": ["address"]}}]	13	1
151	2017-10-20 14:51:51.351501+00	ab0a53aa-f634-434e-b686-538bd95e54a3	ab0a53aa-f634-434e-b686-538bd95e54a3	2	[{"changed": {"fields": ["address", "description"]}}]	13	1
152	2017-10-20 15:55:39.939047+00	afe7877b-9e15-46c5-8b38-7650289af7ab	afe7877b-9e15-46c5-8b38-7650289af7ab	2	[{"changed": {"fields": ["description"]}}]	13	1
153	2017-11-30 14:53:13.740957+00	2	Proyecto Serrin	1	[{"added": {}}]	14	1
154	2017-11-30 14:54:21.840045+00	2	Proyecto Serrin	2	[{"changed": {"fields": ["image"]}}]	14	1
186	2017-11-30 19:40:17.382076+00	7	tierra	1	[{"added": {}}]	11	1
187	2017-12-05 22:06:03.736318+00	2	Proyecto Serrin	2	[{"changed": {"fields": ["image"]}}]	14	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 187, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	core	attachment
9	core	channeltype
10	core	membership
11	core	tag
12	core	dimension
13	core	record
14	core	channel
15	world	worldborder
16	world	veredascolombia
17	core	message
18	core	profile
50	mobile	audio
51	mobile	imagen
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 51, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-09-03 16:06:24.794603+00
2	auth	0001_initial	2017-09-03 16:06:25.119868+00
3	admin	0001_initial	2017-09-03 16:06:25.200991+00
4	admin	0002_logentry_remove_auto_add	2017-09-03 16:06:25.240715+00
5	contenttypes	0002_remove_content_type_name	2017-09-03 16:06:25.357062+00
6	auth	0002_alter_permission_name_max_length	2017-09-03 16:06:25.376031+00
7	auth	0003_alter_user_email_max_length	2017-09-03 16:06:25.3998+00
8	auth	0004_alter_user_username_opts	2017-09-03 16:06:25.427121+00
9	auth	0005_alter_user_last_login_null	2017-09-03 16:06:25.448165+00
10	auth	0006_require_contenttypes_0002	2017-09-03 16:06:25.451279+00
11	auth	0007_alter_validators_add_error_messages	2017-09-03 16:06:25.472455+00
12	auth	0008_alter_user_username_max_length	2017-09-03 16:06:25.533104+00
13	authtoken	0001_initial	2017-09-03 16:06:25.606083+00
14	authtoken	0002_auto_20160226_1747	2017-09-03 16:06:25.795887+00
15	core	0001_initial	2017-09-03 16:06:25.877178+00
16	core	0002_auto_20170421_1825	2017-09-03 16:06:26.263262+00
17	core	0003_auto_20170421_1841	2017-09-03 16:06:26.305843+00
18	core	0004_auto_20170427_0251	2017-09-03 16:06:26.399799+00
19	core	0005_auto_20170504_0340	2017-09-03 16:06:26.565227+00
20	core	0006_auto_20170504_0556	2017-09-03 16:06:26.594759+00
21	core	0007_auto_20170531_0013	2017-09-03 16:06:26.644871+00
22	core	0008_auto_20170531_0014	2017-09-03 16:06:26.656145+00
23	core	0009_channel_dimensions	2017-09-03 16:06:26.712124+00
24	core	0010_auto_20170531_0022	2017-09-03 16:06:26.811576+00
25	core	0011_auto_20170531_0116	2017-09-03 16:06:26.858824+00
26	core	0012_auto_20170531_0117	2017-09-03 16:06:26.905112+00
27	core	0013_auto_20170531_0117	2017-09-03 16:06:26.954023+00
28	core	0014_channel_slug	2017-09-03 16:06:26.996213+00
29	core	0015_ojovozrecord_country	2017-09-03 16:06:27.038932+00
30	core	0016_ojovozrecord_audio	2017-09-03 16:06:27.082897+00
31	core	0017_auto_20170716_2106	2017-09-03 16:06:27.309956+00
32	core	0018_auto_20170725_0345	2017-09-03 16:06:27.391892+00
33	core	0019_auto_20170814_0522	2017-09-03 16:06:27.475321+00
34	core	0020_auto_20170814_1554	2017-09-03 16:06:27.609296+00
35	core	0021_channel_image	2017-09-03 16:06:27.646816+00
36	core	0022_auto_20170820_0036	2017-09-03 16:06:27.740057+00
37	core	0023_auto_20170820_0043	2017-09-03 16:06:27.866341+00
38	core	0024_record_tags	2017-09-03 16:06:27.915578+00
39	core	0025_auto_20170901_0417	2017-09-03 16:06:28.165241+00
40	core	0026_auto_20170901_0423	2017-09-03 16:06:28.325307+00
41	core	0027_auto_20170901_0431	2017-09-03 16:06:28.488193+00
42	core	0028_remove_record_tags	2017-09-03 16:06:28.517504+00
43	core	0029_record_tags	2017-09-03 16:06:28.568349+00
44	sessions	0001_initial	2017-09-03 16:06:28.595102+00
45	world	0001_initial	2017-09-03 16:06:28.614907+00
46	world	0002_veredascol	2017-09-03 16:06:28.636274+00
47	world	0003_veredascolombia	2017-09-03 16:06:28.65819+00
48	world	0004_auto_20170713_1908	2017-09-03 16:06:28.683451+00
49	world	0005_auto_20170713_1927	2017-09-03 16:06:28.705912+00
50	world	0006_delete_veredascol	2017-09-03 16:06:28.718524+00
51	world	0007_auto_20170714_0455	2017-09-03 16:06:28.739678+00
52	world	0008_auto_20170714_1457	2017-09-03 16:06:28.761804+00
53	core	0030_message_profile	2017-09-25 22:29:44.787943+00
86	core	0030_auto_20170927_0344	2017-10-01 20:23:10.51153+00
87	core	0031_auto_20170927_0359	2017-10-01 20:47:35.168142+00
88	core	0032_merge_20171001_2035	2017-10-01 20:47:35.17281+00
89	core	0031_auto_20171001_2032	2018-02-25 17:15:48.22311+00
90	mobile	0001_initial	2018-02-25 17:15:48.86162+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_migrations_id_seq', 90, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
wcr9smdjn60nu3407tr8jswhtxm9hzmr	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-09-24 21:08:24.152081+00
ap48t9zdrpqyolfmdnhkhcs1edf02qyb	MmM1NWI2OWQzYTk3NmRkYmUzZjViMzk1OGM5OWUxNTE1MGM5ZjM4YTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ODIwNTQwM2UzMmQ3YWZlZDU1ZjQ1NGRkNTg1ZjJkZTJlMjQ3OWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-09-24 21:18:13.526555+00
1r9xc3nd9qapi5qcp2d5giohj8xsb18k	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-10-15 20:48:58.450585+00
fga82nkskjv9bpps0gvoyk7xp41nho1a	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-10-15 20:49:31.164204+00
vilvwhfujrmd1lcsx6odfbrqdnih006o	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-10-15 20:49:54.828416+00
k77lu4xhelsyncp5gr1vwr8qoam4eerc	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-10-15 20:50:53.479736+00
vnmz3gosbei5sgnuasl7zzxkp75ilef7	MzY2MGNjOGU2ZjkwMmNkZjI0MzZmNmU0NGUxNWY2YjU3MWViN2FkMjp7fQ==	2017-10-15 20:51:34.100623+00
17k3u7wxi8tgu27d2ty3s73llk15181a	MmM1NWI2OWQzYTk3NmRkYmUzZjViMzk1OGM5OWUxNTE1MGM5ZjM4YTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ODIwNTQwM2UzMmQ3YWZlZDU1ZjQ1NGRkNTg1ZjJkZTJlMjQ3OWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-15 21:25:15.341274+00
ycl6u6uebeg2pnrx4m2h124ppm1d4xic	MmM1NWI2OWQzYTk3NmRkYmUzZjViMzk1OGM5OWUxNTE1MGM5ZjM4YTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk2ODIwNTQwM2UzMmQ3YWZlZDU1ZjQ1NGRkNTg1ZjJkZTJlMjQ3OWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-17 16:13:34.075502+00
\.


--
-- Data for Name: mobile_audio; Type: TABLE DATA; Schema: public; Owner: root
--

COPY mobile_audio (id, channel, audio) FROM stdin;
\.


--
-- Name: mobile_audio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('mobile_audio_id_seq', 1, false);


--
-- Data for Name: mobile_imagen; Type: TABLE DATA; Schema: public; Owner: root
--

COPY mobile_imagen (id, channel, img) FROM stdin;
\.


--
-- Name: mobile_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('mobile_imagen_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- Data for Name: world_veredascolombia; Type: TABLE DATA; Schema: public; Owner: root
--

COPY world_veredascolombia (id, dptompio, codigo_ver, nom_dep, nomb_mpio, nombre_ver, vigencia, fuente, descripcio, seudonimos, area_ha, cod_dpto, shape_area, shape_len, geom) FROM stdin;
\.


--
-- Name: world_veredascolombia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('world_veredascolombia_id_seq', 1, false);


--
-- Data for Name: world_worldborder; Type: TABLE DATA; Schema: public; Owner: root
--

COPY world_worldborder (id, name, area, pop2005, fips, iso2, iso3, un, region, subregion, lon, lat, mpoly) FROM stdin;
\.


--
-- Name: world_worldborder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('world_worldborder_id_seq', 1, false);


SET search_path = tiger, pg_catalog;

--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY geocode_settings  FROM stdin;
debug_geocode_address	false	boolean	debug	outputs debug information in notice log such as queries when geocode_addresss is called if true
debug_geocode_intersection	false	boolean	debug	outputs debug information in notice log such as queries when geocode_intersection is called if true
debug_normalize_address	false	boolean	debug	outputs debug information in notice log such as queries and intermediate expressions when normalize_address is called if true
debug_reverse_geocode	false	boolean	debug	if true, outputs debug information in notice log such as queries and intermediate expressions when reverse_geocode
reverse_geocode_numbered_roads	0	integer	rating	For state and county highways, 0 - no preference in name, 1 - prefer the numbered highway name, 2 - prefer local state/county name
use_pagc_address_parser	false	boolean	normalize	If set to true, will try to use the pagc_address normalizer instead of tiger built one
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_gaz  FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_lex  FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY pagc_rules  FROM stdin;
\.


SET search_path = topology, pg_catalog;

--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology  FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY layer  FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: core_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_attachment
    ADD CONSTRAINT core_attachment_pkey PRIMARY KEY (id);


--
-- Name: core_channel_dimensions_channel_id_dimension_id_68491a47_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_channel_dimensions
    ADD CONSTRAINT core_channel_dimensions_channel_id_dimension_id_68491a47_uniq UNIQUE (channel_id, dimension_id);


--
-- Name: core_channel_dimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_channel_dimensions
    ADD CONSTRAINT core_channel_dimensions_pkey PRIMARY KEY (id);


--
-- Name: core_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_channel
    ADD CONSTRAINT core_channel_pkey PRIMARY KEY (id);


--
-- Name: core_channelsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_channeltype
    ADD CONSTRAINT core_channelsettings_pkey PRIMARY KEY (id);


--
-- Name: core_dimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_dimension
    ADD CONSTRAINT core_dimensions_pkey PRIMARY KEY (id);


--
-- Name: core_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_membership
    ADD CONSTRAINT core_membership_pkey PRIMARY KEY (id);


--
-- Name: core_message_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_message
    ADD CONSTRAINT core_message_pkey PRIMARY KEY ("uniqueID");


--
-- Name: core_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_profile
    ADD CONSTRAINT core_profile_pkey PRIMARY KEY (id);


--
-- Name: core_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_profile
    ADD CONSTRAINT core_profile_user_id_key UNIQUE (user_id);


--
-- Name: core_record_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_record
    ADD CONSTRAINT core_record_pkey PRIMARY KEY ("uniqueID");


--
-- Name: core_record_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_record_tags
    ADD CONSTRAINT core_record_tags_pkey PRIMARY KEY (id);


--
-- Name: core_record_tags_record_id_tag_id_c6bf7bed_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_record_tags
    ADD CONSTRAINT core_record_tags_record_id_tag_id_c6bf7bed_uniq UNIQUE (record_id, tag_id);


--
-- Name: core_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY core_tag
    ADD CONSTRAINT core_tag_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mobile_audio_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY mobile_audio
    ADD CONSTRAINT mobile_audio_pkey PRIMARY KEY (id);


--
-- Name: mobile_imagen_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY mobile_imagen
    ADD CONSTRAINT mobile_imagen_pkey PRIMARY KEY (id);


--
-- Name: world_veredascolombia_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY world_veredascolombia
    ADD CONSTRAINT world_veredascolombia_pkey PRIMARY KEY (id);


--
-- Name: world_worldborder_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY world_worldborder
    ADD CONSTRAINT world_worldborder_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: core_attachment_author_id_a283fa81; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_attachment_author_id_a283fa81 ON core_attachment USING btree (author_id);


--
-- Name: core_attachment_related_record_id_dc9c8e20; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_attachment_related_record_id_dc9c8e20 ON core_attachment USING btree (related_record_id);


--
-- Name: core_channel_dimensions_channel_id_57971c83; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_channel_dimensions_channel_id_57971c83 ON core_channel_dimensions USING btree (channel_id);


--
-- Name: core_channel_dimensions_dimension_id_b3b4fd1d; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_channel_dimensions_dimension_id_b3b4fd1d ON core_channel_dimensions USING btree (dimension_id);


--
-- Name: core_channel_mapCenterLocation_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX "core_channel_mapCenterLocation_id" ON core_channel USING gist ("mapCenterLocation");


--
-- Name: core_channel_slug_834f079d; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_channel_slug_834f079d ON core_channel USING btree (slug);


--
-- Name: core_channel_slug_834f079d_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_channel_slug_834f079d_like ON core_channel USING btree (slug varchar_pattern_ops);


--
-- Name: core_dimension_slug_dfc9d62b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_dimension_slug_dfc9d62b ON core_dimension USING btree (slug);


--
-- Name: core_dimension_slug_dfc9d62b_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_dimension_slug_dfc9d62b_like ON core_dimension USING btree (slug varchar_pattern_ops);


--
-- Name: core_membership_channel_id_2f2bfbff; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_membership_channel_id_2f2bfbff ON core_membership USING btree (channel_id);


--
-- Name: core_membership_user_id_f9b5780b; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_membership_user_id_f9b5780b ON core_membership USING btree (user_id);


--
-- Name: core_message_author_id_e56399bc; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_message_author_id_e56399bc ON core_message USING btree (author_id);


--
-- Name: core_message_channel_id_28a6aa8a; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_message_channel_id_28a6aa8a ON core_message USING btree (channel_id);


--
-- Name: core_message_record_id_269214b5; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_message_record_id_269214b5 ON core_message USING btree (record_id);


--
-- Name: core_record_author_id_b50b47ac; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_record_author_id_b50b47ac ON core_record USING btree (author_id);


--
-- Name: core_record_channel_id_5b0b6a0d; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_record_channel_id_5b0b6a0d ON core_record USING btree (channel_id);


--
-- Name: core_record_location_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_record_location_id ON core_record USING gist (location);


--
-- Name: core_record_tags_record_id_ce2ebf35; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_record_tags_record_id_ce2ebf35 ON core_record_tags USING btree (record_id);


--
-- Name: core_record_tags_tag_id_45d445bc; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_record_tags_tag_id_45d445bc ON core_record_tags USING btree (tag_id);


--
-- Name: core_tag_related_channel_id_f2670d5c; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_tag_related_channel_id_f2670d5c ON core_tag USING btree (related_channel_id);


--
-- Name: core_tag_slug_466bcce3; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_tag_slug_466bcce3 ON core_tag USING btree (slug);


--
-- Name: core_tag_slug_466bcce3_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX core_tag_slug_466bcce3_like ON core_tag USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: world_veredascolombia_geom_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX world_veredascolombia_geom_id ON world_veredascolombia USING gist (geom);


--
-- Name: world_worldborder_mpoly_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX world_worldborder_mpoly_id ON world_worldborder USING gist (mpoly);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_attachment_author_id_a283fa81_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_attachment
    ADD CONSTRAINT core_attachment_author_id_a283fa81_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_attachment_related_record_id_dc9c8e20_fk_core_reco; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_attachment
    ADD CONSTRAINT core_attachment_related_record_id_dc9c8e20_fk_core_reco FOREIGN KEY (related_record_id) REFERENCES core_record("uniqueID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_channel_dimensi_dimension_id_b3b4fd1d_fk_core_dime; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_channel_dimensions
    ADD CONSTRAINT core_channel_dimensi_dimension_id_b3b4fd1d_fk_core_dime FOREIGN KEY (dimension_id) REFERENCES core_dimension(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_channel_dimensions_channel_id_57971c83_fk_core_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_channel_dimensions
    ADD CONSTRAINT core_channel_dimensions_channel_id_57971c83_fk_core_channel_id FOREIGN KEY (channel_id) REFERENCES core_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_membership_channel_id_2f2bfbff_fk_core_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_membership
    ADD CONSTRAINT core_membership_channel_id_2f2bfbff_fk_core_channel_id FOREIGN KEY (channel_id) REFERENCES core_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_membership_user_id_f9b5780b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_membership
    ADD CONSTRAINT core_membership_user_id_f9b5780b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_message_author_id_e56399bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_message
    ADD CONSTRAINT core_message_author_id_e56399bc_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_message_channel_id_28a6aa8a_fk_core_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_message
    ADD CONSTRAINT core_message_channel_id_28a6aa8a_fk_core_channel_id FOREIGN KEY (channel_id) REFERENCES core_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_message_record_id_269214b5_fk_core_record_uniqueID; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_message
    ADD CONSTRAINT "core_message_record_id_269214b5_fk_core_record_uniqueID" FOREIGN KEY (record_id) REFERENCES core_record("uniqueID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_profile_user_id_bf8ada58_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_profile
    ADD CONSTRAINT core_profile_user_id_bf8ada58_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_record_author_id_b50b47ac_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_record
    ADD CONSTRAINT core_record_author_id_b50b47ac_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_record_channel_id_5b0b6a0d_fk_core_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_record
    ADD CONSTRAINT core_record_channel_id_5b0b6a0d_fk_core_channel_id FOREIGN KEY (channel_id) REFERENCES core_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_record_tags_record_id_ce2ebf35_fk_core_record_uniqueID; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_record_tags
    ADD CONSTRAINT "core_record_tags_record_id_ce2ebf35_fk_core_record_uniqueID" FOREIGN KEY (record_id) REFERENCES core_record("uniqueID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_record_tags_tag_id_45d445bc_fk_core_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_record_tags
    ADD CONSTRAINT core_record_tags_tag_id_45d445bc_fk_core_tag_id FOREIGN KEY (tag_id) REFERENCES core_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_tag_related_channel_id_f2670d5c_fk_core_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_tag
    ADD CONSTRAINT core_tag_related_channel_id_f2670d5c_fk_core_channel_id FOREIGN KEY (related_channel_id) REFERENCES core_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

