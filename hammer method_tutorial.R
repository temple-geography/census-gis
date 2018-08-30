# GETTING STARTED
library(tidyverse)
library(tidycensus)
library(stringr)
library(sf)
library(tmap)

## If using a public computer, run the following line with your API key
# census_api_key("REPLACE_WITH_YOUR_CENSUS_API_KEY") 

# Vector of variables from ACS table B25036-Tenure by Year Structure Built
year_built = paste("B25036", str_pad(1:23, 3, pad = "0"), sep = "_")

# LOADING, CREATING, AND WORKING WITH TRACT DATA
# Import ACS Tract Data 
sfTracts = get_acs(...)

# Calculate Decadal Housing Units
sfTracts = transmute(
  sfTracts, GEOID, NAME, 
  county_fips = substr(GEOID, 1, 5),
  tract_est_1970 = B25036_011E + B25036_010E + B25036_009E + B25036_008E + B25036_021E + B25036_020E + B25036_019E + B25036_018E, 
  tract_est_1980 = tract_est_1970 + B25036_007E + B25036_017E, 
  tract_est_1990 = ..., 
  tract_est_2000 = ..., 
  tract_est_2010 = ...
)

# Use Grouping to Estimate County Housing Units
dfTracts = as.data.frame(sfTracts) %>%
  group_by(county_fips) %>%
  transmute(
    GEOID, 
    county_est_1970 = sum(tract_est_1970), 
    county_est_1980 = ...,
    county_est_1990 = ...,
    county_est_2000 = ...,
    county_est_2010 = ...
    ) %>%
  ungroup() %>%
  select(-county_fips)

# Read in county-level data from NHGIS
filename = "..."
dfCounties = read_csv(filename)

# Rename county columns for easier use
dfCounties = transmute(
  dfCounties, county_fips = paste(STATEFP, COUNTYFP, sep = ""),
  county_1970 = A41AA1970, county_1980 = A41AA1980, county_1990 = A41AA1990, 
  county_2000 = A41AA2000, county_2010 = A41AA2010
)

# JOINING AND CALCULATING THE ADJUSTMENT VALUE
x = sfTracts %>% 
  # Inner join the dfTracts table, which has the county estimates
  inner_join(...) %>%
  # Inner join the dfCounties table, which has the actual county housing counts
  inner_join(...) %>%
  # Calculate adjusted tract level housing counts
  mutate(
    tract_adj_1970 = tract_est_1970 * county_1970 / county_est_1970, 
    tract_adj_1980 = ..., 
    tract_adj_1990 = ...,
    tract_adj_2000 = ...,
    tract_adj_2010 = ...
    ) 

y = filter(x, county_fips == "42101")
y = mutate(y, growth_1970_2010 = 100 * (tract_adj_2010 - tract_adj_1970) / tract_adj_1970)
# Map Urban Growth
mapHousing = tm_shape(y) + 
  tm_fill(
    col = c("tract_adj_2010", "tract_adj_1970"), palette = "Blues", style = "jenks", 
    title=expression("Urban Growth")
    ) 
mapHousing = tm_shape(y) + 
  tm_fill(
    col = c("tract_adj_2010", "growth_1970_2010"), 
    palette = c("RdYlGn"), style = "jenks", 
    title=expression("Urban Growth")
  ) 

mapHousing

save_tmap(tm = mapHousing, filename="FIGURE_NAME.jpeg")
