# Exercise: Spatial Relationships

Answer the following questions using the New York City data from the Introduction to PostGIS Workshop.

1. Write a query to return a list of subway stations (`gid` and `name`) that are within 500 meters of another subway station. **Hint:** This will require a "self-join", where the `nyc_subway_stations` table will appear twice in the `FROM` clause of the query.
2. Write an aggregate query that returns the total length of all street segments that intersect a 500m buffer of the 7 train stop (check the `routes` column) at Grand Central station. Do *not* clip the street segments (i.e., do *not* use the `ST_Intersection` function). If a street segment is partially in the boundary, count its entire length.
3. Write a query that determines whether any census blocks are in more than one neighborhood. Make sure to use a function that does not count the block as "in" if it only shares a boundary with the neighborhood. **HINT:** Previewing the data in QGIS will help you know whether your query results make sense.
4. Write a query that returns the population of the Astoria-Long Island City neighborhood. The population data is in `nyc_census_blocks`. Assume that any block which partially shares area with the neighborhood is "in" that neighborhood.
5. Based on the answer to question 3, how confident are you in the population calculated in question 4? Do you expect the number to be exact, too high, or too low? Why?

