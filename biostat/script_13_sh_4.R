sample_size <- 100 # Количество пациентов, прошедших, терапию
Hg_sd <- 3 # Разброс в улучшении Hg

num_samples <- 100000 # Сколько раз мы набираем выборку?

stat_criterions_H0 <- sapply(1:num_samples, function(k){
  Hg_change <- rnorm(sample_size, 0, Hg_sd)
  stat_criterion <- sqrt(sample_size)*abs(mean(Hg_change))/sd(Hg_change)
})

<<<<<<< HEAD
threshold <- 2
=======
threshold <- 1.96
>>>>>>> 56bba9b... new classes

hist(stat_criterions_H0,freq = FALSE)

abline(v = threshold, col="red", lwd=3, lty=2)

#### А если H0 - не верна?

Hg_improve <- 1 # Истинное среднее изменение уровня Hg (в ГС)
Hg_change <- rnorm(sample_size, Hg_improve, Hg_sd)

stat_criterion <- sqrt(sample_size)*abs(mean(Hg_change))/sd(Hg_change)

print(stat_criterion)

abline(v = stat_criterion, col="blue", lwd=3, lty=2)

if_H0_were_correct <- sum(stat_criterions_H0 <= stat_criterion)/num_samples

print(if_H0_were_correct) # Чем ближе к 1, тем подозрительнее

p <- 1 - if_H0_were_correct # Чем ближе к 0, тем подозрительнее

print(p)