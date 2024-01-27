library(shiny)

# Define UI for application that draws a histogram
dashboardPage(skin = "green",
              dashboardHeader(title = "Billboards"),
              dashboardSidebar(sidebarMenu(menuItem("Analyze a genre", tabName = "first_tab", icon = icon("bar-chart")),
                                           menuItem("Make a hit song", tabName = "second_tab", icon = icon("microphone-lines")),
                                           menuItem("Distribute that", tabName = "third_tab", icon = icon("sliders")),
                                           menuItem("Explore an Artist", tabName = "fourth_tab", icon = icon("people-group"))
              )),
              dashboardBody(
                tabItems(
                  # First Tab - 'firstPlot'
                  tabItem("first_tab",
                          sidebarLayout(
                            sidebarPanel(
                              
                              selectInput("broad_genre", 
                                          label = "Select a genre:", 
                                          choices = genres_choices), 
                              
                              selectInput("years",
                                          label = "Select the Year:",
                                          choices = year_choices)),
                            
                            mainPanel(
                              fluidRow(
                                column(width = 6, plotOutput("barPlot")),
                                column(width = 6, plotOutput("barPlot2"))
                              )
                              
                            )
                          )
                  ),
                  
                  #Second Tab
                  tabItem("second_tab",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("energy_value",
                                          "Select energy value:",
                                          min = min(billboard$energy),
                                          max = max(billboard$energy),
                                          value = median(billboard$energy)),
                              sliderInput("danceability_value",
                                          label = "Select danceability value",
                                          min = min(billboard$danceability),
                                          max = max(billboard$danceability),
                                          value = median(billboard$danceability)),
                              sliderInput("valence_value",
                                          label = "Select valence value",
                                          min = min(billboard$valence),
                                          max = max(billboard$valence),
                                          value = median(billboard$valence))
                            ),
                            mainPanel(
                              dataTableOutput("table")
                            )
                          )
                  ),
                  
                  
                  
                  # Third Tab 
                  tabItem("third_tab",
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput("bins",
                                          "Number of bins:",
                                          min = 1,
                                          max = 50,
                                          value = 30),
                              selectInput("hist_variable", "Select a variable:", choices = variable_choices)
                            ),
                            
                            mainPanel(
                              fluidRow(column(width = 6, plotOutput("boxPlot")),
                                       column(width = 6, plotOutput("genrePlot"))),
                              fluidRow(column(width = 12, plotOutput("distPlot")))
                            )
                          )),
                  
                  
                  #fourth tab
                  tabItem("fourth_tab",
                          sidebarLayout(
                            sidebarPanel(
                      ),
                            
                            mainPanel(
                              textInput("artist_variable", "Enter Artist Name"),
                              fluidRow(DTOutput("artistTable")),
                              fluidRow(column(width = 6, plotOutput("peakdistPlot")),
                                       column(width = 6, plotOutput("weeksdistPlot"))),
                              fluidRow(column(width = 12, plotOutput("peakweekboxPlot")))
                             
                            ),
                            
                          )  
                  )
                  
                  
                  #New tabItem would start here
                  
                  
                  
                  
                  
                  
                )
              )
)#Last Parenthesis





