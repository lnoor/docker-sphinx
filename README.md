## Dockerfile for Sphinx

This [Docker](https://www.docker.com)  container offers the [Sphinx](https://sphinx-doc.org/en/master)
documentation utility. I found it cumbersome to figure out what packages to install to get Sphinx to work
on the various systems I use. Deploying this container resolves that problem.

Note that I have made no effort to keep the container as small as possible.
I wanted a container that can generate HTML, PDF and EPUB files and all necessary dependencies are included.

This container is intended to be used either stand-alone or as a basis on which Sphinx extensions can be added.

## Usage

Creating a new project::

   $ docker run -u `id -u`:`id -g` --rm -ti -v `pwd`:/work lnoor/sphinx sphinx-quickstart

Build documentation::

   $ docker run -u `id -u`:`id -g` --rm -ti -v `pwd`:/work lnoor/sphinx make html epub latexpdf
