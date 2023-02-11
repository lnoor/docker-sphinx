FROM debian:bullseye-slim

WORKDIR /work

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y --no-install-recommends install make texlive-base dvipng graphviz imagemagick libjs-mathjax \
    && apt-get -y --no-install-recommends install latexmk texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-latex-recommended lmodern \
    && apt-get -y --no-install-recommends install python3 python3-pip libstemmer0d \
    && apt-get -y --no-install-recommends install gcc libstdc++-10-dev libpython3.9-dev

# RUN pip3 install --no-cache-dir sphinx Pillow-PIL sphinx-rtd-theme PyStemmer
RUN pip3 install --no-cache-dir sphinx sphinx-rtd-theme PyStemmer

RUN apt-get -y purge gcc libstdc++-10-dev libpython3.9-dev \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
CMD ["make", "html"]


