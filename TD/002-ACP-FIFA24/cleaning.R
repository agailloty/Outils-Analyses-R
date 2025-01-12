library(readr)
library(dplyr)

# "https://www.kaggle.com/api/v1/datasets/download/stefanoleone992/ea-sports-fc-24-complete-player-dataset"
fifa24 <- read_csv("FIFA24/male_players.csv")
fifa24 <- dplyr::filter(fifa24, fifa_version == 24)

to_keep <- c("short_name", "player_positions", "overall", "potential", 
  "value_eur", "wage_eur", "age", "height_cm", "weight_kg", 
  "club_name", "league_name", "league_level", "nationality_name",
  "preferred_foot", "weak_foot", "skill_moves", "international_reputation", 
  "work_rate", "body_type", "pace", "shooting", "passing", 
  "dribbling", "defending", "physic", "attacking_crossing", "attacking_finishing", 
  "attacking_heading_accuracy", "attacking_short_passing", "attacking_volleys", 
  "skill_dribbling", "skill_curve", "skill_fk_accuracy", "skill_long_passing", 
  "skill_ball_control", "movement_acceleration", "movement_sprint_speed", 
  "movement_agility", "movement_reactions", "movement_balance", 
  "power_shot_power", "power_jumping", "power_stamina", "power_strength", 
  "power_long_shots", "mentality_aggression", "mentality_interceptions", 
  "mentality_positioning", "mentality_vision", "mentality_penalties", 
  "mentality_composure", "defending_marking_awareness", "defending_standing_tackle", 
  "defending_sliding_tackle", "goalkeeping_diving", "goalkeeping_handling", 
  "goalkeeping_kicking", "goalkeeping_positioning", "goalkeeping_reflexes", 
  "goalkeeping_speed"
)

fifa24 <- fifa24[, to_keep]

fr_columns <- c("nom", "positions_joueur", "note_globale", "potentiel", 
                "valeur_eur", "salaire_eur", "age", "taille_cm", "poids_kg", 
                "nom_club", "nom_ligue", "niveau_ligue", "nationalite_nom", 
                "pied_prefere", "mauvais_pied", "gestes_techniques", "reputation_internationale", 
                "taux_effort", "type_corps", "vitesse", "tir", "passe", 
                "dribble", "defense", "physique", "attaque_centres", "attaque_finitions", 
                "attaque_precision_tete", "attaque_passes_courtes", "attaque_volées", 
                "technique_dribbles", "technique_effet", "technique_precision_coups_francs", "technique_passes_longues", 
                "technique_controle_balle", "mouvement_acceleration", "mouvement_vitesse_sprint", 
                "mouvement_agilite", "mouvement_reactions", "mouvement_equilibre", 
                "puissance_tirs", "puissance_sauts", "puissance_endurance", "puissance_force", 
                "puissance_tirs_longs", "mental_agressivite", "mental_interceptions", 
                "mental_placement", "mental_vision", "mental_penalties", 
                "mental_sang_froid", "defense_marqueur", "defense_tacles_debout", 
                "defense_tacles_glisses", "gardien_plongeon", "gardien_manipulation", 
                "gardien_degagements", "gardien_positionnement", "gardien_reflexes", 
                "gardien_vitesse")

colnames(fifa24) <- fr_columns

fifa24$nom <- make.unique(fifa24$nom)

player_positions <- sapply(lapply(fifa24$positions_joueur, strsplit, ","), function(pos) pos[[1]][1])

positions_abg <- unique(player_positions)

positions_fr <- c("Avant-centre", "Milieu central", "Attaquant en retrait", "Gardien de but", "Ailier gauche", 
                  "Milieu défensif central", "Défenseur central", "Ailier droit", "Milieu offensif central", 
                  "Arrière droit", "Milieu droit", "Arrière gauche", "Milieu gauche", "Arrière latéral gauche", 
                  "Arrière latéral droit")

positions_traduites <- positions_fr[match(player_positions, positions_abg)]
fifa24$positions_joueur <- positions_traduites

fifa24 <- as.data.frame(fifa24)
row.names(fifa24) <- fifa24$nom
fifa24$nom <- NULL
saveRDS(fifa24, "002-ACP-FIFA24/fifa24b.RDS")

write.csv(fifa24, "002-ACP-FIFA24/fifa24.csv", sep = ",", row.names = T)

