
# Reading data

?read.table
?read.csv


mydata <- read.csv('evals.csv')


# Summaries

head(mydata, 3)
tail(mydata)

View(mydata)

str(mydata)

a <- names(mydata)

summary(mydata)




# Variables

b <- mydata$score

mean(mydata$score)

summary(mydata$score)

mydata$score * 2

mydata$ten_point_scale <- mydata$score * 2



summary(mydata$ten_point_scale)

mydata$new_varible <- 0
mydata$number <- 1:nrow(mydata) #записать от 1 до последней строки в mydata
summary(mydata$number)

nrow(mydata) #возвращает кол-во строчек в data-frame
ncol(mydata) #количество столбцов в data-frame





# Subsetting

mydata$score[1:10] # вывод первых 10 значений столбца score; [] - способ задавать индекс

mydata[1,1]
mydata[c(2,193,225),1] #обращение к строке, столбцу
mydata[101:200,1] #обращение к строке (со 101 по 200), столбцу

mydata[5,]
mydata[,1] == mydata$score #сравнение значений

mydata[,2:5]
head(mydata[,2:5]) #вывод шести первых знчений столбцов 2-5

##


# Subsetting with condition

mydata$gender
mydata$gender == 'female' #вывеи TRUE если женщина. Выведи FALSE, если другое
mydata[mydata$gender == 'female',1] #вывод первого столбца (score) только женщин
head(mydata[mydata$gender == 'female',1:3]) #вывод 1-3 столбцов (score, rank, ethnicity) только женщин

#subset - позволяет обращаться к данным без индексации
subset(mydata, gender == 'female')

head(subset(mydata, gender == 'female'))
head(subset(mydata, score > 3.5))


# rbind, cbind
#rbind - row bind
#cbind - column bind

#rbind - соединяет два дата-фрейма по строкам с одинаковым кол-вом столбцов, если у них (столбцов/переменных) одинаковые имена

#cbind - соединяет два дата-фрейма по столбцам


mydata2 <- subset(mydata, gender == 'female')
mydata3 <- subset(mydata, gender == 'male')
mydata4 <- rbind(mydata2, mydata3)

mydata5 <- mydata[,1:10] #дата-фрейм с 1 по 10 столбец
mydata6 <- mydata[,11:24]
mydata7 <- cbind(mydata6, mydata5) 

