FROM ubuntu

ENV TZ=Europe/Moscow \
    DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -yq
RUN apt-get -yq install software-properties-common wget dirmngr gnupg apt-transport-https curl libxml2-dev libcurl4-openssl-dev libssl-dev cron nano

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

RUN apt install -yq r-base build-essential

RUN Rscript -e 'install.packages(c("xml2", "curl", "crul", "tidyverse", "scholar", "WikipediR", "urltools", "stringr", "tokenizers", "rtweet", "here"))'