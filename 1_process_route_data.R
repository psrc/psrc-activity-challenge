# Data Analysis Packages
library(dplyr)
library(readr)

# Mapping Packages
library(osrm)
library(sf)
library(lwgeom)
library(leaflet)

# Inputs ------------------------------------------------------------------
wgs84 <- 4326
proj_wgs84 <- 5070
miles_to_meters <- 1609.344

# First leg from Washington to Maine
seattle <- c(-122.335167, 47.608013)
ellensburg <- c(-120.547847, 46.996514)
moses_lake <- c(-119.278076, 47.130142)
spokane <- c(-117.426048, 47.658779)
coeur_dAlene <- c(-116.780468, 47.677683)
missoula <- c(-113.994003, 46.872128)
butte <- c(-112.534790, 46.003822)
bozeman <- c(-111.042934, 45.677033)
billings <- c(-108.500690, 45.783287)
rapid_city <- c(-103.231014, 44.080543)
wall_drug <- c(-102.240395, 43.992577)
sioux_falls <- c(-96.731103, 43.544595)
madison <- c(-89.401230, 43.073052)
chicago <- c(-87.629798, 41.878113)
toledo <- c(-83.555214, 41.652805)
cleveland <- c(-81.694361, 41.499321)
buffalo <- c(-78.878369, 42.886447)
albany <- c(-73.756233, 42.652580)
boston <- c(-71.058880, 42.360082)
portland_me <- c(-70.255325, 43.659100) 
bangor <- c(-68.773430, 44.801182)
houlton <- c(-67.842201, 46.125999)

# Second leg from Maine to Florida
providence <- c(-71.412834, 41.823989)
new_haven <- c(-72.927887, 41.308273)
new_york <- c(-74.006015, 40.712776)
philadelphia <- c(-75.165222, 39.952583) 
baltimore <- c(-76.612190, 39.290386)
dc <- c(-77.036870, 38.907192)
richmond <- c(-77.436050, 37.540726)
raliegh <- c(-78.638176, 35.779591)
savannah <- c(-81.099834, 32.080898)
jacksonville <- c(-81.655651, 30.332184)
miami <- c(-80.191790, 25.761681)

# Third leg from Florida to California
orlando <- c(-81.379234, 28.538336)
gainesville <- c(-82.324826, 29.651634)
tallahassee <- c(-84.280733, 30.438256)
mobile <- c(-88.039891, 30.695366)
new_orleans <- c(-90.071533, 29.951065)
houston <- c(-95.369803, 29.760427)
san_antonio <- c(-98.493628, 29.424122)
el_paso <- c(-106.485022, 31.761878)
tucson <- c(-110.974711, 32.222607)
phoenix <- c(-112.074037, 33.448377)
palm_springs <- c(-116.545292, 33.830296)
los_angeles <- c(-118.243683, 34.052235)

# Fourth leg from California to Washington
santa_barbara <- c(-119.698190, 34.420830)
san_luis_obispo <- c(-120.659616, 35.282753)
big_sur <- c(-121.808055, 36.270423)
santa_cruz <- c(-122.030792, 36.974117)
pacifica <- c(-122.486919, 37.613825)
marshall <- c(-122.893174, 38.161589)
galloway <- c(-123.816227, 39.365021)
rockport <- c(-123.805904, 39.428186)
eureka <- c(-124.163673, 40.802071)
crescent_city <- c(-124.201530, 41.755766)
coos_bay <- c(-124.217890, 43.366500)
lincoln_city <- c(-124.017891, 44.958164)
astoria <- c(-123.831253, 46.187885)
aberdeen <- c(-123.815722, 46.975372)
olympia <- c(-122.900695, 47.037874)
tacoma <- c(-122.444290, 47.252877)

# Create Routes -------------------------------------------------------------------
# ChatGPT helped staff learn how to create a route using the osrm package. 
# Staff adopted the approach to build multiple segments across the US
# AI was also pointed staff to a projected crs for WGS84 that works better for a US map instead of a state plane system

# Seattle to Maine via I-90 (to Boston) and I-95 (Boston to Maine)
route_1a <- osrmRoute(src = seattle, dst = chicago, overview = "full") |> mutate(segment = "Washington to Maine") |> st_transform(crs = proj_wgs84)
route_1b <- osrmRoute(src = chicago, dst = buffalo, overview = "full") |> mutate(segment = "Washington to Maine") |> st_transform(crs = proj_wgs84)
route_1c <- osrmRoute(src = buffalo, dst = boston, overview = "full") |> mutate(segment = "Washington to Maine") |> st_transform(crs = proj_wgs84)
route_1d <- osrmRoute(src = boston, dst = houlton, overview = "full") |> mutate(segment = "Washington to Maine") |> st_transform(crs = proj_wgs84)

# Maine to Florida via I-95
route_2a <- osrmRoute(src = houlton, dst = providence, overview = "full") |> mutate(segment = "Maine to Florida") |> st_transform(crs = proj_wgs84)
route_2b <- osrmRoute(src = providence, dst = dc, overview = "full") |> mutate(segment = "Maine to Florida") |> st_transform(crs = proj_wgs84)
route_2c <- osrmRoute(src = dc, dst = raliegh, overview = "full") |> mutate(segment = "Maine to Florida") |> st_transform(crs = proj_wgs84)
route_2d <- osrmRoute(src = raliegh, dst = miami, overview = "full") |> mutate(segment = "Maine to Florida") |> st_transform(crs = proj_wgs84)

# Florida to California via I-10
route_3a <- osrmRoute(src = miami, dst = orlando, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)
route_3b <- osrmRoute(src = orlando, dst = tallahassee, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)
route_3c <- osrmRoute(src = tallahassee, dst = new_orleans, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)
route_3d <- osrmRoute(src = new_orleans, dst = el_paso, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)
route_3e <- osrmRoute(src = el_paso, dst = phoenix, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)
route_3f <- osrmRoute(src = phoenix, dst = los_angeles, overview = "full") |> mutate(segment = "Florida to California") |> st_transform(crs = proj_wgs84)

# California to Washington via PCH
route_4a <- osrmRoute(src = los_angeles, dst = santa_barbara, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4b <- osrmRoute(src = santa_barbara, dst = san_luis_obispo, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4c <- osrmRoute(src = san_luis_obispo, dst = big_sur, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4d <- osrmRoute(src = big_sur, dst = santa_cruz, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4e <- osrmRoute(src = santa_cruz, dst = pacifica, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4f <- osrmRoute(src = pacifica, dst = marshall, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4g <- osrmRoute(src = marshall, dst = galloway, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4h <- osrmRoute(src = galloway, dst = rockport, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4i <- osrmRoute(src = rockport, dst = eureka, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4j <- osrmRoute(src = eureka, dst = crescent_city, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4k <- osrmRoute(src = crescent_city, dst = coos_bay, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4l <- osrmRoute(src = coos_bay, dst = lincoln_city, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4m <- osrmRoute(src = lincoln_city, dst = astoria, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4n <- osrmRoute(src = astoria, dst = aberdeen, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4o <- osrmRoute(src = aberdeen, dst = olympia, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)
route_4p <- osrmRoute(src = olympia, dst = tacoma, overview = "full") |> mutate(segment = "California to Washington") |> st_transform(crs = proj_wgs84)

# Convert to a Projected CRS for distance measurement
routes_proj <- bind_rows(route_1a,route_1b,route_1c,route_1d,
                         route_2a,route_2b,route_2c,route_2d,
                         route_3a,route_3b,route_3c,route_3d,route_3e,route_3f,
                         route_4a,route_4b,route_4c,route_4d,route_4e,route_4f,
                         route_4g,route_4h,route_4i,route_4j,route_4k,route_4l,
                         route_4m,route_4n,route_4o,route_4p)

full_route <- routes_proj |>
  st_combine() |>
  st_line_merge()

full_route <- st_cast(full_route, "LINESTRING")

total_len <- as.numeric(sum(st_length(full_route)))

# Create Milestones to use in the Map -----------------------------------------------
# ChatGPT helped staff learn how to use st_line sample from the lwgeom package to determine
# a point on a linestring based on a distance in a tibble. 

milestones <- read_csv("data/milestones.csv", show_col_types = FALSE) |>
  mutate(Meters = Miles * miles_to_meters) |>
  mutate(Fraction = Meters / total_len)
  
milestone_pts <- st_line_sample(
  full_route, 
  sample = milestones$Fraction)

milestones_sf <- milestones |>
  st_drop_geometry() |>
  st_sf(geometry = st_cast(milestone_pts, "POINT")) |> 
  st_transform(wgs84)

# Save Layers for Mapping -------------------------------------------------
saveRDS(full_route, "data/full_route.rds")
saveRDS(route_1a |> st_transform(crs = wgs84), "data/route_1a.rds")
saveRDS(route_1b |> st_transform(crs = wgs84), "data/route_1b.rds")
saveRDS(route_1c |> st_transform(crs = wgs84), "data/route_1c.rds")
saveRDS(route_1d |> st_transform(crs = wgs84), "data/route_1d.rds")
saveRDS(route_2a |> st_transform(crs = wgs84), "data/route_2a.rds")
saveRDS(route_2b |> st_transform(crs = wgs84), "data/route_2b.rds")
saveRDS(route_2c |> st_transform(crs = wgs84), "data/route_2c.rds")
saveRDS(route_2d |> st_transform(crs = wgs84), "data/route_2d.rds")
saveRDS(route_3a |> st_transform(crs = wgs84), "data/route_3a.rds")
saveRDS(route_3b |> st_transform(crs = wgs84), "data/route_3b.rds")
saveRDS(route_3c |> st_transform(crs = wgs84), "data/route_3c.rds")
saveRDS(route_3d |> st_transform(crs = wgs84), "data/route_3d.rds")
saveRDS(route_3e |> st_transform(crs = wgs84), "data/route_3e.rds")
saveRDS(route_3f |> st_transform(crs = wgs84), "data/route_3f.rds")
saveRDS(route_4a |> st_transform(crs = wgs84), "data/route_4a.rds")
saveRDS(route_4b |> st_transform(crs = wgs84), "data/route_4b.rds")
saveRDS(route_4c |> st_transform(crs = wgs84), "data/route_4c.rds")
saveRDS(route_4d |> st_transform(crs = wgs84), "data/route_4d.rds")
saveRDS(route_4e |> st_transform(crs = wgs84), "data/route_4e.rds")
saveRDS(route_4f |> st_transform(crs = wgs84), "data/route_4f.rds")
saveRDS(route_4g |> st_transform(crs = wgs84), "data/route_4g.rds")
saveRDS(route_4h |> st_transform(crs = wgs84), "data/route_4h.rds")
saveRDS(route_4i |> st_transform(crs = wgs84), "data/route_4i.rds")
saveRDS(route_4j|> st_transform(crs = wgs84), "data/route_4j.rds")
saveRDS(route_4k|> st_transform(crs = wgs84), "data/route_4k.rds")
saveRDS(route_4l|> st_transform(crs = wgs84), "data/route_4l.rds")
saveRDS(route_4m |> st_transform(crs = wgs84), "data/route_4m.rds")
saveRDS(route_4n |> st_transform(crs = wgs84), "data/route_4n.rds")
saveRDS(route_4o |> st_transform(crs = wgs84), "data/route_4o.rds")
saveRDS(route_4p|> st_transform(crs = wgs84), "data/route_4p.rds")
saveRDS(milestones_sf, "data/milestones.rds")
