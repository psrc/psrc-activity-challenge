shinyUI(
  
  page_fluid(
    
    theme = psrc_theme_light,
    
    layout_columns(
      col_widths = c(3, 8, 1),
    
      div(
        style = "text-align: left;",
        tags$img(
          src = "psrc-logo.png",
          height = "90px",
          alt = "PSRC's Logo"
        )
      ),
      
      div(
        class = "app_title",
        "Activity Challenge 2026"
      ),
      
      div(
        style = "text-align: right;",
        checkboxInput("dark_mode", "🌙 Dark mode", value = FALSE, width = "100%")
      )
      
    ), # end of top page header column layout for images/logos/theme selection
    
    card_body(
      selectizeInput(
        "ActivitySummary",
        label = "Summarize by:",
        choices = c("Staff", "Department", "Agency"),
        selected = "Department",
        options = list(dropdownParent = 'body')
      ),
      class = "selection_panel"
    ),
    
    hr(style = "border-top: 1px solid #000000;"),

    card(
      layout_columns(
        
        col_widths = c(4,8),

        uiOutput('staff_leaderboard'),
        
        card_body(
          tags$div(
            role = "img",
            `aria-label` = "Map showing how many miles each PSRC department has moved so far in 2026.",
            leafletOutput("activity_map", height = 450),
            )
          ),
      
      ), # end of layout_columns
      
    ), # end of card
    

    # Card for Footer
    card(
      
      layout_columns(
        col_widths = c(2,7,3),
        
        card_body(tags$img(src='footer-logo.png', style="margin-top: 0x; padding-left: 0px; padding-right: 0px;", class = "responsive-image", alt = "PSRC logo"), class = "footer_panel"),
        
        card_body(
          tags$div(class = "footer_heading", HTML(paste0("About PSRC<br>", tags$div(class = "footer_about", psrc_mission)))),
        ),
        
        card_body(
          tags$div(class = "footer_heading", HTML(
            paste0(
              "Connect with PSRC<br>", 
              tags$div(
                class = "psrc-location", 
                style = "display: flex; align-items: top;",
                icon("location-dot", class = "m-connect-loc"), 
                div(
                  div("1201 Third Avenue, Suite 500"), 
                  "Seattle, WA 98101-3055")
              ),
              tags$div(class = "psrc-phone", 
                       style = "display: flex; align-items: center;", 
                       icon("phone-volume", class = "m-connect"), 
                       "206-464-7090"
              ),
              tags$a(class = "psrc_email",
                     icon("envelope", class = "m-connect"), 
                     href = paste0("mailto:","info@psrc.org","?"), 
                     "info@psrc.org")
            ))),
        ),
      ),
      
      card_footer(
        layout_columns(
          col_widths = c(9,3),
          card_body(div(
            a(class = "footer_url", 
              href="https://www.facebook.com/PugetSoundRegionalCouncil", 
              icon("facebook", class = "soc-connect"),
              span("Link to PSRC's Facebook page", class = "sr-only"), 
              target="_blank"),
            a(class = "footer_url", 
              href="https://twitter.com/SoundRegion", 
              icon("x-twitter", class = "soc-connect"),
              span("Link to PSRC's Twitter feed", class = "sr-only"),
              target="_blank"),
            a(class = "footer_url", 
              href="https://www.instagram.com/soundregion/", 
              icon("instagram", class = "soc-connect"), 
              span("Link to PSRC's Instagram feed", class = "sr-only"),
              target="_blank"),
            a(class = "footer_url", 
              href="https://www.linkedin.com/company/soundregion", 
              icon("linkedin", class = "soc-connect"), 
              span("Link to PSRC's LinkedIn feed", class = "sr-only"),
              target="_blank")
          )),
          
          tags$div(class = "footer_about", "Dashboard by", tags$div(class = "footer_url", "PSRC Data Science")),
        ),
        class = "footer_footer"),
      class = "footer_panel") # end of card for footer
    
    ) # end of page fluid
  
  ) #end of shiny UI