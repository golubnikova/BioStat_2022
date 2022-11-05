library(epitools)

contigency_table <- matrix(c(110,66,30,23,150,5),nrow = 3, ncol = 2)

print(contigency_table)

oddsratio(contigency_table)
