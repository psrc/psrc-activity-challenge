

psrc_theme_light <- bs_theme(bg = "white",
                       fg = "black",
                       base_font = font_google("Poppins", local = TRUE),
                       primary = "#00716C",
                       version = 5) |>
  
                       bs_add_rules("
                       
                       /* General Text settings */
                       
                       h1 {
                       font-size: 2rem;
                       font-family: Poppins Semibold, sans-serif;
                       font-weight: 600;
                       margin-bottom: 1.5rem;
                       margin-top: 0;
                       line-height: 2.5rem;
                       }
                       
                       h2 {
                       font-size: 1.625rem;
                       font-family: Poppins Semibold, sans-serif;
                       font-weight: 600;
                       margin-bottom: 1.25rem;
                       margin-top: 0;
                       line-height: 2.5rem;
                       }
                       
                       h3 {
                       font-size: 1.375rem;
                       font-family: Poppins Semibold, sans-serif;
                       font-weight: 600;
                       margin-bottom: 0rem;
                       margin-top: 0;
                       line-height: 2.25rem;
                       }
                       
                       .app_title {
                       color: black;
                       font-size: 2rem;
                       font-weight: 800;
                       line-height: 1.25rem;
                       margin-bottom: 0rem;
                       margin-top: 3rem;
                       }
                       
                       .links {
                       color: #00716C;
                       }
                       
                       .links-container{
                       background-color: #fff;
                       }

                       .source_url {
                       color: #00716C;
                       font-size: 12pt;
                       text-decoration-line: underline;
                       text-decoration-color: #00716C;
                       text-decoration-thickness: 1.5px; 
                       }
                       
                       .left-panel-url {
                       font-weight: 600;
                       }
                       
                       .m-menu__title {
                       font-size: 22px;
                       font-weight: 400;
                       margin-bottom: 0.5rem;
                       color: #2F3030;
                       }
                       
                       /* footer styles */
                       
                       .responsive-image {
                       width: 100%;
                       }
                       
                       .icon-image {
                       width: 10%;
                       }
                       
                       .report-icon {
                       color: black;
                       font-size: 2rem;
                       font-weight: 200;
                       padding-bottom: 0.75rem;
                       padding-left: 5px;
                       padding-right: 15px;
                       }
                       
                       @media (max-width: 768px) {
                       .responsive-image {
                       width: 50%;
                       }
                       }
                       
                       .footer_first_row {
                       padding-bottom: 0rem;
                       }
                       
                       .footer_panel {
                       background-color: #4A0048;
                       padding-left: 1rem;
                       padding-top: 1rem;
                       padding-bottom: 1rem;
                       padding-right: 1rem;
                       }
                       
                       .footer_feedback {
                       color: white;
                       font-size: 1.25rem;
                       font-weight: 400;
                       line-height: 1.25rem;
                       }
                       
                       .footer_heading {
                       color: white; 
                       font-size: 1.25rem;
                       font-weight: 600;
                       padding-bottom: 1.5rem;
                       }
                       
                       .footer_about {
                       color: white; 
                       font-size: 1rem;
                       font-weight: 200;
                       }
                       
                       .psrc-location {
                       color: white; 
                       font-size: 1rem;
                       font-weight: 200;
                       padding-bottom: 0.75rem;
                       }
                       
                       .psrc-phone {
                       color: white; 
                       font-size: 1rem;
                       font-weight: 200;
                       padding-bottom: 0.75rem;
                       }
                       
                       .psrc-email {
                       color: #fff; 
                       font-size: 1rem;
                       font-weight: 200;
                       padding-bottom: 0.75rem;
                       }
                       
                       .m-connect {
                       color: #fff;
                       font-size: 12pt;
                       padding-left: 5px;
                       padding-right: 15px;
                       
                       }
                       
                       .m-connect-loc {
                       color: #fff;
                       font-size: 12pt;
                       padding-left: 5px;
                       padding-right: 15px;
                       padding-top: 5px;
                       
                       }
                       
                       .footer_footer {
                       background-color: #630460;
                       padding-left: 0rem;
                       padding-top: 1rem;
                       padding-bottom: 0rem;
                       padding-right: 0rem;
                       color: #EC9B21;
                       }
                       
                       .footer_url {
                       color: #EC9B21;
                       font-size: 12pt;
                       text-decoration: none;
                       }
                       
                       i {
                       color: black;
                       font-size: 20pt;
                       padding-left: 15px;
                       padding-right: 15px;
                       }
                       
                       .soc-connect {
                       color: #EC9B21;
                       font-size: 16pt;
                       padding-left: 15px;
                       padding-right: 15px;
                       
                       }
                       
                       a {
                       color: #EC9B21;
                       text-decoration: none;
                       }
                       
                       .rtp-link {
                       color: #00716C;
                       font-weight: bold;
                       text-decoration: none;
                       }
                       
                       .rtp-link:hover {
                       text-decoration: underline;
                       }
                       
                       .sr-only {
                       position: absolute;
                       width: 1px;
                       height: 1px;
                       padding: 0;
                       margin: -1px;
                       overflow: hidden;
                       clip: rect(0, 0, 0, 0);
                       border: 0;
                       }
                       
                       .insights_panel {
                       background-color: #C0E095;
                       clip-path: polygon(0 0, 100% 0, 100% 20%, 100% 80%, 95% 100%, 20% 100%, 0 100%, 0% 20%);
                       padding: 1.5rem;
                       border-radius: 5px;
                       }
                       
                       .selection_panel {
                       background-color: #E3C9E3;
                       clip-path: polygon(0 0, 100% 0, 100% 20%, 100% 80%, 95% 100%, 20% 100%, 0 100%, 0% 20%);
                       padding: 1.5rem;
                       border-radius: 5px;
                       }
                       
                       .icon_panel {
                       background-color: #F5F5F5;
                       clip-path: polygon(0 0, 100% 0, 100% 20%, 100% 80%, 95% 100%, 20% 100%, 0 100%, 0% 20%);
                       padding: 1.5rem;
                       border-radius: 5px;
                       }
                       
                       .leaderboard-item {
                       background: #f8f9fa;
                       }
                       
                       .leaderboard-item strong {
                       font-size: 1.05em;
}
                       

                       ")
