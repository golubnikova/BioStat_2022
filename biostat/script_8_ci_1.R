library(Rmisc)

sample_size <- 3 # Количество пациентов, прошедших, терапию
Hg_improve <- 20 # Истинное среднее изменение уровня Hg (в ГС)
Hg_sd <- 3 # Разброс в улучшении Hg

num_samples <- 10000 # Сколько раз мы набираем выборку?
missed <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)
  result <- CI(Hg_change, ci = 0.95)
  lower_bound <- result["lower"]
  upper_bound <- result["upper"]
  true_or_false <- ifelse((lower_bound<Hg_improve)&(Hg_improve<upper_bound),"Captured","Missed")
})
table(missed)