library(ISLR)
library(MASS)
df = Default
df
index <- sample(x=1:nrow(df), size = 0.7*nrow(df))
train <- df[index,]
test <- df[-index,]

model <- lda(default ~ student+income+balance, data=train)
summary(model)
test$pred <- predict(model, test)$class
test
table(test$pred, test$default)


df = Default
df$student <- as.factor(as.numeric(df$student))
index = sample(x = 1:nrow(df), size = round(nrow(df) * 0.9))
train = df[index, ]
test = df[-index, ]

model = qda(default ~ student + balance + income, train)
summary(model)

test$pred = predict(model, test)$class
table(test$pred, test$default)
