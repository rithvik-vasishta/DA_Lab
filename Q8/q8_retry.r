library(ISLR)
df <- Default
df
df['student'] <- apply(df['student'], 1, function(x) 
  {if (x == 'No') 
    return(0)
  else
    return(1)})
df['default'] <- apply(df['default'], 1, function(x) 
{if (x == 'No') 
  return(0)
  else
    return(1)})
df

train_index <- sample.int(nrow(df), size = 0.75*nrow(df))
train <- df[train_index, ]
test <- df[-train_index,]

normalize <- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
train['balance'] <- sapply(train['balance'], normalize)
train['income'] <- sapply(train['income'], normalize)
x_train = x_test <- train[,-1]
y_train = y_test <- train[,1]

logisticReg <- function(X,Y,lr=0.1){
  params <- rep(0, ncol(x_train)+1)
  for(i in 1:10){
    for(row in 1:nrow(X)){
      x <- as.numeric(c(list(1), X[row,]))
      pred <- as.double(1/as.double(1+exp(-(x%*%params))))
      loss <- Y[row] - pred
      for(p in 1:length(params)){
        params[p] = params[p] + x[p]*loss*lr
      }
    }
  }
  return(params)
  
}

getPred <- function(x){
  x<-as.numeric(c(list(1),x))
  return(1/(1+exp(-(x%*%params))))
}

getClass <- function(x){
  if(x>=0.5)
    return(1)
  return(0)
}

model <- glm(default ~ student+balance+income, data=train,family=binomial)

params <- logisticReg(x_train, y_train)
params

pred <- sapply(apply(x_train, 1, getPred), getClass)
pred
predLib <- sapply(predict(model, x_train, type='response'), getClass)
predLib

print('Confustion matrix')
table(pred, y_train)
print('CM for library')
table(predLib, y_train)

params
model$coefficients

