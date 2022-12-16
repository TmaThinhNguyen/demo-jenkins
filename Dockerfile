FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/*.jar
WORKDIR /opt/app
COPY ${JAR_FILE} gets.jar
ENTRYPOINT ["java","-jar","gets.jar"]
