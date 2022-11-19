rm(list = ls())

library(sandwich)
library(lmtest)


ghbc <- data.frame(read.csv("hb.csv")[2:4])

## Study design and what is hba1c


## How can we compare the groups?

t.test(m9 ~ group, data = ghbc)

t.test((m9-m0) ~ group, data = ghbc)

fit1 <- lm(m9 ~ group + m0, data = ghbc)
coeftest(fit1, vcov = vcovHC(fit1, type = "HC4")) %>% confint

## Ok cool, but how about some exploratory analysis...

cols = c("cadetblue3", "salmon2")

plot(m9 ~ m0, data = ghbc, col = cols[group], pch = 20)

boxplot(ghbc$m9 ~ ghbc$group, col = cols[1], pch = 20)

boxplot(ghbc$m0 ~ ghbc$group, col = cols[1], pch = 20)

plot(m9 ~ m0, data = ghbc, col = cols[group], pch = 20) ### Wuuuut?...


## Sensitivity analysis

t.test(m9 ~ group, data = ghbc)
t.test(m9 ~ group, data = ghbc[-17, ])

t.test((m9-m0) ~ group, data = ghbc)
t.test((m9-m0) ~ group, data = ghbc[-17, ])

### Not so different... How come?

boxplot((ghbc$m9-ghbc$m0), col = cols[1], pch = 20)
boxplot((ghbc$m9-ghbc$m0) ~ ghbc$group, col = cols[1], pch = 20)
plot((m9-m0) ~ m0, data = ghbc, col = cols[group], pch = 20)


### Carrying on with sensitivity analysis

fit1 <- lm(m9 ~ group + m0, data = ghbc)
coeftest(fit1, vcov = vcovHC(fit1, type = "HC4")) %>% confint

fit1 <- lm(m9 ~ group + m0, data = ghbc[-17, ])
coeftest(fit1, vcov = vcovHC(fit1, type = "HC4")) %>% confint


## How about some transformations?

par(mfrow = c(2, 1))

### Kinda skewed...

hist(ghbc$m0, col = cols[1])
boxplot(ghbc$m0, col = cols[1], pch = 20, horizontal = TRUE)

### That looks better!
hist(log2(ghbc$m0), col = cols[1])
boxplot(log2(ghbc$m0), col = cols[1], pch = 20, horizontal = TRUE)

par(mfrow = c(1, 1))

### Spoiler alert: ghbc is indeed lognormal-ish.

### Idea: Compare logarithms rather than original data 

boxplot(log2(ghbc$m9) ~ ghbc$group, col = cols[1], pch = 20)

t.test(log2(m9) ~ group, data = ghbc)

2^(t.test(log2(m9) ~ group, data = ghbc)$conf.int) # 1 is the reference

### But what is the tradeoff?..

chic <- read.csv("chicago.csv")

### Brief data description (Chicago insurance redlining in 47 districts in 1970)
### minor:    percentage of minority (0 - 100) in a given district
### fire:     number of fires per 100 households during the reference period
### theft:    number of reported thefts per 1000 inhabitants
### old:      percentage of residential units built before 1939
### insur:    number of policies per 100 households
### income:   median income (USD 1000) per household
### side:     location of the district within Chicago (1 = North, 2 = South)


plot(fire ~ minor, col = cols[chic$side], pch = 20, data = chic)
plot(log2(fire) ~ minor, col = cols[chic$side], pch = 20, data = chic)
