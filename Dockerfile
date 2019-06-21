FROM alpine:edge
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install openjdk8, headless gui tools, bash, firefox, procps
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update openjdk8 ttf-dejavu xvfb bash firefox procps

ADD xvfb-firefox /usr/bin/xvfb-firefox
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox && \
  chmod +x /usr/bin/xvfb-run
