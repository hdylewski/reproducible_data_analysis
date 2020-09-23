##
library(nycflights13)
library(tidyverse)

# see documentation fo flights data structure
?nycflights13::flights
glimpse(flights)

##gather flights that are at least 2hrs late
flights_2hr_late <- filter(flights, dep_delay >= 120)
glimpse(flights_2hr_late)

##flights with combined airline and flight number
flights_airline_num <- mutate(flights, airline_flight_num = paste0(carrier, flight))
glimpse(flights_airline_num)


## number of flights each aircraft flew for each carrier total

## group flight data by tailnumber then by carrier
tail_num_group <- group_by(flights, tailnum, carrier)

## make tibble showing flights per carrier for each tailnumber aka number_of_flights
tail_num_carriers = summarize(tail_num_group, number_of_flights = n() )
print (tail_num_carriers)

## Same result using pipes 
Plain_and_carrier <- flights %>%
  group_by(tailnum, carrier) %>%
  summarize(tail_num_group, number_of_flights = n())

