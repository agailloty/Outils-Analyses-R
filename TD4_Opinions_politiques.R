library(FactoMineR)
library(Factoshiny)

opinion = read.csv("data/Opinion_politique.csv", sep = ";")

Factoshiny(opinion)