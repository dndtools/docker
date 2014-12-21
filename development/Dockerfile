FROM debian:stable

MAINTAINER Piero Steinger <piero@steinger.eu>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
  ca-certificates \
  python2.7 \
  python-dev \
  python-pip \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV DNDTOOLS_VERSION master
ENV DNDTOOLS_DIR /dndtoolsrepo
ENV DATA_DIR /data

COPY files/ $DATA_DIR/

RUN wget https://github.com/dndtools/dndtools/archive/$DNDTOOLS_VERSION.tar.gz -q -O- | tar -xz \
  && mv /dndtools-$DNDTOOLS_VERSION $DNDTOOLS_DIR \
  && cd $DNDTOOLS_DIR \
  && pip install https://github.com/etianen/django-reversion/archive/release-1.3.3.zip \
  && pip install -r requirements.txt

EXPOSE 8000

CMD ["/data/runscript.sh"]

