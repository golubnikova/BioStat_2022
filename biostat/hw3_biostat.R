
# Home work #3
# Biostat
# Task 3
# Formuala: SE = sd(x)/sqrt(length(x))


a <- 10 # Нижняя граница
b <- 160 # Верхняя граница

n <- 50 # Количество пациентов

samples <- runif(n, a, b)
sd_res <- sd(samples)
se_res <- sd(samples)/sqrt(length(samples))
