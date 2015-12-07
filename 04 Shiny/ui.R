#ui.R

require(shiny)
require(shinydashboard)
require(leaflet)

dashboardPage(
  dashboardHeader(
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Graph 1", tabName = "distPlot1", icon = icon("th")),
      menuItem("Graph 2", tabName = "distPlot2", icon = icon("th")),
      menuItem("Graph 3", tabName = "blending", icon = icon("th")),
      menuItem("Graph 4", tabName = "crosstab", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "distPlot1",
              actionButton(inputId = "clicks1",  label = "Click me"),
              plotOutput("distPlot1")
      ),
      
      # Second tab content
      tabItem(tabName = "distPlot2",
        actionButton(inputId = "clicks2",  label = "Click me"),
        plotOutput("distPlot2")
      ),
      
      # Third tab content
      tabItem(tabName = "blending",
        actionButton(inputId = "clicks3",  label = "Click me"),
        plotOutput("distPlot3")
      ),
      
      # Fourth tab content
      tabItem(tabName = "crosstab",
        sliderInput("KPI1", 
                    "LO:", 
                    min = 1,
                    max = 7, 
                    value = 7),
        sliderInput("KPI2", 
                    "MED:", 
                    min = 7,
                    max = 10, 
                    value = 10),
        actionButton(inputId = "clicks4", 
                     label = "Click me"),
        plotOutput("distPlot4")
        )

    )
  )
)
  