-- ignore NOTICE
SET client_min_messages TO WARNING;

REFRESH MATERIALIZED VIEW import.county_city;
REFRESH MATERIALIZED VIEW import.state_city;
REFRESH MATERIALIZED VIEW import.state_county;
REFRESH MATERIALIZED VIEW import.country_state;
REFRESH MATERIALIZED VIEW import.city_list;
REFRESH MATERIALIZED VIEW import.city_list_country;
REFRESH MATERIALIZED VIEW import.city_postcode;
REFRESH MATERIALIZED VIEW import.city_suburb;
REFRESH MATERIALIZED VIEW import.city_roads;
REFRESH MATERIALIZED VIEW import.city_places;
