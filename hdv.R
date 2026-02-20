library(FactoMineR)
library(Factoshiny)

hdv <- read.csv("https://raw.githubusercontent.com/agailloty/Outils-Analyses-R/main/dataset/hdv2003.csv", stringsAsFactors = FALSE)


Factoshiny(hdv)