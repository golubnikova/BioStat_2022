library(survival)
library(survminer)

data(lung) # Загружаем встроенный датасет

surv_object <- Surv(time = lung$time, event = lung$status) #Объект Surv
# В статусе меньшее число считатется цензурированием, большее - событием

fit <- survfit(surv_object ~ 1, data = lung) # Построение модели по данным

# Дополнительная информация:
ggsurvplot(fit, 
           data = lung,
           title = "Lung cancer survival curve",
           surv.median.line = "hv",            # Добавляем медианы
           risk.table = TRUE,                  # Добавляем табличку с количеством пациентов
           tables.height = 0.20,               # Размер таблицы
           legend = "none") # Убираем легенду
