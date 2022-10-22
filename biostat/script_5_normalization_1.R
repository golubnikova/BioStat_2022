library(ggplot2)

# Прирост гемоглобина (центральная предельная теорема)

values <- 0:16 # Значения, которые может принимать случайная величина
max_val <- max(values) # Максимальное значение случайной величины
Pr <- 1/length(values)  # Распределение в генеральной совокупности

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

n <- 10 # Количество добровольцев (вместо лет наблюдения за полями)
m <- 1000 # Количество исследовательских центров (вместо количества полей)

# Что там намеряли в центрах

results_from_centers <- sapply(1:m, function(x){
  my_group_Hg_upd <- sample(values, n, replace = TRUE) # Результаты n добровольцев
  sample_mean <- mean(my_group_Hg_upd)
})

hist(results_from_centers,ylim = c(0,sqrt(n)/sqrt(2*pi*standard_deviation)),freq = FALSE)
x <- seq(true_mean-3*standard_deviation,true_mean+3*standard_deviation,0.1)
y <- dnorm(x,true_mean,standard_deviation/sqrt(n))
lines(x,y,col = "red")

# На сколько ошиблись в центрах

erros_from_centers <- sapply(1:m, function(x){
  my_group_Hg_upd <- sample(values, n, replace = TRUE) # Результаты n добровольцев
  sample_mean <- mean(my_group_Hg_upd)
  error <- sample_mean - true_mean
})

hist(erros_from_centers,ylim = c(0,sqrt(n)/sqrt(2*pi*standard_deviation)),freq = FALSE)
x <- seq(-3*standard_deviation,+3*standard_deviation,0.1)
y <- dnorm(x,0,standard_deviation/sqrt(n))
lines(x,y,col = "red")

# К чему привела нормализация

normalized_errors <- sapply(1:m, function(x){
  my_group_Hg_upd <- runif(n, 0, max_val) # Результаты n добровольцев
  sample_mean <- mean(my_group_Hg_upd)
  sample_sd <- sd(my_group_Hg_upd)
  normalized_error <- sqrt(n)*(sample_mean - true_mean)/sample_sd
})

hist(normalized_errors,xlim = c(-3,3), ylim = c(0,1/sqrt(2*pi)),freq = FALSE)
x <- seq(-3,+3,0.1)
y <- dnorm(x)
lines(x,y,col = "red")