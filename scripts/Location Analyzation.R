library(dplyr)
library(lubridate)
library(magrittr)
library(leaflet)
library(ggplot2)

#Change the wd to the script location
setwd("~/Documents/Projects/Data-Hackathon-Aribnb/scripts")
seattle_listing <- read.csv("../data/seattle/seattle_listings.csv")
seattle_listing$success_rating <- seattle_listing$reviews_per_month * as.numeric(gsub('[$,]', '', seattle_listing$price))

leaflet(seattle_listing) %>% 
  addTiles() %>% 
  setView(-122.32855, 47.61035, zoom = 10.5) %>%
  addCircles(lng = ~longitude, lat = ~latitude, weight = ~success_rating/1000,
             radius = 0.1, fillColor = "blue",fillOpacity = 0.01)
seattle_listing$floor_date <- floor_date(as.Date(seattle_listing$first_review, format="%Y-%m-%d"), "month")
seattle_listing$last_review_floor <- floor_date(as.Date(seattle_listing$last_review, format="%Y-%m-%d"), "month")
seattle_newList_summarize <- seattle_listing %>%
  group_by(floor_date) %>%
  summarize(count_first = n())
seattle_lastList_summarize <- seattle_listing %>%
  group_by(last_review_floor) %>%
  summarize(count_last = n())
seattle_lastList_summarize$last_review_floor <- max(seattle_lastList_summarize$last_review_floor, na.rm = TRUE) - seattle_lastList_summarize$last_review_floor
seattle_lastList_summarize$last_review_floor <- seattle_lastList_summarize$last_review_floor/365

ggplot(data=seattle_newList_summarize, aes(x=floor_date, y=count_first)) +
  geom_bar(stat="identity") + xlab("Year") + ylab("New House Owner")
ggplot(data=seattle_lastList_summarize, aes(x=last_review_floor, y=count_last), Y_name) +
  geom_bar(stat="identity") + xlab("Years Inactive") + ylab("Count")
