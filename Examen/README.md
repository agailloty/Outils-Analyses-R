# Modalité des contrôles continus

Deux contrôles de connaissances sont prévus dans le cadre du TD d'outils d'enquête, d'analyse de données et de décision. 

## Contrôle 1 : Vendredi 31 mars 2023

Il vous sera demandé de réaliser une étude sur un jeu de données : 

Vous devrez : 
- Produire et interpréter des statistiques descriptives en utilisant R
- Réaliser une analyse en composantes principales (ACP) en utilisant le package FactoMineR et interpréter les résultats
- Réaliser une classification ascendante hiérarchique après l'ACP. 


## Contrôle 2 : Vendredi 7 avril 2023

Vous devrez : 
- Produire et interpréter des statistiques descriptives en utilisant R
- Réaliser une analyse des correspondances multiples (ACM) en utilisant le package FactoMineR et interpréter les résultats
- Réaliser une classification ascendante hiérarchique après l'ACM. 

Pour chacun des contrôles je vous enverrai un énoncé comportant une douzaine de questions auxquelles vous devrez répondre en écrivant des lignes de codes R puis en interprétant les résultats.

## Déroulement du contrôle 

### 15 minutes de préparation au début de la séance
### 1h30 d'examen
### 15 minutes pour finaliser et m'envoyer votre rapport Rmarkdown

A la fin du contrôle vous devrez m'envoyer un fichier Word qui est produit par Rmarkdown.
Le contrôle dure *1h30*. Je vous laisserai 15 minutes au début pour vous préparer et 15 minutes à la fin pour m'envoyer votre travail.

## Former des groupes de 2 à 3 étudiants 

Envoyez-moi un mail agailloty@gmail.com dans lequel vous indiquez vos noms et prénoms. 
Je me servirai de votre adresse mail pour vous envoyer le sujet le jour de l'examen.

## Conseils 

### Familiariser avec l'environnement de travail de RStudio. 

Familiarisez-vous à :
- Ouvrir un projet dans Rstudio
- Rédiger votre projet dans un document Rmarkdown
- Exporter votre travail en Word

### Reviser les notions vues ensemble 

- Calculer des statiques groupées
- Calculer le coefficient de corrélation linéaire entre deux variables
- Générer une matrice de corrélation entre plusieurs variables

#### Interpréter les sorties d'une ACP, ACM, CAH
- Les valeurs propres
- Combien de composantes retenir dans une étude et selon quel critère 
- Quel pourcentage d'informations expliquées avec les composantes retenues
- Interpréter les graphiques des variables
- Commenter chacune des composantes (ne pas se contenter d'un commentaire technique mais chercher à donner du sens à ce que mesure chaque composante) 
- Décrire les clusters (individus parangon, spécifiques)
- ...


### Assurez-vous d'avoir les packages correctement installés sur vos ordinateurs
Ce [répertoire](https://github.com/agailloty/Outils-Analyses-R/tree/main/Examen/ExempleEnvironnement) est un exemple de ce à quoi ressemble votre environnement de travail le jour de l'examen. Vous pouvez d'ores et déjà vous familiariser avec cet environnement pour ne pas perdre du temps précieux le jour de l'examen. 
Il est important de double-cliquer sur le fichier ayant l'extension `.Rproj` pour ouvrir le projet dans Rstudio. De cette façon vous n'aurez pas de problème pour lire le jeu de données. 