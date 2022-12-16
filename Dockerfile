FROM maven:3.6.3-jdk-11-openj9 AS build

VOLUME /tmp

WORKDIR /opt/app

COPY ./ /opt/app

RUN mvn clean install -DskipTests

FROM adoptopenjdk/openjdk11:alpine-jre

COPY --from=build /opt/app/target*.jar app.jar


ENV PORT 8081
EXPOSE $PORT

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]