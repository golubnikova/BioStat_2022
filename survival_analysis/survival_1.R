library(survival)
library(survminer)

data(lung) # Загружаем встроенный датасет
View(lung) # Смотрим на него

?survival::lung # Можно посмотреть писание

surv_object <- Surv(time = lung$time, event = lung$status) #Объект Surv
# В статусе меньшее число считатется цензурированием, большее - событием
head(surv_object, 20)

fit <- survfit(surv_object ~ 1, data = lung) # Построение модели по данным
summary(fit) # Вывод сводной информации

ggsurvplot(fit, 
           data = lung)