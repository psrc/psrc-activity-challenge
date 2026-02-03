create_activity_map <- function(staff, locations, staff_type) {
  
  pal <- colorFactor(
    palette = c("#00A7A0", "#91268F", "#F05A28", "#8CC63E", "#4C4C4C", "#630460", "#005753"),
    domain = staff$Name
  )
  
  m <- leaflet() |>
    
    addTiles(group = "Open Street Map") |>
    
    addProviderTiles(providers$CartoDB.Positron, group = "Positron (minimal)") |>
    
    addProviderTiles(providers$Esri.WorldImagery, group = "Satellite") |>
    
    addLayersControl(baseGroups = c("Open Street Map", "Positron (minimal)", "Satellite"),
                     overlayGroups = c("Staff", "Milestones"),
                     options = layersControlOptions(collapsed = TRUE)) |>
    
    addPolylines(
      data = route_1a,
      color = "#00A7A0",
      weight = 5,
      label = "Seattle to Maine"
    ) |>
    
    addPolylines(
      data = route_1b,
      color = "#00A7A0",
      weight = 5,
      label = "Seattle to Maine"
    ) |>
    
    addPolylines(
      data = route_1c,
      color = "#00A7A0",
      weight = 5,
      label = "Seattle to Maine"
    ) |>
    
    addPolylines(
      data = route_1d,
      color = "#00A7A0",
      weight = 5,
      label = "Seattle to Maine"
    ) |>
    
    addPolylines(
      data = route_2a,
      color = "#8CC63E",
      weight = 5,
      label = "Maine to Florida"
    ) |>
    
    addPolylines(
      data = route_2b,
      color = "#8CC63E",
      weight = 5,
      label = "Maine to Florida"
    ) |>
    
    addPolylines(
      data = route_2c,
      color = "#8CC63E",
      weight = 5,
      label = "Maine to Florida"
    ) |>
    
    addPolylines(
      data = route_2d,
      color = "#8CC63E",
      weight = 5,
      label = "Maine to Florida"
    ) |>
    
    addPolylines(
      data = route_3a,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_3b,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_3c,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_3d,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_3e,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_3f,
      color = "#F05A28",
      weight = 5,
      label = "Florida to California"
    ) |>
    
    addPolylines(
      data = route_4a,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4b,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4c,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4d,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4e,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4f,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4g,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4h,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4i,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4j,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4k,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4l,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4m,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4n,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4o,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    addPolylines(
      data = route_4p,
      color = "#91268F",
      weight = 5,
      label = "California to Washington"
    ) |>
    
    # Participants
    # addCircleMarkers(
    #  data = staff,
    #  radius = 6,
    #  color = ~pal(Name),
    #  fillOpacity = 0.9,
    #  stroke = FALSE,
    #  group = "Staff",
    #  label = ~paste0(
    #    Name, " (", Type, ")\n",
    #    Miles, " miles\n",
    #    "Next stop: ", `Next Milestone`)) |>
    
    addAwesomeMarkers(
      data = staff,
      lng = ~st_coordinates(geometry)[,1],
      lat = ~st_coordinates(geometry)[,2],
      icon = ~awesomeIcons(
        icon = icon,
        iconColor = iconColor,
        markerColor = "lightgray",
        library = "fa"
      ),
      popup = ~paste0(
        "<strong>", Name, "</strong><br>",
        "Miles: ", round(Miles), "<br>",
        "Next: ", `Next Milestone`
      )
    ) |>
    
    # Milestones
    addCircleMarkers(
     data = locations,
     radius = 4,
     stroke = TRUE,
     color = "#4C4C4C",
     fillOpacity = 0.75,
     group = "Milestones",
     label = ~paste0(Name, "\n", Miles, " miles from Seattle"))
  
  return(m)
  
}
