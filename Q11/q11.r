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
for(row in 1:nrow(df)){
  x <- df[row, 2:6]
  barplot(as.numeric(x), names.arg = x,  main = paste('Student',df[row,'name'],'marks distribution'), col = rainbow(length(x)))
  legend("topright" ,legend = labels, fill = rainbow(length(x)))
}

df = data.frame(
  votes = c(55,65,74,23,21,29,39,10),
  party = c("A", "B", "C", "A", "B", "C", "A", "B")
)

labels <- c("Party A", "Party B", "Party C")
a <- sum(df$votes[df$party == 'A'])/sum(df$votes)*100
b <- sum(df$votes[df$party == 'B'])/sum(df$votes)*100
c <- sum(df$votes[df$party == 'C'])/sum(df$votes)*100
v<-c(a,b,c)
barplot(v, names.arg = "votes distribution", col=rainbow(length(v)))
legend("topright", legend = labels, fill = rainbow(length(v)))


df <- data.frame(
  rollno = c(100, 101, 102, 103, 104),
  marks1 = c(90,100,85,90,70),
  marks2 = c(85,90,100,95,75),
  gender = c('M','M','F','F','M')
)
x<- c(mean(df[df$gender == 'M',]$marks1), mean(df[df$gender == 'F',]$marks1))
barplot(x, names.arg = 'Marks 1 dist', col = rainbow(length(x)))
legend("topright", legend = c("Boys", "Girls"), fill = rainbow(length(x)))
