# plone-frontend

Plone frontend [Docker](https://docker.com) images using Node 14.

> **NOTE**: These images are not yet officially supported by the Plone Community.

## Supported tags and respective Dockerfile links

- `14.0.0-alpha, 14.0.0-alpha-node14` [(14.0/14.0.0-alpha/Dockerfile.node14)](https://github.com/plone/plone-frontend/blob/main/14/14.0.0-alpha/Dockerfile.node14)

## Using this image

### Using Docker compose

Use the example setup provided at [(examples/nginx-volto-plone)](https://github.com/plone/plone-frontend/blob/main/examples/nginx-volto-plone/docker-compose.yml)

Start the stack with `docker-compose`

```shell
docker-compose up -d
```

Then point your browser at http://localhost:3000 and you should see the default page for the Plone frontend.

## Contribute

- [Issue Tracker](https://github.com/plone/plone-frontend/issues)
- [Source Code](https://github.com/plone/plone-frontend/)
- [Documentation](https://github.com/plone/plone-frontend/)

Please **DO NOT** commit to main directly. Even for the smallest and most trivial fix.
**ALWAYS** open a pull request and ask somebody else to merge your code. **NEVER** merge it yourself.


## License

The project is licensed under the GPLv2.
