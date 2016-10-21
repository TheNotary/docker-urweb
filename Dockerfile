FROM ubuntu:15.10

RUN apt-get update
RUN apt-get install -y build-essential \
  libgmp-dev \
  libssl-dev \
  libpq-dev \
  libsqlite3-dev \
  mlton \
  sqlite3 

ADD http://www.impredicative.com/ur/urweb-20160805.tgz /tmp/urweb.tgz
RUN tar xzf /tmp/urweb.tgz
RUN rm /tmp/urweb.tgz
RUN mv urweb /urweb

WORKDIR /urweb
RUN ./configure && \
    make && \
    make install

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /app
VOLUME /app

# ENTRYPOINT /docker-entrypoint.sh
