#-----------------------------------------
# Script for homework 3
# Understanding data types, basic data import, and intro to plots
#
# Identify data types, import data, tidy it up, and make a plot
#
#Written by Haley Dylewski
-----------------------------------------

library(tidyverse)

# -----------------------------------------------
#      Part 1: Vector Types and Coercion
#--------------------------------------------------
# define vectors 
Vect.1 <- c(TRUE,FALSE,FALSE)
vect.2 <- c(1,2,3)
Vect.3 <- c(1.3,2.4,3.5)
vect.4 <- c("a","b","c")

# Identify structure type of each vector
class(Vect.1)
class(vect.2)
class(Vect.3)
class(vect.4)

# What type are these vectors and why
unknown.1 <- c(1, 2,"a") # chr
unknown.2 <- c(TRUE, FALSE, 2) #num
## Why: a vector can only contain  asingle data type. 
## unknown.1: a can only be a char. Numbers can also be coerced to chars
## unknown 2: logicals are stored in the computer as 1's and 0's
##            so can be coerced to be nums


#-----------------------------------------------------
#      Part 2: Basic R operations
#-----------------------------------------------------

##reads in enzyme activity data file, gathers information on the file
## (class type, structure) and prints  a histogram of tha data

med_enz <- read.csv(file = 'data/med_enz.csv')

#gather info on file structure
class(med_enz)
str(med_enz)
nrow(med_enz)
glimpse(med_enz)

#print histogram
p <- ggplot(data = med_enz, aes(x = activity.nM.hr)) + 
  geom_histogram()
print(p)
ggsave(filename = "plots/hmk_2_plot.png", plot = p, height = 3, width = 4, units = "in", dpi = 300)

