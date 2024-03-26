# syntax=docker/dockerfile:1
ARG VOLTO_VERSION
FROM plone/frontend-builder-next:${VOLTO_VERSION} as builder

# Build Volto Project and then remove directories not needed for production
RUN <<EOT
    set -e
    pnpm build
EOT

FROM plone/frontend-prod-config-next:${VOLTO_VERSION} as base

LABEL maintainer="Plone Community <dev@plone.org>" \
      org.label-schema.name="plone-frontend" \
      org.label-schema.description="Plone frontend image" \
      org.label-schema.vendor="Plone Foundation"

# Copy Volto project
COPY --from=builder /app/ /app/
