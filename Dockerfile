FROM alpine:edge
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# add openjdk8
# add ttf-dejavu fonts
# add ps procps replacement
# add xvfb headless gui
# add bash
# add firefox
RUN apk upgrade --no-cache && \
  apk add --no-cache openjdk8 && \
  apk add --no-cache ttf-dejavu && \
  apk add --no-cache procps && \
  apk add --no-cache xvfb && \
  apk add --no-cache bash && \
  echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update firefox

ADD xvfb-firefox /usr/bin/xvfb-firefox
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox && \
  chmod +x /usr/bin/xvfb-run
