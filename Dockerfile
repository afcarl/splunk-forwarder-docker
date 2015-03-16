FROM debian:wheezy

ENV SPLUNK_FORWARDER_VERSION 6.2.2
ENV SPLUNK_FORWARDER_BUILD 255606

RUN apt-get update && \
  apt-get install -y wget && \
  apt-get clean

RUN \
  wget -O splunkforwarder.deb http://download.splunk.com/products/splunk/releases/${SPLUNK_FORWARDER_VERSION}/universalforwarder/linux/splunkforwarder-${SPLUNK_FORWARDER_VERSION}-${SPLUNK_FORWARDER_BUILD}-linux-2.6-amd64.deb && \
  dpkg -i splunkforwarder.deb && \
  rm -f splunkforwarder.deb

WORKDIR /opt/splunkforwarder

CMD ["bin/splunk", "start", "--answer-yes", "--no-prompt", "--accept-license", "--nodaemon"]