library(FactoMineR)
library(Factoshiny)

fifa150 <- readRDS("data/fifa150.RDS")

acp<-PCA(fifa150,quali.sup=c(42,43),quanti.sup=c(36,37,38,39,40,41),graph=FALSE)

Factoshiny(acp)