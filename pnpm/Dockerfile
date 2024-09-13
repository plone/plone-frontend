# syntax=docker/dockerfile:1
ARG VOLTO_VERSION
FROM plone/frontend-builder:${VOLTO_VERSION} as builder

# Build Volto Project and then remove directories not needed for production
COPY pnpm-workspace.yaml /app/
RUN --mount=type=cache,id=pnpm,target=/app/.pnpm-store,uid=1000 <<EOT
    set -e
    pnpm build
    rm -rf node_modules
    pnpm install --prod
EOT

FROM plone/frontend-prod-config:${VOLTO_VERSION} as base

LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="plone-frontend" \
      org.label-schema.description="Plone frontend image" \
      org.label-schema.vendor="Plone Foundation"

# Copy Volto project
COPY --from=builder /app/ /app/
