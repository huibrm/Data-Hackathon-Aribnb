############################################################################################################
setwd("../dubstech_datathon/Airbnb/data")
############################################################################################################
library(dplyr)
library(tidyr)

############################################################################################################
# Seattle Data
############################################################################################################

# Seattle Listings
seattle_listings <- read.csv( "seattle/seattle_listings.csv", stringsAsFactors = FALSE)
#seattle_listings <-na.omit(seattle_listings)
#write.csv(seattle_listings,"Seattle_noNA_lisiting.csv")
# Seattle Listing Column Names
sea.col<-data.frame(colnames(seattle_listings))

# Seattle Calendar
seattle_calendar <- read.csv( "seattle/seattle_calendar.csv", stringsAsFactors = FALSE)

# Seattle Reviews
seattle_reviews <- read.csv( "seattle/seattle_reviews.csv", stringsAsFactors = FALSE)

#slect and clean columns
picked.col <- select(seattle_listings, 	
                     neighbourhood_group_cleansed, property_type, room_type,
                     longitude, latitude, host_is_superhost, price, review_scores_rating)
picked.col$price <- as.numeric(gsub("\\$", "", picked.col$price))
Seattle.neighbor<-group_by(picked.col,room_type) %>% 
  summarize(mean = mean(price))
picked.col<-na.omit(picked.col)
write.csv(picked.col, "min_seattle_listing.csv")
#location, host quality, price, time.




############################################################################################################
# Boston Data
############################################################################################################

# Boston Listings
boston_listings <- read.csv( "boston/boston_listings.csv", stringsAsFactors = FALSE)

# Boston Listing Column Names
colnames(boston_listings)

# Boston Calendar
boston_calendar <- read.csv( "boston/boston_calendar.csv", stringsAsFactors = FALSE)

# Boston Reviews
boston_reviews <- read.csv( "boston/boston_reviews.csv", stringsAsFactors = FALSE)