-- Create schema and table for statistics

CREATE SCHEMA IF NOT EXISTS statistics;

CREATE TABLE IF NOT EXISTS statistics.road_addresses  (
    osm_id bigint,
    statedate timestamptz,
    count_addresses int DEFAULT NULL,
    count_roads int DEFAULT NULL,
    count_errors int DEFAULT NULL,
    CONSTRAINT road_addresses_pk PRIMARY KEY(osm_id,statedate)
);
