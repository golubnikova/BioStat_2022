library(tidyverse)
library(rstatix)

df <- mtcars # Load dataset

df_1 <- df %>% 
  filter(am == 1) # Dataset for the first engine type

df_2 <- df %>% 
  filter(am == 0) # Dataset for the second engine type

# Four variants to run t-test function

t.test(df_1$mpg, df_2$mpg) 

t.test(data = df, mpg ~ am)

df %>% t.test(mpg ~ am, data = .) 

df %>% t_test(mpg ~ am, detailed = TRUE)

# How to extract confidence intervals

test_result <- t.test(df_1$mpg, df_2$mpg)

lower_bound <- test_result$conf.int[1]

upper_bound <- test_result$conf.int[2]

lower_bound <- t.test(df_1$mpg, df_2$mpg)$conf.int[1]

upper_bound <- t.test(df_1$mpg, df_2$mpg)$conf.int[2]
