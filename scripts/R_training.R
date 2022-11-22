my_var1 <- 42
my_var2 <- 35.25
my_var1 + 100
my_var3 <- my_var1^2 + my_var2^2
my_vector1 <- c(-32, 0.58, 67)
my_vector1[3]
my_vector1[c(1,3)]
my_vector1[my_vector1 > 0 & my_vector1 < 65]

my_vector <- 1:20
my_sum <- sum(my_vector[my_vector > 10])


age <- c(16,18,22,27)
is_maried <- c(F, F, T, T)
data <- list(age, is_maried)
data[[1]][1]
data[[2]][3]



my_vector <- c(21, 18, 21, 19, 25, 20, 17, 17, 18, 22, 17, 18, 18, 19, 19, 27, 21, 20, 24, 17, 15, 24, 24, 29, 19, 14, 21, 17, 19, 18, 18, 20, 21, 21, 19, 19, 17, 21, 13, 17, 13, 23, 15, 23, 24, 16, 17, 25, 24, 22)
mean(my_vector1)
sd(my_vector1)
my_vector1[my_vector1 < mean(my_vector1) + sd(my_vector1)]
my_vector1[my_vector1 > mean(my_vector1) + sd(my_vector1)]

my_vector2 <- my_vector1[my_vector1 < mean(my_vector1) + sd(my_vector1) || my_vector1 < mean(my_vector1) - sd(my_vector1)]
my_vector_2
my_vector_2 <- my_vector[my_vector < mean(my_vector) + sd(my_vector) & my_vector > mean(my_vector) - sd(my_vector)]



mydata <- read.csv('evals.csv')
View(mydata)
str(mydata)

mydata$number <- 1:nrow(mydata)

mydata[5,] #îáðàùàåìñÿ ê ïÿòîé ñòðîêå
mydata[,1] #îáðàùàåìñÿ ê ïåðâîìó ñòîëáöó
mydata$gender

mydata[mydata$gender == 'female',1] #âûâîä îöåíîê äëÿ æåíùèí


# rbind, cbind

mydata2 <- subset(mydata, gender == 'female')
mydata3 <- subset(mydata, gender == 'male')
mydata4 <- rbind(mydata2, mydata3)

mydata5 <- mydata[,1:10]
mydata6 <- mydata[,11:24]
mydata7 <- cbind(mydata6, mydata5) #îáúåäèíÿåò äâå òàáëèöû

?cbind

#1.3. Task 1.
data(mtcars)
help(mtcars)
my_data_cars <- mtcars

#Â äàòàôðýéìå mtcars ñîçäàéòå íîâóþ êîëîíêó (ïåðåìåííóþ) ïîä íàçâàíèåì even_gear
#my_data_cars$even_gear <- ifelse(my_data_cars$gear %% 2 ==1 , 0,1)
#mtcars$even_gear <- (mtcars$gear+1) %% 2
my_data_cars$even_gear <- 0
my_data_cars$even_gear <- (my_data_cars$gear+1) %% 2

#Task 2
#Cîçäàòü ïåðåìåííóþ - âåêòîð mpg_4 è ñîõðàíèòü â íåå çíà÷åíèÿ ðàñõîäà òîïëèâà (mpg) äëÿ ìàøèí ñ ÷åòûðüìÿ öèëèíäðàìè (cyl)
mpg_4 <- my_data_cars[my_data_cars$cyl == 4,"mpg"]

#Task 3
#Cîçäàòü íîâûé dataframe ïîä íàçâàíèåì mini_mtcars, â êîòîðîì áóäóò ñîõðàíåíû òîëüêî òðåòüÿ, ñåäüìàÿ, äåñÿòàÿ, äâåíàäöàòàÿ è ïîñëåäíÿÿ ñòðî÷êà äàòàôðåéìà mtcars
names(mtcars)
str(mtcars)
mini_mtcars <- subset(mtcars[c(3,7,10,12,32),])
#àëüòåðíàòèâíîå ðåøåíèå
mini_mtcars <- mtcars[c(3, 7, 10, 12, nrow(mtcars)), ]

# 1.4. Ýëåìåíòû ñèíòàêñèñà
# Ñîçäàéòå íîâóþ ÷èñëîâóþ ïåðåìåííóþ  new_var â äàííûõ mtcars, êîòîðàÿ ñîäåðæèò åäèíèöû â ñòðî÷êàõ, åñëè â ìàøèíå íå ìåíüøå ÷åòûð¸õ êàðáþðàòîðîâ (ïåðåìåííàÿ "carb") èëè áîëüøå øåñòè öèëèíäðîâ (ïåðåìåííàÿ "cyl"). Â ñòðî÷êàõ, â êîòîðûõ óñëîâèå íå âûïîëíÿåòñÿ, äîëæíû ñòîÿòü íóëè.
mtcars$new_var <- 0
mtcars$new_var <- ifelse(mtcars$carb >= 4 | mtcars$cyl > 6, 1, 0)
#Ïîäñêàçêà: åñëè ïîñòàâèòü êàâû÷êè äëÿ çíà÷åíèé, òî ââåäåòñÿ ñëîâî, à íå ÷èñëî. Áåç êàâû÷åê áóäåò ÷èñëî.

# Â óæå ñóùåñòâóþùåé ïåðåìåííîé my_vector ñîõðàíåí âåêòîð èç 50 ÷èñåë.

#Ðåøèòå çàäà÷ó èñïîëüçóÿ êîíñòðóêöèþ ifelse:
#Åñëè ñðåäíåå çíà÷åíèå âåêòîðà my_vector áîëüøå 20, â ïåðåìåííóþ result ñîõðàíèòå "My mean is great",  åñëè ñðåäíåå çíà÷åíèå my_vector ìåíüøå èëè ðàâíî 20 òî â ïåðåìåííóþ result ñîõðàíèòå  ñòðîêó "My mean is not so great".
result <- 0
my_vector <- c(1:50)
my_vector <- c(20.67,23.34, 22.65, 17.11, 22.1, 26.32, 20.39, 21.04, 23.78, 31.11, 21.13, 22.44, 23.21, 27.02, 18.64, 20.9, 20.77, 20.0, 21.29, 23.48, 18.47, 25.02, 17.04, 30.97, 12.91, 23.88, 32.95, 8.46 ,23.15, 21.05, 20.63, 19.95, 17.38, 29.35, 24.43, 23.66, 18.32, 30.13, 19.36, 19.67, 24.23, 20.82, 18.21, 9.91 ,21.45, 18.04, 18.31, 17.18, 10.99, 10.06)
if (mean(my_vector, trim=0, na.rm = FALSE) > 20){
  result <- 'My mean is great'
} else {
  result <- 'My mean is not so great'
}

?AirPassengers # ñïðàâêà î äàííûõ
str(AirPassengers) # ñòðóêòóðà äàííûõ
AirPassengers[1]

#ñîçäàòü ïåðåìåííóþ good_months è ñîõðàíèòü â íåå ÷èñëî ïàññàæèðîâ òîëüêî â òåõ ìåñÿöàõ, â êîòîðûõ ýòî ÷èñëî áîëüøå, ÷åì ïîêàçàòåëü â ïðåäûäóùåì ìåñÿöå.  
as.vector(AirPassengers)
good_months <- c()

for (i in 1:(length(AirPassengers)-1)){
  if (AirPassengers[i+1] > AirPassengers[i]){
    good_months <- append(good_months,AirPassengers[i+1])
  }
}
str(good_months)

# Îïèñàòåëüíûå ñòàòèñòèêè
# Ðàññ÷èòàéòå ñðåäíåå çíà÷åíèå âðåìåíè ðàçãîíà (qsec) äëÿ àâòîìîáèëåé, ÷èñëî öèëèíäðîâ (cyl) ó êîòîðûõ íå ðàâíÿåòñÿ 3 è ïîêàçàòåëü êîëè÷åñòâà ìèëü íà ãàëëîí òîïëèâà (mpg) áîëüøå 20.
# Ïîëó÷èâøèéñÿ ðåçóëüòàò (ñðåäíåå çíà÷åíèå) ñîõðàíèòå â ïåðåìåííóþ result.

mean(mtcars$qsec[mtcars$cyl != 3 & mtcars$mpg > 20])

# Ïðè ïîìîùè ôóíêöèè aggregate ðàññ÷èòàéòå ñòàíäàðòíîå îòêëîíåíèå ïåðåìåííîé hp (ëîøàäèíûå ñèëû) è ïåðåìåííîé disp (âìåñòèìîñòè äâèãàòåëÿ)  ó ìàøèí ñ àâòîìàòè÷åñêîé è ðó÷íîé êîðîáêîé ïåðåäà÷. 
descriptions_stat <- aggregate(cbind(hp,disp) ~ am, mtcars, sd)

install.packages("zeallot")
install.packages('psych',repos='http://cran.us.r-project.org')

# Âîñïîëüçóåìñÿ âñòðîåííûìè äàííûìè airquality. Â íîâóþ ïåðåìåííóþ ñîõðàíèòå subset èñõîäíûõ äàííûõ, îñòàâèâ íàáëþäåíèÿ òîëüêî äëÿ ìåñÿöåâ 7, 8 è 9.
library(psych)
?describe
str(airquality)
str(airquality$Month)
#air_subset <- subset (airquality, Month == c(7,8,9)) #çàïèñûâàåò íå âñå çíà÷åíèÿ
air_subset <- subset(airquality, Month%in%c(7,8,9))
#Ïðè ïîìîùè ôóíêöèè aggregate ðàññ÷èòàéòå êîëè÷åñòâî íåïðîïóùåííûõ íàáëþäåíèé ïî ïåðåìåííîé Ozone â 7, 8 è 9 ìåñÿöå. Äëÿ îïðåäåëåíèÿ êîëè÷åñòâà íàáëþäåíèé èñïîëüçóéòå ôóíêöèþ length().
result <- aggregate(Ozone ~ Month, air_subset, FUN = length)

#Àëüòåðíàòèâíîå ðåøåíèå:
result <- aggregate(Ozone ~ Month, airquality, subset = Month %in% c(7,8,9), length) 

#Ïðèìåíèòå ôóíêöèþ describeBy ê êîëè÷åñòâåííûì ïåðåìåííûì äàííûõ airquality, ãðóïïèðóÿ íàáëþäåíèÿ ïî ïåðåìåííîé Month.
describeBy(x = airquality, group = airquality$Month)

#Ðàáîòà ñ äàííûìè virginica
View(describe(iris))

#Â ïåðåìåííîé my_vector ñîõðàíåí âåêòîð ñ ïðîïóùåííûìè çíà÷åíèÿìè. Âàì íóæíî ñîçäàòü íîâûé âåêòîð fixed_vector, â êîòîðîì âñå ïðîïóùåííûå çíà÷åíèÿ âåêòîðà my_vector áóäóò çàìåíåíû íà ñðåäíåå çíà÷åíèå ïî èìåþùèìñÿ íàáëþäåíèÿì.
#Ïðè ýòîì èñõîäíûé âåêòîð îñòàâüòå áåç èçìåíåíèé!
my_vector <- rnorm(30)
my_vector[sample(1:30, 10)] <- NA
View(my_vector)
fixed_vector <- 0
fixed_vector <- replace(my_vector, is.na(my_vector), mean(my_vector, na.rm=TRUE))
sum(my_vector %in% c(NA))
sum(fixed_vector %in% c(NA))
is.na(my_vector)

# 1.6 Îïèñàòåëüíûå ñòàòèñòèêè. Ãðàôèêè
airquality$Month  <- factor(airquality$Month, labels = c("MY","JN","JL","AUG","SEP"))
boxplot(Ozone ~ Month, airquality, cex.lab = 1.3, cex.axis = 1.3)

plot1 <- ggplot(df, aes(x=mpg, y=disp, col=hp))+
  geom_point()

ggplot(iris, aes(Sepal.Length)) + geom_histogram(aes(col = Species))
ggplot(iris, aes(Sepal.Length, fill = Species)) + geom_histogram()
ggplot(iris, aes(Sepal.Length, col = Species)) + geom_histogram()
ggplot(iris, aes(Sepal.Length)) + geom_histogram(fill = Species)
ggplot(iris, aes(Sepal.Length)) + geom_histogram(aes(fill = Species))

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species, size = Petal.Length)) +
  geom_point()

# 2.1 Àíàëèç íîìèíàòèâíûõ äàííûõ
# Íàéòè äîëþ ðûæåâîëîñûõ (Red) îò îáùåãî ÷èñëà ãîëóáîãëàçûõ ìóæ÷èí
dimnames(HairEyeColor)
str(HairEyeColor)
sum(HairEyeColor['Red','Blue','Male'])
sum(HairEyeColor[,'Blue','Male'])
sum(HairEyeColor['Red','Blue','Male']) / sum(HairEyeColor[,'Blue','Male'])

#Àëüòåðíàòèâíîå ðåøåíèå:
# 1 - 100% ïî ñòðîêàì, 2 - 100% ïî ñòîëáöàì
prop.table(HairEyeColor[ , ,'Male'],2)['Red','Blue']

#Íàïèøèòå ÷èñëî çåëåíîãëàçûõ æåíùèí â íàáîðå äàííûõ HairEyeColor
sum(HairEyeColor[ ,'Green','Female'])

#Ïîñòðîéòå ñòîëá÷àòóþ äèàãðàììó ðàñïðåäåëåíèÿ öâåòà ãëàç ïî öâåòó âîëîñ òîëüêî ó æåíùèí èç
#òàáëèöû HairEyeColor. Ïî îñè X äîëæåí èäòè öâåò âîëîñ, öâåò ñòîëáèêîâ äîëæåí îòðàæàòü öâåò ãëàç. Ïî îñè Y - êîëè÷åñòâî íàáëþäåíèé.
library("ggplot2")
HairEyeColor[ , ,'Female']
mydata <- as.data.frame(HairEyeColor[ , ,'Female'])
ggplot(data = mydata, aes(x = Hair, y = Freq, fill = Eye)) + 
  geom_bar(stat="identity", position ="dodge") + 
  scale_fill_manual(values=c("Brown", "Blue", "Darkgrey", "Darkgreen"))
