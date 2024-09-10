# syntax=docker/dockerfile:1
FROM node:20-slim
ARG VOLTO_VERSION
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="frontend-base" \
      org.label-schema.description="Plone frontend builder image" \
      org.label-schema.vendor="Plone Foundation"

RUN <<EOT
    set -e
    apt update
    apt install -y --no-install-recommends python3 python3-pip build-essential git ca-certificates pipx
    rm -rf /var/lib/apt/lists/*
EOT

RUN <<EOT
    set -e
    pipx run --no-cache cookieplone sub/frontend_project --no_input __version_plone_volto=$VOLTO_VERSION
    chown -R node:node /app
EOT

COPY --chown=node:node volto.config.js /app/

RUN corepack enable
USER node 

WORKDIR /app

RUN --mount=type=cache,id=pnpm,target=/app/.pnpm-store,uid=1000 <<EOT
    set -e
    git clone -b $VOLTO_VERSION --depth 1 https://github.com/plone/volto core
    pnpm install
EOT
