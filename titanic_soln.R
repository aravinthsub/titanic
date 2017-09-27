install.packages("dplyr")
install.packages("tidyr")
install.packages("stringdist")
install.packages("magrittr")
library(dplyr)
library(stringdist)
library(tidyr)
library(magrittr)

str(titanic)

titanic <- read.csv("titanic_original.csv")
titanic <- as.data.frame(titanic)

str(titanic)
titanic$embarked <- sub("^$", "S", titanic$embarked)

avgAge <- mean(titanic$age, na.rm = TRUE)

titanic$age[is.na(titanic$age)] <- avgAge
titanic$boat <- sub("^$", "NA", titanic$boat)

EmptyCabin <- which(titanic$cabin=="")
NotEmptyCabin <- which(titanic$cabin!="")


titanic$has_cabin_number[EmptyCabin] <- 0
titanic$has_cabin_number[NotEmptyCabin] <- 1  

write.csv(titanic, file="titanic_clean.csv")