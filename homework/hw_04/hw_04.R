# -------------------------------------------
#
# Script for Homework 4: 
# Reformatting data frames and introductory plotting (line and box plots)
# 
# Imports data and makes 3 formatted plots
# 
# Written by Haley Dylewski
#-------------------------------------------------

library(tidyverse)

#-------------------------------------------------

chris_data <- read_csv('data/babe_names.csv')
glimpse(chris_data)

#tidy up data
chris_data_tidy <- chris_data %>%
  pivot_longer(cols = -year, names_to = 'gender', values_to = "number.babies")
glimpse(chris_data_tidy)


# generate a line plot. 
# format: x_axis = year , y_axis = #babies, different colors for genders
ggplot(data = chris_data_tidy) + 
    geom_line(mapping = aes(x= year, y = number.babies, color = gender))

# generate a smooth/loess line plot
# format: same as previous plot
ggplot(data = chris_data_tidy) + 
  geom_smooth(mapping = aes(x= year, y = number.babies, color = gender))

# generate box plot
# format: x_axis = sex, y-axis = #babies, color coded for gender
ggplot(data = chris_data_tidy) + 
  geom_boxplot(mapping = aes(x= gender, y = number.babies, color = gender))


