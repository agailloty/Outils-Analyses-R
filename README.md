# OEAD 2026 RStudio image

This image provides an RStudio Server environment with the following packages preinstalled:

- `FactoMineR`
- `Factoshiny`
- `factoextra`
- `ggplot2`
- `rmarkdown`
- `quarto`

Published image:

```text
ghcr.io/agailloty/oead-2026:latest
```

## Pull the image

If the package is public:

```bash
docker pull ghcr.io/agailloty/oead-2026:latest
```

## Start RStudio Server

Run the container and set your own RStudio password:

```bash
docker run --rm -p 8787:8787 -e PASSWORD='change-me' ghcr.io/agailloty/oead-2026:latest
```

Then open:

```text
http://localhost:8787
```

Sign in with:

- username: `rstudio`
- password: the value passed in `PASSWORD`

If you do not set `PASSWORD`, the container generates one at startup and prints it in the logs.

## Persist your work

To keep your files between runs, mount a local folder into the RStudio home directory:

```bash
mkdir -p "$HOME/oead-2026-work"
docker run --rm -p 8787:8787 \
  -e PASSWORD='change-me' \
  -v "$HOME/oead-2026-work:/home/rstudio" \
  ghcr.io/agailloty/oead-2026:latest
```

## Use Docker Compose

A ready-to-use `compose.yaml` file is included in this repository:

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
```

Start the service:

```bash
mkdir -p work
PASSWORD='change-me' docker compose up -d
```

Then open `http://localhost:8787` and sign in as `rstudio`.

Stop it with:

```bash
docker compose down
```

## Check the installed packages

Inside R or the RStudio console, you can load the main packages with:

```r
library(FactoMineR)
library(Factoshiny)
library(factoextra)
library(ggplot2)
library(rmarkdown)
library(quarto)
```

You can also verify them from the command line:

```bash
docker run --rm ghcr.io/agailloty/oead-2026:latest \
  Rscript -e "library(FactoMineR); library(Factoshiny); library(factoextra); library(ggplot2); library(rmarkdown); library(quarto); cat('All packages loaded\n')"
```

## Notes about Factoshiny

This is a headless container, so loading `tcltk` or `Factoshiny` may print this warning:

```text
no DISPLAY variable so Tk is not available
```

That warning is expected in containers without a graphical desktop and does not prevent `Factoshiny` from loading.

## Stop the container

If you started it in the foreground, press `Ctrl+C`.

If you started it with `-d`, stop it with:

```bash
docker stop <container_id>
```
