library(FactoMineR)
library(Factoshiny)

orange = read.csv("data/Orange.csv", sep = ";", row.names = "Produit")

Factoshiny(orange)