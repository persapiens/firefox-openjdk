FROM persapiens/openjdk:11u2-slim-alpine
MAINTAINER Marcelo Fernandes <persapiens@gmail.com>

# install headless gui tools, bash, firefox
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache --update xvfb bash firefox

ADD xvfb-firefox /usr/bin/xvfb-firefox
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox && \
  chmod +x /usr/bin/xvfb-run
