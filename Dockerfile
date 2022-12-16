FROM maven:3.6.3-jdk-11-openj9 AS build

WORKDIR /opt/app

COPY ./ /opt/app

RUN mvn clean install -DskipTests

FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/*.jar
WORKDIR /opt/app
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
