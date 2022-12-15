FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/*.jar
WORKDIR /opt/app
COPY ${JAR_FILE} demo.jar

RUN mvn clean install -DskipTests

ENV PORT 8081
EXPOSE $PORT

ENTRYPOINT ["java","-jar","demo.jar"]