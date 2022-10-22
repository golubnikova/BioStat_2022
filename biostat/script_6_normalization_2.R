library(ggplot2)

# Количество дней до выздоровления (центральная предельная теорема)

avg_days <- 7 # Cредняя продолжительность болезни (в ГС)
values <- 1:(3*avg_days)
Pr <- dgeom(values,1/(avg_days+1))  # Распределение в генеральной совокупности

df <- data.frame(values, Pr)

ggplot(df, aes(x=values, y=Pr)) +
  geom_point() + 
  geom_segment( aes(x=values, xend=values, y=0, yend=Pr)) +
  scale_x_continuous(breaks = values) +
  theme_bw()

true_mean <- avg_days # Истинное среднее (математическое ожидание)

variance <- avg_days^2 # Дисперсия

print(variance)

standard_deviation <- sqrt(variance)

print(standard_deviation)

n <- 15 # Количество добровольцев 
m <- 1000 # Количество исследовательских центров

normalized_errors <- sapply(1:m, function(x){
  my_group_disease_duration <- rgeom(n, 1/(avg_days+1)) # Результаты n добровольцев
  sample_mean <- mean(my_group_disease_duration)
  sample_sd <- sd(my_group_disease_duration)
  error <- sqrt(n)*(sample_mean - true_mean)/sample_sd
})

hist(normalized_errors,ylim = c(0,1/sqrt(2*pi)),freq = FALSE)
x <- seq(-3,+3,0.1)
y <- dnorm(x)
lines(x,y,col = "red")