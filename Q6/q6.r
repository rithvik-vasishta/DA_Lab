table <- read.csv('ageloans.csv', header = TRUE)
table

predict <- function(x,k){
  dis = vector()
  age <- x[1]
  loan <- x[2]
  length(dis) = nrow(table)
  for(i in 1:nrow(table)){
    dis[i] = sqrt(((age - table[i,1])^2) + ((loan - table[i,2])^2))
  }
  temp <- table
  temp$dist <- dis
  temp <- temp[order(temp$dist),]
  n_classes <- temp[1:k,3]
  count_table <- table(n_classes)
  classes <- names(count_table)
  return(classes[which.max(count_table)])
}

x_test <- data.frame("Age"=c(5,20,80),"Loan"=c(5,10000,300000))
pred1 <- apply(x_test,1,function(x) predict(x,1))
pred1
pred2 <- apply(x_test,1,function(x) predict(x,2))
pred2
pred3 <- apply(x_test,1,function(x) predict(x,3))
pred3

#Library Function
library(class)
y_train <- table[,3]
x_train <- table[,1:2]
pred_lib1 <- knn(train = x_train,test=x_test,cl=y_train, k = 1)
pred_lib1
pred_lib2 <- knn(train = x_train,test=x_test,cl=y_train, k = 2) 
pred_lib2
pred_lib3 <- knn(train = x_train,test=x_test,cl=y_train, k = 3) 
pred_lib3

