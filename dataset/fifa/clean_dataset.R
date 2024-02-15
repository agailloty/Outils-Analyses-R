library(readr)
library(dplyr)
fifa22 <- read_csv("https://raw.githubusercontent.com/agailloty/Outils-Analyses-R/2023/dataset/fifa22.csv")

# Remove columns with > 30% of missing data

cols_to_remove <- colnames(fifa22[,sapply(fifa22, function(x) sum(is.na(x))/ 19239) > 0.2])
fifa_cleaned <- fifa22[, !names(fifa22) %in% cols_to_remove]
fifa_cleaned <- na.omit(fifa_cleaned)

# Define columns to keep in the dataset

var_actives <- c("short_name", "age", "height_cm", "weight_kg", "shooting", "passing", "dribbling", 
                 "defending", "physic", "attacking_crossing", "attacking_finishing", 
                 "attacking_heading_accuracy", "attacking_short_passing", "attacking_volleys", 
                 "skill_dribbling", "skill_curve", "skill_fk_accuracy", "skill_long_passing", 
                 "skill_ball_control", "movement_acceleration", "movement_sprint_speed", 
                 "movement_agility", "movement_reactions", "movement_balance", 
                 "power_shot_power", "power_jumping", "power_stamina", "power_strength", 
                 "power_long_shots", "mentality_aggression", "mentality_interceptions", 
                 "mentality_positioning", "mentality_vision", "mentality_penalties", 
                 "mentality_composure", "defending_marking_awareness", "defending_standing_tackle", 
                 "defending_sliding_tackle", "goalkeeping_diving", "goalkeeping_handling", 
                 "goalkeeping_reflexes")

var_quanti_illustratives <- c("overall", "potential", "value_eur", "wage_eur","league_level", "international_reputation")

var_quali_illustratives <- c("preferred_foot", "body_type")

columns_to_keep <- c(var_actives, var_quanti_illustratives, var_quali_illustratives)

final_data <- fifa_cleaned[, columns_to_keep]

# Write down the data as a csv file

write.csv(x = final_data, file = "fifa_players_22.csv", row.names = FALSE)

