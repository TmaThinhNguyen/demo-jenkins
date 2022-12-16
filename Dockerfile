FROM maven:3.6.3-jdk-11-openj9 AS build

WORKDIR /opt/app

COPY ./ /opt/app

RUN mvn clean install spring-boot:repackage

FROM adoptopenjdk/openjdk11:alpine-jre

VOLUME /tmp

COPY --from=build /opt/app/target*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
