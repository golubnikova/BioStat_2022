library(Rmisc)

sample_size <- 3 # Количество пациентов, прошедших, терапию
avg_days <- 7 # Истинная средняя продолжительность болезни (в ГС)

num_samples <- 10000 # Сколько раз мы набираем выборку?
missed <- sapply(1:num_samples, function(k){
  my_group_disease_duration <- rgeom(sample_size, 1/(avg_days+1)) # Результаты n добровольцев
  result <- CI(my_group_disease_duration, ci = 0.95)
  lower_bound <- result["lower"]
  upper_bound <- result["upper"]
  true_or_false <- ifelse((lower_bound<avg_days)&(avg_days<upper_bound),"Captured","Missed")
})
table(missed)