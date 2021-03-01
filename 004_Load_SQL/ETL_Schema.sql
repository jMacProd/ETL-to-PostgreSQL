-- Consider adding drop "DROP TABLE IF EXISTS table_name;" if rqeuired
-- But then don't drop tables once csv data has been imported via jupyter notebook

--These are the basic tables that plot the keys for each item

-- -- Drop table if it already exists
-- DROP TABLE IF EXISTS departments CASCADE;
-- DROP TABLE IF EXISTS department_employees CASCADE;
-- DROP TABLE IF EXISTS department_managers CASCADE;
-- DROP TABLE IF EXISTS employees CASCADE;
-- DROP TABLE IF EXISTS salaries CASCADE;
-- DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE local_govt_areas (
	lga_id INT PRIMARY KEY,
	lga_name VARCHAR(30)
);


CREATE TABLE suburbs (
	postcode INT,
	suburb VARCHAR(30) PRIMARY KEY,
	lat DECIMAL,
	lon DECIMAL
);



CREATE TABLE crime (
	crime_id VARCHAR(5) PRIMARY KEY,
	crime_name VARCHAR
);




CREATE TABLE place (
	place_id INT PRIMARY KEY,
	place_type VARCHAR(30)
);


--Link LGA to suburb
CREATE TABLE lga_suburbs (
	lga_id INT,
	suburb VARCHAR(255),
	CONSTRAINT fk_lgaid
      FOREIGN KEY(lga_id)
	  REFERENCES local_govt_areas(lga_id)
	  ON DELETE SET NULL,
	CONSTRAINT fk_postcodelga
      FOREIGN KEY(suburb)  
	  REFERENCES suburbs(suburb)
	  ON DELETE SET NULL
);


-- Link Suburb to Crime
CREATE TABLE suburb_vs_crime (
	lga_name VARCHAR(255),
	postcode INT,
	suburb VARCHAR(255),
	crime_id VARCHAR(5),
	crime_name VARCHAR,
	average_incident INT,
	CONSTRAINT fk_postcodecrime
      FOREIGN KEY(suburb) 
	  REFERENCES suburbs(suburb)
	  ON DELETE SET NULL,
	CONSTRAINT fk_crimepostcode
      FOREIGN KEY(crime_id) 
	  REFERENCES crime(crime_id)
	  ON DELETE SET NULL
);


-- Link place type to Crime
CREATE TABLE place_vs_crime (
	place_id INT,
	crime_id VARCHAR(5),
	average_incident INT,
	CONSTRAINT fk_placecrime
      FOREIGN KEY(place_id) 
	  REFERENCES place(place_id)
	  ON DELETE SET NULL,
	CONSTRAINT fk_crimeplace
      FOREIGN KEY(crime_id) 
	  REFERENCES crime(crime_id)
	  ON DELETE SET NULL
);


-- Link suburb to Places type
CREATE TABLE suburb_vs_place (
	suburb VARCHAR,
	place_id INT,
	place_type_count INT,
	CONSTRAINT fk_postcodeplace
      FOREIGN KEY(suburb) 
	  REFERENCES suburbs(suburb)
	  ON DELETE SET NULL,
	CONSTRAINT fk_placepostcode
      FOREIGN KEY(place_id) 
	  REFERENCES place(place_id)
	  ON DELETE SET NULL
);


-- Select Tables



SELECT *
FROM local_govt_areas;

SELECT *
FROM suburbs;

SELECT *
FROM crime;

SELECT *
FROM place;

SELECT *
FROM lga_suburbs;

SELECT *
FROM suburb_vs_crime;

SELECT *
FROM place_vs_crime;

SELECT *
FROM suburb_vs_place;