# Setup with Webserver (Nginx), Frontend(Volto), Plone Backend and Database Server (Postgres)

## Setup

Clone this repository and go to the `examples/webserver-volto-plone-postgres` folder

```shell
git clone https://github.com/plone/plone-frontend.git
cd plone-frontend/examples/webserver-volto-plone-postgres
```

Start the solution with `docker-compose` (or `docker compose` for newer versions)

```shell
docker-compose up -d
```

## Access the site

After startup, go to `http://localhost/` and you should see the site.
