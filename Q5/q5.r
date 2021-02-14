df <- read.csv('q5.csv')
df
model <- lm(Sales ~ TV + Radio, data=df)
print(summary(model))
df$pred_builtin = predict(model, data=df)
df

x1_bar = mean(df$TV)
x2_bar = mean(df$Radio)
y_bar = mean(df$Sales)

b1 = sum((df$TV - x1_bar)*(df$Sales - y_bar))/sum((df$TV - x1_bar)**2)
b2 = sum((df$Radio - x2_bar)*(df$Sales - y_bar))/sum((df$Radio - x2_bar)**2)
b0 = y_bar - b1*x1_bar - b2*x2_bar

df$pred_manual = b0 + b1*df$TV + b2*df$Radio
df

rss = sum((df$Sales - df$pred_manual)**2)
tss = sum((df$Sales - y_bar)**2)
rss
tss
se = 1-(rss/tss)
se
rse = rss/(nrow(df)-2)
rse
