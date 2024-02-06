-- Creating table of green spaces in Maine --
-- Randome Queries to practice --
CREATE TABLE green_spaces (
id SERIAL PRIMARY KEY,
name VARCHAR (255),
location GEOMETRY(Point, 4326),
area_sq_m NUMERIC
);

INSERT INTO green_spaces (name, location, area_sq_m)
SELECT name, ST_Transform(ST_Centroid(way),4326)as Icon,
ST_Area(way)
FROM planet_osm_polygon
WHERE leisure = 'park';

--Query 1: total green space in Maine 
SELECT SUM(ST_Area(way)) as total_green_space_area
FROM planet_osm_polygon
WHERE leisure = 'park';

-- Query 2: Largest green space area in Maine
SELECT name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area DESC
LIMIT 1;

-- Query 3: Smallest green space area in Maine 
SELECT name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area ASC
LIMIT 1;

-- Query 4: Five largest green spaces in Maine
SELECT name, ST_Area(way) as area
FROM planet_osm_polygon
WHERE leisure = 'park'
ORDER BY area DESC
LIMIT 5;

-------------- To Create Table with Green Spaces in Maine --------

-- Green spaces exclusively located in the city of Portland, ME could not be selected using a query because there were only three parks with 
-- 'portland in their name --

CREATE TABLE portlandmanine_greenspaces (
id SERIAL PRIMARY KEY,
name VARCHAR (255),
location GEOMETRY(Point, 4326),
area_sq_m NUMERIC,
);

INSERT INTO portlandmanine_greenspaces (name, location, area_sq_m)
SELECT name, ST_Transform(ST_Centroid(way),4326)as Icon,
ST_Area(way)
FROM planet_osm_polygon
WHERE leisure = 'park'; 


