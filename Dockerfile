FROM rocker/rstudio:latest

ARG QUARTO_VERSION=1.7.32

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gdebi-core \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libjpeg-dev \
    libpng-dev \
    libssl-dev \
    libtiff5-dev \
    libxml2-dev \
    tcl \
    tk \
    && curl -fsSLO "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && gdebi -n "quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && rm "quarto-${QUARTO_VERSION}-linux-amd64.deb" \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r --error --skipinstalled \
    FactoMineR \
    Factoshiny \
    factoextra \
    ggplot2 \
    quarto \
    rmarkdown

EXPOSE 8787
