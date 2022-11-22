
setwd("C:/Users/Liliya/Documents/R")
getwd()
mydata <- read.csv("Data/evals.csv")

str(mydata)
mydata$gender == 'female'
mydata[mydata$gender == 'female',1]

names(mydata)

mydata2 <- subset(mydata, gender == 'female')
mydata3 <- subset(mydata, gender == 'male')


mydata5 <- mydata[,1:10] #дата-фрейм с 1 по 10 столбец
mydata6 <- mydata[,11:21]
mydata7 <- cbind(mydata5, mydata6)

names(mydata5)
names(mydata6)
names(mydata7)
test <- subset(mydata, )

exp(2)
log(2)
sqrt(2)
sin(2)
sqrt(5400)
log(8, base = 2)
