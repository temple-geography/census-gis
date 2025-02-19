# Exercise: Aggregating Tract-Level Estimates to Neighborhoods

Complete Ex 6.1 in *Exploring the U.S. Census* using data from 2023 for a neighborhood in a major city in your state. In a previous exercise, you identified the largest county in your state. The largest county is probably host to the largest city, or another major city in your state. You can pick any neighborhood that is comprised of at least three Census tracts. (If you find that no neighborhoods in your city satisfy this requirement, please show me your data so we can discuss what neighborhood you should work with.)

You may complete the exercise following the textbook instructions or using R. As with last week's exercise, if you complete the exercise in R, follow the textbook instructions for "Aggregating Tract-Level Estimates to Neighborhoods with Calc", but figure out how to do the steps in R instead. **Completing the exercise in R is optional.**

You will begin by identifying the tracts that approximate the chosen neigbhorhood. It will be easiest to explore the tracts and neighborhoods in QGIS. Neighborhoods are usually defined by social consensus, and not official administrative units. In class I will demonstrate how to do this for the textbook example of the Over-the-Rhine neighborhood in Cincinatti using data downloaded from the [Cincinatti Open Data Portal](https://data.cincinnati-oh.gov/), which I found by searching Google for "cincinatti open data". Before class, you might try to find a similar portal for your city, and download neighborhood boundaries and Census tracts. Note that while we usually download tracts directly from the Census servers, many local and state government open data portals will already have tracts extracted for their city or state. If you find you have trouble finding neighborhood boundaries for your city, I will help you search during class time.

The relevant table in the 2023 ACS is B07204 Geographical Mobility in the Past Year for Current Residence. Students completing the exercise in Calc can download this table from [https:\\data.census.gov](data.census.gov). Note that you *can* select geographies from different summary levels, so it is possible to download your city (search the Place geography) and your neighborhood's Census tracts in a single table. Students completing the exercise in R can use `get_acs()` to request the desired variables from `B07204`. Refer to <https://censusreporter.org/tables/B07204/> for the specific variables you will need for this exercse. Step 3 shows which variables you will be left with after deletion.

Note that some cities, such as Philadelphia, are coterminous with their counties. (That is, the City of Philadelphia has the same borders as Philadelphia County.) In such a case, the variable `BO7204_008` ("different city, same county") will be zero, because there is no part of the county that is not in the city. If that is the case, you should omit this variable from your analysis.

For Step #15, just use Cornell's ACS calculator. Do not try to do the formula in your spreadsheet or in R.

## Notes for Spreadsheet 

Do not use the `ROUND` function. Do not multiply by 100 to generate percentages. Instead, use cell formatting to display numbers as a percentage and to limit the number of decimal places shown.

## Notes for R Users

Conveniently, **tidycensus** has an `moe_sum()` function that can be used to calculate the margin of error on the sum of an estimate. Assume you have a data frame named `neighborhood_tracts`, with population estimate and MOE columns named `total` and `total_moe`. you can calculate the sum of estimates and the MOE of the sum as follows:

```r
neighborhood_pop = neighborhood_tracts %>%
  summarise(
    total = sum(total),
    total_moe = moe_sum(total_moe, total)
  )
```

**tidycensus** also has an `moe_prop()` function that can be used to calculate the margin of error of a proportion (percentage). Assume you have a data frame named `city`, with population and margin of error in `total`, `total_moe`, `same_house`, and `same_house_moe` columns. The inputs to this function should be the actual estimates and MOEs, *not* the percentages. You would calculate MOEs of the proportions as follows:

```r
philly_mobility = philly_mobility %>%
  mutate(
    pct_same_house = 100 * same_house / total,
    pct_same_house_moe = 100 * moe_prop(same_house, total, same_house_moe, total_moe)
  )
```

Note that if you want percentages instead of proportions, you should multiply by 100 *after* applying `moe_prop()`. 

Don't adjust the estimates or MOEs that you use as inputs, and don't try to use the percentage itself *in* the calculation. This is different from the formula shown in the textbook, which uses the proportion (percentage) in the MOE formula.

## Deliverables

Spreadsheet users:

1. A workbook containing the final spreadsheet with coefficients of variation, percentages, and MOE of the percentages for each category of household (same house different house, same city; etc.)
2. The result of the Cornell ACS calculator in Step #15. Is the difference in movers between this neighborhood and the city statistically significant?

R users:

1. An R script with all the code used for the exercise.
2. As a comment at the end of the script, paste in the result of evaluating the final data frame (this will be a snippet of the first few rows and variables).
3. As a comment at the end of the script, write about the result of the Cornell ACS calculator in Step #15. Is the difference in movers between this neighborhood and the city statistically significant?
