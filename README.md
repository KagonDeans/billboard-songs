***Billboard Hot 100 and Spotify Data Analysis: A Shiny Application Project***



*Project Overview*

I developed an interactive R Shiny application to explore the relationship between Billboard Hot 100 rankings and Spotify data. The application provides users with a dynamic platform to explore the impact of various Spotify variables on a song’s likelihood of ranking number one on the Billboard Hot 100 charts.
 
 *Motivation:*
 
 I choose this data to explore billboards hot 100 charts because I love music and am interested in knowing if the consumer makes a song popular or if the song is produced to be great. By analyzing this data I hope to uncover patterns and insights that shed light on the factors influencing a song's success in different genres, artists and years.
 
*Challenges and Approach:*

 Working with a large dataset presents some difficulties, especially when it comes to cleaning and exploring the data. To overcome these challenges, I've simplified the data by removing any missing values and focused on analyzing smaller sections of the dataset at a time. This approach helps me manage the data more effectively and identify the most important information for my analysis.


*Data Source and tools:*

The data I chose is "Billboard Hot 100 songs 2000-2018 w/ Spotify Data + Lyrics" which can be found on [data.world](https://data.world/typhon/billboard-hot-100-songs-2000-2018-w-spotify-data-lyrics), it is composed of billboard hot 100 songs from the years 2000 - 2018. To ensure data completeness, I excluded songs from 2018 due to incomplete records. The data got the songs, dates, artists, genre and their ranks through the billboards api. Additionally, it incorporates audio features retrieved from Spotify's API by Echonest. These features include acousticness, energy, danceability, instrumentalness, liveness, speechiness, and valence. Further definitions of these features can be found [here](https://developer.spotify.com/documentation/web-api/reference/get-several-audio-features).

The tools used are:

- R for general data handling.
- Shiny


*Usage:*

My dashboard comprises of four tabs, each offering unique functionalities:

1. "Analyse a Genre":

- Explore how different genres and years impact the average values of Spotify audio features.

-  Users will select a genre and a year to view bar graphs displaying the average values of Spotify audio features for that genre and year.

- View the Spotify audio features of songs that stayed the longest on the Billboard charts in the selected genre and year.

2. "Make a Hit Song": 

- Experiment with values for energy, danceability, and valence features to see how they affect the likelihood of a song reaching the number one spot on the charts.

- Input values for these features and view three songs with values closest to the chosen ones, along with their peak positions on the charts.

- Certain combinations of feature values may result in songs reaching the number one spot.

3. "Check out the Spread":

- Illustrate the distribution of Spotify audio features across different genres using boxplot graphs.

- Select a variable to view its distribution.

- View a bar plot displaying the number of songs per genre in the dataset.

- Explore the overall distribution of the selected variable using a distribution plot.

4. "Explore an Artist":

- Search for an artist and view a table of all their songs from the years 2000 to 2017 that have been on the charts.

- View distribution plots illustrating the distribution of the artist's peak positions on the Billboard charts and the distribution of the number of weeks the artist's songs have spent on the Billboard Hot 100 charts.


*Future Goals:*

In the future, I want to fix the problem of different ways artists' collaborations are shown in the data. These differences make it hard to figure out how much each artist contributed to a song. To solve this, I'll make sure all collaborations are written in the same way. This will help me better understand how artist involvement affects how popular a song becomes.

Additionally, I am keen to investigate whether certain songs exhibit audio features that classify them as ideal summer songs, love songs, or dance tracks. This exploration promises insights into the characteristics that contribute to a song's association with particular moods or occasions.



