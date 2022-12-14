sample_size <- 100 # Количество пациентов, прошедших, терапию
Hg_improve <- 20 # Истинное среднее изменение уровня Hg (в ГС)
Hg_sd <- 3 # Разброс в улучшении Hg

# На sample_size = 15 уже плохо работает.

alpha <- 0.05
x_lower <- qnorm(alpha/2)
x_upper <- qnorm(1-alpha/2)

num_samples <- 10000 # Сколько раз мы набираем выборку?

# Расчет lower_bound, upper_bound с помощью центральной предельной теоремы
missed <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)
  lower_bound <- mean(Hg_change) + x_lower*sd(Hg_change)/sqrt(sample_size) 
  upper_bound <- mean(Hg_change) + x_upper*sd(Hg_change)/sqrt(sample_size) 
  true_or_false <- ifelse((lower_bound<Hg_improve)&(Hg_improve<upper_bound),"Captured","Missed")
})
table(missed)

# Заменяем формулы lower_bound, upper_bound на функцию CI - confidence interval 
# И сравниваем полученный результат
# Функция CI - основана на Т-распределении Стьюдента
# Предыдущий 
missed_new <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)
  CI_calc <- CI(Hg_change)
  lower_bound <- CI_calc['lower']
  upper_bound <- CI_calc['upper']
  true_or_false <- ifelse((lower_bound<Hg_improve)&(Hg_improve<upper_bound),"Captured","Missed")
})
table(missed_new)

