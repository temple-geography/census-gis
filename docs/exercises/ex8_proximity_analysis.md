# Exercise: Proximity Analysis

The first three questions in this exercise use New York City data from the Introduction to PostGIS Workshop. Subsequent questions use world data from the Natural Earth data.

1. Using a KNN operator and a correlated subquery, create a query which lists the names of all subway stations and the nearest other subway station. **OPTIONAL:** Also display the distance between the stations. Since a correlated subquery can only return a single column, you will have to construct a "compound" column, either using string concatenation (easier) or the array constructor (harder).
2. Using a KNN operator and a lateral join, create a query which calculates the distance from every subway station to the nearest five other subway stations. List the station names and the distances in the output.
3. Create a query which calculate the average nearest distance from each NYC census blocks to subway stations for those blocks which are 45% or greater African-American. That is, your result should be *one* average nearest distance for the set of census blocks meeting the given demographic criteria. Then create the same query for NYC census blocks that are 45% or greater White and again for those that are 45% or greater Asian. 
4. Create a query which calculates distances from each city in the United States in the `ne_110m_populated_places` layer to the five nearest cities in *any* country. (That is, for some US cities, the nearest large city may be in Mexico or Canada.) List the cities and distances in the output.


