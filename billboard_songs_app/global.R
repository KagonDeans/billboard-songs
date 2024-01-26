library(shiny)
library(tidyverse)
library(DT)
library(shinydashboard)
library(shinyWidgets)


billboard <- read_csv("./data/billboard_genre2.csv")


genres_choices <- billboard |> 
  pull(broad_genre) |> 
  unique() |> 
  sort()

#genres_choices <- c("All", genres_choices)

variable_choices <- billboard |> 
  select(where(is.numeric), -year, -peak_pos, -weeks, -rank, -duration_ms, -last_pos, -tempo, -loudness, -week_number) |>
  colnames()

year_choices <- billboard |>
  pull(year) |>
  unique() |>
  sort()

top_songs <- billboard  |> 
  group_by(year, broad_genre)  |> 
  slice_max(order_by = weeks, n = 1)  |> 
  ungroup() 

top_artists <-
  billboard |> 
  filter(weeks >= 14 & rank <= 50) |> 
  group_by(main_artist)  |> 
  filter(n() >= 3) 


billboard_pivoted <- billboard |> 
  filter(title %in% (top_songs |> pull(title))) |> 
  select(title,year,artist, broad_genre, energy, liveness, speechiness, acousticness, instrumentalness, danceability, valence) |> 
  pivot_longer(cols =-c("title", "year", "broad_genre", "artist"), names_to = "variable", values_to = "value") 


logistic_model <- glm(number_one ~ energy + liveness + speechiness + acousticness + instrumentalness + danceability + valence,
                      data = billboard, 
                      family = "binomial")
