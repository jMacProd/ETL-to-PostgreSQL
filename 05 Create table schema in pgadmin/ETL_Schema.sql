-- Consider adding drop "DROP TABLE IF EXISTS table_name;" if rqeuired
-- But then don't drop tables once csv data has been imported via jupyter notebook

--These are the basic tables that plot the keys for each item

CREATE TABLE local_govt_areas (
	lga_id INT PRIMARY KEY,
	lga_name VARCHAR(30)
);

SELECT *
FROM local_govt_areas;

CREATE TABLE suburbs (
	postcode INT PRIMARY KEY,
	suburb VARCHAR(30)
);

SELECT *
FROM suburbs;


CREATE TABLE place_types (
	place_id INT PRIMARY KEY,
	place_type VARCHAR(30)
);

SELECT *
FROM place_types;

CREATE TABLE crime_types (
	crime_id VARCHAR(5) PRIMARY KEY,
	crime_name VARCHAR(30)
);

SELECT *
FROM crime_types;

--Link LGA to suburb
CREATE TABLE lga_suburbs (
	lga_id INT,
	postcode INT,
	CONSTRAINT fk_lgaid
      FOREIGN KEY(lga_id)
	  REFERENCES local_govt_areas(lga_id)
	  ON DELETE SET NULL,
	CONSTRAINT fk_postcodelga
      FOREIGN KEY(postcode)  
	  REFERENCES suburbs(postcode)
	  ON DELETE SET NULL
);

SELECT *
FROM lga_suburbs;

-- Link Suburb to Crime
CREATE TABLE suburb_vs_crime (
	postcode INT,
	crime_id VARCHAR(5),
	average_incident INT,
	CONSTRAINT fk_postcodecrime
      FOREIGN KEY(postcode) 
	  REFERENCES suburbs(postcode)
	  ON DELETE SET NULL,
	CONSTRAINT fk_crimepostcode
      FOREIGN KEY(crime_id) 
	  REFERENCES crime_types(crime_id)
	  ON DELETE SET NULL
);

SELECT *
FROM suburb_vs_crime;

-- Link place type to Crime
CREATE TABLE place_type_vs_crime (
	place_id INT,
	crime_id VARCHAR(5),
	average_incident INT,
	CONSTRAINT fk_placecrime
      FOREIGN KEY(place_id) 
	  REFERENCES place_types(place_id)
	  ON DELETE SET NULL,
	CONSTRAINT fk_crimeplace
      FOREIGN KEY(crime_id) 
	  REFERENCES crime_types(crime_id)
	  ON DELETE SET NULL
);

SELECT *
FROM place_type_vs_crime;


-- Link suburb to Places type
CREATE TABLE suburb_vs_place_type (
	postcode INT,
	place_id INT,
	place_type_count INT,
	CONSTRAINT fk_postcodeplace
      FOREIGN KEY(postcode) 
	  REFERENCES suburbs(postcode)
	  ON DELETE SET NULL,
	CONSTRAINT fk_placepostcode
      FOREIGN KEY(place_id) 
	  REFERENCES place_types(place_id)
	  ON DELETE SET NULL
);

SELECT *
FROM suburb_vs_place_type;