### Трансформация значений

rate <- 1/100 # Параметр экспоненциального распределения (1/среднее значение)

n <- 1000 # Количество добровольцев

titer <- rexp(n, rate)

hist(titer)

log_titer <- log2(titer)

hist(log_titer)

### Прирост значений ###

a <- 10 # Нижняя граница биохимического маркера
b <- 20 # Верхняя граница биохимического маркера

n <- 10000 # Количество добровольцев

sample_1 <- runif(n, a, b)

hist(sample_1)

sample_2 <- runif(n, a+5, b+5)

hist(sample_2)

delta_sample <- sample_2 - sample_1

hist(delta_sample)

### Сумма случайных величин ###

a <- 100 # Нижняя граница урожая
b <- 200 # Верхняя граница урожая

n <- 1000 # Количество полей

sample_1 <- runif(n, a, b) # Урожай за первый год наблюдения

hist(sample_1)

sample_2 <- runif(n, a, b) # Урожай за второй год наблюдения

hist(sample_1 + sample_2)

sample_3 <- runif(n, a, b) # Урожай за третий год наблюдения

hist(sample_1 + sample_2 + sample_3)

sample_4 <- runif(n, a, b) # Урожай за четвертый год наблюдения

hist(sample_1 + sample_2 + sample_3 + sample_4)
