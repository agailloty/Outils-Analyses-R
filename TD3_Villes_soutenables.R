library(FactoMineR)
library(Factoshiny)

villes = read.csv("data/Villes.csv", sep = ";", dec = ",", row.names = "Ville")

Factoshiny(villes)