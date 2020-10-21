#### 
#### This script makes two plots from one data set
#### One is a bad plot and the other a good plot

library(tidyverse)

test_history<- read.csv("data/testing_history.csv")
#test_result <- select(test_history, date, state, negative, negativeIncrease,
 #                     positive, positiveIncrease, recovered, 
  #                    totalTestResults)
test_result <- select(test_history, date, state,recovered)

glimpse(test_result)
 

recovered_TN<- test_result %>% 
    pivot_wider(names_from = state, values_from = recovered) %>% 
     select(date,TN)
    

TN_sum <- test_result %>%
    pivot_wider(names_from = state, values_from = recovered) %>%
    select(date,TN,positive)
