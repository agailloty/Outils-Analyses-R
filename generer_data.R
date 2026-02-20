# ==========================================================
# Génération d'un jeu de données simulé
# ==========================================================

set.seed(123)

n <- 120

data_sim <- data.frame(
  
  Horodateur = Sys.time() + 1:n,
  
  "À quelle fréquence assistes-tu aux cours magistraux ?" =
    sample(c("Toujours ou presque",
             "Souvent",
             "Occasionnellement",
             "Rarement"),
           n, replace = TRUE),
  
  "Comment travailles-tu le plus souvent ?" =
    sample(c("Seul(e)",
             "En groupe",
             "Alternance seul/groupe",
             "Je travaille peu en dehors des cours"),
           n, replace = TRUE),
  
  "Quelle est ta méthode dominante pour préparer les examens ?" =
    sample(c("Fiches synthétiques personnelles",
             "Exercices / annales",
             "Relecture passive des cours",
             "Supports numériques (vidéos, IA, plateformes)"),
           n, replace = TRUE),
  
  "Quelle est ta motivation principale dans tes études ?" =
    sample(c("Intérêt intellectuel",
             "Obtenir un bon diplôme",
             "Insertion professionnelle rapide",
             "Je ne suis pas sûr(e) de mes objectifs"),
           n, replace = TRUE),
  
  "En moyenne, combien de temps passes-tu sur écran par jour ? ( hors cours obligatoires)" =
    sample(c("Moins de 2h",
             "2–4h",
             "4–6h",
             "Plus de 6h"),
           n, replace = TRUE),
  
  "À quoi servent principalement les études supérieures selon toi ?" =
    sample(c("Acquérir des compétences concrètes",
             "Obtenir un diplôme reconnu",
             "Construire un réseau social",
             "C’est surtout un passage obligé"),
           n, replace = TRUE),
  
  "Peut-on réussir sans études supérieures ?" =
    sample(c("Oui, très souvent",
             "Oui, mais plus difficilement",
             "Rarement",
             "Non, presque impossible"),
           n, replace = TRUE),
  
  "Quelle est ta vision de la réussite professionnelle ?" =
    sample(c("Stabilité et sécurité",
             "Revenus élevés",
             "Autonomie / indépendance",
             "Équilibre vie pro / vie perso"),
           n, replace = TRUE),
  
  "Après tes études, tu te projettes plutôt comme :" =
    sample(c("Salarié dans le privé",
             "Fonctionnaire",
             "Profession libérale / indépendant",
             "Entrepreneur"),
           n, replace = TRUE),
  
  "Activité extra-académique dominante" =
    sample(c("Sport régulier",
             "Activité culturelle (musique, lecture, arts)",
             "Engagement associatif",
             "Peu d’activité régulière"),
           n, replace = TRUE),
  
  "Où habites-tu pendant l’année universitaire ?" =
    sample(c("Chez tes parents",
             "En colocation",
             "Seul(e)",
             "Résidence universitaire"),
           n, replace = TRUE),
  
  "Quel type de baccalauréat as-tu obtenu ?" =
    sample(c("Général",
             "Technologique",
             "Professionnel",
             "Équivalence / autre parcours"),
           n, replace = TRUE),
  
  check.names = FALSE
)

# ==========================================================
# Export CSV
# ==========================================================

write.csv(data_sim, "enquete_g4.csv", row.names = FALSE, fileEncoding = "UTF-8")
