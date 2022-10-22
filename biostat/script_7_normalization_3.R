library(ggplot2)

# Какой-то странный показатель (центральная предельная теорема)

true_feature_parameter <- 7 
values <- seq(0,2*true_feature_parameter,0.1)
Pr <- dcauchy(values, location = true_feature_parameter)  # Распределение в генеральной совокупности

df <- data.frame(values, Pr)

ggplot(df, aes(x=values, y=Pr)) +
  geom_line() + 
  scale_x_continuous(limits = c(0,2*true_feature_parameter)) +
  theme_bw()

n <- 30 # Количество добровольцев 
m <- 1000 # Количество исследовательских центров

normalized_errors <- sapply(1:m, function(x){
  my_group_feature <- rcauchy(x, location = true_feature_parameter) # Результаты n добровольцев
  sample_mean <- mean(my_group_feature)
  sample_sd <- sd(my_group_feature)
  normlized_error <- sqrt(n)*(sample_mean - true_feature_parameter)/sample_sd
})

hist(normalized_errors,freq = FALSE)
x <- seq(-3,+3,0.1)
y <- dnorm(x)
lines(x,y,col = "red")