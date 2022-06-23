FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone
RUN apt update
RUN apt install --no-install-recommends -y docker.io maven openjdk-11-jdk-headless git wget
