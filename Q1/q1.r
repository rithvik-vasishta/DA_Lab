df <- data.frame(name = c("jacK","jackson89","jo hn","jill","#ben", "max","mARco"),
                 usn = c("CD6",'CD7','CD22','CD34','CD45','CD65','CD69'),
                 addr = c('blr','glb','MYS','BLR','MAN','BLR','BLR'),
                 dept = c('CSE','CSE','CSE','CSE','CSE','CSE','CSE'),
                 cgps = c("7.8","na","12","5.7","8","na","70%"))
write.csv(df,'temp.csv')
df
df$name <- gsub('[[:digit:]]','',df$name)
df
df$name <- gsub('[[:punct:]]','',df$name)
df$name <- gsub('[[:space:]]','',df$name)
df$name <- tolower(df$name)
df
df$cgps <- gsub('%','',df$cgps)
df$cgps <- as.numeric(df$cgps)
df
df$cgps <- ifelse(df$cgps>10.0,df$cgps/10.0,df$cgps)  
df
df$cgps[which(is.na(df$cgps))] <- mean(df$cgps, na.rm = TRUE)
df

outliers = boxplot(df$cgps)$out
data <- df
df <- data[-which(df$cgps %in% outliers),]
df

