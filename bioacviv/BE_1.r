library(BE)
library(PKNCA)

Cmax <- rlnorm(10000, meanlog = 2, sdlog = 1)

sd(Cmax)/mean(Cmax)

hist(Cmax, 
     breaks = c(0:20,max(Cmax)),
     xlim = c(0,20))

logCmax <- log(Cmax)

sd(logCmax)/mean(logCmax)


hist(logCmax)

# Обработка 

df <- NCAResult4BE

test_result <- test2x2(df, "AUClast")

print(test_result)

# Расчет выборки

CV_1 <- 34 # Прямо из статьи (!!!неправильно!!!)

sscv(CV_1)

CV_2 <- ci2cv(8, 10, 0.96, 1.15) # Пересчетом из ДИ

sscv(CV_2, True.R = 1.05)
