

##
library(nycflights13)
library(tidyverse)

##

glimpse(flights)
?flights

## flights in January. (select columns with month row =1)
### filter returns rows for comparison is true
jan_flights <- filter(flights, month ==1)
glimpse(jan_flights)

##flights in Jan and feb
jan_or_feb <- filter(flights, month == 1 | month == 2)
glimpse(jan_or_feb)

##united airlines flights on the 13th of the month
UA_13th <- filter(flights, carrier == "UA" & day ==13)
glimpse (UA_13th)

##Flights longer than 2000 miles
longhaul <- filter(flights, distance > 2000)
glimpse(longhaul)

## NA for missing data

missing_tailnum <- filter(flights, is.na(tailnum))
glimpse(missing_tailnum)

## Removing NA: is.na() returns true for NA else false
### Will want to remove NA from calculations
### messes up logical operations

# Practice with select() function

##select columns by name
select(flights, carrier, year)

##by pattern
select(flights, contains("hour"))

##select column by position in data frame
select(flights, 1:3)


# Calculations using data frames

## using summarize: condense to single answer
##calculate mean distance of flights
summary_dist <- summarise (flights, mean.distance = mean(distance))
summary_dist

## passing multiple functions to summarize
mean_dist_and_sd <- summarise (flights,
                                mean.dist = mean(distance, na.rm = TRUE),
                                sd.dist = sd(distance, na.rm = TRUE))

mean_dist_and_sd


## using mutate: answer for each row
## watch out for NA using parameter na.rm = true

##convert miles to km
### multiplies entire row by factor
flights_km <- mutate(flights, dist.km = distance*1.61)
glimpse(flights_km)

###passing multiple arguments

flights_obsolete_units <- mutate(flights,
                                 dist.furlongs = distance*8,
                                 dist.leagues =distance * 0.29,
                                 dist.rods = distance * 320)
select(flights_obsolete_units, distance, dist.furlongs, dist.leagues, dist.rods)


# Grouping practice

## group_by() invisibly groups

grouped_flights <- group_by(flights, carrier)
glimpse(grouped_flights)

distance_summary <- summarise(grouped_flights, 
                              mean.dist = mean(distance, na.rm = TRUE),
                              sd.dist = sd(distance, na.rm = TRUE))
print(distance_summary)
