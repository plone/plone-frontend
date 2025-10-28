# syntax=docker/dockerfile:1
ARG VOLTO_VERSION
ARG RAZZLE_SUBPATH_PREFIX=
FROM plone/frontend-builder:${VOLTO_VERSION} AS builder

# Build Volto Project and then remove directories not needed for production
COPY pnpm-workspace.yaml /app/
ENV RAZZLE_SUBPATH_PREFIX ${RAZZLE_SUBPATH_PREFIX}
RUN --mount=type=cache,id=pnpm,target=/app/.pnpm-store,uid=1000 <<EOT
    set -e
    pnpm build
    rm -rf node_modules
    pnpm install --prod
EOT

FROM plone/frontend-prod-config:${VOLTO_VERSION} AS base
ARG RAZZLE_SUBPATH_PREFIX

LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="plone-frontend" \
      org.label-schema.description="Plone frontend image" \
      org.label-schema.vendor="Plone Foundation"

# Copy Volto project
COPY --from=builder /app/ /app/
ENV RAZZLE_SUBPATH_PREFIX ${RAZZLE_SUBPATH_PREFIX}

# Make sure the correct version of pnpm from package.json is installed
RUN corepack install
