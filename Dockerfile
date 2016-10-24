FROM ubuntu:15.10

RUN apt-get update
RUN apt-get install -y build-essential \
  emacs-goodies-el \
  libgmp-dev \
  libssl-dev \
  libpq-dev \
  libsqlite3-dev \
  mlton \
  sqlite3 

# ADD http://www.impredicative.com/ur/urweb-20160805.tgz /tmp/urweb.tgz
COPY urweb-20160805.tgz /tmp/urweb.tgz
RUN tar xzf /tmp/urweb.tgz
RUN rm /tmp/urweb.tgz
RUN mv urweb* /urweb

WORKDIR /urweb
RUN ./configure && \
    make && \
    make install

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /app
VOLUME /app
RUN echo "./demo/demo.exe" >> /root/.bash_history
RUN echo "sqlite3 /path_to_db.sqlite <demo/demo.sql" >> /root/.bash_history
RUN echo "urweb -dbms sqlite -db /path_to_db.sqlite -demo /Demo demo" >> /root/.bash_history

# ENTRYPOINT [ "/docker-entrypoint.sh" ]
