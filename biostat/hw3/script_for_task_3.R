
# Biostatistic
# Script for task 3
# 01.11.2022

# This script forms samples (N = 10, 40, 160) with "sample" function, calculates stand. deviations, standard errors.
# Input: df
# Output: df_finish

cycles <- c(2,3,4) # Количество циклов химиотерапии для дебют+рецидив (из задания 2)
pr <- c(0.125, 0.500, 0.375) # Веротяности для циклов терапии дебют+рецидив (из задания 2)
df <- data.frame(cycles, pr) # Дата-фрейм

n1 <- 10 # Количество пациентов
n2 <- 40  # Количество пациентов
n3 <- 160  # Количество пациентов

group1 <- df[sample(1:nrow(df), size = n1, replace = TRUE), ]
group2 <- df[sample(1:nrow(df), size = n2, replace = TRUE), ]
group3 <- df[sample(1:nrow(df), size = n3, replace = TRUE), ]


true_mean_1 <- sum(cycles*pr) # Истинное среднее (математическое ожидание)
variance_1 <- sum((cycles-true_mean_1)^2*pr) # Дисперсия
standard_deviation_1 <- sqrt(variance_1)
print(standard_deviation_1)
se_1 <- standard_deviation1/sqrt(n1)



true_mean_2 <- sum(cycles*pr) # Истинное среднее (математическое ожидание)
variance_2 <- sum((cycles-true_mean_2)^2*pr) # Дисперсия
standard_deviation_2 <- sqrt(variance_2)
se_2 <- standard_deviation1/sqrt(n2)


true_mean_3 <- sum(cycles*pr) # Истинное среднее (математическое ожидание)
variance_3 <- sum((cycles-true_mean_3)^2*pr) # Дисперсия
standard_deviation_3 <- sqrt(variance_3)
se_3 <- standard_deviation1/sqrt(n3)

df_finish <- data.frame(N = c(n1,n2,n3), SE = c(se_1, se_2, se_3))

library('readr')
library('dplyr')
df_finish %>% write_delim("hw3/task3_df.xls", delim = "\t")
