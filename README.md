<p align="center">
    <img alt="Plone Logo" width="200px" src="https://raw.githubusercontent.com/plone/plone-frontend/15.x/docs/logo.png">
</p>

<h1 align="center">
  plone/plone-frontend
</h1>

<div align="center">

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/plone/plone-frontend?sort=semver)](https://hub.docker.com/r/plone/plone-frontend)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/plone/plone-frontend?sort=semver)](https://hub.docker.com/r/plone/plone-frontend)

![GitHub Repo stars](https://img.shields.io/github/stars/plone/plone-frontend?style=flat-square)
[![license badge](https://img.shields.io/github/license/plone/plone-frontend)](./LICENSE)

</div>

Plone frontend [Docker](https://docker.com) images using Node.

## Supported tags and respective Dockerfile links

- `16`, `16.20`, `16.20.8`, `latest` [(16.x/Dockerfile)](https://github.com/plone/plone-frontend/blob/16.x/Dockerfile)

### Nightly version

Built from the main branch of [@plone/volto](https://github.com/plone/volto) every night.

- `nightly` [(Dockerfile.nightly)](https://github.com/plone/plone-frontend/blob/15.x/Dockerfile.nightly)

### Older tags

- `15, 15.16, 15.16.0` [(15.16.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.16.0/Dockerfile)
- `15.15, 15.15.0` [(15.15.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.13.0/Dockerfile)
- `15.13, 15.13.0` [(15.13.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.13.0/Dockerfile)
- `15.12, 15.12.2` [(15.12.1/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.12.2/Dockerfile)
- `15.11, 15.11.2` [(15.11.2/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.11.2/Dockerfile)
- `15.10, 15.10.1` [(15.10.1/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.10.1/Dockerfile)
- `15.9, 15.9.0` [(15.9.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.9.0/Dockerfile)
- `15.8, 15.8.1` [(15.8.1/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.8.1/Dockerfile)
- `15.7, 15.7.0` [(15.7.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.7.0/Dockerfile)
- `15.6, 15.6.1` [(15.6.1/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.6.1/Dockerfile)
- `15.5, 15.5.0` [(15.5.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.5.0/Dockerfile)
- `15.4, 15.4.1` [(15.4.1/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.4.1/Dockerfile)
- `15.3, 15.3.0` [(15.3.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.3.0/Dockerfile)
- `15.2, 15.2.3` [(15.2.3/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.2.3/Dockerfile)
- `15.1, 15.1.2` [(15.1.2/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.1.2/Dockerfile)
- `15.0, 15.0.0` [(15.0.0/Dockerfile)](https://github.com/plone/plone-frontend/blob/v15.0.0/Dockerfile)
- `14.10, 14.10.0, 14.10.0-node16` [(/14/14.10/14.10.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.10/14.10.0/Dockerfile.node16)
- `14.9, 14.9.0, 14.9.0-node16` [(/14/14.9/14.9.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.9/14.9.0/Dockerfile.node16)
- `14.8, 14.8.1, 14.8.1-node16` [(/14/14.8/14.8.1/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.8/14.8.1/Dockerfile.node16)
- `14.8.0, 14.8.0-node16` [(/14/14.8/14.8.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.8/14.8.0/Dockerfile.node16)
- `14.7, 14.7.1, 14.7.1-node16` [(/14/14.7/14.7.1/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.7/14.7.1/Dockerfile.node16)
- `14.7.0, 14.7.0-node16` [(/14/14.7/14.7.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.7/14.7.0/Dockerfile.node16)
- `14.6, 14.6.0, 14.6.0-node16` [(/14/14.6/14.6.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.6/14.6.0/Dockerfile.node16)
- `14.5, 14.5.0, 14.5.0-node16` [(/14/14.5/14.5.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.5/14.5.0/Dockerfile.node16)
- `14.4, 14.4.0, 14.4.0-node16` [(/14/14.4/14.4.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.4/14.4.0/Dockerfile.node16)
- `14.3, 14.3.0, 14.3.0-node16` [(/14/14.3/14.3.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.3/14.3.0/Dockerfile.node16)
- `14.2, 14.2.3, 14.2.3-node16` [(/14/14.2/14.2.3/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.2/14.2.3/Dockerfile.node16)
- `14.2.2, 14.2.2-node16` [(/14/14.2/14.2.2/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.2/14.2.2/Dockerfile.node16)
- `14.2.1, 14.2.1-node16` [(/14/14.2/14.2.1/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.2/14.2.1/Dockerfile.node16)
- `14.2.0, 14.2.0-node16` [(/14/14.2/14.2.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.2/14.2.0/Dockerfile.node16)
- `14.1, 14.1.1, 14.1.1-node16` [(/14/14.1/14.1.1/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.1/14.1.1/Dockerfile.node16)
- `14.1.0, 14.1.0-node16` [(/14/14.1/14.1.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.1/14.1.0/Dockerfile.node16)
- `14.0, 14.0.2, 14.0.2-node16` [(/14/14.0/14.0.2/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.0/14.0.2/Dockerfile.node16)
- `14.0.1, 14.0.1-node16` [(/14/14.0/14.0.1/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.0/14.0.1/Dockerfile.node16)
- `14.0.0, 14.0.0-node16` [(/14/14.0/14.0.0/Dockerfile.node16)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/14/14.0/14.0.0/Dockerfile.node16)
- `13.15, 13.15.1-node14` [(13/13.15/13.15.1/Dockerfile.node14)](https://github.com/plone/plone-frontend/blob/5419f28e2d00788ca042c49cc44df83b6785ee3a/13/13.15/13.15.1/Dockerfile.node14)

## Usage

Please refer to the [Official Plone Documentation](https://6.dev-docs.plone.org/install/containers/images/frontend.html) for further documentation and examples.

## Contribute

- [Issue Tracker](https://github.com/plone/plone-frontend/issues)
- [Source Code](https://github.com/plone/plone-frontend/)
- [Documentation](https://6.dev-docs.plone.org/install/containers/images/frontend.html)

Please **DO NOT** commit to version branches directly. Even for the smallest and most trivial fix.

**ALWAYS** open a pull request and ask somebody else to merge your code. **NEVER** merge it yourself.

## License

The project is licensed under the GPLv2.
