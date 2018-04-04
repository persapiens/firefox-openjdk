FROM alpine:edge
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install openjdk8, headless gui tools, firefox
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update openjdk8 ttf-dejavu xvfb firefox 

ADD xvfb-firefox /usr/bin/xvfb-firefox
RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox

