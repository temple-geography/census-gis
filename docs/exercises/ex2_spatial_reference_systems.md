# Exercise: Spatial Reference Systems and Measurement

This assignment makes use of data from the Introduction to PostGIS Workshop (table names begin with `nyc_`) and Natural Earth Data (table names beging with `ne_`).

Make sure to pay attention to the units, and convert all distances to kilometers and all areas to square kilometers.

1. Create a query which measures the area of all the neighborhoods in the `nyc_neighborhoods` table. Write one query which displays the neighborhood name and the following areas:
    1. the area in the coordinate system as stored (UTM 18N)
    2. the area in New York State Plane Long Island (look up the appropriate SRID)
    3. the geodetic area using a geography cast
2. Create a query which calculates the distance from the 4/5/6 Grand Central Station stop to every neighborhood in `nyc_neighborhoods`. Use a subquery to select only the `geom` for Grand Central Station as one of the input parameters to the distance function. Write one query which displays the neighborhood name and the following distances:
    1. the distance in the coordinate system as stored (UTM 18N)
    2. the distance in New York State Plane Long Island (look up the appropriate SRID)
    3. the geodetic distance using a geography cast
3. Create a query which calculates distance from Philadelphia to the five most populous cities in the table `ne_10m_populated_places` (use the `pop_max` column for population size). Write one query which displays the city name and the following distances:
    1. the distance in the coordinate system as stored (decimal degrees, which will be useless)
    2. the distance in Web Mercator (which will also be useless)
    3. the geodetic distance using a geography cast


