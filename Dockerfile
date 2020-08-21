FROM debian:buster-slim

WORKDIR /work

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install make dvipng graphviz imagemagick libjs-mathjax \
    && apt-get -y install latexmk texlive-fonts-recommended texlive-fonts-extra texlive-generic-extra texlive-latex-extra texlive-latex-recommended lmodern \
    && apt-get -y install python3 python3-pip libstemmer0d \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir sphinx Pillow-PIL sphinx-rtd-theme PyStemmer

CMD ["make", "html"]
