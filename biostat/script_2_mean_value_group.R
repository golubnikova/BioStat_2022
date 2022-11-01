library(ggplot2)

# Прирост гемоглобина (1 доброволец)

values <- 0:10 # Значения, которые может принимать случайная величина
max_val <- 10 # Максимальное значение случайной величины
prob <- 0.5 # Симметрия
Pr <- dbinom(values, max_val, prob) # Распределение в генеральной совокупности

df <- data.frame(values, Pr)

ggplot(df, aes(x=values, y=Pr)) +
  geom_point() + 
  geom_segment( aes(x=values, xend=values, y=0, yend=Pr)) +
  scale_x_continuous(breaks = values) +
  theme_bw()

true_mean = sum(values*Pr) # Истинное среднее (математическое ожидание)

print(true_mean)

my_group_Hg_upd <- rbinom(250, max_val, prob) # Результаты 100 добровольцев

print(my_group_Hg_upd)

sample_mean = mean(my_group_Hg_upd)

print(sample_mean)

sample_median = median(my_group_Hg_upd)

print(sample_median)

table(my_group_Hg_upd)
