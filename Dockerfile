FROM debian:buster-slim

RUN mkdir -p /work
WORKDIR /work

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install make dvipng graphviz imagemagick libjs-mathjax \
    && apt-get -y install latexmk texlive-fonts-recommended texlive-fonts-extra texlive-generic-extra texlive-latex-extra texlive-latex-recommended lmodern \
    && apt-get -y install python3-sphinx python3-pil python3-sphinx-rtd-theme python3-stemmer \
    && apt-get autoremove \
    && apt-get clean
