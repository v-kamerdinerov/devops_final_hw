FROM ubuntu:18.04 as maven
MAINTAINER Vlad Kamerdinerov <anakin174jedi@gmail.com>
ENV DIRPATH=/home/ubuntu
WORKDIR $DIRPATH
RUN apt update && \
    apt install maven git  -y &&\
    git clone https://github.com/v-kamerdinerov/boxfuse.git $DIRPATH && \
    mvn -f pom.xml clean package && \
    apt remove git -y  && \
    mv ./target/hello-1.0.war ./target/hello-1.0.war && \
    rm -rf /var/cache/apk/*


FROM alpine:latest as prod
ENV TOMCAT_VERSION 8.5.50
EXPOSE 8080
RUN apk update && apk upgrade && \
    apk add openjdk8 && \
    apk add wget  && \
    wget --quiet --no-cookies https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
    tar xzvf /tmp/tomcat.tgz -C /opt && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    rm /tmp/tomcat.tgz && \
    rm -rf /opt/tomcat/webapps/examples && \
    rm -rf /opt/tomcat/webapps/docs && \
    rm -rf /opt/tomcat/webapps/ROOT && \
    apk del wget && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/lib/apt/lists/*
COPY --from=maven /home/ubuntu/target/hello-1.0.war /opt/tomcat/webapps
COPY Config.properties /opt/tomcat/webapps/ROOT/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]