# Apache Tika Docker Image
# Maintained by Bespoke Insights

FROM ubuntu:15.04
MAINTAINER aaron@bespokeinsights.com.au

# Tika Version
ENV VERSION 1.13

# Install Java 8  (JRE) and Tika
RUN apt-get update -y && \
    apt-get install openjdk-8-jre -y && \
    curl http://www.apache.org/dist/tika/tika-server-${VERSION}.jar -s -o /tika-server-${VERSION}.jar
    apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9998

ENTRYPOINT java -jar /tika-server-${VERSION}.jar -h 0.0.0.0
