FROM maven:3.9.6 AS MAVEN_BUILD

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/

RUN mvn -Dmaven.test.skip=true package -Ptest

FROM openjdk:21

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/backend-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "backend-0.0.1-SNAPSHOT.jar"]