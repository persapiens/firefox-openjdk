FROM adoptopenjdk/openjdk11:jdk-11.0.8_10-alpine

LABEL MAINTAINER="Marcelo Fernandes <persapiens@gmail.com>"

# add xvfb headless gui
# add bash
# add firefox
RUN apk upgrade --no-cache && \
  apk add --no-cache xvfb && \
  apk add --no-cache bash && \
  apk add --no-cache firefox

ADD xvfb-firefox /usr/bin/xvfb-firefox
# install xvfb-run script
ADD xvfb-run /usr/bin/xvfb-run

RUN chmod +x /usr/bin/xvfb-firefox \
  && mv /usr/bin/firefox /usr/bin/firefox-original \
  && ln -s /usr/bin/xvfb-firefox /usr/bin/firefox && \
  chmod +x /usr/bin/xvfb-run
