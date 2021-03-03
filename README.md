# ETL-Project

This project seeks to enable exploratory data analysis of the relationship (if any) between crimes committed and the profile of the suburb based on types of places, in the suburbs of the Greater Melbourne area. The data explores types of crimes and the average frequency per year and place types including liquor stores, police stations and parks. (The average is based on the frequency recorded for years ending from 2011 to 2020.)

The Extract-Transform-Load (ETL) process was utilised for its effectiveness in collating the raw datasets for analysis (extraction) from various sources, and applying numerous transformations on each dataset in order to be loaded into SQL as a relational database. The transformations “cleaned” the data into a normalised and consistent format to allow for importing into SQL and subsequently allow any user to perform various join analyses applicable to one’s needs.


## Project team <include personal github links or git hub places web bio?>
Tom Peddlesden
Heesu Ha
Welan Chu

## Status
* Project is finalised

## Run order for Jupyter Notebooks and pgadmin query file for establishing table schema

Directory: 001_Extract_Transform_Suburbs
* 01_scraping_melbourne_suburbs_heesu.ipynb
* 02_Obtaining postcodes for final suburb list.ipynb
* 03_output_suburbs_postcodes_for_sql.ipynb

Directory: 002_Extract_Transform_Google_Places
*  01_melb_no_types.ipynb
* 02_check_api_data.ipynb
* 03_places_types_output_for_sql.ipynb
* 04_suburb_place_types_output_for_sql.ipynb

Directory: 003_Extract_Transform_Crime_Data
* Crime - Transformation 1 - filtering out irrelevant data.ipynb
* Crime - Transformation 2 - Data Clean.ipynb
* Crime - Transformation 3 - exploratory data analysis.ipynb

Directoty: 004_Extract_Teansform_LGA_Suburb
* 01_creating_tables_for_sql_heesu_2_times_Output.ipynb

Directory: 005_Load_SQL
* 01_load_SQL.ipynb
* pdadmin file establishing table schema: ETL_Schema.sql


### Final Output
![Entity Relationship Digram](https://github.com/jMacProd/ETL-Project/005_Load_SQL/02_Entity Relationship Digram/EntityRelationshipDiagram.png)

## Navigating the repository:


## Technologies:
* Visual studio code - build basic structure and content of the site in html 
* Bootstrap 4.3.1 - establish overall responsive CCS framwork and style elemements
* ccs style sheet - utilised to create media queries and to style some smaller specific elements
* Python - version 3.6 Jupyter Notebok - read in existing csv dataset and covert to html table 
* Github pages - publish site



## Resources
* #https://www.geeksforgeeks.org/detect-and-remove-the-outliers-using-python/)
* 

## Notes

  
Please feel free to contact us!
