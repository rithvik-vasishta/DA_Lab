library(class)
df = data.frame(
  age = c(25,35,30,20,27,30,32,22,26,500),
  loan = c(10000,20000,10000,15000,12000,17000,35000,28000,19000,3000000),
  default = c("Y", "N", "Y", "Y", "N", "Y", "N", "N", "Y","Y")
)
df
myKnn <- function(x,k){
  distance = vector()
  age <- as.numeric(x[1])
  loan <- as.numeric(x[2])
  length(distance) = nrow(df)
  for(i in 1:nrow(df))
    distance[i] = sqrt(((age - df[i,1])^2) + ((loan - df[i,2])^2))
  temp <- df
  temp$dist = distance
  temp <- temp[order(temp$dist),]
  cnt <- table(temp[1:k,3])
  classes <- names(cnt)
  pred <- classes[which.max(cnt)]
  return(pred)
}






df$pred1 <- apply(df,1,function(x) myKnn(x,1))
df$pred2 <- apply(df,1,function(x) myKnn(x,2))
df$pred3 <- apply(df,1,function(x) myKnn(x,3))
df
y <- df[,3]
x <- df[,1:2]

df$predk1_builtin <- knn(train = x, cl = y, test = df[,1:2], k = 1)
df$predk2_builtin <- knn(train = x, cl = y, test = df[,1:2], k = 2)
df$predk3_builtin <- knn(train = x, cl = y, test = df[,1:2], k = 3)

df
