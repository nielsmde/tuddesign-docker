FROM debian:stretch


# needed for basic build rules
RUN apt-get update && apt-get install -y software-properties-common

# needed for asymptote to run
RUN apt-get install -y freeglut3 libglu1 libosmesa6 ghostscript

RUN apt-get update -q \
    && apt-get install -qy build-essential wget libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -q && apt-get install -y texlive-latex-recommended texlive-science latexmk

# Install tuddesign-Packages
WORKDIR /tmp/deb
ARG server="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/pool"
RUN wget $server/tudfonts/t1-tudfonts_0.0.20090806_all.deb \
    && wget $server/tudfonts/ttf-tudfonts_0.0.20090806_all.deb \
    && wget $server/tex-tudfonts/tex-tudfonts_0.0.20090806_all.deb \
    && wget $server/latex-tuddesign/latex-tuddesign_1.0.20140928_all.deb \
    && wget $server/latex-tuddesign-thesis/latex-tuddesign-thesis_0.0.20140703_all.deb

RUN apt install -y /tmp/deb/*-tudfonts_*.deb \
    && apt install -y /tmp/deb/latex-tuddesign*.deb

WORKDIR /data

RUN rm -r /tmp/deb

ENV HOME /home
VOLUME ["/data","/home"]

