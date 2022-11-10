sample_size <- 100 # Количество пациентов, прошедших, терапию
Hg_improve <- 0 # Истинное среднее изменение уровня Hg (в ГС)
Hg_sd <- 10 # Разброс в улучшении Hg

Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)

stat_criterion <- sqrt(sample_size)*abs(mean(Hg_change))/sd(Hg_change)

print(stat_criterion)

num_samples <- 100000 # Сколько раз мы набираем выборку?

stat_criterions <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)
  stat_criterion <- sqrt(sample_size)*abs(mean(Hg_change))/sd(Hg_change)
})

hist(stat_criterions,freq = FALSE)


threshold <- 1.98 # ??? Хочу ошибку первого рода 0.05 -- метод подбора
threshold <- qt(0.975, sample_size-1) # ??? Хочу ошибку первого рода 0.05 -- аналитический расчет

Type_I_error <- sum(stat_criterions > threshold)/num_samples #Оценка вероятности ошибки I рода  

print(Type_I_error)

#### А если лекарство все таки работает?

sample_size <- 100 # Количество пациентов, прошедших, терапию
Hg_improve <- 100 # Истинное среднее изменение уровня Hg (в ГС)
Hg_sd <- 3 # Разброс в улучшении Hg

num_samples <- 100000 # Сколько раз мы набираем выборку?

stat_criterions <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)
  stat_criterion <- sqrt(sample_size)*abs(mean(Hg_change))/sd(Hg_change)
})

hist(stat_criterions,freq = FALSE)

Type_II_error <- sum(stat_criterions <= threshold)/num_samples  

print(Type_II_error)
