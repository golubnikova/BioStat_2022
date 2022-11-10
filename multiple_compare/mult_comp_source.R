rm(list = ls())

library(dplyr)


##### Graphical Functions #####

plot.playground <-
  function(x, y, true.x = NULL, true.y = NULL, xlab = "Height (cm)", ylab = "Age (y)", square = FALSE) {
    # Prepare the canvas
    plot(
      x = c(
        min(x, na.rm = TRUE) - 5,
        max(x, na.rm = TRUE)
      ),
      y = c(
        min(y, na.rm = TRUE) - 2.5,
        max(y, na.rm = TRUE)
      ),
      type = "n",
      frame.plot = FALSE,
      xlab = xlab,
      ylab = ylab
    )
    
    x.jitter <- runif(length(y), -4.9, -1.5)
    
    # Plot Y rug 
    points(
      rep(min(x, na.rm = TRUE), length(y)) + x.jitter,
      y,
      pch = 20,
      cex = 0.5,
      col = "darkgoldenrod2"
    )
    
    
    y.jitter <- runif(length(x), -2.4, -0.5)
    
    # Plot X rug
    points(
      x,
      rep(min(y, na.rm = TRUE), length(x)) + y.jitter,
      pch = 20,
      cex = 0.5,
      col = "salmon3"
    )
    
    if(square){
      plot.square(x, y, true.x, true.y)
    }
    
  }

plot.square <- function(x, y, true.x = NULL, true.y = NULL, alpha = 0.05){
  
  x.confint <- t.test(x, conf.level = 1 - alpha)$conf.int[c(1, 2)]
  y.confint <- t.test(y, conf.level = 1 - alpha)$conf.int[c(1, 2)]
  
  abline(h = true.y, col = "deepskyblue3", lty = 5)
  abline(v = true.x, col = "deepskyblue3", lty = 5)
  
  points(true.x, true.y, col = "deepskyblue3", pch = 18, cex = 2)
  
  if(is.null(true.x)){
    col.x <- "black"
  } else if(x.confint[1] <= true.x & true.x <= x.confint[2]){
    col.x <- "darkolivegreen3"
  } else {
    col.x <- "brown2"
  }
  
  if(is.null(true.y)){
    col.y <- "black"
  } else if(y.confint[1] <= true.y & true.y <= y.confint[2]){
    col.y <- "darkolivegreen3"
  } else {
    col.y <- "brown2"
  }
  
  lines(x = x.confint, y = rep(y.confint[1], 2), col = col.x, lwd = 2)
  lines(x = x.confint, y = rep(y.confint[2], 2), col = col.x, lwd = 2)
  
  
  lines(y = y.confint, x = rep(x.confint[1], 2), col = col.y, lwd = 2)
  lines(y = y.confint, x = rep(x.confint[2], 2), col = col.y, lwd = 2)
}

##### PART I. WARM UP #####

# 3
soccer_general <- read.csv("soccer.csv", sep=";")[, 2:6] %>%
  mutate(Position = as.factor(Position),
         Nationality = as.factor(Nationality),
         Age = as.numeric(Age),
         Height = as.numeric(Height)) %>%
  filter(Nationality %in% c("Spanish", "Italian", "German", "English", "Argentinian"))

# 4

set.seed(1)

soccer_wrk <- soccer_general[sample(1:nrow(soccer_general), 50), ] %>%
  mutate(Nationality = factor(Nationality))


soccer_wrk %>% head

# 5

soccer_wrk %>% summary

# 6
soccer_wrk %>% filter(Position == "Defender") %>% pull(Age) %>% summary

# 7 

soccer_general %>% filter(Position == "Defender") %>% pull(Age) %>% mean(na.rm = TRUE)

soccer_wrk %>% filter(Position == "Defender") %>% select(Age) %>% t.test(mu = 26.88)

# 12

soccer_wrk %>% filter(Position == "Defender") %>% pull(Age) %>% t.test(mu = 26.88)

# 13

soccer_wrk %>% filter(Position == "Defender") %>% pull(Age) %>% t.test

# 22

soccer_wrk %>% filter(Position == "Defender") %>% pull(Age) %>% t.test %>% with(conf.int)

# 23

soccer_wrk %>% filter(Position == "Defender") %>% pull(Height) %>% t.test

# 24

soccer_general %>% filter(Position == "Defender") %>% pull(Height) %>% mean(na.rm = TRUE)

soccer_wrk %>% filter(Position == "Defender") %>% pull(Height) %>% t.test(mu = 183.586)

# 25

plot.playground(soccer_wrk %>% filter(Position == "Defender") %>% pull(Height),
                soccer_wrk %>% filter(Position == "Defender") %>% pull(Age),
                square = TRUE)

# 27

plot.playground(soccer_wrk %>% filter(Position == "Defender") %>% pull(Height),
                soccer_wrk %>% filter(Position == "Defender") %>% pull(Age),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Height) %>% mean(na.rm = TRUE),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Age) %>% mean(na.rm = TRUE),
                square = TRUE
)


##### PART II. CORRECTION PROCEDURES ####

# 35

plot.playground(soccer_wrk %>% filter(Position == "Defender") %>% pull(Height),
                soccer_wrk %>% filter(Position == "Defender") %>% pull(Age),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Height) %>% mean(na.rm = TRUE),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Age) %>% mean(na.rm = TRUE),
                square = TRUE
)

# 36

plot.playground(soccer_wrk %>% filter(Position == "Defender") %>% pull(Height),
                soccer_wrk %>% filter(Position == "Defender") %>% pull(Age),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Height) %>% mean(na.rm = TRUE),
                soccer_general %>% filter(Position == "Defender") %>% 
                  pull(Age) %>% mean(na.rm = TRUE),
                square = TRUE
)
plot.square(soccer_wrk %>% filter(Position == "Defender") %>% pull(Height),
            soccer_wrk %>% filter(Position == "Defender") %>% pull(Age),
            soccer_general %>% filter(Position == "Defender") %>% 
              pull(Height) %>% mean(na.rm = TRUE),
            soccer_general %>% filter(Position == "Defender") %>% 
              pull(Age) %>% mean(na.rm = TRUE),
            alpha = 0.05/2
)

# 38

soccer_general %>% filter(Position == "Defender") %>% pull(Age) %>% mean(na.rm = TRUE)

soccer_general %>% filter(Position == "Defender") %>% pull(Height) %>% mean(na.rm = TRUE)

# 39

soccer_wrk %>% filter(Position == "Defender") %>% select(Age) %>% t.test(mu = 26.88)

soccer_wrk %>% filter(Position == "Defender") %>% select(Height) %>% t.test(mu = 183.57)

# 42

p.adjust(c(0.5188, 0.03727), method = "bonferroni")

# 50

p.adjust(c(0.5188, 0.03727), method = "holm")

# 54

p.adjust(c(0.5188, 0.03727), method = "BH")


##### PART III. HOMEWORK #####

soccer_general <- read.csv("soccer.csv", sep=";")[, 2:6] %>%
  mutate(Position = as.factor(Position),
         Nationality = as.factor(Nationality),
         Age = as.numeric(Age),
         Height = as.numeric(Height)) %>%
  filter(Nationality %in% c("Spanish", "Italian", "German", "English", "Argentinian"))

set.seed(1)

soccer_wrk <- soccer_general[sample(1:nrow(soccer_general), 150), ] %>%
  mutate(Nationality = factor(Nationality))
