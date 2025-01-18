# Exercise: Relating Group Quarters and Rural Categories

You will complete the analysis of Ex. 5.1 in *Exploring the U.S. Census* using data from 2020 for your chosen state.

The exercise is "Relating Group Quarters and Rural Categories with Calc". **Graduate students must complete the exercise using R.** Undergraduates are encouraged to complete the exercise using R as well.

Rural-urban definitions have been updated since 2013. Please download the [2023 Rural-Urban Continuum Codes](https://ers.usda.gov/sites/default/files/_laserfiche/DataFiles/53251/Ruralurbancontinuumcodes2023.csv?v=79750). (If this link doesn't work, search for "USDA RUCC" to find them.)

The relevant table in the 2020 Census is P17 HOUSEHOLD TYPE (INCLUDING LIVING ALONE) BY RELATIONSHIP. Students completing the exercise in Calc can download this table from data.census.gov. Students completing the exercise in R can use `get_decennial()` to just request variables `P0170001` (Total population) and `P0170030` (Institutionalized population).

In addition to the tables produced by your analysis, create a choropleth map of the percent of institutionalized population in each county. Label each county. Drop the " County, <State Name>" from the end of each county. E.g. in Pennsylvania you would want the labels to read "Montgomery" and "Chester" isntead "Montgomery County, Pennsylvania" and "Chester County, Pennsylvania". Spreadsheet users should create the map in QGIS, while R users should create the map using the `tmap` package.

## Notes for Spreadsheet Users

Do not use the `ROUND` function. Do not multiply by 100 to generate percentages. Instead, use cell formatting to display numbers as a percentage and to limit the number of decimal places shown.

## Notes for R Users

In Step 7 "Calculate ranks", you can use the R function `rank()` to rank each column. `rank()` defaults to ascending order (that is, 10 is treated as a "higher" rank than 20). You can rank the counties in descending order of population (so that larger counties are ranked higher) using `rank(desc(<column_name>))`.

You will be able to skip Step 8 "Modify GEOID codes", because `get_decennial()` returns GEOIDs in the desired format.

## Deliverables

Spreadsheet users:

1. A workbook containing the final counties table with population rankings and joined RUCCs, and the pivot table showing summary data by RUCC.
2. A choropleth map with title, your name, data sources, and legend, exported as a PDF from QGIS.

R users:

1. An R script with all code used for the exercises.
2. An exported CSV of the pivot table showing summary data by RUCC.
3. An exported PNG of your choropleth map with title and legend.
