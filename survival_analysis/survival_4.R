library(casebase)
library(visreg)
library(survival)
library(survminer)

data("brcancer")

# Риски в группах

mod_cb <- fitSmoothHazard(cens ~ time + hormon,
                          data = brcancer,
                          time = "time")

gg_object <- plot(mod_cb,
                  hazard.params = list(xvar = "time",
                                       by = "hormon",
                                       alpha = 0.20, # 80% CI
                                       ylab = "Hazard",
                                       gg = TRUE)) 

gg_object +
  theme_bw()

# Строим модель Кокса

cox_model <- coxph(Surv(time, cens) ~ hormon, data = brcancer)

# Тест допущения о пропорциональности

test.ph <- cox.zph(cox_model)

ggcoxzph(test.ph)

print(test.ph)

summary(cox_model)
