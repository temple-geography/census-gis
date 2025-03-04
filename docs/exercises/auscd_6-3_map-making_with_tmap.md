# Exercise: Map-Making with Tmap

🛠️ **UNDER CONSTRUCTION** 🛠️

You will create maps of racial demographics for the largest county in your state using the `tmap` package in R. As discussed in class, treat Hispanic/Latino of any race as a single group, and for all other races uses non-Hispanic only.

Based on [Analyzing US Census Data 6.3 Map-making with tmap](https://walker-data.com/census-r/mapping-census-data-with-r.html#map-making-with-tmap), you will make the following maps:

1. A choropleth map of a non-White racial/ethnic group present in your county.
2. A faceted choropleth of all significant race/ethnicity groups in your county.
3. A dot density map of significant race/ethnicity groups in your county.

Begin by using `get_decennial()` (2020) or `get_acs()` (2023) to identify the largest county (by population) in your state. Include this code in your script.

Determine what races are significantly present in your county by 

We are going to use an easier way of adding a basemap. Section 6.3.2 "Adding reference elements to a map" demonstrates using the Mapbox API to fetch basemap tiles, but this requires having a Mapbox API key, and also takes an extra step to fetch the tiles. Tmap 4.0 has a function, `tm_basemap()`, which allows you to add a basemap without needing an API key.
