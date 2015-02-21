FROM ubuntu:15.04
MAINTAINER Bogdan Popa <bogdan@defn.io>

RUN apt-get update
RUN apt-get install -y build-essential libgmp-dev libssl-dev mlton

ADD http://www.impredicative.com/ur/urweb-20150214.tgz /tmp/urweb-20150214.tgz
RUN tar xzf /tmp/urweb-20150214.tgz
RUN rm /tmp/urweb-20150214.tgz
RUN mv urweb-20150214 /urweb

WORKDIR /urweb
RUN ./configure && make && make install

RUN mkdir /app
WORKDIR /app
VOLUME /app
