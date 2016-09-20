# Apache Tika Docker Image
# Maintained by Bespoke Insights

FROM alpine:3.3

MAINTAINER aaron@bespokeinsights.com.au

# Tika Version
ENV VERSION 1.13

# Install Java 8  (JRE) and Tika
RUN apk --update add curl openjdk8-jre && \
    curl http://www.apache.org/dist/tika/tika-server-${VERSION}.jar -s -o /tika-server-${VERSION}.jar

EXPOSE 9998

ENTRYPOINT java -jar /tika-server-${VERSION}.jar -h 0.0.0.0
