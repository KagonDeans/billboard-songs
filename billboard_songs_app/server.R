library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  filtered <- reactive({
    if (input$broad_genre == "All" ) {
      genre_filter <- genres_choices
    }
    else{
      genre_filter <- input$broad_genre
    }
    billboard |> 
      filter(broad_genre %in% genre_filter) 
  })
  #
  # First Tab: Bar Plots that shows the average values of songs in a particular genre and 
  #the values of the number one song of a particular genre in a specific year.
  
  output$barPlot <- renderPlot({
    
    filtered()  |> 
      filter(year == input$years) |> 
      select(where(is.numeric), -year, -peak_pos, -weeks, -rank, -duration_ms, -last_pos, -tempo, -loudness, -week_number) |> 
      colMeans() |> 
      enframe(name = "Variable", value = "Mean")  |> 
      ggplot(aes(x = Variable, y = Mean)) +
      geom_col() +
      labs(title = paste("Average Values of Variables for", input$broad_genre), x = "Variables", y = "Mean Value")
  })
  
  
  output$barPlot2 <- renderPlot({
    billboard_pivoted |> 
      filter(year == input$years & broad_genre == input$broad_genre) |>  
      ggplot( aes(x = variable, y = value)) +
      geom_col() +
      labs(title =paste("Longest Charted",input$broad_genre,"Song in the year", input$years), x = "Song Variables", y = "Song Value")
    
  })
  
  
  #Second Tab: that allows users to select values for energy, valence and danceability, and the output will be a 
  #table showing songs with variables closets to the select values.
  output$table <- renderDataTable({ 
    valence_selection <- input$valence_value
    danceability_selection <- input$danceability_value
    energy_selection <- input$energy_value
    
    variable_distance <-
      billboard |> 
      mutate(distance = abs(energy - energy_selection) + abs(danceability - danceability_selection) + abs(valence - valence_selection)) |> 
      select(year, title, main_artist, peak_pos, weeks, broad_genre, energy, valence, danceability, distance) |>
      arrange(distance) |> 
      head(3)
  }, options = list(scrollX = TRUE))
  
  
  
  
  #Third tab: A plot showing how variables are distributed amongst genres
  output$boxPlot <- renderPlot({
    billboard |> 
      ggplot(aes(x = broad_genre, y = .data[[input$hist_variable]])) +
      geom_boxplot(color = "black") +
      labs(title = paste("Distribution of", input$hist_variable, "by Genre"),
           x = "Genre", y = input$hist_variable)
    
  })
  
  output$distPlot <- renderPlot({
    
    filtered() |>
      drop_na(input$hist_variable) |>
      ggplot(aes(x = .data[[input$hist_variable]])) +
      geom_histogram(bins = input$bins) +
      labs(x = input$hist_variable,
           title = paste('Distribution of', input$hist_variable))
    
  })
  
  output$genrePlot <- renderPlot({
    billboard |> 
      count(broad_genre) |> 
      ggplot(aes(x = broad_genre, y = n)) +
      geom_col(fill = "purple") +
      labs(title = "Number of Songs per Genre", x="Genre", y="Count")
    
  })
  
  
  #Fourth Tab: Creating a table where the user can select an artist and they will get barplot of the means.
  artist_data <-
    reactive({
    billboard |> 
      arrange(peak_pos, desc(weeks)) |>  
      filter(main_artist == input$artist_variable)
  })

  
  
  output$artistTable <- renderDT({
    artist_data() |> 
      select(date, title, main_artist, peak_pos, weeks, broad_genre, energy, valence, danceability) 
  }, options = list(scrollX = TRUE, lengthMenu = c(5, 30, 50)))
  
  
 
  output$peakdistPlot <- renderPlot({
    artist_data() |> 
    ggplot(aes(x = peak_pos)) +
      geom_histogram(bins = input$bins) +
      labs(x = "Peak Position",
           title = paste('Distribution of',input$artist_variable, 'Peak Position on the charts'))
    
  })
  
  output$weeksdistPlot <- renderPlot({
    artist_data() |> 
    ggplot(aes(x = weeks)) +
      geom_histogram(bins = input$bins) +
      labs(x = "Amount of Weeks",
           title = paste('Distribution of weeks', input$artist_variable,'spent on charts'))
    
  })
  
  output$peakweekboxPlot <- renderPlot({
    artist_data() |> 
      select(energy, valence, danceability) |> 
    pivot_longer(cols = everything()) |> 
      ggplot(aes(x = name, y = value)) +
      geom_boxplot() +
      labs(x ="idk" ,
           title = ('Distribution of'))
    
    
  })
  
}
