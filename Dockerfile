FROM maven:3.6.3-jdk-11-openj9 AS build

RUN mvn clean install -DskipTests

FROM adoptopenjdk/openjdk11:alpine-jre

VOLUME /tmp

ADD demo-jenkins/target/demoJenkins-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
