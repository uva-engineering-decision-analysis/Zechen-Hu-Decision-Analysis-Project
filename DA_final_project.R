weekdaytime <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Weekday_time.csv")
weekdaylog <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Weekday_log-time.csv")

summary(weekdaytime)
summary(weekdaylog)

library(mclust)

##weekday
#kmeans
weekdaytime.kmeans <-kmeans(weekdaytime, 2)
weekdaytime.kmeans.c <- weekdaytime.kmeans$cluster
#GMM
weekdaytime.GMM <- Mclust(weekdaytime, 2)
weekdaytime.GMM.c <- weekdaytime.GMM$classification
#lognormal
weekdaylog.GMM <- Mclust(weekdaylog, 2)
weekdaylog.GMM.c <- weekdaylog.GMM$classification

weekdaytime.dataframe <- data.frame(weekdaytime.kmeans.c, weekdaytime.GMM.c, weekdaylog.GMM.c)
write.csv(weekdaytime.dataframe, "/Users/huzechen/CourseProject/DA/final project/data/Total/WeekdayClassification.csv", row.names = FALSE)

##weekend
weekendtime <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Weekend_time.csv")
weekendlog <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Weekend_log-time.csv")

#kmeans
weekendtime.kmeans <-kmeans(weekendtime, 2)
weekendtime.kmeans.c <- weekendtime.kmeans$cluster
#GMM
weekendtime.GMM <- Mclust(weekendtime, 2)
weekendtime.GMM.c <- weekendtime.GMM$classification
#lognormal
weekendlog.GMM <- Mclust(weekendlog, 2)
weekendlog.GMM.c <- weekendlog.GMM$classification

weekendtime.dataframe <- data.frame(weekendtime.kmeans.c, weekendtime.GMM.c, weekendlog.GMM.c)
write.csv(weekendtime.dataframe, "/Users/huzechen/CourseProject/DA/final project/data/Total/WeekendClassification.csv", row.names = FALSE)


##AM Peak
ampeaktime <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/AM Peak_time.csv")
ampeaklog <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/AM Peak_log-time.csv")

#kmeans
ampeaktime.kmeans <-kmeans(ampeaktime, 2)
ampeaktime.kmeans.c <- ampeaktime.kmeans$cluster
#GMM
ampeaktime.GMM <- Mclust(ampeaktime, 2)
ampeaktime.GMM.c <- ampeaktime.GMM$classification
#lognormal
ampeaklog.GMM <- Mclust(ampeaklog, 2)
ampeaklog.GMM.c <- ampeaklog.GMM$classification

ampeaktime.dataframe <- data.frame(ampeaktime.kmeans.c, ampeaktime.GMM.c, ampeaklog.GMM.c)
write.csv(ampeaktime.dataframe, "/Users/huzechen/CourseProject/DA/final project/data/Total/AM PeakClassification.csv", row.names = FALSE)

##PM Peak
pmpeaktime <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/PM Peak_time.csv")
pmpeaklog <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/PM Peak_log-time.csv")

#kmeans
pmpeaktime.kmeans <-kmeans(pmpeaktime, 2)
pmpeaktime.kmeans.c <- pmpeaktime.kmeans$cluster
#GMM
pmpeaktime.GMM <- Mclust(pmpeaktime, 2)
pmpeaktime.GMM.c <- pmpeaktime.GMM$classification
#lognormal
pmpeaklog.GMM <- Mclust(pmpeaklog, 2)
pmpeaklog.GMM.c <- pmpeaklog.GMM$classification

pmpeaktime.dataframe <- data.frame(pmpeaktime.kmeans.c, pmpeaktime.GMM.c, pmpeaklog.GMM.c)
write.csv(pmpeaktime.dataframe, "/Users/huzechen/CourseProject/DA/final project/data/Total/PM PeakClassification.csv", row.names = FALSE)

##Off Peak
offpeaktime <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Off Peak_time.csv")
offpeaklog <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/Off Peak_log-time.csv")

#kmeans
offpeaktime.kmeans <-kmeans(offpeaktime, 2)
offpeaktime.kmeans.c <- offpeaktime.kmeans$cluster
#GMM
offpeaktime.GMM <- Mclust(offpeaktime, 2)
offpeaktime.GMM.c <- offpeaktime.GMM$classification
#lognormal
offpeaklog.GMM <- Mclust(offpeaklog, 2)
offpeaklog.GMM.c <- offpeaklog.GMM$classification

offpeaktime.dataframe <- data.frame(offpeaktime.kmeans.c, offpeaktime.GMM.c, offpeaklog.GMM.c)
write.csv(offpeaktime.dataframe, "/Users/huzechen/CourseProject/DA/final project/data/Total/Off PeakClassification.csv", row.names = FALSE)


###Plot
##weekday
weekday.kmeansdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekdaykmeans.csv")
weekday.GMMdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekdayGMM.csv")
weekday.lognormaldata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekdaylognormal.csv")
#kmeans
weekday.kmeansdata.all <- weekday.kmeansdata[,1]
weekday.kmeansdata.group1 <- weekday.kmeansdata[,2]
weekday.kmeansdata.group2 <- weekday.kmeansdata[,3]
weekday.kmeansdata.group1 <- na.omit(weekday.kmeansdata.group1)
weekday.kmeansdata.group2 <- na.omit(weekday.kmeansdata.group2)
hist(weekday.kmeansdata.all, freq = T, ylim=c(0,0.15), main = "Kmeans for Weekday")
lines(density(weekday.kmeansdata.all),col='blue')
lines(density(weekday.kmeansdata.group1),col='red')
lines(density(weekday.kmeansdata.group2),col='yellow')
#GMM
weekday.GMMdata.all <- weekday.GMMdata[,1]
weekday.GMMdata.group1 <- weekday.GMMdata[,2]
weekday.GMMdata.group2 <- weekday.GMMdata[,3]
weekday.GMMdata.group1 <- na.omit(weekday.GMMdata.group1)
weekday.GMMdata.group2 <- na.omit(weekday.GMMdata.group2)
hist(weekday.GMMdata.all, freq = T, ylim=c(0,0.15), main = "GMM for Weekday")
lines(density(weekday.GMMdata.all),col='blue')
lines(density(weekday.GMMdata.group1),col='red')
lines(density(weekday.GMMdata.group2),col='yellow')
#lognormal
weekday.lognormaldata.all <- weekday.lognormaldata[,1]
weekday.lognormaldata.group1 <- weekday.lognormaldata[,2]
weekday.lognormaldata.group2 <- weekday.lognormaldata[,3]
weekday.lognormaldata.group1 <- na.omit(weekday.lognormaldata.group1)
weekday.lognormaldata.group2 <- na.omit(weekday.lognormaldata.group2)
hist(weekday.lognormaldata.all, freq = T, ylim=c(0,0.15), main = "Lognormal-MM for Weekday")
lines(density(weekday.lognormaldata.all),col='blue')
lines(density(weekday.lognormaldata.group1),col='red')
lines(density(weekday.lognormaldata.group2),col='yellow')

##weekend
weekend.kmeansdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekendkmeans.csv")
weekend.GMMdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekendGMM.csv")
weekend.lognormaldata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/weekendlognormal.csv")
#kmeans
weekend.kmeansdata.all <- weekend.kmeansdata[,1]
weekend.kmeansdata.group1 <- weekend.kmeansdata[,2]
weekend.kmeansdata.group2 <- weekend.kmeansdata[,3]
weekend.kmeansdata.group1 <- na.omit(weekend.kmeansdata.group1)
weekend.kmeansdata.group2 <- na.omit(weekend.kmeansdata.group2)
hist(weekend.kmeansdata.all, freq = T, ylim=c(0,0.15), main = "Kmeans for Weekend")
lines(density(weekend.kmeansdata.all),col='blue')
lines(density(weekend.kmeansdata.group1),col='red')
lines(density(weekend.kmeansdata.group2),col='yellow')
#GMM
weekend.GMMdata.all <- weekend.GMMdata[,1]
weekend.GMMdata.group1 <- weekend.GMMdata[,2]
weekend.GMMdata.group2 <- weekend.GMMdata[,3]
weekend.GMMdata.group1 <- na.omit(weekend.GMMdata.group1)
weekend.GMMdata.group2 <- na.omit(weekend.GMMdata.group2)
hist(weekend.GMMdata.all, freq = T, ylim=c(0,0.15), main = "GMM for Weekend")
lines(density(weekend.GMMdata.all),col='blue')
lines(density(weekend.GMMdata.group1),col='red')
lines(density(weekend.GMMdata.group2),col='yellow')
#lognormal
weekend.lognormaldata.all <- weekend.lognormaldata[,1]
weekend.lognormaldata.group1 <- weekend.lognormaldata[,2]
weekend.lognormaldata.group2 <- weekend.lognormaldata[,3]
weekend.lognormaldata.group1 <- na.omit(weekend.lognormaldata.group1)
weekend.lognormaldata.group2 <- na.omit(weekend.lognormaldata.group2)
hist(weekend.lognormaldata.all, freq = T, ylim=c(0,0.15), main = "Lognormal-MM for Weekend")
lines(density(weekend.lognormaldata.all),col='blue')
lines(density(weekend.lognormaldata.group1),col='red')
lines(density(weekend.lognormaldata.group2),col='yellow')

##AM Peak
ampeak.kmeansdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/ampeakkmeans.csv")
ampeak.GMMdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/ampeakGMM.csv")
ampeak.lognormaldata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/ampeaklognormal.csv")
#kmeans
ampeak.kmeansdata.all <- ampeak.kmeansdata[,1]
ampeak.kmeansdata.group1 <- ampeak.kmeansdata[,2]
ampeak.kmeansdata.group2 <- ampeak.kmeansdata[,3]
ampeak.kmeansdata.group1 <- na.omit(ampeak.kmeansdata.group1)
ampeak.kmeansdata.group2 <- na.omit(ampeak.kmeansdata.group2)
hist(ampeak.kmeansdata.all, freq = T, ylim=c(0,0.15), main = "Kmeans for AM Peak")
lines(density(ampeak.kmeansdata.all),col='blue')
lines(density(ampeak.kmeansdata.group1),col='red')
lines(density(ampeak.kmeansdata.group2),col='yellow')
#GMM
ampeak.GMMdata.all <- ampeak.GMMdata[,1]
ampeak.GMMdata.group1 <- ampeak.GMMdata[,2]
ampeak.GMMdata.group2 <- ampeak.GMMdata[,3]
ampeak.GMMdata.group1 <- na.omit(ampeak.GMMdata.group1)
ampeak.GMMdata.group2 <- na.omit(ampeak.GMMdata.group2)
hist(ampeak.GMMdata.all, freq = T, ylim=c(0,0.15), main = "GMM for AM Peak")
lines(density(ampeak.GMMdata.all),col='blue')
lines(density(ampeak.GMMdata.group1),col='red')
lines(density(ampeak.GMMdata.group2),col='yellow')
#lognormal
ampeak.lognormaldata.all <- ampeak.lognormaldata[,1]
ampeak.lognormaldata.group1 <- ampeak.lognormaldata[,2]
ampeak.lognormaldata.group2 <- ampeak.lognormaldata[,3]
ampeak.lognormaldata.group1 <- na.omit(ampeak.lognormaldata.group1)
ampeak.lognormaldata.group2 <- na.omit(ampeak.lognormaldata.group2)
hist(ampeak.lognormaldata.all, freq = T, ylim=c(0,0.15), main = "Lognormal-MM for AM Peak")
lines(density(ampeak.lognormaldata.all),col='blue')
lines(density(ampeak.lognormaldata.group1),col='red')
lines(density(ampeak.lognormaldata.group2),col='yellow')

##PM Peak
pmpeak.kmeansdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/pmpeakkmeans.csv")
pmpeak.GMMdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/pmpeakGMM.csv")
pmpeak.lognormaldata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/pmpeaklognormal.csv")
#kmeans
pmpeak.kmeansdata.all <- pmpeak.kmeansdata[,1]
pmpeak.kmeansdata.group1 <- pmpeak.kmeansdata[,2]
pmpeak.kmeansdata.group2 <- pmpeak.kmeansdata[,3]
pmpeak.kmeansdata.group1 <- na.omit(pmpeak.kmeansdata.group1)
pmpeak.kmeansdata.group2 <- na.omit(pmpeak.kmeansdata.group2)
hist(pmpeak.kmeansdata.all, freq = T, ylim=c(0,0.15), main = "Kmeans for PM Peak")
lines(density(pmpeak.kmeansdata.all),col='blue')
lines(density(pmpeak.kmeansdata.group1),col='red')
lines(density(pmpeak.kmeansdata.group2),col='yellow')
#GMM
pmpeak.GMMdata.all <- pmpeak.GMMdata[,1]
pmpeak.GMMdata.group1 <- pmpeak.GMMdata[,2]
pmpeak.GMMdata.group2 <- pmpeak.GMMdata[,3]
pmpeak.GMMdata.group1 <- na.omit(pmpeak.GMMdata.group1)
pmpeak.GMMdata.group2 <- na.omit(pmpeak.GMMdata.group2)
hist(pmpeak.GMMdata.all, freq = T, ylim=c(0,0.15), main = "GMM for PM Peak")
lines(density(pmpeak.GMMdata.all),col='blue')
lines(density(pmpeak.GMMdata.group1),col='red')
lines(density(pmpeak.GMMdata.group2),col='yellow')
#lognormal
pmpeak.lognormaldata.all <- pmpeak.lognormaldata[,1]
pmpeak.lognormaldata.group1 <- pmpeak.lognormaldata[,2]
pmpeak.lognormaldata.group2 <- pmpeak.lognormaldata[,3]
pmpeak.lognormaldata.group1 <- na.omit(pmpeak.lognormaldata.group1)
pmpeak.lognormaldata.group2 <- na.omit(pmpeak.lognormaldata.group2)
hist(pmpeak.lognormaldata.all, freq = T, ylim=c(0,0.15), main = "Lognormal-MM for PM Peak")
lines(density(pmpeak.lognormaldata.all),col='blue')
lines(density(pmpeak.lognormaldata.group1),col='red')
lines(density(pmpeak.lognormaldata.group2),col='yellow')

##Off Peak
offpeak.kmeansdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/offpeakkmeans.csv")
offpeak.GMMdata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/offpeakGMM.csv")
offpeak.lognormaldata <- read.csv("/Users/huzechen/CourseProject/DA/final project/data/Total/offpeaklognormal.csv")
#kmeans
offpeak.kmeansdata.all <- offpeak.kmeansdata[,1]
offpeak.kmeansdata.group1 <- offpeak.kmeansdata[,2]
offpeak.kmeansdata.group2 <- offpeak.kmeansdata[,3]
offpeak.kmeansdata.group1 <- na.omit(offpeak.kmeansdata.group1)
offpeak.kmeansdata.group2 <- na.omit(offpeak.kmeansdata.group2)
hist(offpeak.kmeansdata.all, freq = T, ylim=c(0,0.15), main = "Kmeans for Off Peak")
lines(density(offpeak.kmeansdata.all),col='blue')
lines(density(offpeak.kmeansdata.group1),col='red')
lines(density(offpeak.kmeansdata.group2),col='yellow')
#GMM
offpeak.GMMdata.all <- offpeak.GMMdata[,1]
offpeak.GMMdata.group1 <- offpeak.GMMdata[,2]
offpeak.GMMdata.group2 <- offpeak.GMMdata[,3]
offpeak.GMMdata.group1 <- na.omit(offpeak.GMMdata.group1)
offpeak.GMMdata.group2 <- na.omit(offpeak.GMMdata.group2)
hist(offpeak.GMMdata.all, freq = T, ylim=c(0,0.15), main = "GMM for Off Peak")
lines(density(offpeak.GMMdata.all),col='blue')
lines(density(offpeak.GMMdata.group1),col='red')
lines(density(offpeak.GMMdata.group2),col='yellow')
#lognormal
offpeak.lognormaldata.all <- offpeak.lognormaldata[,1]
offpeak.lognormaldata.group1 <- offpeak.lognormaldata[,2]
offpeak.lognormaldata.group2 <- offpeak.lognormaldata[,3]
offpeak.lognormaldata.group1 <- na.omit(offpeak.lognormaldata.group1)
offpeak.lognormaldata.group2 <- na.omit(offpeak.lognormaldata.group2)
hist(offpeak.lognormaldata.all, freq = T, ylim=c(0,0.15), main = "Lognormal-MM for Off Peak")
lines(density(offpeak.lognormaldata.all),col='blue')
lines(density(offpeak.lognormaldata.group1),col='red')
lines(density(offpeak.lognormaldata.group2),col='yellow')

