# syntax=docker/dockerfile:1
FROM node:16-bullseye-slim
ARG VOLTO_VERSION

LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="frontend-base" \
      org.label-schema.description="Plone frontend builder image" \
      org.label-schema.vendor="Plone Foundation"

RUN <<EOT
    set -e
    apt update
    apt install -y --no-install-recommends python3 build-essential
    npm install --no-audit --no-fund -g yo @plone/generator-volto@6
    mkdir /app
    chown -R node:node /app
    rm -rf /var/lib/apt/lists/*
EOT

WORKDIR /app
RUN corepack enable

USER node
RUN <<EOT
    set -e
    yo @plone/volto \
        app \
        --description "Plone frontend using Volto" \
        --skip-addons \
        --skip-install \
        --skip-workspaces \
        --volto=${VOLTO_VERSION} \
        --no-interactive
    yarn install --network-timeout 1000000
EOT

COPY --chown=node:node scripts/helper.py /setupAddon
