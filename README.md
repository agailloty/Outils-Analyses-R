# Image RStudio OEAD 2026

Cette image fournit un environnement RStudio Server avec les packages suivants préinstallés :

- `FactoMineR`
- `Factoshiny`
- `factoextra`
- `ggplot2`
- `rmarkdown`
- `quarto`

Image publiée :

```text
ghcr.io/agailloty/oead-2026:latest
```

## Récupérer l'image

```bash
docker pull ghcr.io/agailloty/oead-2026:latest
```

## Lancer RStudio Server

Démarrez le conteneur en définissant votre propre mot de passe RStudio :

```bash
docker run --rm -p 8787:8787 -e PASSWORD='change-me' ghcr.io/agailloty/oead-2026:latest
```

Puis ouvrez :

```text
http://localhost:8787
```

Connectez-vous avec :

- nom d'utilisateur : `rstudio`
- mot de passe : la valeur transmise dans `PASSWORD`

Si vous ne définissez pas `PASSWORD`, le conteneur en génère un au démarrage et l'affiche dans les journaux.

## Conserver votre travail

Pour garder vos fichiers entre les exécutions, montez un dossier local dans le répertoire personnel de RStudio :

```bash
mkdir -p "$HOME/oead-2026-work"
docker run --rm -p 8787:8787 \
  -e PASSWORD='change-me' \
  -v "$HOME/oead-2026-work:/home/rstudio" \
  ghcr.io/agailloty/oead-2026:latest
```

## Utiliser Docker Compose

Un fichier `compose.yaml` prêt à l'emploi est inclus dans ce dépôt :

```yaml
services:
  rstudio:
    image: ghcr.io/agailloty/oead-2026:latest
    ports:
      - "8787:8787"
    environment:
      PASSWORD: ${PASSWORD:-change-me}
    volumes:
      - ./work:/home/rstudio
    restart: unless-stopped
```

La directive `restart: unless-stopped` redémarre automatiquement le conteneur après un redémarrage du système, sauf si vous l'avez arrêté manuellement.

### Démarrage rapide

Créez le dossier de travail et lancez le service :

```bash
mkdir -p work
docker compose up -d
```

Puis ouvrez `http://localhost:8787` et connectez-vous en tant qu'`rstudio` avec le mot de passe par défaut `change-me`.

### Personnaliser le mot de passe

Pour définir votre propre mot de passe, copiez le fichier `.env.example` en `.env` et modifiez la valeur :

```bash
cp .env.example .env
```

Éditez `.env` :

```ini
PASSWORD=votre-mot-de-passe
```

Puis démarrez le service :

```bash
mkdir -p work
docker compose up -d
```

> **Note** : le fichier `.env` contient votre mot de passe et n'est pas versionné. Ne le partagez pas et ne le commitez pas dans votre dépôt.

Arrêtez le service avec :

```bash
docker compose down
```

## Vérifier les packages installés

Dans R ou la console RStudio, vous pouvez charger les packages principaux avec :

```r
library(FactoMineR)
library(Factoshiny)
library(factoextra)
library(ggplot2)
library(rmarkdown)
library(quarto)
```

Vous pouvez également les vérifier depuis la ligne de commande :

```bash
docker run --rm ghcr.io/agailloty/oead-2026:latest \
  Rscript -e "library(FactoMineR); library(Factoshiny); library(factoextra); library(ggplot2); library(rmarkdown); library(quarto); cat('Tous les packages sont chargés\n')"
```

## Remarques sur Factoshiny

Ce conteneur est sans interface graphique, donc le chargement de `tcltk` ou `Factoshiny` peut afficher cet avertissement :

```text
no DISPLAY variable so Tk is not available
```

Cet avertissement est normal dans les conteneurs sans bureau graphique et n'empêche pas le chargement de `Factoshiny`.

## Arrêter le conteneur

Si vous l'avez démarré en avant-plan, appuyez sur `Ctrl+C`.

Si vous l'avez démarré avec `-d`, arrêtez-le avec :

```bash
docker stop <container_id>
```
