# Exercise: Spatial Joins

1. The subway station table in the PostGIS workshop shows what borough each station is in, but not the neigbhorhood. Use a spatial join to add the neighborhood name (only) from `nyc_neighborhoods` to *all* attributes of `nyc_subway_stations`.
2. Use a spatial join and an aggregate query to show the names and number of homicides of the 10 neighborhoods in New York City with the most homicides.
3. Use a spatial join and an aggregate query to show the street type and total length by type of all streets that are in or cross the East Village neigbhorhood.
4. Using the Natural Earth dataset, list the countries (`name` field) for all disputed areas that border on or overlap China. The borders of China can be obtained from the countries table. As a comparison, you may search the `note_brk` field for areas claimed by China. Do any other disputed areas turn up that didn't appear in the spatial join?
5. Use a spatial join and an aggregate query to show the total length of railroads by country in Europe.


