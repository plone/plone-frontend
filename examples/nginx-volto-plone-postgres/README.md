# Stack with Nginx Volto Plone and Postgres

## Setup

Clone this repository and go to the `examples/nginx-volto-plone-postgres` folder

```shell
git clone https://github.com/plone/plone-frontend.git
cd plone-frontend/examples/nginx-volto-plone-postgres
```

Start the stack with `docker-compose`

```shell
docker-compose up -d
```

## Setup Plone backend

In a browser, go to [http://localhost:8080/@@plone-addsite?site_id=Plone&advanced=1](http://localhost:8080/@@plone-addsite?site_id=Plone&advanced=1 and create a new site:

![Plone site creation](./plone-setup.png "Plone site creation")

After the Plone site is created, go to http://localhost/ and you should see the site.
