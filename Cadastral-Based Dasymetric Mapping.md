Overview
========

Data
====

The SpatiaLite database used for this exercise can be downloaded from <https://www.dropbox.com/s/3s4j4yo0dj6ip1c/hells_kitchen.sqlite?dl=0>.

Hell’s Kitchen is a neighborhood in New York City west of the Midtown central business district. Although people have been trying to rebrand it as “Clinton” for at least 20 years, it is still widely known as Hell’s Kitchen. It was for a long time a neighborhood of working class Irish, and has been experiencing development pressure from the growing demand for commercial space in Midtown, as well as residential gentrifcation.

We will be using data from New York City’s “MapPLUTO”, a GIS layer of tax parcels. This data is useful for our purposes because it includes several different area measurements, including lot area (`LotArea`) and area devoted to specific uses such as residential (`ResArea`), commercial (`ComArea`), retail (`RetailArea`), etc. In order to make the analysis simpler, I have extracted parcels just from Hell’s Kitchen. I have also included ACS 2014 census tracts with race data (Table B02001, although for this exercise we will only be using the total population filed `B02001e1`.) Add both of these tables, as well as `water_coastal` and `nyc_neighborhood` to your map.

Allocating Population to Tax Parcels
====================================

1.  We want to join the tract ID and population data to the parcels. Go to Vector→Data Management Tools→Join Attributes By Location. The target layer is the `parcel` layer, and the join layer is `acs2014_tract_race`. Call the output `parcel_tractid.shp`.
2.  In order to use Statistics By Categories, we need the `ResArea` field to be a floating point value. Therefore, use the Field Calculator to create a new field named `resarea2` of type “Decimal number (real)”. Set the expression to `to_real(ResArea)`. Save changes to the layer.
3.  Now calculate Statistics By Categories:

    -   Input vector layer: `parcel_tractid`
    -   Field to calculate statistics on: `resarea2`
    -   Field with categories: `geoid`

4.  Join the Statistics By Categories table to the `parcel` layer using the `GEOID` and `category` fields.
5.  Using the Field Calculator, create a new field `res_total`. Set the expression to `to_real(sum)`. Remember that this is the sum of `ResArea` by Census tract. You can now drop the join to the Statistics By Categories table.


