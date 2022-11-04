sample_size <- 10 # Количество пациентов, прошедших, терапию
avg_days <- 7 # Истинная средняя продолжительность болезни (в ГС)

alpha <- 0.05
x_lower <- qnorm(alpha/2)
x_upper <- qnorm(1-alpha/2)

num_samples <- 10000 # Сколько раз мы набираем выборку?
missed <- sapply(1:num_samples, function(k){
  my_group_disease_duration <- rgeom(sample_size, 1/(avg_days+1)) # Результаты n добровольцев
  lower_bound <- mean(my_group_disease_duration) + x_lower*sd(my_group_disease_duration)/sqrt(sample_size) 
  upper_bound <- mean(my_group_disease_duration) + x_upper*sd(my_group_disease_duration)/sqrt(sample_size) 
  true_or_false <- ifelse((lower_bound<avg_days)&(avg_days<upper_bound),"Captured","Missed")
})
table(missed)