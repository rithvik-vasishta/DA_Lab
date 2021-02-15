#df <- read.csv('q4.csv')
df
df <- data.frame(budget=c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131),
                 sales=c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48))

#new <- data.frame(budget = c(4000,4500,5000,5500,6000,6500,10000,2000))
#using inbuilt
linear_model = lm(sales~budget, data=df)
print(summary(linear_model))
new = data.frame(budget = df$budget)
prediction = predict(linear_model, new)
prediction
plot(df$budget, df$sales, col="red", abline(lm(df$sales~df$budget)))
lines(df$budget, prediction, col="blue")

#manually
x_bar <- mean(df$budget)
y_bar <- mean(df$sales)

m1 <- sum((df$budget - x_bar)*(df$sales - y_bar))/sum((df$budget - x_bar)**2)
m0 <- y_bar - m1*x_bar

new_pred = m0 + m1*df$budget
plot(df$budget, df$sales, col="red")
lines(df$budget, new_pred, col="blue")

