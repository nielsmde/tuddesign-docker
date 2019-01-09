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
COPY ./deb/ /tmp/deb/
RUN pwd && ls  && ls /tmp/deb
RUN apt install -y /tmp/deb/*-tudfonts_*.deb
RUN apt install -y /tmp/deb/latex-tuddesign_*.deb
RUN apt install -y /tmp/deb/latex-tuddesign-thesis_*.deb

WORKDIR /data
ENV HOME /home
VOLUME ["/data","/home"]

