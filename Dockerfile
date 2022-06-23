FROM alpine:latest
EXPOSE 8080
ENV CATALINA_HOME=/opt/tomcat
ENV TOMCAT_VERSION=9.0.64
ENV WAR_FILE_PATH=war/target/hello-1.0.war
WORKDIR /opt
RUN apk add --update git maven openjdk8 wget &&\
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz &&\
    tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz &&\
    mv apache-tomcat-${TOMCAT_VERSION} tomcat &&\
    rm -rf apache-tomcat-${TOMCAT_VERSION}.tar.gz &&\
    rm -rf tomcat/webapps/*
COPY ${WAR_FILE_PATH} ${CATALINA_HOME}/webapps/ROOT.war
CMD ${CATALINA_HOME}/bin/catalina.sh run
