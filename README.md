# billboard-songs

**Project Overview**
I developed an interactive R Shiny application to explore the relationship between Billboard Hot 100 rankings and Spotify data. The application provides users with a dynamic platform to explore the impact of various Spotify variables on a song’s likelihood of ranking number one on the Billboard Hot 100 charts.
 
 **Motivation:**
 I choose this data to explore billboards hot 100 charts because I love music and am interested in knowing if the consumer makes a song popular or if the song is produced to be great. By analyzing this data I hope to uncover patterns and insights that shed light on the factors influencing a song's success in different genres, artists and years.
 
**Challenges and Approach:**
 Working with a large dataset presents some difficulties, especially when it comes to cleaning and exploring the data. To overcome these challenges, I've simplified the data by removing any missing values and focused on analyzing smaller sections of the dataset at a time. This approach helps me manage the data more effectively and identify the most important information for my analysis.


**Data Source and tools:**
The data I chose is "Billboard Hot 100 songs 2000-2018 w/ Spotify Data + Lyrics" which can be found on [data.world](https://data.world/typhon/billboard-hot-100-songs-2000-2018-w-spotify-data-lyrics). It is composed of billboard hot 100 songs from the years 2000 - 2018. o ensure data completeness, I excluded songs from 2018 due to incomplete records. The data got songs, dates, artists, genre and their ranks through the billboards api. Additionally, it incorporates audio features retrieved from Spotify's API by Echonest. These features include acousticness, energy, danceability, instrumentalness, liveness, speechiness, and valence. Further definitions of these features can be found [here](https://developer.spotify.com/documentation/web-api/reference/get-several-audio-features Spotify Web API):

The tools used are:
- R for general data handling.
- Shiny


**Usage:**
My dashboard comprises four tabs, each offering unique functionalities:


1. "Analyse a Genre": This tab allows users to explore how different genres and years impact the average values of Spotify audio features. Users can select a genre and a year to view bar graphs displaying the average values of Spotify audio features for that genre and year. Additionally, users can view the Spotify audio features of songs that stayed the longest on the Billboard charts in the selected genre and year.

2. "Make a Hit Song": In this tab, users can experiment with values for energy, danceability, and valence features to see how they affect the likelihood of a song reaching the number one spot on the charts. Based on statistical analysis, only energy, danceability, and valence show significance. Users can input values for these features and view three songs with values closest to the chosen ones, along with their peak positions on the charts. Notably, certain combinations of feature values may result in songs reaching the number one spot.

3. "Check out the Spread": This tab illustrates the distribution of Spotify audio features across different genres. Users can select a variable to view its distribution via boxplot graphs. Additionally, a bar plot displays the number of songs per genre in the dataset, while a distribution plot shows the overall distribution of the selected variable.

4. "Explore an Artist": Here, users can search for an artist and view a table of all their songs from the years 2000 to 2017 that have been on the charts. The tab also includes two distribution plots: one illustrating the distribution of the artist's peak positions on the Billboard charts and the other displaying the distribution of the number of weeks the artist's songs have spent on the Billboard Hot 100 charts. 


**Future Goals**

In the future, I want to fix the problem of different ways artists' collaborations are shown in the data. These differences make it hard to figure out how much each artist contributed to a song. To solve this, I'll make sure all collaborations are written in the same way. This will help me better understand how artist involvement affects how popular a song becomes.

Additionally, I am keen to investigate whether certain songs exhibit audio features that classify them as ideal summer songs, love songs, or dance tracks. This exploration promises insights into the characteristics that contribute to a song's association with particular moods or occasions.

**Acknowledgments:**


**Contact Information**


Data Insights

1. How does factors such as danceability, energy, and valence affects how long a song stays on the charts and its position?
3. Does a genre dominate the charts in certain years or months of the year?
4. How does collaborations of artists impact the chart positions.







Project Screenshots

