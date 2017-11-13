-- ignore NOTICE
SET client_min_messages TO WARNING;

-- create View to fill street and filter useless tupels
CREATE MATERIALIZED VIEW IF NOT EXISTS osm_associated_with_street AS
SELECT *
FROM osm_associated AS asso
WHERE house_polygon_way IS NOT NULL 
   OR house_polygon_rel IS NOT NULL 
   OR house_point IS NOT NULL
WITH NO DATA;

-- Update view
REFRESH MATERIALIZED VIEW osm_associated_with_street;

-- Update addresses
UPDATE import.osm_addresses AS addr
SET "addr:street" = asso.name,
	"source:addr:street" = asso.osm_id
FROM osm_associated_with_street AS asso
WHERE asso.name IS NOT NULL AND "addr:street" IS NULL
  AND ( (addr.class='point' AND addr.osm_id=asso.house_point) OR
        (addr.class='polygon' AND addr.osm_id=asso.house_polygon_way) OR
		(addr.class='polygon' AND addr.osm_id=asso.house_polygon_rel) );

ANALYSE import.osm_addresses;
