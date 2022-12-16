FROM adoptopenjdk/openjdk11:alpine-jre

ADD target/demoJenkins-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]