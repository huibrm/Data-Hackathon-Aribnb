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

# Seattle Listing Column Names
sea.col<-data.frame(colnames(seattle_listings))

# Seattle Calendar
seattle_calendar <- read.csv( "seattle/seattle_calendar.csv", stringsAsFactors = FALSE)

# Seattle Reviews
seattle_reviews <- read.csv( "seattle/seattle_reviews.csv", stringsAsFactors = FALSE)

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