# ==========================================================
# 1. Import
# ==========================================================

data <- read.csv("data/enquete_g4.csv", stringsAsFactors = FALSE, check.names = FALSE)

# ==========================================================
# 2. Renommage des colonnes (<=12 caractères)
# ==========================================================

names(data) <- c(
  "Horodate",
  "assiduite",
  "trav_mode",
  "meth_exam",
  "motiv_etud",
  "tps_ecran",
  "role_etud",
  "reuss_sans",
  "vis_reuss",
  "proj_prof",
  "act_extra",
  "residence",
  "type_bac"
)

# ==========================================================
# 3. Recodage des modalités (<=8 caractères)
# ==========================================================

# Assiduité
data$assiduite[data$assiduite == "Toujours ou presque"] <- "toujour"
data$assiduite[data$assiduite == "Souvent"] <- "souvent"
data$assiduite[data$assiduite == "Occasionnellement"] <- "occasi"
data$assiduite[data$assiduite == "Rarement"] <- "rare"

# Travail
data$trav_mode[data$trav_mode == "Seul(e)"] <- "seul"
data$trav_mode[data$trav_mode == "En groupe"] <- "groupe"
data$trav_mode[data$trav_mode == "Alternance seul/groupe"] <- "altern"
data$trav_mode[data$trav_mode == "Je travaille peu en dehors des cours"] <- "peu"

# Méthode
data$meth_exam[data$meth_exam == "Fiches synthétiques personnelles"] <- "fiches"
data$meth_exam[data$meth_exam == "Exercices / annales"] <- "exos"
data$meth_exam[data$meth_exam == "Relecture passive des cours"] <- "passif"
data$meth_exam[data$meth_exam == "Supports numériques (vidéos, IA, plateformes)"] <- "numeriq"

# Motivation
data$motiv_etud[data$motiv_etud == "Intérêt intellectuel"] <- "interet"
data$motiv_etud[data$motiv_etud == "Obtenir un bon diplôme"] <- "diplome"
data$motiv_etud[data$motiv_etud == "Insertion professionnelle rapide"] <- "emploi"
data$motiv_etud[data$motiv_etud == "Je ne suis pas sûr(e) de mes objectifs"] <- "indecis"

# Temps écran
data$tps_ecran[data$tps_ecran == "Moins de 2h"] <- "moins2h"
data$tps_ecran[data$tps_ecran == "2–4h"] <- "2_4h"
data$tps_ecran[data$tps_ecran == "4–6h"] <- "4_6h"
data$tps_ecran[data$tps_ecran == "Plus de 6h"] <- "plus6h"

# Rôle études
data$role_etud[data$role_etud == "Acquérir des compétences concrètes"] <- "compet"
data$role_etud[data$role_etud == "Obtenir un diplôme reconnu"] <- "dip_rec"
data$role_etud[data$role_etud == "Construire un réseau social"] <- "reseau"
data$role_etud[data$role_etud == "C’est surtout un passage obligé"] <- "oblige"

# Réussir sans études
data$reuss_sans[data$reuss_sans == "Oui, très souvent"] <- "oui_frt"
data$reuss_sans[data$reuss_sans == "Oui, mais plus difficilement"] <- "oui_diff"
data$reuss_sans[data$reuss_sans == "Rarement"] <- "rare"
data$reuss_sans[data$reuss_sans == "Non, presque impossible"] <- "non"

# Vision réussite
data$vis_reuss[data$vis_reuss == "Stabilité et sécurité"] <- "stable"
data$vis_reuss[data$vis_reuss == "Revenus élevés"] <- "revenu"
data$vis_reuss[data$vis_reuss == "Autonomie / indépendance"] <- "autonom"
data$vis_reuss[data$vis_reuss == "Équilibre vie pro / vie perso"] <- "equil"

# Projection
data$proj_prof[data$proj_prof == "Salarié dans le privé"] <- "prive"
data$proj_prof[data$proj_prof == "Fonctionnaire"] <- "fonct"
data$proj_prof[data$proj_prof == "Profession libérale / indépendant"] <- "liberal"
data$proj_prof[data$proj_prof == "Entrepreneur"] <- "entrepr"

# Activité
data$act_extra[data$act_extra == "Sport régulier"] <- "sport"
data$act_extra[data$act_extra == "Activité culturelle (musique, lecture, arts)"] <- "culture"
data$act_extra[data$act_extra == "Engagement associatif"] <- "assoc"
data$act_extra[data$act_extra == "Peu d’activité régulière"] <- "peu"

# Résidence
data$residence[data$residence == "Chez tes parents"] <- "parents"
data$residence[data$residence == "En colocation"] <- "coloc"
data$residence[data$residence == "Seul(e)"] <- "seul"
data$residence[data$residence == "Résidence universitaire"] <- "res_uni"

# Bac
data$type_bac[data$type_bac == "Général"] <- "general"
data$type_bac[data$type_bac == "Technologique"] <- "techno"
data$type_bac[data$type_bac == "Professionnel"] <- "pro"
data$type_bac[data$type_bac == "Équivalence / autre parcours"] <- "autre"

# ==========================================================
# 4. Transformation en facteurs
# ==========================================================

data[ , -1] <- lapply(data[ , -1], factor)

library(FactoMineR)
library(Factoshiny)

data$Horodate <- NULL
Factoshiny(data)
