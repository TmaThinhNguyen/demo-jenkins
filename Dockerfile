FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/*.jar
WORKDIR /opt/app
COPY ${JAR_FILE} pigapp.jar
ENTRYPOINT ["java","-jar","pigapp.jar"]
EXPOSE 8081

