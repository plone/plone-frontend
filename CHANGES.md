plone-frontend image builder changelog
======================================

Note: these are changes made to the supporting release process of the offical Volto example frontend and builder images, that you can use in your own workflows as base images. 
It is not the changelog for the Volto release itself, allthough we keep the tags of this repo in sync with the used Volto releases.


18.26.0.dev0
------------

- Fix passing plone_version to cookieplone in the Dockerfile.builder frontend-builder image. The old parameter is no longer picked up due to an issue in cookieplone, this caused a Volto 19 mrs.developer.json reference being present in the builder image (#61)  @fredvd

