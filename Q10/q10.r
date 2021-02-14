df <- data.frame(
  name = c("Ramesh", "Suresh", "Mallesh"),
  physics = c(100,90,90),
  chemistry = c(90,100,80),
  maths = c(75, 85, 100),
  foc = c(65, 70, 70),
  cad = c(70, 75, 75)
)
df
labels <- colnames(df)[2:6]
par(mfrow=c(1,3))
for(i in 1:nrow(df)){
  x <- df[row, 2:6]
  pie(as.numeric(x), labels=x, main=paste('Studen ', df[row,'name']), col=rainbow(length(x)))
  legend("topright", legend=labels, fill=rainbow(length(x)), cex=1)
}
