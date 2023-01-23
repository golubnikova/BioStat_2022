library(ggplot2)
library(epiR)

Type_I_prob <- 0.05
Type_II_prob <- 0.2 # Мощность 0.8

p_R <- 0.26 # Ожидаемая частота диареи в группе плацебо
p_T <- 0.08 # Ожидаемая частота диареи в группе LGG

delta = 0.05 #Граница превосходства

n_sample <- 97 # Размер выборки

group_R <- sample(c("D+","D-"), n_sample, prob = c(p_R, 1-p_R), replace = TRUE)
group_T <- sample(c("D+","D-"), n_sample, prob = c(p_T, 1-p_T), replace = TRUE)

df <- data.frame(group  = c(rep("LGG",n_sample),rep("Placebo",n_sample)),
                 result = c(group_T, group_R))

cont_table <- table(df)

print(cont_table)

fmsb::riskdifference(cont_table[1,2],cont_table[2,2],n_sample,n_sample,conf.level = 0.95)

-----
left_bounds_H0 <- sapply(1:10000, function(x){
  
    p_T <- p_R #- delta # всего на клинически незначимую величину
  
  group_R <- sample(c("D+","D-"), n_sample, prob = c(p_R, 1-p_R), replace = TRUE)
  group_T <- sample(c("D+","D-"), n_sample, prob = c(p_T, 1-p_T), replace = TRUE)
  
  df <- data.frame(group  = c(rep("LGG",n_sample),rep("Placebo",n_sample)),
                   result = c(group_T, group_R))
  
  cont_table <- table(df)
  
  invisible(capture.output(
    result <- riskdifference(cont_table[1,2],cont_table[2,2],n_sample,n_sample,conf.level = 0.95)))
  
  lower_bound <- -result$conf.int[2]
})

---
print(sum(left_bounds_H0 > 0)/10000)

left_bounds_H1 <- sapply(1:1000, function(x){
  group_R <- sample(c("D+","D-"), n_sample, prob = c(p_R, 1-p_R), replace = TRUE)
  group_T <- sample(c("D+","D-"), n_sample, prob = c(p_T, 1-p_T), replace = TRUE)
  
  df <- data.frame(group  = c(rep("LGG",n_sample),rep("Placebo",n_sample)),
                   result = c(group_T, group_R))
  
  cont_table <- table(df)
  
  invisible(capture.output(
    result <- riskdifference(cont_table[1,2],cont_table[2,2],n_sample,n_sample,conf.level = 0.95)))
  
  lower_bound <- -result$conf.int[2]
})

print(sum(left_bounds_H1 > 0)/1000)

----

left_bounds_H0 <- sapply(1:10000, function(x){
  
  p_T <- p_R - delta # всего на клинически незначимую величину
  
  group_R <- sample(c("D+","D-"), n_sample, prob = c(p_R, 1-p_R), replace = TRUE)
  group_T <- sample(c("D+","D-"), n_sample, prob = c(p_T, 1-p_T), replace = TRUE)
  
  df <- data.frame(group  = c(rep("LGG",n_sample),rep("Placebo",n_sample)),
                   result = c(group_T, group_R))
  
  cont_table <- table(df)
  
  invisible(capture.output(
    result <- riskdifference(cont_table[1,2],cont_table[2,2],n_sample,n_sample,conf.level = 0.95)))
  
  lower_bound <- -result$conf.int[2]
})


print(sum(left_bounds_H0 > delta)/10000)



