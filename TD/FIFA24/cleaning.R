library(readr)
male_fc_24_players <- read_csv("FIFA24/male_fc_24_players.csv")

newColumns <- c("n", "nom", "nation", "club", "position", "positions_alternatives", "age", "note_globale", "vitesse", 
  "tir", "passe", "dribble", "defense", "physique", "acceleration", "vitesse_de_sprint", "placement", 
  "finitions", "puissance_de_tir", "tirs_de_loin", "volees", "penalties", "vision", "centres", 
  "precision_coups_francs", "passes_courtes", "passes_longues", "effet", "agilite", "equilibre", 
  "reactions", "controle_de_balle", "dribbles", "sang_froid", "interceptions", "precision_de_la_tete", 
  "sens_defensif", "tacles_debout", "tacles_glisses", "saut", "endurance", "force", "agressivite", "taille", 
  "poids", "pied_prefere", "mauvais_pied", "ligue", "taux_d_effort_offensif", "taux_d_effort_defensif", 
  "gestes_techniques", "url", "plongeon_gardien", "manipulation_gardien", "degagements_gardien", 
  "placement_gardien", "reflexes_gardien", "sexe")

colnames(male_fc_24_players) <- newColumns
write.csv(male_fc_24_players, "FIFA24/fifa.csv", sep = ",", row.names = F)
