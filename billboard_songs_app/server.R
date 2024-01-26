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
    
  variable_distance <-
    billboard |> 
    mutate(distance = abs(energy - energy_selection) + abs(danceability - danceability_selection) + abs(valence - valence_selection)) |> 
    select(year, title, main_artist, peak_pos, weeks, broad_genre, energy, valence, danceability, distance) |>
    arrange(distance) |> 
    head(3)
  }, options = list(scrollX = TRUE))
  
  
  #Third tab: A plot showing how variables are distributed amongst genres
  output$distPlot2 <- renderPlot({
    billboard |> 
      ggplot(aes(x = broad_genre, y = .data[[input$hist_variable]])) +
       geom_boxplot(color = "black") +
      labs(title = paste("DIstribution of", input$hist_variable, "by Genre"),
           x = "Genre", y = input$hist_variable)
    
  })
  
  output$distPlot <- renderPlot({
    
    filtered() |>
      drop_na(input$hist_variable) |>
      ggplot(aes(x = .data[[input$hist_variable]])) +
      geom_histogram(bins = input$bins) +
      labs(x = input$hist_variable,
           title = paste('Histogram of', input$broad_genre))
    
  })
  
  
  #Fourth Tab: Creating a table where the user can select an artist and they will get barplot of the means.
  artist_data <- reactive({
    billboard |> 
      filter(main_artist == input$artist_variable)
  })
  
  output$artistTable <- renderDT({
     billboard |> 
    #artist_data() |> 
      select(date, title, main_artist, peak_pos, weeks, broad_genre, energy, valence, danceability) 
  }, options = list(scrollX = TRUE, lengthMenu = c(5, 30, 50)))
  

  output$artist_mini_table <- renderTable({
    #billboard |> 
    artist_data() |> 
    filter(main_artist == input$artist_variable) |> 
      select(peak_pos, weeks, rank, energy, valence, danceability) |> 
      colMeans() |> 
      enframe(name = "Variable", value = "Mean")
      
  })
  
  
  
  

}
