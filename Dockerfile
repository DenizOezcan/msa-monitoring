FROM openjdk:21-jdk-alpine
COPY target/one-0.0.1-SNAPSHOT.jar msa-monitoring.0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/msa-monitoring.0.0.1-SNAPSHOT.jar"]