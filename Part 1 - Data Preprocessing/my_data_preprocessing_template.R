# Data Preprocessing

# Importing the dataset
# install.packages("caTools")
setwd("C:/Code/MachineLearning/Part 1 - Data Preprocessing")
library(caTools)

dataset = read.csv("Data.csv")

# Take care of missing data

dataset$Age = ifelse( is.na(dataset$Age),
                      ave(dataset$Age , FUN = function(x) mean( x, na.rm = TRUE ) ) ,
                      dataset$Age )

dataset$Salary = ifelse( is.na(dataset$Salary) ,
                         ave( dataset$Salary, FUN = function(x) mean(x , na.rm = TRUE) ),
                         dataset$Salary  )

# Encoding categorical data
dataset$Country = factor( dataset$Country , 
                          levels = c('France' , 'Spain', 'Germany'),
                          labels = c(1 ,  2 , 3)
                          )

dataset$Purchased = factor( dataset$Purchased , 
                            levels = c('Yes' , 'No') ,
                            labels = c( 0, 1 )
                            )
#split data set into training set and data set

set.seed( 123 )
split = sample.split( dataset$Purchased , SplitRatio = 0.8 )

trainingSet = subset( dataset , split == TRUE )
testSet = subset( dataset, split == FALSE )