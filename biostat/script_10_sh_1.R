sample_size <- 30
glucoze_A <- rnorm(sample_size, mean=4.5, sd=0.3) # Глюкоза в группе А

glucoze_B <- rnorm(sample_size, mean=5.6, sd=0.3) # Глюкоза в группе Б

t.test(glucoze_A,glucoze_B, conf.level = 0.999)
