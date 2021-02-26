-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hPcTGE
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "local_govt_areas" (
    "lga_id" INT   NOT NULL,
    "lga_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_local_govt_areas" PRIMARY KEY (
        "lga_id"
     )
);

CREATE TABLE "lga_suburbs" (
    "lga_id" INT   NOT NULL,
    "postcode" INT   NOT NULL,
    CONSTRAINT "pk_lga_suburbs" PRIMARY KEY (
        "lga_id","postcode"
     )
);

CREATE TABLE "suburbs" (
    "postcode" INT   NOT NULL,
    "suburb" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_suburbs" PRIMARY KEY (
        "postcode"
     )
);

CREATE TABLE "place_types" (
    "place_id" INT   NOT NULL,
    "place_type" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_place_types" PRIMARY KEY (
        "place_id"
     )
);

CREATE TABLE "crime_types" (
    "crime_id" VARCHAR(5)   NOT NULL,
    "crime_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_crime_types" PRIMARY KEY (
        "crime_id"
     )
);

CREATE TABLE "suburb_vs_crime" (
    "postcoe" INT   NOT NULL,
    "crime_id" VARCHAR(5)   NOT NULL,
    "crime_count" INT   NOT NULL
);

CREATE TABLE "place_type_vs_crime" (
    "place_id" INT   NOT NULL,
    "crime_id" VARCHAR(5)   NOT NULL,
    "average_incident" INT   NOT NULL
);

CREATE TABLE "suburb_vs_place_type" (
    "postcode" INT   NOT NULL,
    "place_id" INT   NOT NULL,
    "place_type_count" INT   NOT NULL
);

ALTER TABLE "lga_suburbs" ADD CONSTRAINT "fk_lga_suburbs_lga_id" FOREIGN KEY("lga_id")
REFERENCES "local_govt_areas" ("lga_id");

ALTER TABLE "lga_suburbs" ADD CONSTRAINT "fk_lga_suburbs_postcode" FOREIGN KEY("postcode")
REFERENCES "suburbs" ("postcode");

ALTER TABLE "suburb_vs_crime" ADD CONSTRAINT "fk_suburb_vs_crime_postcoe" FOREIGN KEY("postcoe")
REFERENCES "suburbs" ("postcode");

ALTER TABLE "suburb_vs_crime" ADD CONSTRAINT "fk_suburb_vs_crime_crime_id" FOREIGN KEY("crime_id")
REFERENCES "crime_types" ("crime_id");

ALTER TABLE "place_type_vs_crime" ADD CONSTRAINT "fk_place_type_vs_crime_place_id" FOREIGN KEY("place_id")
REFERENCES "place_types" ("place_id");

ALTER TABLE "place_type_vs_crime" ADD CONSTRAINT "fk_place_type_vs_crime_crime_id" FOREIGN KEY("crime_id")
REFERENCES "crime_types" ("crime_name");

ALTER TABLE "suburb_vs_place_type" ADD CONSTRAINT "fk_suburb_vs_place_type_postcode" FOREIGN KEY("postcode")
REFERENCES "suburbs" ("postcode");

ALTER TABLE "suburb_vs_place_type" ADD CONSTRAINT "fk_suburb_vs_place_type_place_id" FOREIGN KEY("place_id")
REFERENCES "place_types" ("place_id");

