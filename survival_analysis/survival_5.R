library(tidycmprsk)
library(ggsurvfit)
library(dplyr)

View(trial)

cuminc_object <- cuminc(Surv(ttdeath, death_cr) ~ trt, trial) 

ggcuminc(cuminc_object, outcome = "death from cancer") +
  add_confidence_interval() +
  add_risktable()

cuminc(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  ggcuminc(outcome = c("death from cancer", "death other causes")) +
  add_risktable()