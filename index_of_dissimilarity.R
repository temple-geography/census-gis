# Load Packages
library(tmap)
library(tidyverse)
library(tidycensus)
library(sf)

## If using a public computer, run the following line with your API key
# census_api_key("REPLACE_WITH_YOUR_CENSUS_API_KEY") 

# Variables of interest: White, Black, Asian, Hispanic
race_vars = c("B03002_003", "B03002_004", "B03002_006", "B03002_012")

# Download state and tract-level data, rename columns, drop margins of error
sfStates = get_acs(
  geography = "state", variables = race_vars, endyear = 2015, 
  output = "wide", geometry = TRUE
)
sfStates = select(sfStates, state = GEOID, name = NAME, white = B03002_003E, 
       black = B03002_004E, asian = B03002_006E, hispanic = B03002_012E)
dfTracts = get_acs(
  geography = "tract", variables = race_vars, endyear = 2015, 
  output = "wide", state = sfStates$state
)
dfTracts = transmute(
  dfTracts, state = substr(GEOID, 1, 2), tract = GEOID, 
  name = NAME, white = B03002_003E, black = B03002_004E, asian = B03002_006E, 
  hispanic = B03002_012E
  )

# Calculate the index of dissilimarity (D)
dfStateD = 
  inner_join(dfTracts, sfStates, by = "state", suffix = c("_county", "_state")) %>%
    transmute(state, x = abs(white_county / white_state - black_county / black_state)) %>%
    group_by(state) %>%
    summarise(x = sum(x)) %>%
    transmute(state, D = x / 2)

# Join D back to state features
sfStates = inner_join(sfStates, dfStateD, by = "state")

# For mapping purposes, drop Alaska, Hawai'i, and Puerto Rico
sfLower48 = filter(sfStates, !state %in% c("02", "15", "72"))

# Map Index of Disimilarity
mapStateD = tm_shape(sfLower48) + 
  tm_fill(col = "D", palette = "Blues", style = "jenks", title=expression("Index of Disimilarity")) + 
  tm_layout(title= "Index of Disimilarity Between Black and White Polutions in the US", 
            title.position = c("center", "top"), inner.margins = c(0.1, 0.1, 0.15, 0.05)) + 
  tm_borders()
mapStateD

# Name and save the map
save_tmap(tm = mapStateD, filename="XXXXXXXX.png")
