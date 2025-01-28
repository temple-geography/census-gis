# Exercise: Estimating Seasonal Populations

🛠️ **THIS ASSIGNMENT WAS RECENTLY EDITED. PLEASE BRING ERRORS TO MY ATTENTION** 🛠️

Complete Ex. 4.2 in *Exploring the U.S. Census* using data from 2023 for a resort/vacation area in your state.

Begin by finding an appropriate **place** to analyze (remember that "place" has a specific meaning in the Census). It should be one with a high proportion of seasonal occupancy. You can identify such a place in a couple of ways.

1. You could go to a state tourism website for your state. (For example, the official tourism website for Pennsylvania is <https://www.visitpa.com/>.) However, make sure to avoid major cities! Philadelphia may be a tourist destination, but it does not have a large seasonal population. Think more along the lines of a beach town or ski town.
2. Since you have some experience with `tidycensus`, you could use `get_acs()` to rank all the places in your state based on vacancy status. The variables you need are `B25004_006` - "For seasonal, recreational, or occasional use" and `B25004_001` - "Total vacant housing units". Choose any area with a high percentage of vacant units that are for seasonal use.

The ACS tables are the same in 2023 as 2016 (the year used in the textbook), and they have the same structure. Once you identify the **place** that you will analyze, download tables `B25002` (Occupancy Status), `B25004` (Vacancy Status), and `B25041` (Bedrooms) for your study area.

Do not use the `ROUND` function.

Write a paragraph discussing the implications of your analysis. How does this impact the demand on businesses, emergency services, and local amenities?

## Notes on the Textbook Instructions

1-4. Note that the file names are slightly different from the files provided for the exercises. They have the suffix `_data_with_overlays.csv` instead of `_with_ann.csv`. The column names are also different, and more intelligible than they are in the textbook files. They are composed of the table ID, column number, and "E" for estimate or "M" for margin of error. Refer to the metadata.csv file for each table to see what data is in each column.

5-6. Find the Average Family Size and Average Housing Size of your study area. You will also need total population, so check to show "Demographic" as well as "Social" subjects.

\7. Total population (cell B1), AHS (cell B6), and AFS (cell C6) come from the MCDC profile report. The number of seasonal units and the seasonal MOE comes from Table B25004 (Vacancy Status), which you downloaded from data.census.gov.

\10. The same notes regarding the import of Tables B25002 and B25004 apply to B25041.

\12. The exercise doesn't make clear where the 0.316 (31.6%) comes from. You need to calculate this by dividing the number of seasonal housing units (B25004_006E) by the total number of housing units (B25002_001E). Additionally, rather than type this value into each of 5 different cells, I recommend you put it in cell E1 and then reference this cell in your formula.

## Deliverables

Submit the spreadsheet completed for a resort/vacation area in your state. If you use Google Sheets, please download the spreadsheet in OpenDocument Spreadsheet (.ods) format. If you work in Excel, you may submit either ODS or Excel's native format (.xls or .xlsx).

Include the paragraph discussing the implications of your analysis either in spreadsheet, or as a separate PDF.
