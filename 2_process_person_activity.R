# Data Analysis Packages
library(dplyr)
library(tidyr)
library(readxl)
library(sf)
library(lwgeom)
library(leaflet)

# Inputs ------------------------------------------------------------------
wgs84 <- 4326
proj_wgs84 <- 5070
miles_to_meters <- 1609.344

full_route <- readRDS("data/full_route.rds")
total_len <- as.numeric(sum(st_length(full_route)))

milestones <- readRDS("data/milestones.rds")

# Input Data --------------------------------------------------------------
people <- read_xlsx("data/activity-challenge.xlsx", sheet = "miles") |>
  pivot_longer(cols = contains("Week"), names_to = "Week", values_to = "Miles") |>
  mutate(Miles = replace_na(Miles, 0))

by_person <- people |>
  group_by(Name, icon) |>
  summarise(Miles = round(sum(Miles),1)) |>
  as_tibble() |>
  mutate(Meters = Miles * miles_to_meters, Type = "Staff")
  
by_group <- people |>
  group_by(Team) |>
  summarise(Miles = round(sum(Miles),0)) |>
  as_tibble() |>
  mutate(Meters = Miles * miles_to_meters, Type = "Department") |>
  rename(Name = "Team") |>
  mutate(icon = case_when(
    Name == "Administrative Services" ~ "building-columns",
    Name == "Data" ~ "map",
    Name == "Government Relations & Communications" ~ "bullhorn",
    Name == "Growth Management" ~ "house",
    Name == "Regional Planning" ~ "train",
    Name == "Transportation Planning" ~ "bus"))

by_agency <- people |>
  mutate(Team = "PSRC") |>
  group_by(Team) |>
  summarise(Miles = round(sum(Miles),0)) |>
  as_tibble() |>
  mutate(Meters = Miles * miles_to_meters, Type = "Agency") |>
  rename(Name = "Team") |>
  mutate(icon = case_when(
    Name == "PSRC" ~ "building-user"))

psrc_activity_summary <- bind_rows(list(by_person, by_group, by_agency)) |>
  mutate(iconColor = case_when(
    Name == "Administrative Services" ~ "blue",
    Name == "Data" ~ "orange",
    Name == "Government Relations & Communications" ~ "purple",
    Name == "Growth Management" ~ "green",
    Name == "Regional Planning" ~ "yellow",
    Name == "Transportation Planning" ~ "red",
    Name == "PSRC" ~ "lightblue",
    TRUE ~ "black"))

# Place route percentage on Activity Summary ------------------------------
# ChatGPT helped staff learn how to use st_line sample from the lwgeom package to determine
# a point on a linestring based on a distance in a tibble. 

psrc_activity_summary <- psrc_activity_summary |> mutate(Fraction = Meters / total_len)
points <- st_line_sample(full_route, sample = psrc_activity_summary$Fraction)
points_sf <- st_sf(psrc_activity_summary, geometry = st_cast(points, "POINT")) |> st_transform(wgs84) 

points_sf$`Next Milestone` <- sapply(
  points_sf$Miles,
  function(m) {
    next_m <- milestones$Name[milestones$Miles > m]
    if (length(next_m) == 0) NA_character_ else next_m[1]
  }
)

saveRDS(points_sf, "data/psrc_activity_summary_point.rds")


