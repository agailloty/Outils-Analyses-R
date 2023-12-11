# TD d'outils d'enquête, d'analyse de données et de décision
Cet espace est destiné à contenir les ressources du TD d'outils d'enquête, d'analyse de données et de décision avec R.

Ceci est un TD de 16h. 
Cet espace est mis à jour régulièrement à la fin de chaque séance afin de vous permettre de récuperer les scripts R et Rmarkdown, les PDF. Le contenu de chaque séance sera placé dans un sous-dossier. 

## Installation de R et Rstudio

![](assets/rstudio.png)

### Windows, MacOs, Linux (Ubuntu, Debian ...)

Initialement j'ai pensé à utiliser l'environnement R avec Rcmdr pour les travaux dirigés, mais pour des raisons de compatibilité avec les différents systèmes d'exploitations (Windows, MacOs, Linux, Chromebook), il me semble plus pertinent d'utiliser R et Rstudio.
Ce guide vous permet d'installer R et Rstudio sur votre PC personnel et ainsi suivre les travaux dirigés. 

Se rendre sur le site : https://posit.co/download/rstudio-desktop/

Ce site vous propose deux liens de téléchagrement. 
Le téléchargement du langage R : https://cran.rstudio.com/ et de Rstudio
Si vous avez déjà R installé, vous pouvez sauter cette étape et passer à l'installation de Rstudio en cliquant sur le second lien proposé sur site: ce lien détecte votre système d'exploitation et vous propose de télécharger l'installateur.

### Pour Chromebook 
Suivre le lien suivant pour l'installer. Regarder la vidéo qui montre comment activer Linux sur un Chromebook puis exécuter les scripts bash.
https://www.linuxmadesimple.info/2021/03/how-to-install-rstudio-on-chromebook.html

## Installer les packages d'analyses de données

Ouvrer Rstudio et coller le script suivant dans la console de R.

```r
install.packages(
  c("FactoMineR", "Factoshiny", "FactoInvestigate", "factoextra", "ggcorrplot","ggplot2", "dplyr"))
```
Ce script installe tous les packages dont nous aurons besoin pour réaliser les études. 

## Vérifier qu'un package est correctement installé
Vous pouvez écrire du code R pour vérifier si un package est correctement installé.
Voici le script pour vérifier si le package "FactoMineR" est correctement installé. Si c'est le cas, R affiche TRUE. 
**Assurez-vous de bien écrire correctement le nom du package en respectant la casse. FactoMiner est différent de FactoMineR, Factoshiny est différent factoshiny**

```r
"FactoMineR" %in% installed.packages()[, "Package"]
```

## Lien collaboratif 

J'ai créé un espace Framapad pour collborer en temps réel lors des séances de TD. Je pourrai de temps en temps copier et coller le code R que j'écris pour que vous le récupériez. 
Pour y accéder cliquer sur le lien https://semestriel.framapad.org/p/analyses-donnees-r-9z4q?lang=fr

## Contact 
Je suis joignable par mail => agailloty@gmail.com

# Environnement Rstudio en ligne

Ouvrir ce répoertoire dans RStudio en ligne: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/agailloty/Outils-Analyses-R/master?urlpath=rstudio)