install.packages("ISLR")
library(ISLR)
library(class)
library(dplyr)
library(ggplot2)
library(ggthemes)

##EXPLORATION
#Percentage that purchased caravan insurance
prop.purchased <- mean(Caravan$Purchase == "Yes") 

##Data Cleaning & Wrangling
any(is.na(Caravan))
y <- Caravan[,86]
standardized.data <- scale(Caravan[,-86])
var(standardized.data[,1]) ##should be "1"

##Partition features & response variables into test & train sets
test.index <- 1:1000 #test data will be first 1000 rows
test.data <- standardized.data[test.index,]
test.y <- y[test.index]

train.data <- standardized.data[-test.index,]
train.y <- y[-test.index]

##MODEL 1
set.seed(101)
pred <- knn(train.data, test.data, train.y, k = 1)

##MODEL 1 Metrics
misclass <- mean(test.y != pred)
accuracy <- 1 - misclass

##OPTIMIZATION (of k)
pred = NULL
error.rate = NULL

for(i in 1:20) {
  set.seed(101)
  pred <- knn(train.data, test.data, train.y, k = i)
  error.rate[i] <- mean(test.y != pred)
}

k <- data.frame(k = 1:20, error = error.rate)

#Elbow Chart
ggplot(k, aes(x = k, y = error)) + 
  geom_point(size = 3, color = "blue", alpha = 0.5) +
  geom_line(color = "blue") +
  theme_economist() +
  ggtitle("Elbow Chart") +
  geom_hline(yintercept = k[9,2], linetype = "dashed", color = "red" )

pred9 <- knn(train.data, test.data, train.y, k = 9)
misclass9 <- mean(test.y != pred9)
accuracy9 <- 1 - misclass9 #94% accuracy 
