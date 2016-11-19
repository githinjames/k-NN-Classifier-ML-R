# Using K-NN Algorithm for classifying the Flower Species in IRIS Dataset
data("iris")
str(iris)
table(iris$Species)
head(iris)
# Making Training and validation dataset
set.seed(1234)
g<- runif(nrow(iris))
iris3 <- iris[order(g),]
head(iris3)
# Normalization function
normalize <- function(x)
{
  return((x-min(x))/(max(x)-min(x)))
}
iris_n <- as.data.frame(lapply(iris3[,c(1,2,3,4)], normalize))
summary(iris_n)
iris_train <- iris_n[1:130,]
iris_test <- iris_n[131:150,]
iris_train_target <- iris3$Species[1:130]
iris_test_target <- iris3$Species[131:150]
library(class)
sqrt(150)  # 12.24754, take 13 as k value, odd number to break the tie
m1 <- knn(train = iris_train, test = iris_test, cl= iris_train_target, k=13)
m1
table(iris_test_target, m1)
## CODE ENDS HERE
