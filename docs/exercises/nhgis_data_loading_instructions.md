# NHGIS Data Loading Instructions

As of February 4, 2025, Census FTP servers are partially shutdown. The Census API is not affected, so accessing demographic data is still possible, but downloading GIS files is not.

I have obtained the GIS files and the demographic data for the exercise [Map-Making with Tmap v4](map-making_with_tmap4.md) from National Historical GIS (<https://www.nhgis.org/>). I'm not going to explain all of this code here, but after you run it, you should have a spatial data frame that exactly mimics the result of the **tidycensus** `get_decennial()` call required for this exercise.

**NOTE:** The NHGIS dataset includes all tracts in the United States. You will filter the result to get only the tracts in the county you are mapping for this exercise. The final line (`rm(tmp)`{.r}) deletes the rest of the United States. Do this before closing your project, so that the `.RData` file is not massive.

1. Install **ipumsr**, a package to import data downloaded from NHGIS. **This only needs to be done once, so is not included in the code below**.
    `install.packages("ipumsr")`{.r}
2. Download the files `nhgis0048_csv.zip` and `nhgis0048_shape.zip` from Canvas. **Do not unzip them.** Note that `nhgis0048_shape.zip` is large (464 MB), so if you don't have the space on your personal laptop, you will have to do this exercise on a lab computer.
3. Run the code below, with the following changes:
    * Change `data_dir` to the folder on your computer where you have downloaded the files.
    * Change `county_fips` to the five-digit FIPS code for the largest county in your state. Use the [MCDC Geographic Codes Lookup](https://mcdc.missouri.edu/applications/geocodes/) web page to find the FIPS for your county.


```r
library(ipumsr)

# Change these variables
data_dir = "FOLDER_WITH_NHGIS_FILES"
county_fips = "FIPS_CODE_FOR_YOUR_COUNTY"

nhgis_vars = c(
  geoid = "GEOCODE",
  name = "NAME",
  Total = "U7L001", # <- This is "P5_001N" in the Census API
  White = "U7L003",
  Black = "U7L004",
  AIAN = "U7L005",
  Asian = "U7L006",
  HIPI = "U7L007",
  Other = "U7L008",
  `Two or More` = "U7L009",
  Hispanic = "U7L010"
)

# Load attribute data
nhgis_data = read_nhgis(
  paste0(data_dir, "nhgis0048_csv.zip"),
  vars = nhgis_vars
)

# Load geometries
shp_data = read_ipums_sf(
  paste0(data_dir, "nhgis0048_shape.zip"),
  vars = c(geoid = "GEOID")
)

# Join on GEOID
tmp = ipums_shape_inner_join(nhgis_data, shp_data, by = "geoid")

# Give this variable a name you want to work with
# As demonstrated in class, I used zz_philly_race, for data for Philadelphia
my_county_data_frame = filter(tmp, str_sub(geoid, 1, 5) == county_fips)

# Remove the large data frame with the rest of the United States tracts
rm(tmp)
```
