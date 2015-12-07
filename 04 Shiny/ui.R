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
      menuItem("Graph 4", tabName = "map", icon = icon("th")),
      menuItem("Table", tabName = "table", icon = icon("th"))
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
      tabItem(tabName = "map",
        leafletOutput("map")
      ),
        
      # Fifth tab content
      tabItem(tabName = "table",
        dataTableOutput("table")
      )
    )
  )
)
  