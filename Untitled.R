sourcedir <- "/Users/huzechen/CourseProject/DA"
datadir <- "/Users/huzechen/CourseProject/DA/final project"
setwd(datadir)

Ttime <- read.csv("Ttime.csv")
Kmeansdata <- read.csv("Kmeans.csv")
GMMdata <- read.csv("GMM.csv")

summary(Ttime)


a <- Kmeansdata[,1]
b <- Kmeansdata[,2]
c <- Kmeansdata[,3]
b <- na.omit(b)
c <- na.omit(c)
hist(a, freq = T, ylim=c(0,0.15))
lines(density(a),col='blue')
lines(density(b),col='red')
lines(density(c),col='yellow')


d <- GMMdata[,1]
e <- GMMdata[,2]
f <- GMMdata[,3]
e <- na.omit(e)
f <- na.omit(f)
hist(d, freq = T, ylim = c(0,0.15))
lines(density(d),col='blue')
lines(density(e),col='red')
lines(density(f),col='yellow')
model1 <- kmeans(a,2)
kmeansc <- model1$cluster

library(mclust)
model2 <- Mclust(a, 2)

gmmc <- model2$classification

length(kmeansc)
length(gmmc)

mydataframe <- data.frame(kmeansc, gmmc)
mydataframe
write.csv(mydataframe, "/Users/huzechen/CourseProject/DA/final project/Cluster.csv", row.names = FALSE)
