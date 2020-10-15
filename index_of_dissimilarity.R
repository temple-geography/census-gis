# Load Packages
library(tmap)
library(tidyverse)
library(tidycensus)
library(sf)

## Optionally, load API key from source file so that you don't have to include
## key in your code
# source("census_api_key.R")

## If using a public computer, run the following line with your API key
# census_api_key("REPLACE_WITH_YOUR_CENSUS_API_KEY") 

# Variables of interest: Total, White, Black, Asian, Hispanic
race_vars = c("B03002_001", "B03002_003", "B03002_004", "B03002_006", "B03002_012")

# Download state and tract-level data, rename columns, drop margins of error
sfStates = get_acs(
  geography = "state", variables = race_vars, year = 2015, 
  output = "wide", geometry = TRUE
)
sfStates = select(
  sfStates, state = GEOID, name = NAME, 
  total = B03002_001E, white = B03002_003E, black = B03002_004E, 
  asian = B03002_006E, hispanic = B03002_012E
)
dfTracts = get_acs(
  geography = "tract", variables = race_vars, year = 2015, 
  output = "wide", state = sfStates$state
)
dfTracts = transmute(
  dfTracts, state = substr(GEOID, 1, 2), tract = GEOID, name = NAME, 
  total = B03002_001E, white = B03002_003E, black = B03002_004E, 
  asian = B03002_006E, hispanic = B03002_012E
)

# Calculate the index of dissilimarity (D)
dfStateD = 
  inner_join(dfTracts, sfStates, by = "state", suffix = c("_tract", "_state")) %>%
    transmute(state, x = abs(white_tract / white_state - black_tract / black_state)) %>%
    group_by(state) %>%
    summarise(x = sum(x)) %>%
    transmute(state, D = x / 2)

# Join D back to state features
sfStates = stStates %>%
  as.data.frame() %>%
  inner_join(dfStateD, by = "state") %>% st_sf()

# Is segregation influenced by the proportion of Black population?
ggplot(sfStates, mapping = aes(x = black / total, y = D)) +
  geom_point() +
  geom_smooth() + 
  geom_text(aes(label = name, hjust = -0.1, vjust = 0.5))

# Is segregation influenced by the metro size (total population)?
ggplot(sfStates, mapping = aes(x = log(total), y = D)) +
  geom_point() +
  geom_smooth() +
  geom_text(aes(label = name, hjust = -0.1, vjust = 0.5))

# For mapping purposes, drop Alaska, Hawai'i, and Puerto Rico
sfLower48 = filter(sfStates, !state %in% c("02", "15", "72"))

# Map Index of Disimilarity
mapStateD = tm_shape(sfLower48, projection = "laea_NA") + 
  tm_fill(col = "D", palette = "Blues", style = "jenks", title=expression("Index of Disimilarity")) + 
  tm_layout(title= "Index of Disimilarity Between Black and White Polutions in the US", 
            title.position = c("center", "top"), inner.margins = c(0.1, 0.1, 0.15, 0.05)) + 
  tm_borders()
mapStateD

# Name and save the map
save_tmap(tm = mapStateD, filename="XXXXXXXX.png")
