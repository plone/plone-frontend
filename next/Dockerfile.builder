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
    apt install -y --no-install-recommends python3 build-essential git ca-certificates
    npm install --no-audit --no-fund -g mrs-developer
    mkdir /app
    chown -R node:node /app
    rm -rf /var/lib/apt/lists/*
EOT

WORKDIR /app
RUN corepack enable

USER node
COPY --chown=node:node next/mrs.developer.json /app/.
COPY --chown=node:node next/pnpm-workspace.yaml /app/.
COPY --chown=node:node next/package.json /app/.
COPY --chown=node:node next/.npmrc /app/.
COPY --chown=node:node next/volto.config.js /app/.

RUN <<EOT
    set -e
    sed -i 's/${VOLTO_VERSION}/'"$VOLTO_VERSION"'/g' mrs.developer.json
    missdev --no-config --fetch-https
    mkdir packages
EOT

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install
