shinyServer(function(input, output, session) {
  
  observeEvent(input$dark_mode, {
    new_theme <- if (input$dark_mode) psrc_theme_dark else psrc_theme_light
    session$setCurrentTheme(new_theme)
  })
  
  current_location <- reactive({
    psrc_activity_summary |>
      filter(Type == summary_type(), Miles > 0) |>
      arrange(desc(Miles)) |>
      slice(1)
  })
  
  observeEvent(current_location(), {
    
    coords <- st_coordinates(current_location())
    
    leafletProxy("activity_map") |>
      setView(
        lng = coords[1],
        lat = coords[2],
        zoom = 6
      )
  })
  
  summary_type <- reactive({input$ActivitySummary})
  
  output$activity_map <- renderLeaflet({create_activity_map(staff = psrc_activity_summary |> filter(Type == summary_type() & Miles > 0), 
                                                            locations = milestones, 
                                                            staff_type = "Department")})
  
  output$staff_leaderboard <- renderUI({
    
    max_distance <- milestones |> st_drop_geometry() |> select("Meters") |> pull() |> max()
    
    leaderboard_df <- psrc_activity_summary |>
      st_drop_geometry() |>
      filter(Type == summary_type()) |>
      arrange(desc(Miles)) |>
      mutate(
        Rank = row_number(),
        Miles = round(Miles),
        Pct = Meters / max_distance
      ) |>
      filter(Miles >0)
    
    tagList(
      div(
        style = "max-height: 450px; overflow-y: auto;",
        lapply(seq_len(nrow(leaderboard_df)), function(i) {
          
          row <- leaderboard_df[i, ]
          
          div(
            class = "leaderboard-item mb-2 p-2 border rounded",
            strong(paste0(row$Rank, ". ", row$Name)),
            div(
              style = "font-size: 0.9em; color: #555;",
              paste0("Distance: ", row$Miles, " miles")
            ),
            
            div(
              class = "progress",
              div(
                class = "progress-bar",
                style = paste0("width:", round(row$Pct * 100), "%")
              )
            ),
            
            div(
              style = "font-size: 0.85em; color: #777;",
              paste("Next Milestone:", row$`Next Milestone`)
            )
          )
        })
      )
    )
  })
  
})