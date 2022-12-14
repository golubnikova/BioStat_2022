# 01.11.2022

# 6. Серьезная работа с дата-фреймами с помощью пакетов dplyr, tibble
# left_join(x, y): включает все строки, которые есть в x, отбрасывая из y те, которых нет;
# right_join(x, y): включает все строки, которые есть в y, отбрасывая те, которых там нет;
# inner_join(x, y): включает все строки, которые есть и в x и y;
# full_join(x, y): просто включает все строки, которые есть хотя бы в x или y.

library('readr')
library('dplyr')
library(stringr)
data <- read_tsv("intro_auto/data_tsv.tsv")

library(stringr)
data %>% select(`Пол`, `Группа`, `Базофилы_E1`)
data %>% select(function(x) any(str_detect(x, "Жен")))
data %>% select(`Группа`, function(x) !is.factor(x))
data %>% select(`Группа крови`, `Возраст`, function(x) anyNA(x))
data %>% select(`Группа`, (function(x) is.factor(x)) | where(function(x) is.numeric(x)))

?across

data %>% mutate(across(!contains("E1"), function(x) str_c(x, " + некая строка")))

data %>% mutate(across(!contains("E1") & !c(`Группа`, `Возраст`) & !where(is.factor), function(x) x ^ 2), across(contains("E2"), function(x) x * 100))