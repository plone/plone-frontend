FROM node:16-slim as base
FROM base as builder

ENV VOLTO_MAJOR=16
ENV VOLTO_MINOR=0
ENV VOLTO_PATCH=0
ENV VOLTO_PRERELEASE=
ENV VOLTO_VERSION=${VOLTO_MAJOR}.${VOLTO_MINOR}.${VOLTO_PATCH}${VOLTO_PRERELEASE}



RUN apt-get update \
    && buildDeps="python3 build-essential" \
    && apt-get install -y --no-install-recommends $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir build && chown -R node:node build \
    && npm install --no-audit --no-fund -g yo @plone/generator-volto

RUN corepack enable
USER node
WORKDIR /build

# Generate new volto app
RUN yo @plone/volto \
    plone-frontend \
    --description "Plone frontend using Volto" \
    --skip-addons \
    --skip-install \
    --skip-workspaces \
    --volto=${VOLTO_VERSION} \
    --no-interactive

RUN cd plone-frontend \
    && yarn install --network-timeout 1000000 \
    && yarn build

FROM base
LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="plone-frontend" \
      org.label-schema.description="Plone frontend image" \
      org.label-schema.vendor="Plone Foundation"

RUN apt-get update \
    && buildDeps="busybox" \
    && apt-get install -y --no-install-recommends $buildDeps \
    && busybox --install -s \
    && rm -rf /var/lib/apt/lists/*

USER node
COPY --from=builder /build/plone-frontend/ /app/

WORKDIR /app
EXPOSE 3000
CMD ["yarn", "start:prod"]
