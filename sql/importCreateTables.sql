-- ignore NOTICE
SET client_min_messages TO WARNING;

-- create schema (and drop if exists)
DROP SCHEMA IF EXISTS  import CASCADE;
CREATE SCHEMA import;

-- osm_admin
CREATE TABLE import.osm_admin
(
  osm_id bigint,
  name text,
  admin_level integer,
  "ISO3166-1" text,
  geometry geometry,
  last_update timestamp(0) with time zone
);

-- osm_postcode
CREATE TABLE import.osm_postcode
(
  osm_id bigint,
  postal_code text,
  geometry geometry,
  last_update timestamp(0) with time zone
);

-- osm_places
CREATE TABLE import.osm_places
(
  osm_id bigint,
  class text,
  name text,
  type text,
  population bigint,
  geometry geometry,
  last_update timestamp(0) with time zone
);

-- osm_roads
CREATE TABLE import.osm_roads
(
  osm_id bigint,
  name text,
  highway text,
  "addr:suburb" text,
  geometry geometry,
  last_update timestamp(0) with time zone
);

-- osm_addresses
CREATE TABLE import.osm_addresses
(
  osm_id bigint,
  class text,
  "addr:country" text,
  "addr:city" text,
  "addr:postcode" text,
  "addr:street" text,
  "addr:housename" text,
  "addr:housenumber" text,
  "addr:suburb" text,
  "addr:place" text,
  "addr:hamlet" text,
  "source:addr:country" bigint,
  "source:addr:city" bigint,
  "source:addr:postcode" bigint,
  "source:addr:suburb" bigint,
  "source:addr:place" bigint,
  "source:addr:hamlet" bigint,
  "source:addr:street" bigint,
  geometry geometry,
  last_update timestamp(0) with time zone
);

