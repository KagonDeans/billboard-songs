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



**Future Goals**
I wanted to look at how artists contributing to song effects its popularity. there was many different ways in the data to state if a song had contribution. I have to pin down all the ways and the change it to one specific way. I also wanted to explore if there were songs that has audio features that makes them a good summer song or love song or dance song. 

**Acknowledgments:**


**Contact Information**


Data Insights

1. How does factors such as danceability, energy, and valence affects how long a song stays on the charts and its position?
3. Does a genre dominate the charts in certain years or months of the year?
4. How does collaborations of artists impact the chart positions.




project workflow or schedule

1.	Get the Data (01/06/2024)
2.	Clean & Explore the Data (01/09/2024)
3.	Create Presentation and Shiny App (01/20/2024)
4.	Internal Demos (1/23/2024)
5.	Midcourse Project Presentations (1/27/2024)




Project Screenshots

