library(ggplot2)

# Прирост гемоглобина (исследовательский центр)

values <- 0:64 # Значения, которые может принимать случайная величина
max_val <- max(values) # Максимальное значение случайной величины
prob <- 0.5 # Симметрия
Pr <- dbinom(values, max_val, prob) # Распределение в генеральной совокупности

df <- data.frame(values, Pr)

ggplot(df, aes(x=values, y=Pr)) +
  geom_point() + 
  geom_segment( aes(x=values, xend=values, y=0, yend=Pr)) +
  scale_x_continuous(breaks = values) +
  theme_bw()

true_mean <- sum(values*Pr) # Истинное среднее (математическое ожидание)

print(true_mean)

variance <- sum((values-true_mean)^2*Pr) # Дисперсия

print(variance)

standard_deviation <- sqrt(variance)

print(standard_deviation)

n = 2500 # Количество добровольцев 
my_group_Hg_upd <- rbinom(n, max_val, prob) # Результаты 25 добровольцев

print(my_group_Hg_upd)

sample_mean <- mean(my_group_Hg_upd)

print(sample_mean)
